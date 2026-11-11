# Review of ModularCharactersAndBlocks (pull request #1775 at d91b7b5)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

Full review. Of the three previous findings, two are repaired (the vertex comparison and the passage from algebraically closed to splitting fields). The family-index finding is not, and is carried as R02. The passage that this head added to §7.2 raises one new finding, R01. Both are P3.

## R01 (P3) — §7.2 uses the completed maximal unramified extension without citing its owner

**Location.** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:1214–1215`: “the completion of the maximal unramified extension of `K` is a system with residue field `k̄`”. The *Needs:* line at `:1218` reads “§§1.3, 5.1, 6.3, 7.1”.

**Claim.** The step that carries the second main theorem and the block orthogonality of Sambale (stated for an algebraically closed residue field) to the system of §1.1 needs a complete discrete valuation ring `O′ ⊇ O` with residue field `k̄`. No layer here constructs it, no supplier contract or *Needs:* line names an owner, and the pinned Tau Ceti has `K^ur` but not its completion.

**Witness.** Tau Ceti `TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean:97` defines `TauCeti.maximalUnramifiedExtension` only. RamificationOfCompleteDiscretelyValuedFields §4a.3 on main (its README lines 1187–1189) states that `K′` is complete, discretely valued, with `e(K′/K) = 1` and residue field an algebraic closure of `k`.

**Repair.** Cite the owner; state nothing new.
- At `:1214–1215` write: “the completion `K′` of the maximal unramified extension of `K` is complete for a discrete valuation with `e(K′/K) = 1` and residue field `k̄` (RamificationOfCompleteDiscretelyValuedFields §4a.3; the residue field of `K` is finite, hence perfect), so its valuation ring gives a `p`-modular system with residue field `k̄`”.
- Add “RamificationOfCompleteDiscretelyValuedFields §4a.3” to the *Needs:* lines at `:1218` and `:1223–1224`, and to the Layer 7 *Dependencies* at `:1271–1272`.
- Add under *Planned by other roadmaps* and as a subsection `### From TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields` of the supplier contracts: “§4a.3: for `K` complete discretely valued with perfect residue field `k`, the completion `K′` of `K^ur` is complete discretely valued with `e(K′/K) = 1` and residue field an algebraic closure of `k`.”
- Add the supplier to the description's list of reused foundations.

Tested on the instances of §7.2's Checks. For `S₃` at `p = 2` the system of §1.1 has `K = ℚ₂(ζ₃)` with residue field `𝔽₄`; `K′` is the completion of `ℚ₂^ur`, with uniformizer `2` and residue field `𝔽̄₂`; the blocks `e₀`, `e₁` of `𝔽₄[S₃]` and the block `1` of `𝔽₄[C₂]` are the blocks over `𝔽̄₂`. For `C₂` at `p = 2`, `K = ℚ₂` and the single block is unchanged. The supplier is on main and is line 2 of the merge order, so the edge is not upward.

## R02 (P3) — The family index still names this roadmap as the owner of Brauer characters

Re-raised: H03. The file is unchanged since `82701b2`. The reason given for leaving it (the repair job edits only the folder) says who may make the edit, not that the sentence is right; the files directly in `TauCetiRoadmap/RepresentationTheory/` belong to this pull request, which wrote the sentence.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim.** The folder imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (folder `README.md:99–108`). “Both” follows three named roadmaps. The dependency bullet at `:78–81` omits SemisimpleAlgebras Layers 0–2, which §§2.2, 2.3 and 6.2 consume.

**Witness.** Folder `README.md:517–518`: “Their linear independence is imported from GL2AutomorphicRepresentationsAndTransfer §R17.5.11”. The description itself says this roadmap owns “the remaining Brauer-character formulas”.

**Repair.** Replace the sentence with: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes these foundations, imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.” Add SemisimpleAlgebras Layers 0–2 to the bullet at `:78–81`. Tested: the imported items match §R17.5.11 as cited in the folder; the owned items match folder §§2.2, 2.4, 3.1 and Layers 4–7.

## Previous findings

