# Review of K2SymbolsBrauerPartII (pull request #1432 at 158e932)

**Verdict:** needs changes

Incremental re-review of the 92 lines changed since 474cce8 (`scratch/changes.md`: README +24/−13 across §Scope, the K2SymbolsBrauer and ArithmeticKTheory contracts, §§2.1–2.3, §3.4, §5.0d, §5.3 and the Soulé reference; `Suggested.lean` +68, the Layer 2 presentation and three headline theorems). The three previous findings are accounted for under `## Previous findings`; the changed passages, everything that cites them and the Lean statements touched were reviewed in full. Three new P3 findings, all in the repair of the previous R03 (the §5.3 Picard comparison paragraph) and its source note; nothing blocking.

## R01 (P3) — The sign ε_B is attributed to KTheoryFiniteLocalFields §1.1 alone, and the Check's chain model leaves the localization cone sign open

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:833`, "where ε_B is the sign fixed by KTheoryFiniteLocalFields §1.1's Bockstein convention and computed in the Check below"; and the Check at line 852, "the snake value of c for the Quillen boundary is represented by ℓb′−i(a₂) … ε_B=+1 in this model".

**Claim:** ε_B compares the connecting map of the tame short exact sequence (built with ∂ᴹ = −det B_Q, §5.0d) with the Bott transfer. It depends on two conventions, not one: the Bockstein of the Moore cofibre and the sign of the localization boundary B_Q. KTheoryFiniteLocalFields §1.1 fixes only the first (the sequence 0→Kₙ/m→Kₙ(;ℤ/m)→Kₙ₋₁[m]→0 and, with §1.2, "Its Bockstein is [ω]"). The second is fixed by KTheoryFiniteLocalFields §2.2 (`localizationBockstein`: raw spectrum boundary B of GeneralAlgebraicKTheory §8.13, adapted ∂ₙ=(−1)^(n−1)Bₙ, ∂ commuting with the Bockstein, Check ∂₂{2,π}=2 while raw B₂ gives 4), which this README cites nowhere (grep for "KTheoryFiniteLocalFields §2.2": 0 hits; the contract lists §§1.1, 1.8, 3.0a, 3.1–3.4, 7.3). The Check's model fixes the Moore side and the Bockstein sign but not the cone sign of the localization cofibre, and that sign alone flips the value.

**Witness:** With the Check's Moore model (cycle (a₂,a₁′), da₂=ℓa₁′, Bockstein = projection) and the localization cofibre modelled as the standard cone d(o,k)=(do+i(k),−dk) with the Quillen boundary the projection to k, the lift of c is (−b′,a₁′), ℓ·lift = (−ℓb′,da₂), and subtracting d(0,−a₂)=(−i(a₂),da₂) gives the snake value i(a₂)−ℓb′: equal to the transfer, so ε_B=−1. With d(o,k)=(do−i(k),−dk) the lift is (b′,a₁′) and the same subtraction gives ℓb′−i(a₂), the Check's value, so ε_B=+1. With both cofibres in the same Puppe convention (standard cone and projection for both, or the Check's Koszul Moore model with d(o,k)=(do−i(k),−dk)) the two sign changes cancel and ε_B=+1 in every case; the value −1 arises exactly from mixed conventions. KTheoryFiniteLocalFields §2.2, `roadmaps show KTheoryFiniteLocalFields` lines 412–430.

**Exact repair:** In the paragraph, replace "fixed by KTheoryFiniteLocalFields §1.1's Bockstein convention" by "fixed by KTheoryFiniteLocalFields §§1.1–1.2's Bockstein convention together with §2.2's localization/Bockstein square (∂ₙ=(−1)^(n−1)Bₙ with ∂ commuting with the Bockstein)"; add "KTheoryFiniteLocalFields §2.2" to §5.3's *Needs* line and one clause to the From KTheoryFiniteLocalFields contract ("Consume §2.2's `localizationBockstein`: the adapted boundary and its commutation with the Bockstein"). In the Check, state the second half of the model: "the localization cofibre carries the same Puppe convention as the Moore cofibre, the Quillen boundary being the projection to the residue coordinate for the cone differential d(o,k)=(do−i(k),−dk)", and add "changing this cone sign alone also gives ε_B=−1; the value +1 is the value for uniform conventions, which is what the supplied square of §2.2 provides". No mathematics changes elsewhere: ι_S = −(Quillen snake) at line 723 and the paragraph's σ=ε_B·ε_G stand.

## R02 (P3) — §5.3 cites a "divisor/line-bundle convention of §5.0d" that §5.0d does not state

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:833`, "with a sign ε_G fixed by that orientation together with §5.0d's divisor/line-bundle convention (the divisor v corresponds to the class of the ideal of v inverted; using the ideal itself reverses ε_G)".

