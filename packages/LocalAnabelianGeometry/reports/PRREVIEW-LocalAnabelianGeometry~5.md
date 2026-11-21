# Review of LocalAnabelianGeometry (pull request #1811 at 039fbee)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons, both small to repair. The homomorphism property of the logarithm on principal units, which 0.5 and the scope section claim as this roadmap's own, is already a target of ColemanIntegration L0.13 on main, and one sentence in the proof sketch of 0.6 is false at `x = −1/p`. Every finding of the previous review is repaired, the sampled locators in both sources support the statements, and the headline route of Layers 1–8 survived the computed checks. There are six small corrections and one format note, none blocking; three facts are left for the human reviewers.

## R01 (P2) — The homomorphism property of the logarithm on principal units is already a target of ColemanIntegration on main

Section 0.5 (lines 195–197) states that `log : U(K,1) → K` is a continuous homomorphism as a target of this roadmap, the opening of Layer 0 (lines 96–99) says this layer builds it, and the scope section (line 736) lists "the logarithm on principal units as a homomorphism" among what this roadmap owns. An implementer would then prove the same fact twice, once here and once for its first owner.

ColemanIntegration, on main and earlier in the merge order, has the target L0.13, "The logarithm series is a homomorphism on principal units" (`TauCetiRoadmap/ColemanIntegration/README.md`, line 361): for `K` complete, nontrivially normed, ultrametric and of characteristic zero, with a finite extension of `ℚ_p` named as an example (L0.10, line 213), `log(1+u) + log(1+v) = log((1+u)(1+v))` for `‖u‖, ‖v‖ < 1`, hence a continuous group homomorphism from `1 + 𝓂_K` to `(K, +)` that vanishes on roots of unity. Its supplier contracts (line 3351) also record the same product law in PadicFunctionalAnalysis §4.5 for complete normed `ℚ_p`-fields. The sentence about Mathlib and Tau Ceti in the Layer 0 opening is true at the pin (the pinned `log_mul_of_mem_unitFiltration` needs `e < (p − 1) i`); the ownership claim is what clashes.

The smallest change: in 0.5 cite ColemanIntegration L0.13 for the product law and continuity, add it to the `*Needs:*` line and to the supplier contracts, and say in one clause what 0.5 keeps as its own: the reading on Tau Ceti's `unitFiltration K 1` for the valuative carrier, the converse that the kernel is exactly the `p`-power roots of unity (L0.13 gives only vanishing on them), the isomorphism `U(K,1) ⊗_{ℤ_p} ℚ_p ≃ K`, and the `ℤ_p`-module structure. Reword the scope bullet accordingly. `log_mul_of_mem_unitFiltration_one` may stay in `Suggested.lean` as that adapter if its docstring says so.

## R02 (P2) — In 0.6, "`x ∈ ℤ_p` exactly when `1 + p x` has an `n`-th root for every `n` prime to `p`" is false at `x = −1/p`

The proof sketch of the `ℚ_p`-linearity of ring homomorphisms (lines 222–224) asserts an equivalence. For `x = −1/p ∉ ℤ_p` one has `1 + p x = 0 = 0^n` for every `n`, so the right-hand side holds and the left does not. For every other `x ∉ ℤ_p` the equivalence does hold: the elements of `ℚ_p^× = p^ℤ × μ_{p−1} × (1 + pℤ_p)` that are `n`-th powers for all `n` prime to `p` are exactly `1 + pℤ_p` (take `n = p − 1` for the middle factor; for `p = 2` the group is `1 + 2ℤ_2 = ℤ_2^×`).

The argument that follows uses only the implication from left to right, so the result is untouched. Either state that implication alone ("for `x ∈ ℤ_p`, `1 + p x` has an `n`-th root for every `n` prime to `p`"), or write "`1 + p x` is nonzero and has …".

## C01 — Two pointers to "example 2 of Layer 3" lead nowhere