- R01 (vertex comparison unowned) — repaired. `README.md:1001–1005` now asks for “the subgroups `P` minimal with `e ∈ Tr_P^G(k[G]^P)`, and that they form one conjugacy class”, and mentions vertices only as what Webb's theorems compare with. `:35–37` puts relative projectivity, vertices and Green correspondence outside the roadmap. The routes at `:1005–1016`, `:1040–1044`, `:1048–1052` and `:1055–1067` use relative traces only; each step is checked below.
- R02 (no passage from `k̄` to splitting fields) — repaired. `README.md:1024–1033`: “for an extension `k ⊆ k'` of fields of characteristic `p` with `k` splitting a subgroup `H` … the blocks of `k[H]` are exactly the blocks of `k'[H]`”. §7.1 (`:1175–1178`) and §7.3 (`:1249–1251`) use it, their locators are marked with the sources' fields, and a Check is at `:1117–1122`. The §7.2 passage has the gap of R01 above.
- R03 (family index) — not repaired: carried as R02.

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check, including the targeted build.
- Dependency check with the candidate order and `--movable`: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. ArithmeticGaloisDuality is line 62, GL2AutomorphicRepresentationsAndTransfer 101, this roadmap 102, OddOrderTheorem 401. The suppliers SemisimpleAlgebras, QuiverRepresentations, GrothendieckEulerForms, ModularInduction, CharacterTheory and InductionRestriction are on main.
- `lake env lean` on `Suggested.lean`: exit 0, 13 warnings, all `declaration uses sorry`.
- Outside the folder the pull request changes only `TauCetiRoadmap/RepresentationTheory/README.md`, the family index (R02).

**Suggested.lean.**
- Byte-identical to `82701b2`; pins unchanged (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as on main).
- One-tactic probe on a scratch copy, each `sorry` replaced by `first | rfl | infer_instance | simp | exact?`: all 13 theorems fail. Nothing is padding.
- The elaborated signatures of the 18 declarations show no lost binder (`brauerProjection` and `IsDefectGroup` keep `[Finite G]` and `[Field k]`). Five definitions with real bodies, no sorried data, no `set_option`, a single `import Mathlib` and seven `TauCeti.*` modules.
- Headlines: eleven end theorems of the Summary are stated, with `complete_blockIdempotents_unique` and `brauerProjection_mul`. The Brauer-character basis, the generalized decomposition numbers with their orthogonality and the second main theorem are named in the docstring as not statable (no Brauer character at the pins: no hit for it in either pinned library).

**Library declarations opened at the pin** (new at this head): `Representation.relNorm` (`TauCeti/RepresentationTheory/RelativeNorm.lean:85`), `Representation.relNorm_comp_norm` (`:122`, `relNorm ρ H ∘ₗ norm (ρ.comp H.subtype) = ρ.norm`), `Representation.relNorm_apply_of_forall_apply_eq` (`:184`, value `H.index • x`), `Representation.relNormInvariants` (`:204`, from the `H`-invariants to the `G`-invariants), `Rep.moduleProjective_of_id_mem_range_norm_linHom` (`TauCeti/RepresentationTheory/NormSplit/Basic.lean:162`; it assumes `Module.Projective k A.V`, automatic over a field). Each says what §§6.1–6.2 assume of it. Neither pin has defect groups, block idempotents, Brauer maps, `π`-cores or relative projectivity of modules.

**Changed routes, step by step.**
- Minimal `P` is a `p`-group: `a = Tr_S^P(|P : S|⁻¹ a)` for `S` Sylow in `P`.
- `Br_P(e) ≠ 0` for minimal `P`: `e = Tr_P^G(a) e = ∑_{Q<P} Tr_Q^G(a c_Q)` uses the left product formula added to §6.1, then Rosenberg in the commutative `Z(k[G])`.
- `Br_Q(e) ≠ 0` forces `Q ≤ gPg⁻¹` by Mackey; hence maximality of `P`, conjugacy, and every defect group is a conjugate of `P`.
- Principal block: augmentation `∑_C a(C)|C| = 1` gives a class with `a(C) ≠ 0` and `p ∤ |C|`.
- `O_p(G)`: a class outside the normal subgroup `C_G(Q)` has no `Q`-fixed element, so its `Q`-orbits have `p`-power size greater than `1` and its class sum kills every simple module.
- Defect zero: `e_B = Tr_1^G(a)` makes `1_M = ∑_g g a g⁻¹` on every module of the block; conversely the coefficient of `Tr_1^G(a)` at `c` is `|C_G(c)|` times a class sum of coefficients.
- Central character: `Z e_B / (Z e_B ∩ rad)` is a local subalgebra of `kʳ`, hence `k`.
- Scalar extension: `k' ⊗_k Z(k[H]) e_b` has nilpotent maximal ideal with quotient `k'`.
- Webb's proof of Theorem 12.6.4 (webb lines 10524–10565) uses Theorem 12.4.5, Proposition 12.5.7, Corollary 12.3.4 and Lemma 12.6.3, all owned in §§6.1–6.2 by the trace routes; no vertex enters.

