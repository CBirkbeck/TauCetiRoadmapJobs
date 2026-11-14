# FIX-RT-SpectralSequencesAndConvergencePartII~1

Repair round for red-team round 1 (passes a and b). Five findings, settled one by one; none overlap.
Files changed: `packages/SpectralSequencesAndConvergencePartII/README.md`,
`packages/SpectralSequencesAndConvergencePartII/Suggested.lean`, and the top-level `gaps` list of
`packages/SpectralSequencesAndConvergencePartII/design/plan.json` (one `neededBy` entry).
`sources.toml` and `metadata.toml` are unchanged: every new locator lies in a range the manifest
already records (stacks-012K §25 line 3241–3315, tags 0130–0133; stacks-05QI §18 line 3269–3448).

## RT-SpectralSequencesAndConvergencePartII~1a/F01 (P2) — applied

Old: `Suggested.lean` stated only the object horseshoe 2.1(a). New: two sorried theorems,
`exists_quasiIso_injective_horseshoe` (2.1(a′): complexes vanishing below an arbitrary `n`, prescribed
`A → I₁`, outputs `I₂`, `I₃` vanishing below `n`, degreewise split) and `exists_horseshoe_lift`
(2.1(b)). README 2.1(a′), (b) restated to match and name them; new Check on the bound; docstring and
*How to read the build* updated.

Evidence that both are true and statable: carriers `CochainComplex.IsStrictlyGE`
(`Mathlib/Algebra/Homology/Embedding/CochainComplex.lean` line 100), `InjectiveResolution`
(`Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean` line 42), `QuasiIso`,
`ShortComplex.ShortExact`, `ShortComplex.Splitting`. (a′) with a general `n` is stacks-05QI line
3402–3420, Lemma 18.9 (1)–(3), shifted; the single `n` loses nothing, since bounded-below data have a
common lower bound. The route of (b) was recomputed (table below). Neither statement is padding: no
pinned declaration gives either (Mathlib has no horseshoe; Tau Ceti has the one-step injective
horseshoe, the finite projective horseshoe and the complete-resolution horseshoe of
`TauCeti/CategoryTheory/Exact/Resolution/Complete/Horseshoe.lean`, none of them relative or for
complexes of injectives).

## RT-SpectralSequencesAndConvergencePartII~1a/F02 (P3) — applied

Old: 5.2's third Check was the zero complex; no Check in 5.1–5.2 separated `(−1)^{p+q}` from `+1`.
New: 5.2's third Check is `A = ℤ[v] ⊗ Λ(u)`, `du = v`, degree filtration: `d₁(u·u) = 0 = vu − uv`,
unsigned rule `2uv ≠ 0`. 5.1 gains a Check reading `μ_0` on the same couple, where the unsigned
condition asks `0 = 2uv`.

## RT-SpectralSequencesAndConvergencePartII~1b/F01 (P2) — applied

Old: 3.3 took its edge maps from ArithmeticGaloisDuality §D7.1 with no comparison of §D7.1's
carrier (DerivedModuleAlgebra §S.1) and the base's. New: target 1.3(a′) (first-quadrant `′E(K)` ≅
§S.1's sequence of `d′ = d₁`, `d″ = (−1)^p d₂`, compatible with second pages, abutment filtration, `β`,
edge morphisms; flip form), locator, route, *Needs*, three Checks; 3.2, 3.3, both contracts, Scope,
Layer 1/3 dependencies rewired.

Witness confirmed: §D7.1 (ArithmeticGaloisDuality at its open head, *Derived composite spectral
sequence*) has *Needs:* DerivedModuleAlgebra §S.1 and a proof sketch through §S.1's double-complex
sequence; §S.1 (DerivedModuleAlgebra on main, line 955–1060) builds on Tau Ceti's
`CochainComplex.spectralSequence` of the column filtration with `CochainComplex.filtrationAbutmentIso`
and `CochainComplex.filtrationSpectralSequencePageXIsoEInfty` (both at the pin:
`Filtered/Convergence.lean` line 51, `Filtered/Stabilization.lean` line 83). The base design names
§S.1 only in Examples, so no supplier owns the comparison; `′E(K)` is this roadmap's object, so this
roadmap owns it. Changes beyond the reviewer's text: the comparison is stated with the compatibility
that pins it (an abstract isomorphism would admit `−1`, first new Check), the flip form names its
pair `d′ = d₂`, `d″ = (−1)^q d₁`, and the identification of abutments in 3.2 is made explicit (the
augmentation lands in row `0`, where the flip signs are `1`). Gap `base-first-quadrant-sequences`:
"Used in" and `neededBy` now include 1.3.

