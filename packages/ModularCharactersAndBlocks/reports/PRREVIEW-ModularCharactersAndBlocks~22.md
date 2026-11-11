# Review of ModularCharactersAndBlocks (pull request #1775 at 11fcc6f)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

## R01 (P3) — Correct the family index’s owner of Brauer characters

Re-raised: H02 (the earlier repair disposition cited by the previous report’s R01).

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** the index assigns the Brauer-character construction to ModularCharactersAndBlocks, contradicting the folder’s supplier contract.

**Witness:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:93–102` imports Brauer characters and their projective pairing. Supplier #931, `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2938`, explicitly owns both in §R17.5.11.

**Why the earlier disposition does not settle it:** the earlier repair was unable to edit the family index. This review’s brief explicitly makes that index the pull request’s own; the sentence was added by this pull request and remains unchanged at this head. An editing restriction does not resolve the contradictory ownership statements.

**Exact repair:** replace the sentence beginning with the ModularCharactersAndBlocks link by: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes these foundations, imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.”

**Repair test:** the imported objects match the supplier’s definition and pairing at `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2927–2938`; the retained owned objects match this folder’s §§2.2, 2.4, 3.1 and Layers 4–7. The replacement gives both descriptions the same owner and avoids the incorrect “both” after three named foundations.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:133` still says “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.” Carried as R01 above.

## Verified sound

:robot: Independent AI review by Codex. This is an incremental re-review of 10 changed lines since `ef8b735`: five insertions and five deletions, solely adding CharacterTheory §4.5 to the §3.1 Needs line and Layer 3 Dependencies. No mathematical statement or Lean declaration changed. The previous finding and these two dependency additions were checked; untouched mathematics retains the previous review’s evidence.

**Scope and checks.**

- Verified clean head `11fcc6f5d939d3d402f33555beabd54ddf845cd7`. The family index, `Suggested.lean`, library manifest and toolchain are unchanged since `ef8b735`. The brief’s diff excluding this folder and the permitted family-index files prints nothing. No pull-request file was edited.
- Read the repository’s normative writing checklist and CONTRIBUTING, and main’s CharacterTheory, GrothendieckEulerForms and ModularInduction for ownership and form.
- The worker’s head-specific gate passes every check, including the targeted build. Re-running the generic gate reports only the following two configuration exceptions, both also present in r21:

```text
depcheck: NOT IN ORDER: ModularCharactersAndBlocks (insert it after its last supplier)
outside-folder: TauCetiRoadmap/RepresentationTheory/README.md
```

  The first uses the default order rather than the supplied candidate order; the second names the index expressly allowed by this brief. These are false positives for this review, not additional findings. All other reported counters are zero; the generic invocation does not reach its build after those failures. The targeted build was therefore run separately and succeeded.
- The dependency check with the supplied candidate order reports, in full:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

- Direct `lake env lean` elaboration of `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean` exits 0, with exactly 12 warnings, all for `sorry`. The targeted module build also exits 0 with those same warnings.
- A scratch copy containing `#check @name` for all 17 declarations elaborates successfully. All 17 printed signatures match the supplied signature extraction, ignoring whitespace. In particular, the reciprocity signature retains completeness, characteristic zero, the primitive-root hypothesis, the projective-cover relationship, exhaustive nonisomorphic families, free finite lattices and irreducibility. It agrees with the headline at README :632–641. There is no changed Lean statement requiring a new padding probe; r21’s inherited one-tactic results for all twelve theorems remain applicable.

**The added dependency and its mathematical use.**

- CharacterTheory §4.5 exists on main at `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:817–831`. It consumes the absolutely irreducible models over any characteristic-zero field containing the required roots, not merely complex representations with character values in that field. This is exactly the input used at this folder’s README :648–649.
- Opened pinned `TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean:49–50,107–111`: `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` assumes finite G, characteristic-zero K, an algebraically closed extension L, a primitive root of nonzero order n, and exponent(G) dividing n. Its model has `Module.finrank K (V ⟶ V) = 1`. Taking n=e supplies the endomorphism-dimension-one input of reciprocity. For subgroups, their exponents divide e, so the same field works.
- The residue-field half remains the earlier target §2.3, README :498–505. No new dependency on a later layer or open revision was introduced. The exact supplier contract at README :212–214 already includes CharacterTheory §4.5.
- Opened `TauCeti/RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:77–83,115–116,138–153`: `projectiveSimplePairing` is a coordinate pairing, `projectiveSimplePairing_isPerfPair` its perfectness, and `cartanMatrix` has rows indexed by simples and columns by projectives, with entries [P j:S i]. The coordinate construction alone does not assert a Hom-dimension formula without matching covers. The roadmap carries that matching hypothesis and imports, rather than replans, these objects.
- The pins checked are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

