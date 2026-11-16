# FIX-RT-ModularityAndLanglandsExtensionsPartII~1

Repair of red-team round 1 (passes a and b) on `packages/ModularityAndLanglandsExtensionsPartII`.
Files changed: `README.md`, `design/plan.json` (top-level `gaps` only), `sources.toml` (the
`cited_for` of `kl87`). `Suggested.lean` and `metadata.toml` are unchanged: no finding touches a Lean
statement.

## RT-ModularityAndLanglandsExtensionsPartII~1a/F01 (P1) — applied differently

§4.9 now takes the Steinberg-variety `K`-theory realisation, standard modules, classification and
tempered irreducibility from new gap:steinberg-equivariant-k-theory (SpringerResolutionAndCharacteristicCycles,
Layer 6; contract subsection, `gaps` entry, Needs, Layer 4 Dependencies). Adapted `φ`: proved here,
not by the reviewer's "LieHighestWeightPartII N2.1 in the centraliser of `s₀`".

Why differently: the Jacobson–Morozov homomorphism and triple conjugacy are NilpotentOrbits N2
(item 1), on main, which LieHighestWeightPartII line 105 itself imports; LieHighestWeightPartII has no
N2.1 of its own. Applying it "in the centraliser of `s₀`" is circular (`s₀` is defined from `φ`). The
sketch now gives the route: `e = log u`, `Ad(s)e = qe`; Tau Ceti
`TauCeti.exists_isSl2Triple_of_isNilpotent_ad` gives a triple. Tau Ceti
`IsSl2Triple.exists_isSl2Triple_iff_sub_mem` makes the neutral elements an affine space under
`ker(ad e) ∩ [e, 𝔤^∨]`. The weight-zero component, for the diagonalizable closure of `⟨s⟩`, is an
`s`-fixed neutral element. Integrating it gives `φ` (both declarations checked at the Tau Ceti pin,
`TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean` lines 87 and 199). The gap matches the "coherent
equivariant K-theory contract" that SmoothRepresentationsOfLocalGroupsPartII already places on the same
supplier (its README line 142), so the two requests have one owner.

## RT-ModularityAndLanglandsExtensionsPartII~1a/F02 (P2) — applied

Deleted gap:geometric-weak-primitive-auxiliary-finiteness (contract line, Needs, `gaps` entry). §11.6
now proves §8.16's added hypothesis (`[H, H] = SL_2(𝔽_{p^b}) × 1` perfect, `|H/[H, H]|` dividing
`(|k| − 1)²`) and states that both applications are §8.16 as stated. New Check: the `PGL_2` case with
`det = ε̄^{−1}`.

Evidence: PotentialAutomorphyInfrastructurePartII §8.16 (at its head) keeps §8.7's hypotheses with one
Steinberg place `v₀` and unrestricted conditions elsewhere. In the first application (`v₀ = v_2`, input
`Π_2`), the ring with Steinberg conditions on `T_{F_2} ∪ {v_2}` is a quotient. In the second
application (`v₀ ∈ T_{F_2}`, input `Π′_2`), the ring with `R^□` at `v_2` is finite, and `R_{𝒮′_{F_2}}` is
its quotient (nt26 lines 958–979). The remaining hypotheses also hold: §8.7(5) by Lemma 3.7 (§11.4),
§8.7(6) because `p ≥ 5` and `p ∤ 2r`, and the auxiliary place is `v_a` (`H²` vanishes by Lemma 3.3).

## RT-ModularityAndLanglandsExtensionsPartII~1a/F03 (P2) — applied

§11.6 sketch reordered as nt26 lines 945–979: §6.9 gives `Π_2`; §8.16 gives finiteness; the
Schur-form bound gives a characteristic-zero point; gap:auxiliary-place-reducible-lifting
(th24 Theorem 7.5) makes it automorphic, giving `Π′_2`; repeating with `Π′_2` gives `Π`. That gap
was added to the Needs line and the Layer 11 Dependencies.

## RT-ModularityAndLanglandsExtensionsPartII~1a/F04 (P2) — applied differently

