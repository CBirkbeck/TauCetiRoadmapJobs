# Review of K2SymbolsBrauerPartII (pull request #1432 at a495ae1)

**Verdict:** needs changes

Incremental re-review of the 14 lines changed since 158e932 (`scratch/changes.md`: README only, +7/−7, at the EtaleCohomologyFoundations/SchemeAndStackFoundations contract, the KTheoryFiniteLocalFields contract, §5.0d's divisor sentence, §5.3's comparison paragraph, its *Needs* line and its chain-model Check, and the Soulé reference; `Suggested.lean` is byte-identical to 158e932). The three previous findings are accounted for under `## Previous findings`; the changed passages and everything that cites them were reviewed in full. One new P3 finding, introduced by the repair of the previous R01; nothing blocking.

## R01 (P3) — The contract names `ClassicalAlgebraic.cycleClasses` for the regular-immersion class of §5.3, but its smooth-pair scope excludes the number-field pair (Spec O, v)

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:70`, "Consume EtaleCohomologyFoundations §0.9's `ClassicalAlgebraic.cycleClasses`: the Kummer first Chern class of a line bundle, the localized class of a regular immersion and their Cartier-divisor agreement, used in §5.3's Gysin/Picard comparison."

**Claim:** EtaleCohomologyFoundations §0.9 on main (README line 1122) provides `cycleClasses`' localized class `cl_Z` only "for a regular immersion Z→X of codimension c between schemes smooth over a common base on which n is invertible"; the contract sentence drops this hypothesis. §5.3's comparison (line 833) is stated for a number field, and its pair is X = Spec O (O the S-integers, S ⊇ places above ℓ and archimedean) with Z = Spec k(v) a closed point. No base makes both smooth: Z → B smooth forces Z étale over its image point b, so k(b) is finite and O_{B,b} is a field; then X_b is an open subscheme of X containing v and smooth over the finite field k(b), impossible since every nonempty open of Spec O contains the characteristic-zero generic point. The class that covers this pair, with the Cartier agreement §5.3 uses, is the same section's `ClassicalAlgebraic.lciCycleClass` (line 1135: "regular closed immersion i:Z→X of pure codimension c between locally noetherian schemes, with n>0 invertible on X … Prove Cartier agreement … and agreement with `ClassicalAlgebraic.cycleClasses` on locally noetherian pairs in its smooth-pair scope").

**Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` on main (cf0ced74), line 1122 (smooth-pair scope of `cycleClasses`) and line 1135 (`lciCycleClass`, locally noetherian scope, Cartier agreement). Instance: F = Q(μ₃, √2), ℓ = 3, S = {3, ∞}: O = O_F[1/3] is ramified over Z[1/3] at 2, so even Spec O → Spec Z[1/3] is not étale, and (Spec O, v) for v above 2 is not a smooth pair over any base by the argument above; the function-field pair (Spec F_q[t], v) is a smooth pair over F_q, but §5.3's comparison is number-field only.

**Exact repair:** Replace the sentence by "Consume EtaleCohomologyFoundations §0.9's `ClassicalAlgebraic.cycleClasses` for the Kummer first Chern class of a line bundle, and its `ClassicalAlgebraic.lciCycleClass` for the localized class of a regular closed immersion between locally noetherian schemes with ℓ invertible on the target, with its Cartier-divisor agreement, used in §5.3's Gysin/Picard comparison." No change to §5.3 (line 833 cites "§0.9's Cartier-divisor agreement" without naming the declaration) or to the *Needs* line 841 (which cites §0.9).

## Previous findings