**Source sample within the changed dependency’s scope.**

The relevant sampled target is §3.1. Reopened Webb Theorem 9.5.4, printed p. 159, at webb line 6670; its proof at webb line 6679–6684 uses splitting precisely to replace both endomorphism dimensions by 1. Corollary 9.5.3 at webb line 6663–6665 gives the Hom-dimension comparison, and Corollary 9.5.6, printed p. 160, at webb line 6712–6713 gives C=DᵀD. Example 9.5.7 at webb line 6714–6726 confirms the S₃, p=2 matrix. The complete-DVR hypothesis remains explicit. The two source issues below do not invalidate the roadmap’s statement: it assumes completeness and uses prime-to-p roots in the residue field.

No locator changed and no newly unverified locator was added. The other fourteen seeded targets are untouched; their source review and computed examples are carried from r21, rather than presented as newly checked source passages.

**Supplier and ownership resolution.**

Five supplier contracts relevant to the addition or the carried finding were reopened:

| Supplier | Resolved file and lines | Contract checked |
| --- | --- | --- |
| CharacterTheory on main, §4.5 | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:817–831` | Cyclotomic splitting and realization |
| GL2AutomorphicRepresentationsAndTransfer, #931 head, §R17.5.11 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2927–2938` | Brauer character, recognition, projective/simple pairing and ownership |
| QuiverRepresentations on main, Layer 3 | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:505–518,598–608` | Covers and the transpose convention for its Cartan matrix |
| GrothendieckEulerForms on main, Layer 4 | `TauCetiRoadmap/GrothendieckEulerForms/README.md:618–656` | Projective/simple bases, multiplicity pairing, split Hom formula, Cartan map |
| ArithmeticGaloisDuality, #858 head, §R02.4.4 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:3635–3643` | Decomposition map for finite extensions of ℚ_p containing the group-order roots; rational surjectivity |

The last contract checks the boundary mentioned by the previous finding; it was not changed. The object search with `roadmaps grep` re-found the GL2 owner and the conflicting index sentence. Other reciprocity hits concern class field theory or references to the same suppliers, not a new owner of the changed input. The citation resolver finds no missing roadmap citation; its external-library-name check was unavailable, so the relevant library declarations were opened directly at the pins as listed above. The supplied overlap report has no dropped ids, revision-only ids, or other open pull request changing this folder. The description already states the family-index merge order for #1146 and identifies #1047 and #1220 as cleanly merging index changes.

**Headline coverage retained.** The twelve admitted headlines remain block-decomposition uniqueness, residue block lifting, the simple-module count, integral decomposition surjectivity, Brauer reciprocity, multiplicativity of the Brauer map, defect conjugacy, Sylow defect of the principal block, Brauer’s first main theorem, block-section orthogonality, the local third main theorem, and the principal-block kernel theorem. The five definitions support these. The docstring still identifies the unstated Brauer-character basis, generalized decomposition numbers and orthogonality, second main theorem, and central-character/idempotent comparison, together with the missing carriers. This diff changes neither coverage nor generality.

