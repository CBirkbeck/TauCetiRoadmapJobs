# FIX-PKG-EllipticCurveModularityImaginaryQuadraticPartII~2

Repair of the three findings of `REV-PKG-EllipticCurveModularityImaginaryQuadraticPartII` (one review,
so the ids are unqualified). The review's "For the human reviewers" section lists no finding; nothing
was changed because of it.

## F01 (P2) — applied

The finding is right. Mathlib at the pin `1b1ccf4b…` defines `WeierstrassCurve.localPolynomial` (line
43), `WeierstrassCurve.LFunction` (line 79, `[NumberField K]`) and `WeierstrassCurve.LSeries` (line 84)
in `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`. Tau Ceti builds on it
(`TauCeti/AlgebraicGeometry/EllipticCurve/LFunction.lean`, `isMultiplicative_LFunction`, line 76).

Changes:

- README `**Lean.**` paragraph: "The pins supply only the Galois side of an elliptic curve" → "The pins
  supply the elliptic-curve side", with Mathlib's `WeierstrassCurve.LFunction`/`LSeries` added as the
  left side of `L(E/K, s) = L(π_E, s − 1/2)`; "`L`-functions of elliptic curves or of automorphic
  representations over number fields" → "`L`-functions of automorphic representations of `GL₂(𝔸_K)` for
  a CM field `K` (Mathlib's `ModularForm.L` is the `L`-function of a classical modular form on the upper
  half-plane, an object over `ℚ`)".
- `Suggested.lean` module docstring, first bullet: the same correction ("The elliptic-curve side exists
  at the pins … Mathlib's `WeierstrassCurve.LSeries` … is the left side `L(E/K, s)`"; missing list now ends
  with automorphic `L`-functions of `GL₂(𝔸_K)`).
- README `### From Mathlib`: new bullet for `WeierstrassCurve.localPolynomial`, `LFunction`, `LSeries`
  (file named), stating the four local polynomials on the minimal model and the Euler product, as the
  carrier of the finite local factor of `E` and of `L(E/K, s)` in Theorems 2.3, 2.4 and 8.1.

Where I departed from the suggested wording, and why: the review's replacement "`L`-functions of
automorphic representations" is itself too broad at the pins, because Mathlib's
`Mathlib/NumberTheory/ModularForms/LFunction.lean` defines `ModularForm.L` (line 151, namespace
`ModularForm`), the `L`-function of a classical modular form for an arithmetic subgroup of
`GL₂(ℝ)`. Over `ℚ` that object corresponds to automorphic representations of `GL₂(𝔸_ℚ)`. So the
missing-carrier claim is restricted to `GL₂(𝔸_K)` for a CM field `K`, and `ModularForm.L` is named.

Pattern repaired: the same claim occurred in exactly two places (README line 98 and `Suggested.lean`
line 25), and both are fixed. For consistency with the new supplier bullet, the `*Needs:*` lines of
§§2.3, 2.4 and 8.1 now name Mathlib `WeierstrassCurve.localPolynomial` and `WeierstrassCurve.LSeries`,
and the Dependencies of Layers 2 and 8 name "Mathlib's `L`-function of a Weierstrass curve". Their
statements use `L(E/K, s)` and the local factors of `E`.

Statability: Theorems 2.5, 6.2 and 8.1 still need `π_E`, `r_ι(π)`, `rec^T` and the automorphic
`L`-function, so none becomes statable and nothing is declared. I did not state the consequence "`W.LSeries`
has an entire continuation over a CM field": it is not a target of this roadmap (it appears only under
Downstream consumers), and stating it would be a substitute for a headline.

## F02 (P3) — applied

The finding is right. The statements or routes of §§2.1, 2.2, 6.1, 6.2, 7.4 and 7.5 use decomposed
genericity:

- §2.1(a) "decomposed generic over `K`";
- the §2.2 route, "§7.4(1)–(2) decomposed genericity over `F`";
- the §6.1 route, "decomposed genericity is preserved by …";
- §6.2 "`ρ̄` decomposed generic";
- §7.4 "decomposed generic", twice;
- §7.5(a) "decomposed generic".

Yet their `*Needs:*` lines did not name AG2.7. §6.1 and §7.3 need §3.3, but Layer 3 was missing from
the Dependencies of Layers 6 and 7.

Changes:

- "AutomorphicGaloisRepresentationsPartII AG2.7" added to the six `*Needs:*` lines and to the
  Dependencies of Layers 2, 5, 6 and 7.
- Layer 6 Dependencies "Layer 5;" → "Layers 3 and 5;".
- Layer 7 Dependencies "Layers 1 and 6;" → "Layers 1, 3 and 6;".

Pattern check, run by script over the edited README:

- The sections whose `*Needs:*` name AG2.7 are now exactly {1.2, 2.1, 2.2, 5.1, 6.1, 6.2, 7.4, 7.5}, which
  equals the "Used by" list of the AG2.7 contract.
- Every internal layer edge in a `*Needs:*` line appears in that layer's Dependencies. The edges are
  L2←{1}, L4←{3}, L5←{3,4}, L6←{3,5}, L7←{1,3,6} and L8←{1,2,7}, and the Dependencies list the same
  layers.
- Every supplier roadmap named in a layer's `*Needs:*` lines appears in that layer's Dependencies.

## F03 (P3) — applied

The finding is right. The Scope paragraph read "(§§7.5, 8.1–8.7, 9.1–9.11)", but no `*Needs:*` line and
no contract cites CrystallineLocalGlobalCompatibilityCM §8.1 (non-neat `PGL₂` cohomology), §9.2 (the
determinant-kernel reducibility criterion) or §9.3 (AKT Taylor–Wiles data). §9.3 is mentioned twice,
but only as replaced (§4.2) and as a compared formula (first Check of §4.3), not as an import.

Change: "(§§7.5, 8.1–8.7, 9.1–9.11)" → "(§§7.5, 8.2–8.7, 9.1, 9.4–9.11)". This is the union of the
supplier contract and of the `*Needs:*` lines and Layer 5/6 Dependencies. I checked the section headings
at the supplier's head: §§7.5, 8.2–8.7, 9.1 and 9.4–9.11 all exist, and §9.12 is cited only under
Downstream consumers.

## Checks run

- **Elaboration.** `lake env lean packages/EllipticCurveModularityImaginaryQuadraticPartII/Suggested.lean`,
  run from the content checkout after the docstring edit: exit 0, no messages (4.3 s). The file
  declares nothing, so there is no `sorry` and no `TauCeti.*` import to build first.
- **Elaborated-signature comparison.** There is no declaration, so the `#check @name` comparison had
  nothing to run on and nothing changed.