- R01 — repaired: line 833 "fixed by KTheoryFiniteLocalFields §§1.1–1.2's Bockstein convention together with §2.2's localization/Bockstein square (the adapted boundary ∂ₙ=(−1)^(n−1)Bₙ of the raw spectrum boundary, commuting with the Bockstein)"; line 82 consumes §1.2's `bott` and §2.2's `localizationBockstein`; line 841 adds §§1.1–1.2, 2.2; the Check at line 852 now fixes the localization cone (d(o,k)=(do−i(k),−dk), Quillen boundary the projection to k) and computes all four convention cases. All four values recomputed below and found correct. The repair's contract sentence at line 70 introduced the new R01 above.
- R02 — repaired: line 714 "its second map is SchemeAndStackFoundations §3.4's `picard_units_sequence`, sending v to the class of the line bundle O(v), the inverse of the prime ideal of v"; line 833 "the divisor/line-bundle convention stated in §5.0d (SchemeAndStackFoundations §3.4: …)"; line 70 states the convention in the contract. Verified against SSF §3.4 on main and the pinned Tau Ceti sheaf O(D) (below).
- R03 — repaired: line 935 "The formula c₂,₂(α∪a)=c₁,₀(α)∪c₁,₂(a) in the proof of Lemme 2.2.4.4, p.54, cited there to Proposition 2.2.3.3"; soule line 1726–1727, inside printed p.54 (lines 1700–1730), in the proof of the lemma stated at lines 1709–1711.

## Verified sound

### Gate, order, build and signatures