**Seeded sample and the changed sections.** Printed pages follow the page markers: Webb PDF − 7, Martínez PDF − 8, Craven PDF − 5, Sambale PDF.

| Target | Locators checked (source line, printed page) | Result |
| --- | --- | --- |
| 0.1 | Webb L9.3.4 p.146 (webb 6147); Martínez p.3 (martinez 165–167) | supports the factorisation only, as the README says |
| 0.2 | Webb P12.1.1–12.1.2 p.227 (9585, 9596), C12.1.3 p.228 (9608); Martínez T2.11 p.15 (648) | supports |
| 0.3 | Webb §6.2 p.88 (3700, 3726); proof of C12.3.4 p.236 (9972–9977) | supports |
| 1.3 | Webb P9.4.3 p.149 (6276), P9.4.5 p.151 (6334) | supports |
| 2.1 | Webb P10.1.3 p.170 (7179); Martínez L1.1–1.2 pp.2–3 (130, 150), induction formula p.37 (1386) | supports |
| 2.2 | Webb T10.2.2 p.176 (7438), T9.3.6 p.147 (6167, splitting field), L9.3.1–9.3.2 and P9.3.3 pp.145–146 (6093, 6121, 6130), L9.3.5 p.147 (6161); Martínez P1.5 p.3 (174), T1.9 p.5 (219) | supports |
| 3.1 | Martínez P1.12 p.5 (264), C1.13 p.6 (300); Webb T9.5.4 p.159 (6670), P10.2.1 p.174 (7383), P9.5.1 p.157 (6623), C9.5.6 p.160 (6712), C10.3.3 p.183 (7720) | supports |
| 4.1 | Webb T3.6.2 p.42 (1907) | supports |
| 4.3 | Sambale D1.2 p.14 (sambale 335) | supports |
| 5.1 | Sambale D1.9 p.15 (399): coefficients in `ℤ[ζ_{|u|}]` | supports |
| 6.1 | Webb L11.3.1 pp.194–195 (8191), P12.4.1 p.238 (10047, both product formulas), §12.5 p.243 (10234), C12.5.4 p.246 (10365), L12.5.3 p.245 (10341), L11.6.8(2) p.215 (9091); Martínez T4.1 p.23 (894) | supports |
| 6.2 (changed) | Webb T12.4.5 p.241 (10173), T12.5.2 p.244 (10292, proof to 10330), L12.5.1(2) p.244 (10276), C12.4.7 and C12.4.8 p.242 (10199, 10209), C12.3.4 pp.236–237 (9969), P11.3.4 p.198 (8341), T9.6.1 p.161 (6800), C12.5.5 p.246 (10384), T12.6.4 p.250 (10524); Martínez C3.9 p.21 (869), C2.9 p.15 (630) | supports |
| 7.1 (changed) | Sambale D1.10, P1.11, T1.12 p.16 (424, 438, 442; `F` algebraically closed at 316); Martínez T4.10 p.27 (1085) | supports over the stated fields |
| 7.2 | Sambale T1.13, T1.14 p.16 (445, 465); Martínez C2.4 p.11 (451, `g` regular and `x` singular) | supports; passage to §1.1: R01 |
| 7.3 (changed) | Sambale T1.15 p.17 (478) | supports |
| 8.2 | Webb §4.2 p.53 (2348); Martínez §8.1 p.51 (1878), T8.5(iii) p.52 (1928), D7.3 and Problem 7.4 p.44 (1638, 1642), T7.7 p.45 (1710); Sambale T1.24 p.18 (547) | supports |
| 8.3 | Navarro T6.10 | not readable, see below |
| 8.4 | no locator; the list matches §§0.1, 0.3, 1.1, 2.4, 4.2–4.3, 5.1, 7.2, 7.3, 8.2–8.3 and the Downstream entry | consistent |
| 6.3 (outside the sample) | Craven D2.6 p.22, L2.7 and D2.8 p.23, L2.9 and D2.10 p.24, T2.11–2.12 p.25 (craven 814–897) | pages agree |