**Claim:** §5.0d (line 714) says only "The divisor sequence Fˣ→⊕_(v∉S)Z→Pic(O)→0 identifies this cokernel with μ_ℓ⊗Pic(O)" and lists "SchemeAndStackFoundations §3.4's Picard/divisor dictionary" in its *Needs*; no sentence of §5.0d chooses between v ↦ [𝔭_v] and v ↦ [O(v)] = [𝔭_v⁻¹]. The choice is the supplier's: SchemeAndStackFoundations §3.4 on main (`picard_units_sequence`, "⊕_i ℤ·[D_i] → Pic(X)" with "1 ↦ [D]", Hartshorne II.6.5) sends v to the Weil class of the point, which corresponds to O(v) under Cl ≅ Pic: the parenthetical is correct, but its attribution is to a convention that is not written where it says it is, and ε_G (hence σ) depends on it.

**Witness:** `grep -n 'ideal' README.md` finds the convention only at line 833; `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main, §3.4 (heading line 4789, the `picard_units_sequence` sentence). The choice is visible exactly when Pic(O) has a class of order ℓ with [𝔭]⁻¹≠[𝔭], i.e. for odd ℓ (for ℓ=2, [𝔭]⁻¹=[𝔭] on 2-torsion classes, consistent with the Check "σ is invisible at ℓ=2").

**Exact repair:** In §5.0d, after the divisor-sequence sentence, add "The map ⊕_(v∉S)Z→Pic(O) is SchemeAndStackFoundations §3.4's `picard_units_sequence`, sending v to the class of O(v), the inverse of the prime ideal of v." In §5.3 keep the parenthetical and change "§5.0d's divisor/line-bundle convention" to "the divisor/line-bundle convention stated in §5.0d (SchemeAndStackFoundations §3.4)".

## R03 (P3) — Soulé locator: the display without the coefficient −1 is at the foot of p.54, inside the proof of Lemme 2.2.4.4, not at the top

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:935`, "The display at the top of p.54 writes the degree-two Chern class of the external product of a Bott class with a Picard class without the coefficient −1 of Proposition 2.2.3.3".

**Claim:** The formula meant, c₂,₂(α∪a)=c₁,₀(α)∪c₁,₂(a), is soule line 1727, in the proof of Lemme 2.2.4.4 (statement at line 1709–1711), four lines before the page break to p.55; printed p.54 spans soule lines 1700–1730. The top of p.54 carries the (B,q) sentence and Tate's field isomorphism (lines 1702–1708). A reader sent to the top of the page finds a different, correct display.

**Witness:** soule line 1700 (`=== page 54 ===`), line 1727 (the formula, cited to 2.2.3.3), line 1731 (`=== page 55 ===`).

**Exact repair:** Replace "The display at the top of p.54" by "The formula c₂,₂(α∪a)=c₁,₀(α)∪c₁,₂(a) in the proof of Lemme 2.2.4.4, p.54, cited there to Proposition 2.2.3.3,".

## Previous findings