## RT-SpectralSequencesAndConvergencePartII~1b/F02 (P3) — applied differently

Scope: "Künneth sequence over rings whose modules have projective dimension ≤ 1" → the pinned
hypotheses (`Z_q(L)`, `L_q/Z_q(L)` projective, none on `K` or the ring), with names. *From Tau Ceti*:
Künneth hypotheses, `torOneIsoKernel`/`isZero_Tor_add_two`, `cyclicBockstein` added. 4.1 and Layer 6
name them. 4.3 Check: hereditary setting kept, declaration's weaker hypotheses added.

Why differently: the 4.3 Check was true (global dimension ≤ 1 makes cycles and boundaries of a
complex of projectives projective) and the two-column item of 4.3 is stated under `Tor_{≥2} = 0`, so
the suggested replacement would have invoked it outside its hypothesis. The Check now keeps the
setting in which the item applies, states the declaration's own hypotheses
(`TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean` line 270, 307, 729), the degrees it
covers (`n = −m − 1 ≤ −1`), and why the columns `p ≤ −2` still vanish under them alone. Verified at
the pin: `CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel` (`TauCeti/CategoryTheory/Monoidal/Tor.lean`
line 66, second variable), `isZero_Tor_add_two` (line 81), `TauCeti.cyclicBockstein`
(`.../ContCohomology/Bockstein/AllDegrees.lean` line 114, defined through `DiscreteShortExact.delta`,
the connecting map of homogeneous continuous cochains, `HomologySequence.lean` line 109).

## RT-SpectralSequencesAndConvergencePartII~1b/F03 (P3) — applied

Old: 4.2(a) "natural in `K` and `M`". New: "natural in `K`; from page `2` on independent of `P` and
natural in `M`", with the reason (lifts of `M → M′` by `ProjectiveResolution.lift`, homotopic by
`liftHomotopy`, same map on `″E₂ = H^p(H^q(K) ⊗ P^•)` and on the abutment, hence on later pages by
`comm`). *Needs* and Mathlib contracts gain the two names.

Pattern search: 2.4 (from page 1), 2.5, 2.6, 3.2 and 4.3 (from page 2) already qualify their
naturality; 4.2(b), (c) and 4.4 claim none.

## Checks run

**Elaboration.** `lake env lean packages/SpectralSequencesAndConvergencePartII/Suggested.lean` from
the content checkout: exit 0, eleven warnings `declaration uses 'sorry'` (lines 76, 90, 105, 121, 141,
159, 183, 221, 239, 269, 283: the eleven theorems), no errors, no other warnings. No `TauCeti.*` import
(the file imports only `Mathlib`).

**Elaborated signatures.** I put `#check @name` for all thirteen declarations in one scratch copy of
the file and elaborated it once (exit 0). The eleven unchanged declarations match the brief's
`signatures.md`. The two new ones carry every binder in their own signature (no section variables
exist): `exists_quasiIso_injective_horseshoe` keeps `[EnoughInjectives C]`, `hS`, the three
`IsStrictlyGE n` instances, `[I₁.IsStrictlyGE n]`, termwise injectivity of `I₁` and `[QuasiIso ι₁]`;
`exists_horseshoe_lift` keeps `hS`, `hS'`, `φ`, the degreewise exactness `hR`, the three augmentations
with their `QuasiIso` instances and compatibilities, `hi`, `hp`, the degreewise splittings `hip`, `hα`
and `hβ`. Each matches its README statement (2.1(a′), 2.1(b)) hypothesis for hypothesis.

**Dependency check.**