Applied: the introductions of Layers 4–13 no longer open with a source section ("Newton–Thorne II §2
(nt21b pp. 5–19) proves …"). Each now opens with its mathematics and cites theorem locators at the
claims. The overview-table cells for Layers 2, 5, 6, 9–14 that named source theorems now name the
mathematics. Not applied: merging Layers 9 and 12 and Layers 8 and 10, and the renumbering.

Evidence against the merges:
- Each layer is one mathematical unit named by its mathematics, and its order is forced (§10.6 → §9.8,
  §13.3 → §11.10, §13.4 → §12.7, as the review says). That the papers divide the same mathematics the
  same way does not make the plan the source's arrangement.
- Layers 9 and 12 do not state one theorem twice; their statements differ in substance:
  - Layer 9 is `Sym^{n−1}` of non-ordinary weight-two forms for every `p`, including `p = 2` and `p ≤ n`.
    Layer 12 is a tensor with a fixed factor `σ`.
  - The Taylor–Wiles data differ: single-character level in §9.4, ordered diagonal level in §12.4.
  - The image hypotheses differ: §12.5's enormous tensor image against adequacy of `Sym^{n−1}`.
  - The patching bounds differ: nt21b Proposition 2.8, `q ≥ |S ∪ S_∞| − 2`, against nt26
    Proposition 4.9, `q ≥ |S ∪ S_∞|` (§§9.6, 12.6).
- The common patching template is already supplied (DeformationAndDerivedPatchingAlgebra §5.6,
  GL2ModularityLifting Layers 3, 6, gap:formal-torus-patching).
- A merged theorem "for a rank-two problem and a determinant obtained by a fixed algebraic
  construction" appears in no source. It would have no locator, and its hypotheses are not formulated
  anywhere.
- Merging Layers 8 and 10 gains nothing: Layer 8 does not use Layer 9, Layer 10 does.
- The further sources the review suggests are already cited where they are used: th24 Theorems 7.1
  and 7.6 in §13.9, ct17 Theorem 6.2 in §7.7, and kw09 Proposition 9.3 in gap:formal-torus-patching.

## RT-ModularityAndLanglandsExtensionsPartII~1a/F05 (P3) — applied differently

§14.1(1) now:
- chooses `F⁺_1` with `p` split completely, not merely unramified;
- keeps level `GL_2(𝒪_w)` above `p`;
- derives that `σ` is non-CM (Steinberg at `v`) and ι-ordinary, from §R07.5.11 over `ℚ_p` and
  PotentialAutomorphyInfrastructurePartII §0.5.

Added to Needs: §R07.5.11 and §0.5. New Check: a non-ordinary reducible example over `ℚ_{p²}`, and the
instance `p = 577`.

Why differently: §R07.5.11 (FiniteFlatGroupsAndIntegralPadicHodgeTheory, its README line 8093) states
"non-ordinary ⇒ irreducible reduction" only for `K = ℚ_p`. Over `ℚ_{p²}`, a sum of crystalline
characters with labelled weights `(4, 0)` and `(0, 4)` is crystalline of labelled weights `{0, 4}`,
not ordinary, and has reducible reduction. "`p` unramified in `F⁺_1`" therefore does not prove
ordinarity.

## RT-ModularityAndLanglandsExtensionsPartII~1b/F01 (P1) — applied

§13.3: PotentialModularityAndCompatibleSystems §10.10 → ModularityAndLanglandsExtensions §2.25 over a
quadratic CM `E/F`: Fontaine–Laffaille `{0, 2}` component above `t` (§2.1), tamely dihedral type at
`v_1`, automorphy by §2.16, soluble descent. Added the `v_1` condition (`q_{v_1} ≡ −1` mod `t`,
`t ≡ 1` mod 4; nt26 p. 42), two Checks, and §2.25 to contract and Dependencies.

Evidence: §10.10 (at its head) treats "weight-two lifts of determinant `ψχ_p`" only. §10.10 is kept
where it is correct: §§10.2, 10.5, 10.8 and §13.6 are all weight two.

## RT-ModularityAndLanglandsExtensionsPartII~1b/F02 (P1) — applied

§11.6: SerreWeightAndLevelOptimisation §2.4 → step (1), the Khare–Wintenberger argument of §11.2 run
over `F_2` with the Steinberg component also at `v_2`. It gives a non-CM ι-ordinary `σ_2` of weights
`{0, 2}`, Steinberg at `v_2`, then `SP_{r±1}`. Needs: PotentialAutomorphyInfrastructurePartII Layers
0, 5, 8. §2.4 left the Layer 11 Dependencies.

Evidence: §2.4 (at its head) is stated over `ℚ` with `ℓ ∤ N`, while `σ` lives over `F_2 ≠ ℚ` and has
level at `p`. §2.4 is kept for §§7.3, 7.4, which are over `ℚ` with `p ∤ 4`.

## RT-ModularityAndLanglandsExtensionsPartII~1b/F03 (P2) — applied

§§14.4–14.5, the contract and the Layer 14 Dependencies: AL.2 → AL.2.4.1 for entirety, AL.3.6.1 for
absolute convergence on `Re s > 1`, and AL.3.3.8 (Jacquet–Shalika `|α| < q^{1/2}`) for non-vanishing
factors, which `HasProd` needs. The contract now says no Ramanujan–Deligne bound is used.

Evidence: AL.2.4.1 (at its head) gives only "a sufficiently far-right half-plane".

## RT-ModularityAndLanglandsExtensionsPartII~1b/F04 (P2) — applied

Split the old slope-count gap: gap:unobstructed-auxiliary-prime (for §8.2) and
gap:slope-zero-one-dimension-count (nt21b Lemma 3.4, for §10.2), both GL2ModularityLifting Layer 3.
Dropped the §1.4 (`l = 2`) clause of gap:dyadic-definite-unitary-forms (`section` now "Layer 3"), and
§1.4 from §9.1's Needs and the Layer 9 Dependencies.

Evidence: the old slug named both halves, so it was renamed. nt21b uses potential diagonalizability
only in §3, for `t > 5` (lines 1187, 1255, 1281).

## RT-ModularityAndLanglandsExtensionsPartII~1b/F05 (P3) — applied differently

Deleted six unconsumed contract items: SerreWeightAndLevelOptimisation §3.2; EndoscopicTransferAndUnitaryTraceComparison
§§6.9, 6.26, 13.4; DeformationAndDerivedPatchingAlgebra §9.2; GlobalGaloisDeformations §8.6. Kept
EndoscopicTransferAndUnitaryTraceComparison §2.15 and named it in §5.6's sketch, its Needs line and
the Layer 5 Dependencies.

Evidence for keeping §2.15 ("Transfer of Euler–Poincaré functions to endoscopic groups"): §5.6
stabilises the trace formula with an archimedean Euler–Poincaré pseudo-coefficient, so its
endoscopic terms need exactly that transfer.

## Checks

- **Elaboration.** `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, run
  from the content checkout: exit 0. Output: `Suggested.lean:98:8: warning: declaration uses 'sorry'`
  and `Suggested.lean:117:8: warning: declaration uses 'sorry'` (the two headline theorems), nothing
  else. The pinned Tau Ceti module `TauCeti.NumberTheory.ModularForms.Newforms.Satake` was already built.
- **Signature check.** I made a scratch copy of the file with `#check @name` for all four declarations
  and elaborated it once (exit 0). I compared each type with README §§14.4–14.5:
  - `symPowerEulerFactor : ℕ → ℂ → ℂ → ℂ → ℂ`;
  - `HasQuadraticSelfTwist : {N} → [NeZero N] → {k} → Newform N k → Prop`;
  - the level-one theorem: `Newform 1 k`, `1 ≤ n`, Satake pairs at every prime, `HasProd` on
    `n(k−1)/2 + 1 < Re s`;
  - the general theorem: `[NeZero N]`, `2 ≤ k`, `¬HasQuadraticSelfTwist f`, `1 ≤ n`, pairs at `p ∤ N`.

  All four agree with the README; no binder is lost. Nothing changed in the file.
- **Dependency check** (command of the brief): `depcheck: 251 roadmaps, 2408 edges, 0 problem(s)`. No
  UPWARD, CYCLE or `moved:` line. The new suppliers are SpringerResolutionAndCharacteristicCycles
  (earlier in the merge order) and NilpotentOrbits (on main).
- **Citations** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean
  names found nowhere: None."
- **Gaps.** The 15 README slugs equal the 15 `gaps` slugs of `design/plan.json`, and each `needs`
  equals its README contract sentence (checked by script). The `plan.json` diff touches only the `gaps`
  array.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.9 adapted `φ` route | `G = PGL_2`, `G^∨ = SL_2`, `s = diag(q^{1/2}, q^{−1/2})`, `u` regular | neutral elements of triples with nilpositive `E` are `H + ℂE`. `D` is the diagonal torus (`q` not a root of unity). Weight-zero part of `H + cE` is `H`. Standard `φ`, `s₀ = 1` | agrees with the §4.9 Check (tempered Steinberg) | none |
| §4.9, `u = 1` | trivial `u` | `φ` trivial, `s₀ = s`; for `s = diag(q^{1/2}, q^{−1/2})` the moduli are `q^{±1/2}`, not tempered | agrees with the Check | none |
| gap:steinberg-equivariant-k-theory | `PGL_2` | pairs `(u, ρ)` for `s = diag(q^{1/2}, q^{−1/2})`: `u = 1` and `u` regular, `ρ` trivial. Two triples, the trivial representation and Steinberg | matches the first Check of §4.9 | none |
| §11.6 cyclotomic hypothesis | `PSL_2` case `A = SL_2(𝔽_{p^b})`; `PGL_2` case `p = 7` | `A^{ab} = 1`. For `⟨SL_2(𝔽_{7^a}), λ diag(ν, 1)⟩`: det `λ²ν = 1`, square `diag(ν, ν^{−1})`, `A^{ab}` of order 2. `|H^{ab}|` divides `2m` with `7 ∤ m` | holds | new Check |
| §11.6 negative control | upper unipotent `U ≅ 𝔽_7` | `U^{ab} = U`, of order 7 | hypothesis fails; large image needed | in Check |
| §11.6 degenerate rank | `r = 2` | constituents of dimension `3, 1`; `π′_2` is a character, "Steinberg" means unramified twist; §6.9 with `n_2 = 1` | consistent | none |
| §11.6 order of steps | the two finiteness problems | first: Steinberg at `T ∪ {v_2}` is a quotient of the §8.16 ring with `v₀ = v_2`. Second: `R_{𝒮′}` is the unramified-at-`v_2` quotient of the ring with `v₀ ∈ T` | both are §8.16 as stated | sketch rewritten |
| §13.3 weights of `σ′` | `r = 2` | `{0, 1} + {0, 2} = {0, 1, 2, 3}` regular; `{0, 1} + {0, 1}` repeats `1` | weight-two lift excluded | new Check |
| §13.3 place `v_1` | `t = 13` | `103 ≡ −1 (13)`, so a supercuspidal type exists; `53 ≡ 1 (13)`, so only principal series | condition needed | new Check |
| §13.3 §2.25 hypotheses | `n = 2`, `t > 4r + 2 ≥ 10` | `t ≥ 2(d + 1) = 6`; FL range `2 ≤ t − 2`; distinct labelled weights `{0, 2}` | hold | none |
| §14.1 ordinarity | `ℚ_p`, `n = 3`, `p = 577` | `577 = 2·288 + 1` prime, `≡ 1 (4)`; weights `{0, 4}`, `4 ≤ 575`; reducible reduction `ψ̄ ⊕ ψ̄^c` | ordinary | none |
| §14.1 negative control | `ℚ_{p²}`, `ψ_1 ⊕ ψ_2` with weights `(4, 0)`, `(0, 4)` | reducible reduction, no line of weights `(4, 4)` | not ordinary, so `p` must split completely | new Check |
| §14.4 half-plane | `n = 1`; `Δ`, `n = 2` | `(k − 1)/2 + 1 = (k + 1)/2`, the Tau Ceti region; `Δ`: `11 + 1 = 12` | consistent | none |
| §§14.4–14.5 factors non-zero | J–S bound | `|α_p^jβ_p^{n−j} p^{−n(k−1)/2} p^{−s′}| < p^{1/2 − Re s′} < 1` for `Re s′ > 1` | `HasProd` well-founded | AL.3.3.8 cited |
| §5.6 with §2.15 | compact `G(F ⊗ ℝ)` | compact groups have discrete series, so §2.15's hypothesis "`G` over `ℝ` with discrete series" holds | applies | none |
| gap:slope-zero-one-dimension-count | `χ_1 = χ_2` and `χ_1 ≠ χ_2` (nt21b lines 1028–1036) | JH multiplicity `p + 2`, resp. `p + 1`, so `≥ 3`, resp. `≥ 2` | the count needed is the one stated | none |

## Ownership and overlap

- Ownership against open pull requests was checked with `roadmaps grep`/`roadmaps show`.
- The Steinberg-variety `K`-theory has no owner on main or at any open head. SpringerResolutionAndCharacteristicCycles
  stops at §6.5 and puts Springer representations outside its scope. The gap therefore asks it, as
  SmoothRepresentationsOfLocalGroupsPartII already does.
- No new target or `Suggested.lean` declaration was added; no object is owned twice.
- `scratch/overlaps.md`: no open pull request changes this roadmap or drops an id it cites.

## For the maintainer

- **Gap slugs.** Renamed gap:unobstructed-auxiliary-prime-and-slope-count → gap:unobstructed-auxiliary-prime.
  New: gap:slope-zero-one-dimension-count and gap:steinberg-equivariant-k-theory. Removed:
  gap:geometric-weak-primitive-auxiliary-finiteness. No other roadmap cites these slugs (searched).
  No section, layer or target id changed.
- **SpringerResolutionAndCharacteristicCycles** now receives the same `K`-theory request from two
  roadmaps: this one and SmoothRepresentationsOfLocalGroupsPartII. Its scope paragraph excludes
  "general Springer representations", so a human should confirm it accepts the request. The review's
  human-reviewer note on two owners of the Kazhdan–Lusztig classification (this roadmap's §4.9 and
  SmoothRepresentationsOfLocalGroupsPartII SRU.7.4) is unchanged by this round.
- **Not verified.** kl87 (uncertified) is cited by locator only; the gap's content follows that
  locator. No suspicious instructions were found in the reviews.