The Examples of Layer 1 (line 289) and the last Check of 3.1 (line 384) refer to example 2 of Layer 3. Layer 3 has a single example, numbered 1, and the scope section (line 765) cites it as example 1. Point both at example 1.

## C02 — In 8.4 the glued map is called an automorphism of `AlgebraicClosure K`

Line 707 says the `θ_{m+1}` "glue to an automorphism `θ` of `AlgebraicClosure K = ⋃_m K^m`". Its target is `AlgebraicClosure K' = ⋃_m K'^m`, and `K ≠ K'` in general: it is an isomorphism `AlgebraicClosure K → AlgebraicClosure K'`, as the next sentence ("a field isomorphism of the algebraic closures") already says.

## C03 — `injective_artinMap` is listed as a ClassFieldTheory target, but the pinned Tau Ceti proves it

The supplier contract (lines 795–799) puts `injective_artinMap` under "Targets". At the pin it is a theorem, `TauCeti.ClassFieldTheory.injective_artinMap` with hypothesis `[CharZero K]` (`TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/ArtinMap.lean`, line 113). Move it to the implemented list; the first Conventions bullet, which describes its hypotheses as `Algebra ℚ_[p] K` and `Module.Finite ℚ_[p] K`, could say `CharZero`.

## C04 — The Check of 7.2 holds for the uniformizer `p` only

The Check (lines 615–617) says the character of 7.2 on `K = E = ℚ_p` sends `Art(p)` to `1`, so is `χ_cyc⁻¹`, and the Check of 7.3 (line 632) quotes this. The construction projects along the coordinates attached to a chosen uniformizer `ϖ` of `E`; for `ϖ = p v`, `v ∈ ℤ_p^×`, one gets `Art(p) = Art(ϖ)·Art(v⁻¹) ↦ v⁻¹`, and the character is `χ_cyc⁻¹` times an unramified character. Add "for the uniformizer `p`"; the Hodge–Tate numbers in the Check of 7.3 are the same for every choice.

## C05 — The reason given in the last Check of 5.1 does not give the conclusion

Line 490 infers that `K^m` is not complete from `K^1 ⊇ K(μ_{p^∞})`, "which is not complete". A field containing a non-complete subfield may be complete (`ℂ_p ⊇ ℚ̄_p`). The conclusion is right for the reason PadicPeriodRings §1.2 gives in its own Check, applied to `K^m` directly: it has countably infinite dimension over `ℚ_p`.

## C06 — The pull request description describes an earlier head

Three sentences no longer match. "TauCetiProject/TauCetiRoadmap#1411: unit-filtration reciprocity, in its absolute form": the head cites ClassFieldTheory Layer 7's `map_artinMap_unitFiltration_eq_upper` as it is on main, and no amendment. "`Suggested.lean` covers Layer 0, the `G_K` forms of Layers 1–3, and uniformizing characters": of Layer 0 the file now states only 0.5–0.6; 0.1–0.3 are README targets. "ClassFieldTheory targets: `injective_artinMap` (Layer 8)": see C03. Text that would be right: "ClassFieldTheory Layer 7 targets on main: `map_artinMap_unitFiltration_eq_upper`, `cyclotomicCharacter_artinMap`"; "`Suggested.lean` covers 0.5–0.6, …".

## N01 — `map_wildInertiaSubgroup` has no docstring

In `Suggested.lean`, line 114; the other ten declarations have one.

## Verified sound