```text
depcheck: 242 roadmaps, 2195 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. New cross-roadmap edges: none (DerivedModuleAlgebra is on main,
ArithmeticGaloisDuality and SpectralSequencesAndConvergence were already cited).

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation or roadmap Lean name found
nowhere. The tool does not check library names on this host, so every library name added this round
was opened at the pins: `CochainComplex.IsStrictlyGE`, `CategoryTheory.ProjectiveResolution.lift`
(`Abelian/Projective/Resolution.lean` line 92), `CategoryTheory.ProjectiveResolution.liftHomotopy`
(line 162), `HomologicalComplex.homologyKunnethShortComplex_shortExact`,
`CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel`,
`CategoryTheory.ShortComplex.ShortExact.isZero_Tor_add_two`, `TauCeti.cyclicBockstein`,
`CochainComplex.filtrationAbutmentIso`, `CochainComplex.filtrationSpectralSequencePageXIsoEInfty`.

## The adversarial pass on every statement added or changed

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_quasiIso_injective_horseshoe` | `S = 0`; split `S`; `0 → ℤ[0] →(×2) ℤ[0] → ℤ/2[0] → 0`, `n = 0`, `I₁ = (ℚ → ℚ/ℤ)`; non-exact `S` (`A = C = 0`, `B = ℤ/2[0]`); `I₁` with the contractible `ℚ/ℤ →(id) ℚ/ℤ` in degrees `−1, 0` added | `S = 0`: `I₁` acyclic, `I₂ = I₁`, `I₃ = 0`; split: `I₂ = I₁ ⊕ I₃`; non-split: middle `ℚ ⊕ ℚ/ℤ → (ℚ/ℤ)²`, `H⁰ = ℤ`, untwisted sum `H⁰ = ℤ ⊕ ℤ/2`; non-exact: `I₁ ≃ I₃ ≃ 0` force `I₂` acyclic against `H⁰ = ℤ/2`; padded `I₁`: `I₁^{−1} = ℚ/ℤ` a summand of `I₂^{−1}` | true; `hS` and the bound on `I₁` both needed | new README Check (bound on `I₁`) |
| `exists_horseshoe_lift` | split, `f` = id; transported target `φ(u, v) = (u + h v, v)` with `h⁰ = id`, `h¹ = 0` on `I₁ = I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)`; `φ = 0`; the route | split: `μ = α ⊕ β`; transported: differentials `(2u, 2v)` and `(2u − 2v, 2v)`, `μ = φ` works, identity fails by `(−2v, 0)`; `φ = 0`: `ν = 0`, `0` and `r₂β` agree on `ε₂`, homotopic; route: degree-0 corrections are `h̃¹d⁰`, killed by `ε₂` since `d⁰ε₂ = 0` | true | none. P3 note: `hS`, `hS'`, `[QuasiIso ε₃]` and exactness of `R` beyond `r₁` mono, `r₁r₂ = 0` are unused by the route; kept as the README's statement |
| 2.1(a′) README (general `n`) | `n = 0` against Stacks Lemma 18.9 (2), (3) | Stacks line 3417–3419: prescribed `I₁`, vanishing in negative degrees | agrees; general `n` by shifting | restated |
| 1.3(a′) | `K = 0`; single row; single column; the `x, y, z, w` complex | row: `E₂^{n,0} = Hⁿ(K^{•,0})`, `F_I^nHⁿ = Hⁿ`, `F_I^{n+1}Hⁿ = 0`, edge maps identity; column: `F_I^0Hⁿ = Hⁿ`, `F_I^1Hⁿ = 0`; staircase: `x ↦ z`, `y ↦ w − z`, `H¹ = H² = 0`, `d(x + y) = w`, `d₂` iso; pair `(d₁, d₂)`: `y ↦ w + z`, `d(x − y) = −w`, `d₂` negated | true with the stated compatibilities; the dictionary sign is needed | new target, three Checks |
| 1.3(a′), flip form | `σ = (−1)^{pq}` between pair `(d₂, (−1)^q d₁)` and the transpose `((−1)^p d₂, d₁)` | `σd₂ = (−1)^p d₂σ`, `σ(−1)^q d₁ = d₁σ`; `σ = 1` on rows and columns `0` | the flip form is consistent, edge positions unaffected | stated through `totalFlipIso` |
| 3.2, comparison with §D7.1 | augmentation `G(F(J)) → Tot G(I)` | lands in `G(I)^{p,0}`, flip sign `(−1)^{p·0} = 1`; `t` at `J` is the unit of `RG` at `F(J)` | both abutment identifications agree | wording |
| 3.3 five-term, edge maps | coextension example `ℤ/4 → ℤ/2`, `A = ℤ/2` | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`, middle map iso (`G` exact) | unchanged | wording |
| 5.2 sign Check | `A = ℤ[v] ⊗ Λ(u)`, `du = v`, `F^p = A^{≥p}` | `d(uv^k) = v^{k+1}`; `E₁^{p,0} = A^p`; `d₁(u²) = 0`, `vu − uv = 0`, unsigned `2uv ≠ 0` in `A³ = ℤuv`; `H(A) = ℤ` in degree `0` | signed rule holds, unsigned fails | Check replaced |
| 5.1 `μ_0` sign Check | same couple, `x = y = u ∈ E^{1,0}`, `s + t = 1` | `jk(u²) = 0`, `jk(u)u − u jk(u) = 0`, `+` version `2uv ≠ 0` | discriminates `(−1)^{s+t}` | Check added |
| 4.2(a) naturality | `M = ℤ/2`, `K = ℤ[0]`, `P = (ℤ →(×2) ℤ)` and `P′ = (ℤ² → ℤ², (x, y) ↦ (2x, y))` | `″E₁^{−1,0} = ℤ` vs `ℤ²`; `″E₂^{−1,0} = 0` both, `″E₂^{0,0} = ℤ/2` both | page 1 depends on `P`, page 2 does not | restated |
| 4.3 Künneth Check | `C = D = (ℤ →(×2) ℤ)`, homological degrees `1, 0` | `Z_1 = 0`, `Z_0 = ℤ`, `L_1/Z_1 = ℤ`, `L_0/Z_0 = 0`: projective; `m = 0`: tensor term `0`, `Tor₁(ℤ/2, ℤ/2) = ℤ/2 = H_1(C ⊗ D)`, matching `H^{−1} = ℤ/2` of the next Check | consistent; index `i + j = n + 1` | Check restated |
| 4.1 `torOneIsoKernel` | `X = ℤ/2 ⊕ ℤ`, `0 → ℤ →(×2) ℤ → ℤ/2 → 0` | `ker(×2 on X) = ℤ/2`, `Tor₂ = 0` | matches the Check's second computation | named |
| Layer 6 `cyclicBockstein` | `G` trivial, `n = 2`; `G = ℤ/2`, `n = 2` | trivial: `d_1 : ℤ/2 → H¹ = 0`; `ℤ/2`: `E_1^1 = H²(ℤ/2, ℤ)[2] = ℤ/2`, `E_2^1 = 0`, so `d_1 : E_1^1 → E_1^2 = ℤ/2` is an isomorphism, the Bockstein `x ↦ x²` | consistent with 6.2's higher universal-coefficient sequence | named |

## For the maintainer

- New Lean names in `TauCetiRoadmap.SpectralSequencesAndConvergencePartII`:
  `exists_quasiIso_injective_horseshoe`, `exists_horseshoe_lift`. `roadmaps grep` finds neither on
  main or at any open head. No name was renamed or deleted, and no section, layer or target id
  changed; the new item is 1.3(a′) (2.1(a′) already existed and keeps its id).
- New README target 1.3(a′), owned here: the comparison of Layer 1's first-quadrant sequence with
  DerivedModuleAlgebra §S.1 (on main), which the base design names only in Examples. It is what lets
  3.3 import ArithmeticGaloisDuality §D7.1's edge maps. If §D7.1's construction changes away from
  §S.1, the contract under *From TauCetiRoadmap.ArithmeticGaloisDuality* says what is used.
- Gap `base-first-quadrant-sequences`: `neededBy` is now `["1.3", "3.3"]`; slug, supplier, section
  and `needs` unchanged.
- Ownership against open pull requests: checked by object with `roadmaps grep` over all open heads
  and main (horseshoe, relative horseshoe, the two new names, citations of DerivedModuleAlgebra
  §S.1); no other owner of the complex or relative horseshoe or of the §S.1 comparison.
- Nothing suspicious was found in the reviews or fetched texts.