**Adversarial table.** r21 means `packages/ModularCharactersAndBlocks/reports/PRREVIEW-ModularCharactersAndBlocks~21.md`; r20 means the corresponding `~20.md`. Every carried row cites r21; its grouped S rows are expanded using the values in r20 that r21 incorporated. N06–N07 are newly computed for the two changed dependency passages; F01 is freshly checked. No old finding is resurrected from a repaired row. Notation: r=(123), t=(12), α²+α+1=0 in 𝔽₄; e₀=1+r+r² and e₁=r+r² in 𝔽₂[S₃].

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` (r21 via r20) | `𝔽₃[C₂]`; `G = 1` | `(2+2t)² = 2+2t`, `(2+2t)(2−2t) = 0`, sum `1`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` (r21 via r20) | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(2−r−r²)/3 ↦ r+r²`, `(1+r+r²)/3 ↦ e₀`; only `1 ↦ 1` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` (r21 via r20) | `S₃` at 2, 3; `C_p`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| H04 | `span_decompositionRows_eq_top` (r21 via r20) | `S₃` at 3; `C₂` at 2; `Q₈/ℤ₂[i]`; `G = 1` | rows span `ℤ²`; `ℤ`; `ℤ`; `ℤ` | Pass | none |
| H05 | `cartanMatrix_eq_transpose_mul_decomposition` (r21 via r20) | `S₃` at 3, 2; `C₄`, `Q₈` over `ℤ₂[i]`; `G = 1` | `[[2,1],[1,2]]`; `diag(2,1)`; `4 = 4`; `8 = 8`; `1 = 1` | Pass | none (general form registered, N01) |
| H06 | `brauerProjection_mul` (r21 via r20) | `S₃`, `p = 2`, `P = ⟨t⟩`; over `ℚ` | `Br(e₁²) = 0 = 0²`; control `2 ≠ 0` | Pass | none |
| H07 | `IsDefectGroup`, `isDefectGroup_conj` (r21 via r20) | `𝔽₂[S₃]`; `𝔽₂[C₃]` | `Br_⟨t⟩(e₀) = 1`, three conjugate maxima; `Br_⟨t⟩(e₁) = 0` | Pass | none |
| H08 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (r21 via r20) | `𝔽₂[S₃]`; `G = 1` | `aug e₀ = 1` → Sylow; `aug e₁ = 0` excluded | Pass | none |
| H09 | `brauer_first_main` (r21 via r20) | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; `C_p` | `N = D`, block `1 ↔ e₀`; defect zero ↔ itself; both empty | Pass | none |
| H10 | `sum_sameBlock_mul_conj_eq_zero` (r21 via r20) | `S₃` at 2, 3; control `g = h = 1` | `1 − 1 = 0`; `1 + 1 − 2 = 0`; control `2 ≠ 0` | Pass | none |
| H11 | `brauer_third_main_local` (r21 via r20) | `S₃`, `p = 2`, `P = ⟨t⟩`; `P = 1` | `Br_P(e₀) = 1 ≠ 0` ↔ `aug 1 = 1`; `e₀e₁ = 0` | Pass | none |
| H12 | `mem_pPrimeCore_iff_forall_principalBlock` (r21 via r20) | `S₃` at 2, 3; `G = 1` | `C₃ = O_{2'}`; `1 = O_{3'}`; `1 = 1` | Pass | none |
| D01 | `SameBlock` (r21 via r20) | `S₃`, `M ∋ 2`; `M ∋ 3` | `−6 ∈ M`, `−3 ∉ M`; `−3 ∈ M` twice | Pass | none |
| D02 | `pPrimeCore` (r21 via r20) | `S₃`; wrong model `O_p`; infinite `G` | `C₃`, `1`; `1`, `C₃`; `Nat.card = 0` excluded | Pass | none |
| S01 | §0.1 sections (r21 via r20) | `S₃` at 2; `C₆` | sections `3 + 3`, classes `3 = 2 + 1`; `g³ · g⁴ = g⁷ = g` | Pass | none |
| S03 | §1.2 lattices (r21 via r20) | `C₂`, `p = 2`; `G = 1` | `O[C₂]` and `O(1+t) ⊕ O(1−t)` both reduce to class `2`; `O`, `m` both to class `1` | Pass | none |
| S04 | §2.1 induction formula (r21 via r20) | `Ind_1^{S₃}(1)`, `p = 2` | `(6, 0) = 2·(1, 1) + 2·(2, −1)` | Pass | none |
| S05 | §2.2 route (r21 via r20) | `S₃`, `p = 2` | `(t − 1)² = 2 − 2t = 0`, so `t ≡ 1`; `codim T = 2`, `codim [A, A] = 3` | Pass | none |
| S06 | §2.3 splitting (r21 via r20) | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₂(T)` | three 1-dimensional simples; dimensions `1, 2`; dimensions `1, 2` | Pass | none |
| S08 | §4.1 idempotents (r21 via r20) | `C₂/ℚ₂` | `e₊e₋ = (1 − t²)/4 = 0`, `e₊ + e₋ = 1` | Pass | none |
| S09 | §4.3 principal block (r21 via r20) | `𝔽₂[S₃]`; `𝔽₄[C₃]` | `aug e₀ = 1`, `aug e₁ = 0`; `aug(1 + α²r + αr²) = 1 + α² + α = 0` | Pass | none |
| S10 | §5.2 orthogonality (r21 via r20) | `S₃` at 3; `C₃`, `u = v = r` | columns `(1,0,1), (0,1,1), (1,1,−1)`: Gram `[[2,1,0],[1,2,0],[0,0,3]]`, `det Q = −3`, `9 = 3·3`; `1 + 1 + 1 = 3`, without conjugation `0` | Pass | none |
| S11 | §6.3 Brauer pairs (r21 via r20) | `S₃`, `p = 2`, `Q = ⟨t⟩` | `Br_Q(e₀)·1 = 1` (a `B₀`-pair); `Br_Q(e₁) = 0` (not) | Pass | none |
| S12 | §7.1 over splitting fields (r21 via r20) | `S₃` over `𝔽₄` (`e' = 3`), `D = ⟨t⟩`; `D = 1` | `N = D`, block `1 ↔ e₀`, `Br_D(e₀) = 1`, `e₁` not in the image, as over `𝔽̄₂`; `e₁ ↔ e₁` | Pass | none |
| S13 | §7.3 third main theorem (r21 via r20) | `A₄`, `p = 2`, `P = V₄` | `N(V₄) = A₄`, `C(V₄) = V₄`, single block ↔ itself | Pass | none |
| S14 | §8.1 domination (r21 via r20) | `S₃`, `p = 3`, `N = C₃` | block `1 ↦ 1 = e₊ + e₋` in `𝔽₃[C₂]`: two blocks, one dominating block | Pass | none |
| S15 | §8.2 covering (r21 via r20) | `S₃`, `N = C₃`, `k ⊇ 𝔽₄` | `e_α + e_{α²} = 2 + (α² + α)(r + r²) = r + r²` | Pass | none |
| S16 | §8.4 interfaces (r21 via r20) | §8.4 vs *Downstream consumers* | `10 = 10` section references | Pass | none |
| S02 | §1.1 system (locator changed) (r21) | `e = 3`, `p = 2`; `e = 3`, `p = 3`; `e = 1`, `p = 5` | `ℚ₂(ζ₃)` unramified, `k = 𝔽₄`; `ℚ₃(ζ₃)` ramified, `k = 𝔽₃`, `e' = 1`; `ℚ` has 2 roots of unity, `ℚ₅` has 4 | Pass | none |
| S07 | §3.1 pairing (unchanged, re-run) (r21) | `S₃`, `p = 2` | `(2·1 + 2·2·1)/6 = 1`, `(2·2 + 2·2·(−1))/6 = 0` | Pass | none |
| N01 | §3.1 splitting-field form of `C = Dᵀ D` (r21) | `S₃/ℤ₂`; `S₃/ℤ₃`; `G = 1` | `D = [[1,0],[1,0],[0,1]]`, `Dᵀ D = diag(2,1) = C`; `ℚ₃ ∌ ζ₃` (`ℚ₃(ζ₃) = ℚ₃(√−3)` and `v₃(−3) = 1` is odd), `D = [[1,0],[0,1],[1,1]]`, `Dᵀ D = [[2,1],[1,2]] = C`; `(1) = (1)` | Pass outside the root-of-unity headline | none |
| N01c | same, controls (`K` does not split `G`) (r21) | `C₄/ℤ₂` (`−1 ≡ 7` mod 8, so `i ∉ ℚ₂`); `Q₈/ℤ₂` (`(−1,−1)` is a division algebra over `ℚ₂`); `Q₈/ℤ₂[i]` | `1+1+4 = 6 ≠ 4`; `1+1+1+1+16 = 20 ≠ 8`; `4·1 + 2² = 8 = C` | Hypothesis excludes the failures | none |
| N02 | “root-of-unity hypothesis implies it” (r21) | `e = 6`, `p = 2`; `e = 6`, `p = 3`; residue char `0` | `ζ₆² = ζ₃ ↦` primitive cube root, `k ⊇ 𝔽₄` splits; `ζ₆³ = −1 ↦ 2 ∈ 𝔽₃`, `e' = 2`; the bullet requires char `p`, and the headline's last sentence gives `C = Dᵀ D = I` | Pass | none |
| N03 | new Check `S₃` over `ℤ₂` (r21) | `X²+X+1` at `0, 1` in `𝔽₂`; `𝔽₂[S₃]` | `1, 1`: no root, so `ζ₆ ∉ ℚ₂`; `dim P₁ = 2` with factors `1, 1`, 2-dimensional simple projective, `2 + 2·2 = 6` | Pass | none |
| N04 | reworded Check “a splitting hypothesis is needed” (r21) | `C₄/ℤ₂` | `End(2-dim) = ℚ₂(i)`, so `ℚ₂` does not split `C₄`; `𝔽₂` does (one simple, `End = 𝔽₂`); `Dᵀ D = 6 ≠ 4` | Pass: the failing hypothesis is the one on `K` | none |
| N05 | §1.1 root bijection, Lemma 10.1.1 with `a = e'` (r21) | `e = 3`, `p = 2`; `e = 6`, `p = 3`; contrast `e`-th roots, `p = 2` | `{1, ζ₃, ζ₃²} ↦ {1, α, α²}`; `{±1} ↦ {1, 2}`; `μ₂(ℚ₂) = {±1} ↦ {1}`, not injective, so only `e'` is claimed | Pass | none |
| F01 | Family-index ownership sentence (r21, rechecked) | Index :133 versus folder :93–102 and GL2 §R17.5.11 | Index owner = ModularCharactersAndBlocks; supplier owner = GL2AutomorphicRepresentationsAndTransfer; two different names where one is required | Mismatch persists | R01 |
| N06 | Added CharacterTheory §4.5 edge in §3.1 Needs | C₄ over ℤ₂[i]; control ℤ₂ | Four ordinary 1-dimensional simples: DᵀD = 1+1+1+1 = 4 = C; without i, dimensions 1,1,2 give 1+1+4 = 6 ≠ 4. Splitting gives dim End = 1, whereas the 2-dimensional control has dim End = 2 | Correct supplier for the missing factor-one input | Dependency made explicit |
| N07 | Added CharacterTheory §4.5 edge in Layer 3 Dependencies; same input for centralizers | S₃ at p=2 over K=ℚ₂(ζ₃), k=𝔽₄; H=C₃; trivial group | For S₃, D=[[1,0],[1,0],[0,1]], DᵀD=diag(2,1)=C. For H, D=I₃, C=I₃; for G=1, D=C=[1]. Exponents 3 and 1 divide 6, so the same roots suffice | Correct, including subgroup reuse in §5.2 | Dependency made explicit |

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, remains settled as uncertified and cited by locator only. No new request was made; the kernel-theorem row is carried mathematical evidence, not certification of the source.
- Serre (`serre`) remains settled as uncertified; this change adds no dependence on its text.
- The other seeded source passages were not reopened in this incremental review. Their evidence is explicitly inherited from r21. Open-pull-request searches cover the service’s index of 439 heads; unindexed heads were not independently searched.

## Source issues

- **Error** in webb at §9.4, printed p. 148 (webb line 6229–6232): the source says a primitive exponent-order root in the fraction field remains primitive in the residue field; it should be a primitive prime-to-p-part root after reduction (−1 reduces to 1 in characteristic 2); affects nothing.
- **Gap** in webb at Corollary 9.5.6, printed p. 160 (webb line 6712–6713): the source states C=DᵀD for any splitting p-modular system while its preceding proof assumes completeness; it should assume completeness or justify passage to completion; affects nothing.