- R01 — repaired: `Suggested.lean:32–85` adds `SymbolRel`, `SymbolAlgebra` (the `RingQuot` presentation, real bodies) and the headlines `symbolAlgebra_isCentralSimple`, `symbolAlgebra_split`, `symbolAlgebra_matrix_corner`; the docstring sentence calling them not statable is deleted; README §2.1 line 301, §2.2 line 337 and §2.3 line 374 name them. Statements checked below; no new problem.
- R02 — repaired: line 66 "Consume §12.5's real sign homomorphism K₂(R)→Zˣ" and line 519 "Use the supplied real sign homomorphism of K2SymbolsBrauer §12.5 over R"; `realSignSymbol` occurs nowhere in the folder.
- R03 — repaired: Scope line 11, the ArithmeticKTheory contract line 86, §5.0d line 714 and §5.3 lines 833, 841 cite ArithmeticKTheory §6.13 (verified at the head of #1418, lines 2958–2994: F a number field, p odd, L=F(μ_(p^n)); at L=F, n=1 the coinvariants and corestriction are trivial and the source and target are those of ι_S). The comparison is stated as a target with a sign σ to be computed. The repair's sign analysis introduced R01 and R02 above, and its source note R03.

## Verified sound

### Gate, order, build and signatures

My gate run at 158e932 (the worker's at `scratch/gate.md` adds `build=0`):

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed dependency check:

```text
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean. The suppliers newly named in the diff are all admissible: ArithmeticKTheory (earlier, #1418), KTheoryFiniteLocalFields (earlier, #1281), LefschetzPencilsAndVanishingCycles (earlier, #873; §0.10 "Absolute cohomological purity" at its head, lines 701 ff.), EtaleCohomologyFoundations and SchemeAndStackFoundations (main at a0ad405; ECF §0.9 "Algebraic cycle classes and the projective bundle formula", README lines 1120–1143, provides `ClassicalAlgebraic.cycleClasses` with "Cartier-divisor agreement" and the Check "The divisor T=0 on A¹ has localized class given by the Kummer connecting image of T"; SSF §3.4 at line 4789).

`lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for all 8 declarations: the file's own warnings are exactly the five `sorry`s (lines 54, 64, 75, 97, 104). Elaborated types, compared with the README: `SymbolRel : (F : Type u_1) → [Field F] → ℕ → F → F → F → FreeAlgebra F (Fin 2) → FreeAlgebra F (Fin 2) → Prop`; `SymbolAlgebra : (F : Type u_1) → [Field F] → ℕ → F → F → F → Type u_1`; `symbolAlgebra_isCentralSimple : ∀ {F} [Field F] (m : ℕ), 2 ≤ m → IsUnit ↑m → ∀ {ζ : F}, IsPrimitiveRoot ζ m → ∀ (a b : Fˣ), Algebra.IsCentral F (SymbolAlgebra F m ζ ↑a ↑b) ∧ IsSimpleRing … ∧ Module.finrank F … = m ^ 2` (§2.2 line 330 and bullet 337: every field, m ≥ 2 invertible, ζ primitive, units); `symbolAlgebra_split : … ∀ (a b : Fˣ) (L : Type u_2) [Field L] [Algebra F L] (α : L), α ^ m = algebraMap F L ↑a → Nonempty (L ⊗[F] SymbolAlgebra F m ζ ↑a ↑b ≃ₐ[L] Matrix (Fin m) (Fin m) L)` (§2.2 lines 326–328: any extension containing a root of a, no root of b); `symbolAlgebra_matrix_corner : … ∀ (a b : Fˣ) (α : SeparableClosure F), α ^ m = algebraMap … ↑a → (minpoly F α).natDegree ∣ m ∧ ∃ c, algebraMap … c = α ^ (minpoly F α).natDegree ∧ c ^ (m / (minpoly F α).natDegree) = ↑a ∧ Nonempty (SymbolAlgebra F m ζ ↑a ↑b ≃ₐ[F] Matrix (Fin (m / d)) (Fin (m / d)) (SymbolAlgebra F d (ζ ^ (m / d)) c ↑b))` (§2.3 lines 349–357: α∈Fˢ, d=[F(α):F], s=m/d, c=α^d, c^s=a, degree-one convention F at d=1). The three conic declarations are unchanged from r4. No binder dropped (`scratch/signatures.md` agrees). The file has two real-bodied definitions, no sorry'd data, no `set_option`, the single `import Mathlib` plus `TauCeti.NumberTheory.HilbertSymbol.Basic`.

**One-tactic probe.** On the scratch copy, the three new theorems were tried with `simp`, `exact ⟨inferInstance, inferInstance, rfl⟩`, `constructor <;> infer_instance` (central simplicity); `simp`, `infer_instance`, `exact ⟨AlgEquiv.refl⟩` (splitting); `simp`, `exact ⟨minpoly.natDegree_dvd_of_dvd …, a, rfl, rfl, ⟨AlgEquiv.refl⟩⟩`, `simp [hα]` on the divisibility conjunct alone (corner): all nine fail (no progress, instance not found, type mismatch, unknown constant). None is padding; each needs the m² monomial basis (Weibel III.6.9) or the idempotent decomposition of §2.3.

**Headline coverage.** The Layer 2 headlines (central simplicity and degree, splitting, matrix corner) are now stated; the Brauer-class identification of §2.4 needs the Galois symbol on K₂ and stays correctly in the not-statable list; the rest of the docstring's list is unchanged from r4 and still correct at the pins (no classical/Milnor K₂, no integer-weight twist cohomology of rings).

### Sources: the seeded sample, where it falls in the diff

The diff touches §2.2 (one API bullet naming the Lean), §5.3 (the comparison paragraph, its *Needs* and two Checks), §5.0d (one sentence) and the Soulé reference; the other sampled targets (1.1, 1.6, 2.4, 3.1, 3.4, 3.5, 4.1, 5.0a, 5.0b, 5.0c, 5.2, 5.4, 5.5) are unchanged and stand on the r4 verification. Read this round: soule line 1520–1531 (Proposition 2.2.3.3, p.49: for a∈Kₙ(A) integral and b∈K_(n′)(A′;ℤ/q), c_(i+j,k+k′)(a·b) = −(i+j−1)!/((1−i)!(j−1)!)·c_(i,k)(a)∪c_(j,k′)(b), with the (1−i)! misprint; at i=j=1 the coefficient is −1, as §5.3 says); soule line 1693–1699 (§2.2.4.4, p.53: c₂,₂{a,b}=−c₁,₁(a)∪c₁,₁(b), §5.5's input); soule line 1709–1749 (Lemme 2.2.4.4 and proof, pp.54–55: α a Bott class over O_S with μ_(ℓ^ν)⊂O_S, Ω the image of α∪Pic, Ω = Ker(K₂(O_S)/ℓ^ν→K₂(F)/ℓ^ν) by Tate's Theorem 6.2 and finiteness of Pic; the proof matches images only, as the Check at line 853 says); soule line 1750–1773 (the remarks: Tate's map "s'interprète comme un produit externe"; the localization diagram with c₁,₀ on ⊕K₂(k(v);ℤ/q) mapping to ⊕H⁰(k(v),μ_q)→H²(O_S,μ_q^⊗2), which is §5.3's Gysin route). ArithmeticKTheory §6.13 at #1418 lines 2958–2994 as above. KTheoryFiniteLocalFields §1.8 at #1281 line 328 ("Normalize the fibre–cofiber and torsor comparisons by this positive Kummer boundary"), §1.1 line 214–220, §1.2 line 233–240, §2.2 line 412–430. Weibel III.6.9 (weibel line 13858–13892) for the Lean docstrings' locators: relations yx=ζxy, dimension n², the monomial basis.

### Adversarial values

Rows for untouched statements are those of the r4 report (its table, 56 rows, from "Conventions: H_m(a,b)" to "R03 overlap"), carried forward unchanged. New rows for every changed statement:

| Statement | Instance | Values | Result |
|---|---|---|---|
| `symbolAlgebra_isCentralSimple` hypotheses | m=2, ζ=1, a=b=1 (ζ not primitive) | presented algebra F[X,Y]/(X²−1,Y²−1) commutative of dimension 4 = F⁴: not simple, center ≠ F | `IsPrimitiveRoot` needed; negative control |
| same, char p ∣ m | F₃, m=3 | no primitive cube root of 1 in characteristic 3 (T³−1=(T−1)³); `IsPrimitiveRoot ζ 3` unsatisfiable, `IsUnit (3:F₃)` false | both hypotheses exclude it; hmF redundant given hζ (note only) |
| same, m=1 | excluded by 2 ≤ m | SymbolAlgebra F 1 1 a b = F, finrank 1 = 1² | true but excluded; harmless |
| `symbolAlgebra_split` representation | F₅, m=4, ζ=2, α=2 (a=1), b=3 | X=diag(αζ^(−i)), Y forward shift with wrap 3: X⁴=1, Y⁴=3, YX=2·XY all hold; span of the 16 monomials X^iY^j has rank 16 = m² | surjective onto Mat₄(F₅) |
| same | F₇, m=3, ζ=2, α=3 (a=6), b=5 | relations hold; rank 9 | holds |
| same | F₅, m=2, ζ=4, α=3 (a=4), b=2 | relations hold; rank 4 | holds |
| direction control | Y the backward shift | YX = ζ⁻¹XY, not ζXY | the forward shift is forced by `comm` |
| `symbolAlgebra_matrix_corner` | F₅, m=4, ζ=2, a=4, b=3 | T⁴−4=(T²−2)(T²+2), 2 and 3 nonsquares mod 5: d=2, s=2, c=α²=2, c²=4=a; e₀=(X²+2)/4, e₁=X²−2: idempotent, orthogonal, e₀+e₁=1; Ye₀Y⁻¹=e₁, Y²e₀Y⁻²=e₀; x=e₀X, y=e₀Y²: x²=2e₀, y²=3e₀, yx=ζ²xy=4xy; dim e₀Ae₀ = 4 = d²; 16 = s²d² | corner is A_(ζ²)(2,3), as stated |
| same, d=1 | a=α^m, α∈F | natDegree(minpoly)=1, c=α, c^m=a; inner algebra SymbolAlgebra F 1 (ζ^m=1) c b = F; Matrix (Fin m) (Fin m) F | agrees with `symbolAlgebra_split` at L=F |
| same, d=m | T^m−a irreducible | m/d=1, ζ^1=ζ, Fin 1 matrices: A ≃ A | identity case |
| same, junk values | natDegree of minpoly | α integral over F (SeparableClosure is algebraic), so natDegree ≥ 1; m/d exact since d ∣ m is asserted | no 0-division junk |
| Associativity of the presented model | F₅, m=4, ζ=2, a=4, b=3 | all 4096 ordered basis triples associate | consistent structure constants |
| ε_B, uniform conventions | standard cones for Moore and localization, both boundaries projections | transfer reduces from −(i(a₂)+ℓb′); snake for B_Q = −(i(a₂)+ℓb′); snake for ∂₂=−B₂ = +transfer | ε_B=+1 |
| ε_B, the Check's model | Koszul Moore (da₂=ℓa₁′) with cone d(o,k)=(do−i(k),−dk) | transfer from i(a₂)−ℓb′; snake for B_Q = ℓb′−i(a₂) | ε_B=+1, as the Check says |
| ε_B, mixed conventions | Koszul Moore with cone d(o,k)=(do+i(k),−dk) | snake for B_Q = i(a₂)−ℓb′ = transfer | ε_B=−1 (R01) |
| ε_B, ℓ=2 | any convention | −1 ≡ 1 on K₂(O)/2 | invisible, as the Check says |
| σ at ℓ=2 | Q, S={2,∞} | K₂(Z[1/2])/2=C₂ generated by {−1,−1}; Pic=0: both injections are 0→C₂ | images agree, σ invisible |
| Divisor convention visibility | Pic(O) with a class [𝔭] of odd order ℓ | [𝔭]⁻¹ ≠ [𝔭]; ζ⊗[𝔭] ↦ ∓ the other | ε_G flips with the convention (R02) |
| AKT §6.13 at L=F, n=1 | μ_ℓ⊂F, ℓ odd | G=Gal(F/F) trivial: coinvariants = Pic(O_F[1/ℓ])/ℓ⊗μ_ℓ = μ_ℓ⊗Pic(O); corestriction = id; target K₂(O_F)/ℓ=K₂(O_F[1/ℓ])/ℓ | same source and target as ι_S |
| Soulé cancellation | i=j=1 | c₂,₂(α∪a) = −c₁,₀(α)∪c₁,₂(a) (2.2.3.3); h = −c₂,₂ on symbols (§5.5, soule line 1697): h(α∪a)=c₁,₀(α)∪c₁,₂(a) | "the two coefficients −1 cancel" holds |
| Soulé's reading determines σ? | Lemme 2.2.4.4 | proves Ω = Ker only (soule line 1735–1741) | does not determine σ, as the Check says |
| Scope sentence | AKT §6.13 "for odd primes" | §6.13: "odd prime p" (line 2960) | matches |
| R02 of r4 | `realSignSymbol` | 0 occurrences in the folder; prose at lines 66, 519 | repaired |

### Pinned library audit

Pins unchanged: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Opened for the new Lean: `Mathlib/Algebra/RingQuot.lean` (`RingQuot`, its `Algebra S (RingQuot r)` instance), `Mathlib/Algebra/FreeAlgebra.lean` (`FreeAlgebra.ι`), `Mathlib/Algebra/Central/Defs.lean` (`Algebra.IsCentral`), `IsSimpleRing`, `Module.finrank`, `SeparableClosure`, `minpoly`, `Algebra.TensorProduct.leftAlgebra` (the L-algebra structure on `L ⊗[F] A`). Duplication by object: no cyclic or symbol algebra of general degree exists at the pins (grep of Mathlib and Tau Ceti for `cyclicAlgebra`, `CyclicAlgebra`, `symbolAlgebra`, `SymbolAlgebra`: 0; Tau Ceti's `Algebra/CrossedProduct/*` has crossed products and the quaternion case only, which §2.4 compares with rather than restates; Mathlib's `QuaternionAlgebra` is m=2). No other open roadmap head or main folder declares these names (`roadmaps resolve`: none; `scratch/citations.md`: none); ownership of the degree-m symbol algebra by this roadmap is as found in r4.

### Supplier citations resolved this round

ArithmeticKTheory §6.13 (#1418, lines 2958–2994); KTheoryFiniteLocalFields §§1.1, 1.2, 1.8, 2.2 (#1281); LefschetzPencilsAndVanishingCycles §0.10 (#873); EtaleCohomologyFoundations §0.9 and SchemeAndStackFoundations §3.4 (main). The ECF §0.9 citation in §5.3's *Needs* and prose is new and is not yet listed in the "From EtaleCohomologyFoundations and SchemeAndStackFoundations" contract (lines 68–72), which names §§F.0.3, F.4.1–F.4.2, 0.7, F.3a and SSF §§2.11, 2.15; add "§0.9's `ClassicalAlgebraic.cycleClasses` with its Cartier-divisor agreement" there when repairing R01/R02 (same paragraph; no separate finding).

### Shape and policy

The new passages keep the house shape: prose targets with locators, backticked Lean names only where `Suggested.lean` declares them (gate `readme-ids-missing=0`), Checks in prose, no LaTeX, process words or pull-request numbers (gate scanners agree). `K₂(R)→Zˣ` at line 66 uses the README's ASCII Z for the integers, as elsewhere (`μ_ℓ⊗_Z`).

## Not verifiable

- The admitted proofs are not verified; elaboration checks statements, and the computations above refute particular wrong conventions and confirm the stated instances.
- The value of σ itself is a target of §5.3, not a claim; this review checked that its two inputs are conventions the suppliers fix (R01, R02 say where) and that Soulé's reading is consistent with σ=+1 under uniform conventions, nothing more.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmaps grep and resolve indices of 2026-11-05.

## Source issues

- **Misprint** in soule at Proposition 2.2.3.3, printed p.49 (soule line 1530): the source says the denominator contains the factorial of one minus i; it should contain the factorial of i minus one, as in Proposition 2.2.2.3; affects nothing.
- **Misprint** in soule at Lemme 2.2.4.4, proof, printed p.54 (soule line 1727): the source says the degree-two Chern class of the external product of a Bott class and a Picard class equals the cup product of their classes, citing Proposition 2.2.3.3; it should carry that proposition's coefficient −1; affects the proof (only the image subgroup is used, so the lemma stands).