**Adversarial table.** Notation: `r = (123)`, `t = (12)`, `α² + α + 1 = 0` in `𝔽₄`, `e₀ = 1 + r + r²`, `e₁ = r + r²`. All values were computed for this review.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A01 | §6.2 trace minimality | `𝔽₂[S₃]`, `P = 1`, `C₃`, `⟨t⟩` | `Tr_1^G`: coefficients `6a(1) = 0`, `3(a(r) + a(r²))`, `2(…) = 0`, image `𝔽₂e₁`; `Tr_{C₃}^G` on `1, r, r², K_t`: `0, e₁, e₁, 0`, image `𝔽₂e₁`; `Tr_{⟨t⟩}^G(e₀) = 3e₀ = e₀` | minimal groups: `1` for `e₁`, order `2` for `e₀` | none |
| A02 | §6.2 Mackey step | `e₀ = Tr_{⟨t⟩}^G(e₀)`, `Q = ⟨tr⟩` | double cosets of sizes `4` and `2`; terms `Tr_1^Q(e₀) = 2e₀ = 0` and `Tr_Q^Q(e₀) = e₀` | sum `e₀`; `Q` conjugate to `P` | none |
| A03 | `isDefectGroup_conj` | `𝔽₂[S₃]`, `e₀`, `e₁` | `Br_{⟨t⟩}(e₀) = 1`, three conjugate groups; `Br_{⟨t⟩}(e₁) = 0`, only `1` | Pass | none |
| A04 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `𝔽₂[S₃]`; `G = 1` | `aug e₀ = 1·1 + 1·2 = 1`, class `{1}` of size `1`; `aug e₁ = 0`; trivial group `1 = 1` | Pass | none |
| A05 | `O_p(G)` in every defect group | `S₃`, `p = 3`; control `⟨t⟩`, `p = 2` | transpositions: one `C₃`-orbit of size `3`, class sum acts as `3·(±1) = 0`; `Br_{C₃}(1) = 1`; control `Br_{⟨t⟩}(e₁) = 0` | Pass; normality needed | none |
| A06 | defect zero ⇔ matrix algebra | `𝔽₂[S₃] e₁`; control `𝔽₂[C₃] e₁` | `e₁ = Tr_1^G(r)`: coefficients `3·1 = 1` at `r`, `r²`; on the `2`-dimensional simple, `r + r² = 1`; block `M₂(𝔽₂)`, dimension `4`; control `𝔽₄`, dimension `2` | Pass; splitting needed | none |
| A07 | central character and defect classes | `𝔽₂[S₃]`; `𝔽₄[C₃]`; `𝔽₂[C₃]` | `λ_{B₀} = (1, 0, 1)`, `λ_{B₁} = (1, 1, 0)` on `(K_1, K_r, K_t)`; `e₁`: `a·λ = 1·1` on `K_r`, Sylow of `C₃` is `1`; `𝔽₄`: `α²·α = 1`; `𝔽₂[C₃]e₁ ≅ 𝔽₄`, no map to `𝔽₂` | Pass | none |
| A08 | scalar extension | `𝔽₄ ⊆ 𝔽̄₂`; `𝔽₂ ⊆ 𝔽₄` | blocks unchanged; `e_α + e_{α²} = 2 + (α² + α)(r + r²) = e₁` | Pass; splitting of `H` needed | none |
| A09 | §7.2 passage to the system of §1.1 | `S₃`, `p = 2`; `C₂`, `p = 2` | `K = ℚ₂(ζ₃)`, `k = 𝔽₄`, `K′` with residue field `𝔽̄₂`; `d^t = (1, −1, 0)`, nonzero on `B₀` only | true; the extension is not cited | R01 |
| A10 | `complete_blockIdempotents_unique` | `𝔽₃[C₂]` | `e₊ = 2 + 2t`, `e₊² = 8 + 8t = e₊`; `e₋ = 2 + t`, `e₊e₋ = 6 + 6t = 0`, sum `4 + 3t = 1` | Pass | none |
| A11 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `G = 1` | `(1 + r + r²)/3 ↦ e₀`, `(2 − r − r²)/3 ↦ e₁`; `1 ↦ 1` | Pass | none |
| A12 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at `2`, `3`; `G = 1`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| A13 | `span_decompositionRows_eq_top` | `S₃` at `3`; `C₂` at `2`; `ι` empty | `(1,0), (0,1), (1,1)` span `ℤ²`; `(1), (1)` span `ℤ`; `ℤ⁰` | Pass | none |
| A14 | `cartanMatrix_eq_transpose_mul_decomposition` | `S₃` at `3`, `2`; control `C₄/ℤ₂` | `[[2,1],[1,2]]`; `diag(2,1)`; `6 ≠ 4`, excluded since `ℚ₂` has no primitive fourth root | Pass | none |
| A15 | `exists_blockIdempotent_iff_centralCharacter_congr` | `S₃` over `ℤ₂[ζ₃]` | trivial against sign: `3·2 = 6 ∈ m`, one block; trivial against standard: `3 ∉ m`, two blocks | Pass | none |
| A16 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩` | `x = y = e₁`: `0 = 0`; `x = r, y = r²`: `1 ≠ 0`; over `ℚ`: `2 ≠ 0` | Pass; hypotheses needed | none |
| A17 | `brauer_first_main` | `S₃`, `D = ⟨t⟩`; `D = 1`; `A₅`, `D = C₂` | `{1} ≃ {e₀}`, `Br_D(e₀)·1 = 1`; identity on `{e₁}`; both sides empty | Pass | none |
| A18 | `sum_sameBlock_mul_conj_eq_zero` | `S₃`, `p = 2`, `(g, h) = (1, t)`, `(r, t)` | `B₀`: `1 − 1 = 0`; `{std}`: `2·0 = 0`, `(−1)·0 = 0` | Pass | none |
| A19 | `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `1·1 ≠ 0 ↔ aug 1 = 1`; `e₀e₁ = 0 ↔ aug e₁ = 0` | Pass | none |
| A20 | `mem_pPrimeCore_iff_forall_principalBlock` | `S₃` at `2`, `3`; `G = 1` | `{1, sgn}`: `sgn(g) = 1 ⇔ g ∈ C₃`; `std(g) = 2 ⇔ g = 1`; `1 = 1` | Pass | none |
| A21 | §7.1 Check on `S₅`, `p = 3` | cores of the partitions of `5` | `(5)` has `3`-core `(2)`; `(4,1)` and `(1⁵)` have `3`-core `(1,1)`; `(3,1,1)` is a `3`-core, of degree `6` | `B₂ ∋ sgn, χ_{(4,1)}`; `χ_{(4,1)}((45)) = 2` | none |

**Ownership and overlaps.**
- The overlap report lists no dropped id, no revision-only id and no other pull request changing this folder; the resolver finds every citation and Lean name.
- `π`-cores: LocalFiniteGroupTheory (open, never a supplier), OddOrderTheorem §1.1 and GlaubermanZStar write or attribute the same cores. This roadmap is the earliest of them in the merge order and *Scope and ownership* records §0.3 as the owner; the change is theirs. No fully qualified name coincides.
- A search of main and the 439 open heads for defect groups, Brauer pairs, block idempotents and decomposition matrices finds no second owner; the hits are citations or other senses of “block”.
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and ArithmeticGaloisDuality §R02.4.4 resolve at their open heads; both precede this roadmap in the merge order. The generated depends-on block lists both.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III, §15.2 and §16.1: settled as uncertified, cited by locator.
- The two Axiom formalizations linked under References are named as proof sources only; they were not opened.
- Ownership against open pull requests covers the 439 heads in the index of 2026-11-11T05:35:24Z.

## Source issues

- none