Previous review, finding by finding: R01 (three `sorry`'d definitions) repaired, the file has one `def`, with a real body; R02 (unit-filtration reciprocity unowned) repaired, 0.4 now cites `map_artinMap_unitFiltration_eq_upper`, a Layer 7 target of ClassFieldTheory on main (its README line 986); R03 (dropped binders) repaired, `include hK` and all ten elaborated types carry `FinitePadicExtension`; R04 (shape) repaired; R05 (pull-request numbers) repaired, none in either file; R06 (names) repaired, all eleven backticked own names are declared and 7.1–7.2 no longer assume `E` Galois; R07 (pinned declarations) repaired, all four are cited.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 `p`-adic model | `ℚ_p(√p)`, `p` odd; `ℚ_p(p^{1/3})`, `p ≡ 2 mod 3` | Galois: one fixing subgroup. `ζ_3 ∉ K` since `2 ∤ 3`: three distinct conjugate fields | Checks true |
| 0.2 transfer | `H = G`; `G = ℤ_p`, `H = pℤ_p` | identity; `Ver(x) = [G:H]x = px`, iso onto `pℤ_p` | Checks true |
| 0.4 units and filtration | `ℚ_p` odd; `ℚ_2`; `ℚ_3(ζ_9)` | `Art(ℤ_p^×) ≅ μ_{p−1} × U^(1)`; `U^(1) = ℤ_2^×`; upper jumps `0, 1`, lower `0, 2`: upper group at 2 trivial, lower of order 3 | Checks true |
| 0.5 logarithm | `ℚ_2`, `u = −1`; `ℚ_3(μ_3)`; `ℚ_p`, `1+p` | `2 log(−1) = 0`; `ζ_3 ≡ 1 mod (1−ζ_3)`, kernel `μ_3`; `v(log(1+p)) = 1` | true; ownership: R01 |
| 0.6 span | `ℚ_p(√p)`, `I = μ_{p−1}`; `I ⊇ 1 + p^n𝒪` | span `ℚ_p ≠ K`; span `⊇ p^n𝒪`, so `K` | statement true |
| 0.6 `ℚ_p`-linearity | `x = −1/p`; `x ∈ ℤ_p`; `p = 2` | `1+px = 0 = 0^n`; `1+pℤ_p` is `n`-divisible, `n` prime to `p`; `1+2ℤ_2 = ±(1+4ℤ_2)`, odd roots exist | result true; sentence false: R02 |
| 1.1 invariants | `ℚ_2`; `ℚ_3(μ_3)`; `ℚ_p` | `#(A_{/tor}/2) = 4`, `d=f=a=e=1`; `27`, `d=2, f=1, a=1, e=2`; `p^2` exactly | Checks true |
| 2.1 Kummer sequences | `K(μ_{ℓ^ν})`, `ℓ = p` and `ℓ ≠ p`; constant sequence; `(ℤ/2)^2` | `H_ν^ab[ℓ^ν] = Art(μ_{ℓ^ν})`, order `ℓ^ν`; bounded torsion, fails; `H_1^ab[2]` not cyclic | Checks true |
| 2.2 comparison, recovery | `ℚ_p`, `ℓ = p`; `ℓ ≠ p` | `χ(Art u) = u⁻¹`, `χ(Art p) = 1`; Frobenius `↦ q` | agrees with pinned normalization |
| 3.1 `I(G)`, `P(G)` | `ℚ_p(√p)`; unramified quadratic; `ℚ_2`; `m = 0` | `e = 2 ≠ 1` excluded; `e = 1` kept; tame `∏_{ℓ≠2} ℤ_ℓ(1)` metabelian, survives; swap of two `ℤ_p` factors moves inertia | Checks true; `m ≥ 1` needed |
| 4.1 `(k^m)_+` | `ℚ_p`, `H = G` | `U(G) ⊗ ℚ_p ≅ ℚ_p`, rank 1; whole pro-`p` part has rank 2 | Check true |
| 5.1 integers | `ℚ_p` odd; `ℚ_2`; `ℚ_3(μ_3)` | `p⁻¹·pℤ_p = ℤ_p`; `2⁻²·4ℤ_2 = ℤ_2`, with `ε = 1`: `2ℤ_2`; depth 2: `3𝒪_K`, and `e < (p−1)εe` holds | Checks true (C05 on the last) |
| 6.1 bounds | `ℚ_p(1) ⊕ ℚ_p`; unipotent `log χ` | `d^1 = d^0 = 1`, sum 2; connecting map hits `[log χ] ≠ 0`, `d^0 = 1`, sum `1 < 2` | Checks true |
| 6.2 lines | `K = E = ℚ_p`, `ℚ_p(1)`; `K = E = ℚ_p(√p)`, trivial | `1·1 = 1 = d^1`; `1·2 = 2 = dim_K(K ⊗ E)` | formula consistent |
| 6.3 descent | `V` trivial; twist | `(ℂ_p)^{G_K} = K = (ℂ_F)^{G_K}`, `F = K`; `χ` factors through `G^1` | true |
| 6.4 numbers | `ℚ_p(√p)`, `V` trivial | invariants `K`, `ℚ_p`-dimension `2 = d(G^ab)`, quotient 1 | Check true |
| 7.1 uniformizing | `ℚ_p`: trivial, `χ_cyc`, `χ_cyc⁻¹` | `1 ≠ u`; `u⁻¹ = u` only for `±1`; `ι = id` on `ℤ_p^×` | definition excludes both wrong models |
| 7.2 existence | `ℚ_p`, `ϖ = p` and `ϖ = pv` | `Art(p) ↦ 1`; `Art(p) ↦ v⁻¹` | statement true; Check: C04 |
| 7.3 criterion, sign | `ρ = χ_cyc⁻¹` on `ℚ_p` | `ℂ_p(−1−i)` has invariants iff `i = −1`; `d^{−1} = 1`, `d^0 = 0 = 1·(1−1)` | sign as stated |
| 7.4 recovery | `K, K' ⊆ E` | `[E:K] = [E:K']` from Layer 1; both numbers preserved by 6.4 at `m = 1` | follows |
| 8.1 weak theorem | common open `I_0` | `ι = ι'∘α_U` on `I_0`; spans give `ι(K) = ι'(K')` | route sound |
| 8.2 uniqueness | `m = 0`, `ℚ_p` | every `σ ∈ G^1` commutes; `γ|_K = id` always | only `θ|_K` unique at `m = 0` |
| 8.3 strong theorem | indices | descent with `(m+1, 2)` on `G^{m+3}`; needs `[0,∞) ⊆ S`, given by Layer 3 since `m+3 ≥ 2` | route sound |
| 8.4 Mochizuki | `K = K' = ℚ_p`; `S = (0,∞)` vs `[0,∞)` | `Isom = {id}`, `Out_Filt` trivial; the two sets coincide by Layer 3 | true; wording: C02 |
| Lean generality | all ten theorems | each elaborated type carries `FinitePadicExtension K p`; Recovery has two primes | equals README |

- Source locators checked against the text: 30 (hyeon2025 17, mochizuki1997 13), all at their theorem numbers; hyeon2025 lines 133–142, 338–360, 363–456, 463–477, 484–546, 552–648, 657–781, 785–866; mochizuki1997 lines 88–113, 135, 168–203, 220–237, 259–276.
- Library declarations opened at the pin: 27 in Tau Ceti (among them `injective_artinMap`, `LocalExistence/ArtinMap.lean` 113; `transfer_transfer`, `GroupTheory/Transfer/Basic.lean` 146; `isProPSylow_wildInertiaSubgroup`, `LocalField/WildInertia.lean` 611; `deepUnitExpLogEquiv`, `DeepUnits/Basic.lean` 117; `FinitePadicExtension`, `AbsoluteRamificationIndex.lean` 64) and `Field.absoluteGaloisGroupAbelianization` in Mathlib (`FieldTheory/AbsoluteGaloisGroup.lean` 101). Not at the pin, as the docstring says: any absolute upper filtration, closed derived series or group filtration.
- Cross-roadmap citations resolved: FilteredLocalGaloisGroups at its open head (Layers 0–3, §§2.0–2.4, 3.1, 3.2, 3.4 and the eleven names cited); ClassFieldTheory on main (Layers 4, 7, 8); PadicPeriodRings on main (§§1.1, 1.2, 1.4 and their Checks); FiniteFlatGroupsAndIntegralPadicHodgeTheory on main (§§R07.P7.1, R07.P7.3); AnabelianGeometryAndNonabelianChabauty on main (§3.5); LocalGaloisGroups Layer 5.
- Dependency check: `depcheck: 172 roadmaps, 2001 edges, 0 problem(s)`. FilteredLocalGaloisGroups is an open new-roadmap pull request not yet in the merge order; this roadmap is placed after it.
- Elaboration: exit 0, ten `declaration uses sorry` warnings, nothing else. `#check @` types compared with the README for all eleven declarations: no change.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on all ten theorems: none closes. Headlines 8.1, 8.3, 8.4 are not statable at the pins and the docstring says so.
- No change outside the folder; no `set_option`, no `sorry`'d data.

Overlap check: read FilteredLocalGaloisGroups, FieldOfNorms, ClassFieldTheory, PadicPeriodRings, LocalFieldsRamification; LocalFieldsRamification owns the deep-unit logarithm, which 0.5 cites; FilteredLocalGaloisGroups hands the anabelian theorems to this roadmap and keeps filtrations, descent, coordinates and centre-freeness of `G_K^m` (consistent both ways); the product law of the logarithm is shared with ColemanIntegration L0.13, owner ColemanIntegration (R01); nothing else shared.

Source independence: 9 passages compared with 2 sources, none shared beyond formulas the mathematics forces; largest share hyeon2025, 17 of 30 locators; contents compared with hyeon2025: Layers 1–8 run in the order of its §§3–6, two layers to a section, an order the dependency lines force (3 needs 1, 4 needs 3, 5 needs 4, 6 needs 1, 2 and 5, 7 needs 6, 8 needs 7); Layer 0, the proofs of 6.2 and 7.3, the index-set bridge of 3.2 and 8.4 are the roadmap's own: independent.

Research link: Layer 8 is Mochizuki 1997, Thm. 4.2, and Hyeon 2025, Thms. 1.4–1.5, the local counterparts of Saïdi–Tamagawa's `m`-step solvable theorems for number fields (hyeon2025 lines 112–130); Abrashkin's equal-characteristic analogue is named in the README's scope. Rests on the README and hyeon2025 §1.

## Not verifiable

- Serre, *Local Fields* VII §8, XI §3, XV §2; Serre, *Abelian ℓ-adic representations* III App. §5; Tate 1967 §3.3; Neukirch II §5; Yamagata 1976; Jarden–Ritter 1979: listed in the References as background, with no target resting on them alone; not in the manifest and not opened.

## Source issues

- **Error** in hyeon2025 at Proposition 5.5, printed page 17: the source says a line is uniformizing iff its Hodge–Tate number at `i = 1` is `[E:K]` and at `i = 0` is `[E:K]([K:ℚ_p]−1)`; it should be `i = −1`, since the source takes arithmetic Frobenius (page 9) and twists by `χ^{−i}` (page 15); affects a stated result.
- **Error** in hyeon2025 at §4, printed page 13: the source says `ψ_H(v)` is the integral of the index of `(G/H)(w)` in all of `G/H`; it should be the index in the inertia group `(G/H)(0)`, otherwise `ψ = f·v` for an unramified extension; affects the proof.
- **Misprint** in mochizuki1997 at §3, printed page 6: the source says `d_V(i)` is the `ℚ_p`-dimension of the invariants; it should be the `K`-dimension, since the trivial line over `K ≠ ℚ_p` would otherwise violate the bound stated next; affects nothing.

## For the human reviewers

- Scope: Layers 1–8 follow the order of hyeon2025 §§3–6, two layers per section (17 of 30 locators); the dependency lines force that order. Whether this arrangement is acceptable for a roadmap of one article's theorem is yours to judge.
- Licence: the manifest entry `mochizuki1997` records the author's page as its origin but has no authors, title or year fields.
- Not tested: the 7.3 criterion is stated at `i = −1` where both sources print `i = 1`; the README's computation on `ℚ_p` was checked, Serre's appendix (the primary source) was not opened.