My gate run at a495ae1 (the worker's at `scratch/gate.md` adds `build=0`):

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed dependency check:

```text
depcheck: 233 roadmaps, 2129 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean. The suppliers the diff newly names (SchemeAndStackFoundations §3.4 and EtaleCohomologyFoundations §0.9, both on main; KTheoryFiniteLocalFields §§1.2, 2.2, earlier in the order) are admissible.

`lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for all 8 declarations: the file's own warnings are exactly the five `sorry`s (lines 54, 64, 75, 97, 104), exit 0. The elaborated types are those recorded in the r5 report (`SymbolAlgebra`, `SymbolRel`, `symbolAlgebra_isCentralSimple`, `symbolAlgebra_split`, `symbolAlgebra_matrix_corner`, `conicSymbol`, `conicSymbol_real_eq_neg_one_iff`, `conicSymbol_eq_hilbertSymbol`), with every binder present (`scratch/signatures.md` agrees). The Lean file is unchanged since 158e932 (last commit touching it), so the r5 one-tactic probe (nine attempts on the three Layer 2 headlines, all failing) and its headline-coverage audit carry forward unchanged; the pins are unchanged (Mathlib `6b7abb3c7686`, Tau Ceti `a91d3aafa8cd`).

### Sources: the seeded sample, where it falls in the diff

The diff touches §5.0d (one sentence), §5.3 (the comparison paragraph, *Needs* and one Check), two contract paragraphs and the Soulé reference; the other sampled targets (1.1–1.4, 2.1–2.2, 2.4, 3.2–3.3, 4.1, 5.0a, 5.0c, 5.0e, 5.2) are untouched and stand on the r4 and r5 verification. Read this round: soule lines 1700–1731 (printed p.54: the (B,q) sentence and Tate's field isomorphism at 1702–1708, Lemme 2.2.4.4 at 1709–1711, the formula cited to 2.2.3.3 at 1726–1727, page break at 1731), confirming the repaired locator. KTheoryFiniteLocalFields at the head of its pull request: §1.1 (`roadmaps show` lines 212–229: the sequence 0→Kₙ/m→Kₙ(;ℤ/m)→Kₙ₋₁[m]→0), §1.2 (lines 231–245: `bott ω`, "Its Bockstein is [ω]", Check "the determinant of the Bockstein is exactly ω, rather than ω⁻¹"), §2.2 (lines 412–435: `localizationBockstein`, raw B of GeneralAlgebraicKTheory §8.13, ∂ₙ=(−1)^(n−1)Bₙ, raw square B_(n−1)β_n=−β_(n−1)B_n, adapted square commuting, Checks ∂₂{2,π}=2 and ∂₂{π,2}=4 over F₇ with raw B₂ opposite): line 82's "∂₂{u,π}=ū" and line 833's description agree with it. SchemeAndStackFoundations §3.4 on main (README lines 4789–4826: `picardToClassGroup` by codimension-one orders of a rational section, inverse to the pinned `classGroupToLineBundleClass`; `picard_units_sequence` with ⊕ℤ·[D_i]→Pic(X), Hartshorne II.6.5). EtaleCohomologyFoundations §0.9 on main (lines 1120–1143) as in R01 above. LefschetzPencilsAndVanishingCycles §0.10 at the head of its pull request (lines 701–730: purity for regular immersions between regular schemes with invertible coefficients; Check "for a trait and its closed point the required map has degree two and twist minus one") covers (Spec O, v).

### Adversarial values

Rows for untouched statements are those of the r5 report (its 22 new rows, from "`symbolAlgebra_isCentralSimple` hypotheses" to "R02 of r4", and the 56 rows of r4 it carries from "Conventions: H_m(a,b)" to "R03 overlap"), carried forward unchanged. New rows for every changed statement:

| Statement | Instance | Values | Result |
|---|---|---|---|
| Check line 852, cycle condition | Moore d(a,a′)=(da−ℓa′,−da′) | d(a₂,a₁′)=(da₂−ℓa₁′,−da₁′)=0 iff da₂=ℓa₁′, da₁′=0 | as stated |
| Check line 852, lift of c | cone d(o,k)=(do−i(k),−dk), db′=i(a₁′) | d(b′,a₁′)=(db′−i(a₁′),−da₁′)=(0,0) | (b′,a₁′) is a cycle |
| Check line 852, snake value | same | ℓ(b′,a₁′)=(ℓb′,da₂); d(0,−a₂)=(i(a₂),da₂); difference (ℓb′−i(a₂),0); d(ℓb′−i(a₂))=ℓi(a₁′)−i(ℓa₁′)=0 | snake(B_Q)=[ℓb′−i(a₂)] |
| Check line 852, transfer | i(a₂,a₁′)=(i(a₂),i(a₁′)) | d(0,−b′)=(ℓb′,i(a₁′)); difference (i(a₂)−ℓb′,0) | transfer reduces from i(a₂)−ℓb′; snake(B_Q)=−transfer; ι_S=−snake(B_Q)=+transfer; ε_B=+1 |
| Check line 852, cone sign alone | d(o,k)=(do+i(k),−dk) | d(−b′,a₁′)=(−db′+i(a₁′),0)=0; ℓ·lift=(−ℓb′,da₂); d(0,−a₂)=(−i(a₂),da₂); difference (i(a₂)−ℓb′,0) | snake(B_Q)=transfer; ε_B=−1, as stated |
| Check line 852, Moore sign alone | d(a,a′)=(da+ℓa′,−da′), cycle da₂=−ℓa₁′, cone d(o,k)=(do−i(k),−dk) | transfer: (i(a₂),i(a₁′))+d(0,b′)=(i(a₂)+ℓb′,0); snake: ℓ·lift=(ℓb′,−da₂), minus d(0,a₂)=(−i(a₂),−da₂) gives (ℓb′+i(a₂),0) | snake(B_Q)=transfer; ε_B=−1, as stated |
| Check line 852, both changed | both signs flipped | snake: (−ℓb′,−da₂)−(i(a₂),−da₂)=(−ℓb′−i(a₂),0) = −transfer | ε_B=+1, as stated |
| Check line 852, ℓ=2 | any convention | −1≡1 on K₂(O)/2 | invisible, as stated |
| Line 82 / 833, ∂₂=−B₂ | n=2 in ∂ₙ=(−1)^(n−1)Bₙ | (−1)^1=−1 | ∂₂=−B₂, as the Check writes |
| Line 82, ∂₂{u,π}=ū | KTFLF §2.2 Check, F₇, u=2 | ∂₂{2,π}=2, raw B₂{2,π}=4=2⁻¹ | agrees with K2SymbolsBrauer's ∂ᴹ{u,π}=ū (line 66) and §5.0d's ∂ᴹ=−det B_Q |
| Line 714 / 70, O(v)=𝔭_v⁻¹ | pinned `SchemeWeilDivisor.sections` (Sheaf.lean 91–96): f with ord_x f ≥ −coeff_D(x) | D=[v]: f with v(f)≥−1, i.e. 𝔭_v⁻¹; the section 1∈𝔭_v⁻¹ has divisor [v] | O(v) is the inverse ideal, as stated |
| Line 714, direction of `picard_units_sequence` | pinned `classGroupToLineBundleClass` (LineBundle.lean 103–107): class of D ↦ class of 𝒪_X(D); SSF `picardToClassGroup` is its inverse | v ↦ [𝔭_v⁻¹]; with the ideal itself, v ↦ [𝔭_v]=−[𝔭_v⁻¹] | the parenthetical "using the ideal itself reverses ε_G" holds; visible only for odd ℓ (r5 row) |
| Line 70, `cycleClasses` scope on (Spec O, v) | number field, any S | Z=Spec k(v) smooth over B forces O_{B,b} a field with k(b) finite; X_b open in Spec O over a finite field: impossible in characteristic 0 | not a smooth pair; R01 |
| Line 70, `lciCycleClass` scope on (Spec O, v) | same | Spec O locally noetherian regular, v a regular closed immersion of codimension 1, ℓ invertible on O since S ⊇ places above ℓ | in scope, with Cartier agreement |
| Line 70, function-field pair | (Spec F_q[t], v) | both smooth over Spec F_q | `cycleClasses` applies there, but §5.3's comparison is number-field only (line 833) |
| Line 935, Soulé locator | soule lines 1700, 1709, 1727, 1731 | page 54 = lines 1700–1730; formula at 1727 is inside the proof begun at 1712 | repaired locator correct |
| Line 841, new *Needs* edges | SSF §3.4, KTFLF §§1.1–1.2, 2.2 | SSF on main; KTFLF earlier in the order; depcheck 0 problems | no upward edge |

### Pinned library audit

Opened at the pin (Tau Ceti `a91d3aafa8cd`): `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean` lines 89–96 (`sections`: rational functions with order at least −D) and 250 (`sheaf`); `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean` lines 103–117 (`classGroupToLineBundleClass`, class of D ↦ class of 𝒪_X(D)) and 138 (injectivity). No new object is constructed by the diff; the r5 duplication and ownership audit of the symbol algebra and conic symbol stands.

### Supplier citations resolved this round

SchemeAndStackFoundations §3.4 and EtaleCohomologyFoundations §0.9 (main, cf0ced74); KTheoryFiniteLocalFields §§1.1, 1.2, 2.2 and LefschetzPencilsAndVanishingCycles §0.10 (heads of their open pull requests); ArithmeticKTheory §6.13 unchanged from r5. `scratch/citations.md`'s one lead (`cycleClasses` found in no pinned library) is a roadmap declaration of EtaleCohomologyFoundations §0.9 on main, correctly cited as a supplier name; its scope is R01.

### Shape and policy

The seven changed lines keep the house shape: prose with locators, backticked names only for supplier declarations, the Check in prose with computed values, no LaTeX, process words or pull-request numbers (the gate's scanners agree).

## Not verifiable

- The admitted proofs are not verified; the chain-model Check is a computation in a model, and whether that model is the library's raw boundary and Bockstein is deferred, as the Check says, to KTheoryFiniteLocalFields §§1.1–1.2 and 2.2 and GeneralAlgebraicKTheory §8.13.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmaps grep and resolve indices of 2026-11-05.

## Source issues

- **Misprint** in soule at Proposition 2.2.3.3, printed p.49 (soule line 1530): the source says the denominator contains the factorial of one minus i; it should contain the factorial of i minus one, as in Proposition 2.2.2.3; affects nothing.
- **Misprint** in soule at Lemme 2.2.4.4, proof, printed p.54 (soule line 1727): the source says the degree-two Chern class of the external product of a Bott class and a Picard class equals the cup product of their classes, citing Proposition 2.2.3.3; it should carry that proposition's coefficient −1; affects the proof (only the image subgroup is used, so the lemma stands).