- **Dependency check.** `gate --depcheck … --movable` output, run after the final edit:
  `depcheck: 242 roadmaps, 2278 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** `roadmaps resolve` on the edited README leaves three leads: `LeHung26, §4.4`,
  `OpenAI26, §9.4` and `CaptainSude26, §4`. All three are source ids with source locators, not roadmap
  citations. The earlier `ResidualImage.adZeroRep` lead no longer appears, and that name is in
  ArithmeticGaloisRepresentations' `Suggested.lean`. No Lean name of this roadmap is unresolved.
- **Overlaps.** `scratch/overlaps.md` lists no shared roadmap, no dropped id and no revision-only id. No
  new target was added, so ownership is unchanged. Ownership against open pull requests was not
  re-checked beyond that file.
- **Gate failures listed in the brief.** None.
- **Sources.** No new source was cited and `needs-references.toml` was not created.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| "pins supply `L(E/K, s)`" (README, docstring) | Mathlib `LFunction.lean` at the pin | line 79 `LFunction := eulerProduct` over `HeightOneSpectrum (𝓞 K)` of `localEulerFactor` of `W.baseChange (adicCompletion)`; line 84 `LSeries := LSeries (↑ ∘ LFunction)` | true | F01 edits |
| Remaining "lacks" list | grep at both pins: `WeilDeligne`, `AutomorphicRep`, `AutomorphicForm`, `HodgeTate`, `otentiallySemistable`, `LocalLanglands`, `automorphic` | 0 files for the first six; `automorphic` hits only in bibliographies (`HeckeRing/Defs.lean:59`, Tau Ceti `SpecialLinearGroup/Basic.lean:97`, `DivisorTable.lean:46`, `ChainConjugate.lean:47`) and the word "automorphic set" in `Quandle.lean:123`; `ModularForm.L` on `Γ ≤ GL₂(ℝ)`, functions on `ℍ` | true once restricted to `GL₂(𝔸_K)`, `K` CM | wording narrowed, `ModularForm.L` named |
| Mathlib bullet: four local polynomials | definition lines 43–50 | good `1 − C a X + C q X²`, `a = q + 1 − #W'(κ)` on `W' = W.minimal R`; split `1 − X`; then multiplicative `1 + X` (so nonsplit); else `1` | as stated | none |
| Bullet vs §2.3 first Check | split multiplicative; potentially good with nontrivial inertia; good | `1/(1 − T)`, degree 1; Néron–Ogg–Shafarevich gives bad reduction, integral `j` gives not multiplicative, so additive and factor `1`; good: `q = N𝔭 ≥ 2`, so degree 2 | agrees | none |
| Normalisation `L(E/K, s) = L(π_E, s − 1/2)` against Mathlib's factor | good place `q = 4`, `a = 4` | Mathlib: `1/(1 − 4·4^(−s) + 4·4^(−2s)) = (1 − 2·4^(−s))^(−2)`; unitary Satake roots `α + β = 4/2 = 2`, `αβ = 1`, so `α = β = 1`; `L(π_v, s − 1/2) = (1 − 4^(1/2)·4^(−s))^(−2) = (1 − 2·4^(−s))^(−2)` | equal; Mathlib is the arithmetic normalisation, centre `s = 1` | none |
| Junk values of the Mathlib definition | infinite residue field | `q = Nat.card = 0` | never reached: primes of `𝓞_K` have finite residue fields | none |
| "depends only on `E`" | two models of `E` over `K_𝔭` | `minimal` is `(exists_isMinimal R W).choose • W` (`Reduction.lean:300`); minimal models differ by a change of variables with `u ∈ R^×`, which preserves the reduction type and `#W'(κ)` | true | none |
| AG2.7 additions (F02) | statements of §§2.1, 2.2, 6.1, 6.2, 7.4, 7.5 | each contains "decomposed generic(ity)" in its statement or route (quoted under F02) | the `*Needs:*` set equals the "Used by" set, 8 = 8 | F02 edits |
| Layer edges (F02) | `*Needs:*` of §§6.1 and 7.3 | both name §3.3 | Layer 3 is now in the Dependencies of Layers 6 and 7 | F02 edits |
| Scope range (F03) | every CrystallineLocalGlobalCompatibilityCM citation (26 lines) | cited: 7.5, 8.2–8.7, 9.1, 9.4–9.11; 9.3 only as replaced or compared; 9.12 downstream; 8.1 and 9.2 never | the range now equals the imports | F03 edit |

## For the maintainer

- No name that other roadmaps cite changed, and no target, section or layer was added, removed or
  renumbered.
- The parent EllipticCurveModularityImaginaryQuadratic (still a pull request) states the same
  `L`-function identity. Whether its own `**Lean.**`-style text makes the same "no `L`-function of
  elliptic curves at the pins" claim was not checked in this package, and it cannot be edited here.
- No untrusted text asked for any action outside the job.
