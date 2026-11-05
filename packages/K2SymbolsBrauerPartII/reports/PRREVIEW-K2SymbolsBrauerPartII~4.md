# Review of K2SymbolsBrauerPartII (pull request #1432 at 474cce8)

**Verdict:** needs changes

This head is the one the previous review read; the folder has no change since (`scratch/changes.md`: 0 changed lines). The previous review's single finding is checked first; then this is a full review of the 927-line README and the 51-line `Suggested.lean`.

### Previous finding, checked first

**R01 of round 3 (P2, six obsolete supplier-gap requests in `packages/K2SymbolsBrauerPartII/design/plan.json`): repaired.** The board commit 893fccb3 ("retire the six supplier gaps Part II now owns", 2026-11-03) replaced the six `gaps` entries by an empty list; `design/plan.json` now reads `{"gaps": []}`, and the brief records "none declared". The README passages that own the six constructions are unchanged: line 7 "Part II owns the native field-cohomology bridge, the arbitrary-DVR Galois/localization residue comparison, the adic Tate symbol and its coefficient diagram, the conditional and global adic torsion theorems, and the global-field Picard sequence", built in §§1.1, 1.6, 5.0a–5.0d. No `gap:` contract remains in the README, so plan and README agree.

## R01 (P2) — Two Layer 2 headlines are statable at the pins but absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean:10–11`, "The symbol-algebra central-simplicity and proper-degree matrix-corner theorems lack the specified symbol-algebra carrier at the pins."; README §2.2 line 328 "Prove central simplicity: A_ζ(a,b) is central simple of degree m over F" and §2.3 line 349 "Prove the matrix-corner equivalence".

**Claim:** The module docstring names these two headlines as not statable. They are statable at the pins with one simple definition of the kind the acceptance-test rules allow (a specialisation of a library notion with a real body): the presented algebra `RingQuot` of `FreeAlgebra F (Fin 2)` by the three relations X^m = a, Y^m = b, YX = ζXY, which is exactly the universal-property description the README's own §2.1 API gives ("Every pair satisfying these relations in a unital F-algebra induces a unique F-algebra homomorphism from A"). The acceptance file currently tests nothing about the roadmap's own objects: its two theorems concern the auxiliary conic sign only.

**Witness:** A scratch copy elaborates under `lake env lean` at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf) with `sorry` as the only warning, using `Mathlib/Algebra/Central/Defs.lean:67` (`Algebra.IsCentral`), `IsSimpleRing`, `Module.finrank`, `RingQuot` (`Mathlib/Algebra/RingQuot.lean:125`) and `FreeAlgebra` (`Mathlib/Algebra/FreeAlgebra.lean:167`):

```lean
open scoped IntermediateField

inductive SymbolRel (m : ℕ) (ζ a b : F) : FreeAlgebra F (Fin 2) → FreeAlgebra F (Fin 2) → Prop
  | xpow : SymbolRel m ζ a b (FreeAlgebra.ι F 0 ^ m) (algebraMap F _ a)
  | ypow : SymbolRel m ζ a b (FreeAlgebra.ι F 1 ^ m) (algebraMap F _ b)
  | comm : SymbolRel m ζ a b (FreeAlgebra.ι F 1 * FreeAlgebra.ι F 0)
      (algebraMap F _ ζ * (FreeAlgebra.ι F 0 * FreeAlgebra.ι F 1))

abbrev SymbolAlgebra (m : ℕ) (ζ a b : F) : Type _ := RingQuot (SymbolRel F m ζ a b)

theorem symbolAlgebra_isCentralSimple (m : ℕ) (hm : 2 ≤ m) (hmF : IsUnit (m : F))
    {ζ : F} (hζ : IsPrimitiveRoot ζ m) (a b : Fˣ) :
    Algebra.IsCentral F (SymbolAlgebra F m ζ a b) ∧ IsSimpleRing (SymbolAlgebra F m ζ a b) ∧
      Module.finrank F (SymbolAlgebra F m ζ a b) = m ^ 2 := by sorry

theorem symbolAlgebra_matrix_corner (m : ℕ) (hm : 2 ≤ m) (hmF : IsUnit (m : F))
    {ζ : F} (hζ : IsPrimitiveRoot ζ m) (a b : Fˣ)
    (α : SeparableClosure F) (hα : α ^ m = algebraMap F _ (a : F))
    (d : ℕ) (hd : d = Module.finrank F F⟮α⟯) (c : F) (hc : algebraMap F _ c = α ^ d) :
    Nonempty (SymbolAlgebra F m ζ a b ≃ₐ[F]
      Matrix (Fin (m / d)) (Fin (m / d)) (SymbolAlgebra F d (ζ ^ (m / d)) c b)) := by sorry
```

`#check` of both gives the displayed types with every binder retained (`2 ≤ m`, `IsUnit ↑m`, `IsPrimitiveRoot ζ m`, units `a b`). At `d = 1` the right side is `Matrix (Fin m) (Fin m) (SymbolAlgebra F 1 1 c b)`, and the degree-one presentation (X = c, Y = b, YX = XY) is F, matching §2.3's degree-one convention; at `d = m` it is a 1×1 matrix algebra, matching the Check at line 380. Both statements are true for the presented algebra under these hypotheses (Weibel III.6.9, weibel line 13858–13862, gives the m² monomial basis of the presented algebra; the corner argument is §2.3's).

**Exact repair:** Add the three-relation presentation and these two theorems (tested above; names are the author's choice) to `Suggested.lean` under `/-! ## Layer 2: cyclic symbol algebras -/`, delete the sentence of the docstring quoted above, and name the two declarations in the README's §2.2 and §2.3 API bullets ("the central simplicity and degree statement is `…`; the corner equivalence is `…`"), with one clause in §2.1 saying that the acceptance file states the algebra by its universal presentation, whose m² monomial basis is the §2.1 target. This keeps README and Lean at the same generality (every field, m ≥ 2 invertible in F, primitive ζ, units a, b). Nothing else in the file changes; the two conic headlines stay.

## R02 (P3) — `realSignSymbol` does not exist in K2SymbolsBrauer at its head

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:66`, "Consume §12.5's `realSignSymbol` on K₂(R), including its symbol values and surjectivity"; also line 515 "Use the supplied `realSignSymbol` over R".

**Claim:** The backticked name is a claim that the supplier declares it. K2SymbolsBrauer §12.5 at the head of #1302 ("The real sign symbol (Example III.6.2.1)") describes the homomorphism `K_2(ℝ) →* ℤˣ` in prose and names no Lean declaration; its `Suggested.lean` (269 lines) has no `realSignSymbol` (its only sign-related declaration is `MilnorK.numberField_realSign_equiv`, line 194). The name occurs nowhere on main, in any open roadmap head (`roadmaps grep realSignSymbol` returns only this README) or at the pins.

**Witness:** `roadmaps show K2SymbolsBrauer`, §12.5 (the API list begins "The homomorphism `K_2(ℝ) →* ℤˣ` with `{x, y} ↦ −1` if …"); `roadmaps show K2SymbolsBrauer --file Suggested.lean`, grep for `realSign`.

**Exact repair:** Replace both backticked occurrences by prose: "the real sign homomorphism K₂(ℝ) → ℤˣ of K2SymbolsBrauer §12.5" (line 66) and "the supplied real sign homomorphism of K2SymbolsBrauer §12.5" (line 515). No mathematics changes: the values used here (−1 exactly when both entries are negative, surjectivity through {−1,−1}) are the ones §12.5 lists.

## R03 (P3) — ArithmeticKTheory §6.13 already builds the number-field, odd-ℓ case of §5.0d's Picard injection and is not cited

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:710`, "This constructs the Picard injection; it is not inferred from generic restriction being injective on integral K₂."; §5.3 line 827 "This sequence contains the kernel of generic restriction and must be transported with its actual Picard map".

**Claim:** ArithmeticKTheory (earlier in the merge order, cited here only for §§5.2, 6.1, 6.3) has §6.13 "Keune's twisted Picard injection": for every number field F, odd prime p, n ≥ 1 and L = F(μ_{p^n}), the injection `(Pic(O_L[1/p])/p^n ⊗ μ_(p^n))_G ↪ K₂(O_F)/p^n`, built as the Kummer connecting map tensored with μ, corestricted, followed by the degree-two étale K-comparison, with `K₂(O_F)/p^n = K₂(O_F[1/p])/p^n`. With F = L (μ_ℓ ⊂ F), n = 1 and S the places above ℓ and the archimedean places, its source and target are those of §5.0d's `ι_S`. Two roadmaps then each construct a map μ_ℓ ⊗ Pic(O_{F,S}) → K₂(O_{F,S})/ℓ on that overlap, by different routes (snake lemma on tame residues here; Kummer boundary and étale comparison there), and nothing says they agree. Part II's sequence is strictly more general (every global field, ℓ = 2, arbitrary S, the right-hand sum-zero term), so it stays the owner of Tate's Theorem 6.2; but a consumer reading §5.3's "actual Picard map" cannot tell whether it is ArithmeticKTheory's.

**Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md` at the head of #1418, lines 2958–2975 (heading "### 6.13 Keune's twisted Picard injection"; the displayed injection; "The final comparison is the degree-two étale K comparison and invariance of K₂/p^n under inverting p"). This README's citations of ArithmeticKTheory: lines 11, 86, 687, 691, 748, 750, 802, 816, 833, 835, 914, none of §6.13.

**Exact repair:** In §5.0d (or §5.3), after the construction of `ι_S`, add: "For a number field, odd ℓ, μ_ℓ ⊂ F and S the places above ℓ together with the archimedean places, ArithmeticKTheory §6.13 constructs the same injection as the Kummer boundary tensored with μ_ℓ followed by its degree-two étale comparison; prove that `ι_S` equals that map through §5.3's finite ring comparison, with the sign of §5.5 and the positive Kummer boundary of KTheoryFiniteLocalFields §1.8 (Soulé, §2.2.4.4, pp.54–55, soule line 1750–1751, reads Tate's map as the external product whose Chern image is the Kummer class)." Add "ArithmeticKTheory §6.13" to §5.0d's *Needs* line and to the ArithmeticKTheory contract (§ "From ArithmeticKTheory"). The function-field, ℓ = 2 and general-S cases remain this roadmap's.

## Verified sound

### Gate, order, build and signatures

The worker's gate at 474cce8 (`scratch/gate.md`) and my own run both pass:

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

(the `build=0` field is the worker's targeted build; my plain gate call has no build field). `git diff --stat origin/main...HEAD` outside the folder is empty. The prescribed dependency check returned

```text
depcheck: 204 roadmaps, 1662 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. Every supplier named in a *Needs:* line or contract is earlier in `ORDER.txt` (AlgebraicKTheory 12, GeneralAlgebraicKTheory 14, KTheoryLowDegrees 36, K2SymbolsBrauer 37, ArithmeticGaloisDuality 43, SelmerIwasawaCohomology 51, LefschetzPencilsAndVanishingCycles 52, KTheoryFiniteLocalFields 69, ArithmeticKTheory 123; this roadmap 181) or on main (EtaleCohomologyFoundations, SchemeAndStackFoundations, ClassFieldTheory, QuadraticFormInvariants, ClassicalArithmeticCompletion at a0ad405). RefinedTraceMethods and EllipticKTheory are named only as consumers.

`lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for its three declarations exits 0 with the two intended `sorry` warnings (lines 39, 46). Elaborated types, compared with the README: `conicSymbol : (F : Type u_1) → [Field F] → F → F → ℤˣ` (every field, zero inputs allowed, §3.3); `conicSymbol_real_eq_neg_one_iff : ∀ (r s : ℝ), conicSymbol ℝ r s = -1 ↔ r ≤ 0 ∧ s ≤ 0` (§3.3 display); `conicSymbol_eq_hilbertSymbol : ∀ {F} [Field F], 2 ≠ 0 → ∀ (r s : Fˣ), conicSymbol F ↑r ↑s = TauCeti.hilbertSymbol r s` (§3.4, characteristic ≠ 2 and unit inputs). No binder dropped. The file has one real-bodied definition, no sorry'd data, no `set_option`, imports `Mathlib` and `TauCeti.NumberTheory.HilbertSymbol.Basic` only.

**One-tactic probe.** On a scratch copy, each sorried theorem was tried with `simp [conicSymbol]`, `rfl`, `infer_instance`, `simp [conicSymbol, TauCeti.hilbertSymbol]`, `exact` with `TauCeti.hilbertSymbol_eq_one_iff`, and `simp` followed by `nlinarith` for the real one: all eight attempts fail (unsolved goals or tactic failure). Neither theorem is padding; the real criterion needs the inverse-square-root witness and the conic/norm theorem needs the two zero-coordinate cases of §3.3.

**Headline coverage.** README headlines: field-cohomology bridge and ordered cup dictionary (§1.1); residue dictionary on arbitrary DVRs (§1.6); Brauer symbol and root/field change (§§1.4–1.5); symbol-algebra central simplicity, splitting, matrix corner and Brauer class (§§2.2–2.4); arithmetic norm-residue and invariant formula (§§3.1, 3.5); conic criterion and Hilbert comparison (§§3.3–3.4); all-place reciprocity on K₂ (§4.3); adic Tate symbol, torsion, global torsion, Picard sequence, coefficient reduction (§§5.0a–5.0e); local, global and S-integer dictionaries (§§5.1–5.3); finite Chern comparison (§5.5). The two conic headlines are stated. Everything built on classical or Milnor K₂, on K-spectra with finite coefficients, or on integer-weight finite/adic twist cohomology of rings is correctly reported as not statable: at the pins there is no algebraic K₂, Steinberg group or Milnor K carrier (grep of Tau Ceti for `Steinberg`/`MilnorK`/`K2` finds only Lie-theoretic Serre-presentation files; Mathlib has none), and `KummerCoeff`/`muNRep` cohomology is field cohomology only. R01 is the exception: the two Layer 2 headlines need only the presented algebra.

### Sources: the 15 seeded targets

All four works are in the legal cache; locators were read at the printed pages (Tate: marker page N = printed 255+N; Weibel: marker = printed + 9; Soulé and Milne as marked). No README locator is flagged unverified.

| Sampled target | Text opened | Supports the statement as written; limits kept |
|---|---|---|
| 1.1 ordered Kummer-cup dictionary | weibel line 13950–13974 (III.6.10.1–6.10.3, pp.242–243): Kummer sequence, projection formula tr(a∪b)=a∪N b for finite separable E/F, Galois symbol K₂/m→H²(μ_m^{⊗2}) for m prime to char; tate line 287–293 (Lemma 3.2, p.263), line 294–344 (Diagram 3.3 and its verification, pp.263–264) | The ordered cup κ(a)∪κ(b) is Tate's h_ℓ (tate line 342–344). Weibel's projection formula is separable; the README's inseparable transfer with degree multiplier is its own target, correctly not attributed. |
| 1.3 tensor contraction | weibel line 13936–13940, 14004–14006 (μ_m^{⊗2} and the identification by 1↦ζ); milne line 5094–5102 (III.4 Step 4, p.113: H²(μ_n)⊗μ_n ≃ H²(μ_n^{⊗2}) by cup) | The contraction ζ^i⊗ζ^j↦ζ^{ij} is the ζ-identification; the source does not spell the pure-tensor formula, which §1.3 specifies. |
| 1.5 changing root/field | weibel line 14004–14012 (Remark 6.10.4, p.243) | Identification depends on ζ; the three scalars u^j, u^{−2}, u^{−1} are deductions from §§1.2–1.3, not claimed from the source. |
| 1.6 residues, uniformizer-last | tate line 596–597 (Theorem 6.2 proof, p.270: tame symbol d_v{z,a}=z^{v(a)}, uniformizer-last); weibel line 13461–13470 (Lemma 6.3, p.234: ∂_v{r,s}=(−1)^{v(r)v(s)}s^{v(r)}/r^{v(s)}, the inverse convention) | Tate's convention gives ∂{u,π}=ū; Weibel's gives ∂{π,u}=ū. The README names both correctly. The sign −κ(ū) is the README's own derivation (checked below). |
| 2.2 splitting and central simplicity | weibel line 13858–13863 (Example 6.9, p.240: relations yx=ζxy, dimension n², monomial basis), line 13873–13876 (central simplicity cited to Jacobson), line 13884–13892 (Lemma 6.9.1 and proof, p.241) | The README replaces Lemma 6.9.1's criterion by an explicit splitting representation; see Source issues. |
| 2.4 algebra class = contracted ordered cup | weibel line 13893–13898 (Proposition 6.9.2, p.241), line 14004–14012 (Remark 6.10.4, p.243: Tate identified the two symbols); milne line 5019–5067 (III.4 Steps 1–2, pp.111–112: (χ,b)₀=δχ∪b, Inf((χ,b)₀)=(χ,b)=χ∪δb) | The source states the identification exists; the cocycle computation fixing the order and sign is §2.4's, recomputed below. |
| 3.3 total conic sign | weibel line 13394–13405 (Example 6.2.2, p.233: rx²+sy²=1 for local F∋1/2; makes sense for any field of char ≠ 2 but need not be bilinear), line 13450–13453 (Example 6.2.5, p.234: c_{Q₂}(−1,−1)=−1) | Zero inputs and the total definition are the README's. |
| 3.5 arithmetic invariant and cubic witness | milne line 4957–4960 (Proposition 3.6, p.109), line 5069–5075 (Step 3, p.112: (χ,b)=inv(χ∪δb)), line 5088–5090 ((χ,b)=χ(φ_K(b))), line 5140–5146 (Remark 4.5, p.114: φ_K(b)(a^{1/n})=(a,b)a^{1/n}) | Milne's symbol has Artin at b acting on a root of a: the transpose of H_m. The README's transposition and negative exponent are consistent with this (computed below). |
| 4.1 local factors, common target | milne line 8075–8098 (Proposition 5.2, p.178: local components, trivial for almost all v); CAC §1.24 | Number field; real factor only at m ≤ 2 (ClassicalArithmeticCompletion §1.24 line 1096: 1 when n ≥ 3). |
| 5.0a adic Tate symbol and diagram | tate line 256–284 (Theorem 3.1 and proof, pp.262–263: transfer argument, ℓ-divisibility of D_F), line 287–293 (Lemma 3.2), line 294–344 (Diagram 3.3; γ(ζ⊗a)={ζ,a} when μ_ℓ⊂F, descent via E=F(μ_ℓ) and Lemma 3.4; left square δ∘i=h∘γ at line 334–340) | Matches §5.0a item by item, including the coinvariant source and the left square. |
| 5.0c global torsion and adic identification | tate line 542–566 ((5.3), Ker ∂_S finite, Theorem 5.4, pp.269–270); weibel line 30619–30648 (Harder VI.6.1 and Corollary 6.2, pp.502–503) | Function-field finiteness of order prime to p; README's finite-coordinate argument for no divisible subgroup is sound (row below). |
| 5.0e reduction of the ring comparison | weibel line 31341–31352 (VI.8.2–8.3, pp.513–514: H^n(R,ℤ_ℓ(i))=0 for n≠1,2; Cor 8.3 for odd ℓ or totally imaginary F), line 31623–31638 (VI.9.1.3–9.2, p.518: real restriction iso for n≥3 and for n=2, i≥2 with ℤ/2^∞ coefficients) | README keeps odd/totally-imaginary scope for the cd-2 argument and uses high-degree real restriction (ArithmeticGaloisDuality §R02.4.4) for ℓ=2. |
| 5.1 local Tate maps | tate line 463–486 (Proposition 4.5 and Corollary, pp.267–268: h_ℓ bijective for locally compact nondiscrete F) | Scope exactly as the README states (R and C included, ℓ≠char F). |
| 5.3 S-integers and Picard terms | tate line 575–608 (Theorem 6.2 and proof, pp.270–271); soule line 1705–1749 (Lemme 2.2.4.4, pp.54–55, assuming μ_{ℓ^ν}⊂O_S); weibel line 31348–31349 (Cor 8.3 restrictions) | Tate: any global field. Soulé: root containment. README assigns the number-field ring isomorphisms to ArithmeticKTheory §§5.2, 6.1, 6.3, not to these passages. |
| 5.5 finite Chern comparison | soule line 1282–1286 (Prop 2.2.2.3, p.42: coefficient −(i+j−1)!/((i−1)!(j−1)!)), line 1447–1458 (2.2.3.2, p.47: factorization through reduction), line 1693–1699 (2.2.4.4, p.53: c_{2,2}{a,b}=−c_{1,1}(a)∪c_{1,1}(b)), line 1551–1556 (remark after Prop 2.2.3.3, p.49) | Coefficient −1 at i=j=1; no product of two finite classes claimed. |

Also read: milne line 8123–8150 (Theorem 5.3, Example 5.4, p.179) and line 10042–10046 (VII.8.1(b), p.221) for §4.3; tate line 354–367 (Theorem 3.5 and Corollary, p.265) for §5.0b; tate line 570–574 (Theorem 6.1, p.270) for root-symbol surjectivity; weibel line 9972–9980 (III.1.1.1–1.1.2, p.180), line 13284–13295 (III.6.1–6.1.1, p.231), line 13376–13384 (Example 6.2.1, p.232), line 13406–13436 (Example 6.2.3 and Moore 6.2.4, p.233); soule line 1400–1446 (2.2.3.1, pp.45–46).

### Adversarial values

Each row gives the instance and the values computed on both sides. Finite computations (symbol-algebra associativity on all ordered basis triples; conic versus norm solubility on all unit pairs over F₃, F₅, F₇, F₁₁; small-integer searches for the rational conics) were run in a scratch script; the rest were computed by hand.

| Statement | Instance | Values | Result |
|---|---|---|---|
| Conventions: H_m(a,b)=ζ^{−e(inv β{a,b})} | Q₇, m=3, ζ≡2, {3,7} | H(7,3)=Frob(α)/α, α³=3: α⁶=9≡2=ζ, so H(7,3)=ζ, H(3,7)=ζ⁻¹ by skew symmetry; inv β{3,7}=inv(χ₃∪κ(7))=χ₃(Art 7)=χ₃(Frob)=1/3 (Milne 3.6/Step 3); ζ^{−1}=H(3,7) | consistent; positive exponent would give ζ≠ζ⁻¹ |
| §2.4 [A_ζ(a,b)]=β_ζ{a,b} | same witness | A_ζ(3,7)=(L/F,σ,7) with σ(α)=ζα=Frob(α): inv=v(7)/3=1/3; β{3,7}=1/3 | equal |
| §2.4 cochain identity | f(g)=γ^{i(g)}, γ^m=b | δf(g,h)=g(γ^{i(h)})γ^{i(g)}/γ^{i(gh)}=ζ^{j(g)i(h)}·b^{⌊(i(g)+i(h))/m⌋}=d(g,h)ζ^{j(g)i(h)}; so [d]=[ζ^{−j(g)i(h)}]=−c(κ(b)∪κ(a))=c(κ(a)∪κ(b)) by the flip theorem | README formula holds |
| §2.4 Check F₇((t)) | ζ=2, A_ζ(2,t) | Frob(α)/α=α⁶=4=ζ², σ=Frob², inv=2·v(t)/3=2/3; K2SymbolsBrauer §10.32a: [2,t]=4=ζ²↔2/3; H(2,t)=ζ^{−2}=ζ=2, H(t,2)=ζ²=4 | matches both roadmaps |
| §2.1 multiplication | (m,p,ζ,a,b)=(2,5,4,2,3),(3,7,2,2,3),(4,5,2,2,3),(5,11,3,2,3),(3,7,2,3,5) | associativity on 64, 729, 4096, 15625, 729 ordered triples: 0 failures; YX=ζXY true; X^m=a, Y^m=b | holds |
| §2.1 Check line 314 | e_{0,1}e_{1,0} | ζ^{jk}=ζ^{1·1}: ζe_{1,1}; reversed: ζ^0 e_{1,1} | YX=ζXY |
| §2.2 splitting operators | Xv_i=αζ^{−i}v_i, Yv_i=v_{i+1}, Yv_{m−1}=bv₀ | i<m−1: YXv_i=αζ^{−i}v_{i+1}=ζ·αζ^{−(i+1)}v_{i+1}=ζXYv_i; i=m−1: YXv_{m−1}=αζ^{1−m}bv₀=αζbv₀=ζXYv_{m−1}; X^m=a, Y^m=b; eigenvalues αζ^{−i} distinct | holds |
| §2.2 negative control | Mat₂(D), D nonsplit quaternion over F∋μ₄, u=diag(1,−1) | u∉F, u⁴=1, min poly degree 2; class [D]≠0 | Weibel Lemma 6.9.1 fails; README's hypothesis needed |
| §2.3 factorization | m=4, a=c², c nonsquare, F∋i | T⁴−c²=(T²−c)(T²+c), d=2, s=2, −c=i²c nonsquare; dims 16=2²·4 | holds |
| §2.3 general | ζ^s of order d, roots of T^d−cζ^{rd} | roots αζ^{r+sk}, k<d: orbit of αζ^r under Gal (image ⟨ζ^s⟩); r=0..s−1 covers all m roots; factors distinct since ζ^d has order s; Y e_0 Y^{−1}=e_{s−1}, Y^s fixes e_0; (eY^s)^d=be, (eX)^d=ce | holds |
| §3.3 norm criterion ⇒ | ru²+sv²=1, v≠0 | s=(1/v)²−r(u/v)²; v=0: r=t², s=x²−t²y² with x=(1+s)/2, y=(s−1)/(2t) | needs 2≠0 |
| §3.3 norm criterion ⇐ | s=x²−ry², x≠0 | r(y/x)²+s(1/x)²=1; x=0: s=−ry², u=(1+1/r)/2, v=(1/r−1)/(2y) | needs 2≠0 |
| §3.3 char 2 control | F₂(t), (1,t) | conic: (1,0); norm: x²−y²=(x+y)² never t | conic 1, Hilbert −1 |
| §3.3 finite fields | all unit pairs over F₃,F₅,F₇,F₁₁ | 4/4, 16/16, 36/36, 100/100 agree; all solvable | holds |
| §3.3 real | (−1,−1),(0,0),(0,−1); (2,−1),(0,2) | ≤0 both: rx²+sy²≤0≠1; r>0: x=1/√r,y=0 | iff holds with zeros |
| §3.3 rational control | r=3,7,21; s=−1 | rA²=B²+C² primitive: mod 3 (or 7) forces 3∣B,C then 3∣A; no solutions found with A,B<40; r=2,5 have (1,1,1),(1,1,2) | three −1's, product rule fails |
| §3.1 w/m power vs primary projection | w=6, m=3, generator ζ | ζ^{w/m}=ζ²; 3-primary part of ζ is ζ⁴ (ζ=ζ⁴ζ³) | distinct, README right |
| §3.1 Checks | Q₂ {−1,−1}; Q₃ {3,−1}; Q_p {p,u} | x²+y²=−1 unsolvable in Q₂: −1; Q₃(i) unramified, Frob(i)=i³=−i: −1; (p,u)=ū^{(p−1)/2} | values match |
| §3.2 section | ζ^e=t^m | t^{m²}=1⇒t∈μ(F)=μ_m⇒t^m=1⇒ζ^e=1⇒m∣e; m{ζ,a}={1,a}=0; N(i{ζ,a})=ζ^i | well-defined section |
| §3.2 composite control | w=6, value ζ² | i{ζ,a}↦ζ^{2i}: image ⟨ζ²⟩ of order 3 | not a section |
| §1.5 scalars | m=5, u=2 | c_{ζ²}(ζ²⊗ζ³)=ζ^{(2·3)·3}=ζ³ (exponents 2,3 are 1,4 in base ζ², contraction (ζ²)^{1·4}=ζ^8=ζ³)=(c_ζ)^3, u^{−1}=3; weight-two basis factor u²=4; inverse weight-two u^{−2}=4 | three scalars as stated |
| §1.6 cup-factor signs | δ(κ(π))=+1 (LefschetzPencils §0.10: valuation mod n) | δ(κ(π)∪κ(u))=δκ(π)∪κ(ū)=κ(ū); δ(κ(u)∪κ(π))=(−1)^1κ(ū)∪δκ(π)=−κ(ū) (graded Leibniz for a degree-one base class) | ∂h{u,π}=−κ(ū)=−κ(∂ᴹ{u,π}) |
| §1.6 ramified pair | {π,π} | ∂ᴹ{π,π}=∂ᴹ{−1,π}=−1; ∂(κ(π)∪κ(π))=∂(κ(π)∪κ(−1))=κ(−1); −κ(−1)=κ(−1) | consistent |
| §1.6 Check F₃[t]_(t), m=2 | {t,t} | tame −1=2, nonsquare in F₃: κ₂(2)≠0 | sign visible |
| §1.6 transfer Check | unramified quadratic E/Q₇, u=3, m=3 | cor(−κ_E(3))=−κ(N(3))=−κ(9)=−2κ(3); ∂(cor{3,7}_E)=∂(2{3,7})=−2κ(3) | no extra degree factor |
| §1.6 ramified Check | k[[s]]/k[[t]], t=s² | residue of {u,t}=−κ(ū) becomes −2κ(ū) (e=2) | multiplier e |
| §1.1 inseparable transfer | F₂(s)/F₂(t), s²=t, ℓ=3 | res κ(t)=κ_E(s²)=2κ_E(s); cor κ_E(s)=κ(N s)=κ(t); cor∘res=2=[E:F], G_E=G_F so inverse restriction would give 1 | degree multiplier needed |
| §1.1 Check R, m=2 | κ(−1)∪κ(−1) | Hamilton class, invariant 1/2 | nonzero |
| §4.1/§4.3 Q, m=2, {−1,−1} | places 2, ∞, odd p | factors −1, −1, 1; product 1; invariants 1/2+1/2=0 | holds; omitting 2 or ∞ breaks it |
| §4.3 Q(μ₃), v∣7, ζ↦2 | {3,7} | factor ζ⁻¹, invariant 1/3; at the conjugate place ζ↦4: Frob(α)=2α=ζ²α, σ=Frob², invariant 2/3, factor ζ^{−2}=ζ; 1/3+2/3=0 | both transports recover the global root |
| §4.1 real place | m=1; m=2; m>2 | μ₁ target, factor 1; sign factor; no real embedding with ζ_m, m>2 | as stated |
| §5.0a diagram | Tate line 334–340 | δ(i(z⊗α)) is the class of (ℓ^{−1}d(z̃∪dα))=d z̃∪dα=h(γ(z⊗α)) | left square |
| §5.0b model | C_{ℓ^∞}⊕C_ℓ→C_ℓ | kernel D=C_{ℓ^∞} divisible, quotient C_ℓ | D must be quotiented |
| §5.0c F₃(t) | localization at F₃[t] | K₂(F₃[t])=K₂(F₃)=0, so K₂(F)≃⊕_P F_{3^{deg P}}ˣ; each summand finite of order prime to 3; divisible subgroup projects to 0 in every finite coordinate and has finite support ⇒ 0 | torsion, no divisible subgroup |
| §5.0c Q | m=2 | K₂(Q)/2↠⊕_{p odd}F_pˣ/2, each C₂, infinitely many | finite coefficients, infinite group |
| §5.0d Q, S={2,∞}, ℓ=2 | Pic(ℤ[1/2])=0 | K₂(ℤ[1/2])=K₂(ℤ)=ℤ/2 (localization, K₁(F₂)=1); target (μ₂⊕μ₂)₀=C₂; {−1,−1}↦(−1,−1) | 0→0→C₂→C₂→0 |
| §5.0d F₃(t), S={∞} | O=F₃[t] | K₂(O)=0, Pic=0, one coordinate sum-zero =0 | 0→0→0→0 |
| §5.0d F₃(t), S={0,∞} | O=F₃[t,t⁻¹] | K₂(O)=K₂(F₃)⊕K₁(F₃)=C₂ generated by {−1,t}; residues at 0 and ∞: (−1)^{v(t)}=−1 and −1, sum 0; Pic=0 | 0→0→C₂→C₂→0 |
| §5.0d tame left square | Tate line 596–597 | ∂ᴹ{ζ,a}=ζ^{v(a)} with uniformizer-last: a=wπⁿ, {ζ,wπⁿ}↦ζⁿ | left square |
| §5.0d Check Q(μ₃), v∣7 | γ(ζ⊗7) | tame ζ̄=2 of order 3; 3γ=0, γ≠0; cup residue −κ₃(2) | nonzero order 3 |
| §5.0d tensor term | Pic=C_{ℓ²}, generator g | ζ⊗ℓg=0, ζ⊗g generates C_ℓ | Pic/ℓ not Pic[ℓ] |
| §5.0e real H³ | C₂ on ℤ₂(2) trivial | H³=ℤ₂[2]=0, H²=ℤ₂/2=C₂; finite H³(ℤ/2^r)=(ℤ/2^r)[2]=⟨2^{r−1}⟩=C₂; reduction from r+1 sends 2^r to 0 mod 2^r (r=1,2,3 checked); lim=0, lim¹H²=0 (finite towers) | H³_cont=0, H²_cont/2^r≃H²(μ_{2^r}^{⊗2}) |
| §5.0e odd twist control | ℤ₂(1), sign action | H³=H¹=ker(1+g)/(1−g)=ℤ₂/2=C₂ | weight two is used |
| §5.0e ℤ[1/2] | ℓ=2 | H²_cont=K₂(ℤ[1/2]){2}=C₂ (ArithmeticKTheory §6.3 row n=2), quotient by 2^r is C₂ | generator survives |
| §5.0e ℤ[1/3] | ℓ=3 | K₂(ℤ)⊗ℤ₃=0; Pic=0; sum-zero of one summand 0 | both sides 0 |
| §5.1 archimedean | R, ℓ=2; odd ℓ; C | K₂(R)/2^r=C₂=H²(C₂,ℤ/2^r(2)) (trivial action, even weight); odd: 0=0; C: 0=0 | holds |
| §5.1 F₂((t)), ℓ=3 | μ(F₂((t)))=1 | Moore: K₂/3=0, so H²=0 | holds |
| §5.3 raw vs normalized | [3]·[7] over Q₇, m=3 | (θ₂♮)⁻¹: {3,7}, tame 3, invariant 1/3; θ₂⁻¹: −{3,7}, tame 3⁻¹=5, invariant 2/3; κ₃(5)=−κ₃(3) | adapters not interchangeable |
| §5.3 localization square | det B_Q θ₂♮=(∂ᴹ)⁻¹ (K2SymbolsBrauer §11.8: {2,5} at 5 gives 2 vs 3) | ∂h(θ₂♮)⁻¹=−κ∂ᴹ=κ det B_Q | sign as stated |
| §5.4 F₅, m=6 | K₂(F₅)=0 | K₁(F₅)[6]=μ₆(F₅)={1,4}=C₂; CRT: μ₂(F₅)=C₂, μ₃(F₅)=1 | boundary and CRT as stated |
| §5.4 m=1 | cofib(id)=0 | all terms 0 | holds |
| §5.5 coefficient | i=j=1 | −(1)!/(0!0!)=−1 | integer −1 |
| §5.5 cubic | Q₇ {3,7} | cup invariant 1/3; Chern −1/3=2/3; Artin sign independent | two distinct signs |
| §5.5 ℤ/6 | cup coordinate 1 | Chern 5; 5 mod 2=1, 5 mod 3=2; CRT 5 | same sign in each primary part |
| §5.5 raw map | ε=−1 | c red θ₂(x)=c red θ₂♮(εx)=−εh(x)=+h(x) | Conventions line 40 |
| Lean `conicSymbol_eq_hilbertSymbol` | pinned `hilbertSymbol a b = if ∃x y, b=x²−a y² then 1 else −1` (`HilbertSymbol/Basic.lean:46`) | with (a,b)=(r,s) this is §3.3's norm criterion | statement matches |
| Lean `conicSymbol_real_eq_neg_one_iff` | (0,0): 0≠1 | sign −1 and 0≤0∧0≤0 | strict criterion would fail |
| R01 statability | scratch presentation | both Layer 2 headlines elaborate; d=1 gives Matrix (Fin m) (Fin m) F; d=m gives Fin 1 | headlines statable |
| R02 name | `realSignSymbol` | 0 occurrences in K2SymbolsBrauer README (3479 lines) and Suggested.lean (269 lines) at #1302; 0 on main; 0 at the pins | name does not exist |
| R03 overlap | F⊇μ_ℓ, ℓ odd, S=ℓ-places∪∞ | ArithmeticKTheory §6.13 source (Pic(O_F[1/ℓ])/ℓ⊗μ_ℓ), target K₂(O_F)/ℓ=K₂(O_F[1/ℓ])/ℓ (residue groups at ℓ have order prime to ℓ); §5.0d source μ_ℓ⊗Pic(O), target K₂(O)/ℓ | same source and target, two constructions |

### Pinned library audit

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (`lake-manifest.json`). Opened at the pin: `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125,129,131` (`KummerCoeff` = `Additive (rootsOfUnity n (SeparableClosure K))`, discrete); `Kummer.lean:249,277,322,330` (`kummerMap` under `IsUnit (n : K)`, `kummerMap_eq_kummerCocycleClass`, `ker_kummerMap`, `kummerMap_eq_one_iff`); `RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595,790` (`explicitCup11`, `explicitCup11_eq_neg_flip`); `NumberTheory/ClassFieldTheory/MuNRep.lean:137` (`muNRep`); `ClassFieldTheory/Local/Symbol.lean:165` (`kummerCupPairing : TopPairing (muNRep n F) (muNRep n F) (muNRep n F)`); `ClassFieldTheory/Brauer/RootsOfUnity.lean:89,103` (`h2MuEquivZMod` and `toRatAddCircle_h2MuEquivZMod`, nonarchimedean local field in `Type`, `IsUnit (n : F)`, coordinate k ↦ k/n); `ClassFieldTheory/Brauer/Torsion.lean:58` (`h2MuToBr`); `Algebra/CrossedProduct/Comparison.lean:267,295` (`brauerCohomologyEquiv`, `brauerCohomologyEquiv_crossedProductClass`); `Algebra/CrossedProduct/CupProduct.lean:318` (`brauerCohomologyEquiv_quaternionClass`); `NumberTheory/HilbertSymbol/Basic.lean:46,56,69` (`hilbertSymbol`, `hilbertSymbol_eq_one_iff`, `hilbertSymbol_eq_one_iff_exists_norm_eq`); `FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:185` (`hilbertSymbol_eq_cohomological`, `[Invertible (2 : F)]`, `F : Type`); Mathlib `RingTheory/RootsOfUnity/PrimitiveRoots.lean:461,516` (`zmodEquivZPowers`; `zpowers_eq` under `[IsDomain R] [NeZero k]`, as the README says), `RootsOfUnity/Basic.lean:56` (`rootsOfUnity`), `Algebra/Central/Defs.lean:67`, `Algebra/BrauerGroup/Defs.lean:40`, `Algebra/RingQuot.lean:125`, `Algebra/FreeAlgebra.lean:167`. All 29 backticked library names in the README resolve at the pins; the 7 backticked supplier names other than `realSignSymbol` resolve in the cited supplier sections; the 3 own names are declared in `Suggested.lean`.

### Supplier citations resolved (every round, at the current heads)

K2SymbolsBrauer (#1302): §§5.1, 5.2, 5.13–5.15, 7.1–7.3, 8.1 (ε=−1, θ₂♮(z)=θ₂(z⁻¹), θ₁[a]·θ₁[b]=θ₂♮{a,b}), 8.2, 8.3, 9.7 (multiplier e), 9.11, 9.18, 10.7, 10.9, 10.32a ([a,b]_K = normResidueSymbol b a; YX=ζXY; F₇((t)) values [2,t]=4, [t,2]=2), 10.32b, 10.32c, 11.1, 11.2 (any Dedekind domain), 11.3, 11.7, 11.8 (det B η♮ inverts the tame symbol), 12.2–12.3 (number fields), 12.5 (prose only: R02). KTheoryFiniteLocalFields (#1281): §1.1 (`coeff`, `reduce`, `bockstein`, `coeff_exact`, CRT), §1.8 (`earlyChern`, even-coefficient degree-two Bockstein correction), §3.0a (`merkurjevSuslin` K₂(F)/m≃H²(F,μ_m^{⊗2}) for m invertible), §§3.1–3.4 (`normResidueMap`, w/d powers versus primary projections, full-root section choosing a primitive value), §7.3. LefschetzPencilsAndVanishingCycles (#873) §0.10 (purity for regular immersions, invertible coefficients; trait: H²_s(S,μ_n)≅ℤ/n generated by a uniformizer, H¹(η)→H²_s is the valuation mod n). ArithmeticGaloisDuality (#858) §§R02.1.2–R02.1.3 (lattice cohomology has no nonzero divisible subgroup), R02.3.2, R02.4.4 (H^r(G_S,M)≅⊕_{real}Ĥ^r for r≥3). SelmerIwasawaCohomology (#869) §3.15 (number field, S ⊇ ∞ ∪ p-places, ordinary cohomology at real places). GeneralAlgebraicKTheory (#1212) §§1.7, 1.8, 3.12–3.14, Layer 5, 7.4, 7.5. KTheoryLowDegrees (#1248) §§8.1, 13.1. AlgebraicKTheory (#1142) §§1.1–1.4, 2.1–2.3, 3.1, 5.1–5.2. ArithmeticKTheory (#1418) §§5.2 (edge; sign adapter β₂=∂₂⁻¹), 6.1 (odd ℓ or totally imaginary), 6.3 (row n=8k+2: H²(R,ℤ₂(4k+2)), ordinary H²); §6.13 found and not cited (R03). On main (a0ad405): EtaleCohomologyFoundations §§0.7, F.0.3, F.3a (tame character t_ℓ, positive direction), F.4.1–F.4.2; SchemeAndStackFoundations §§0.12, 0.14, 2.11, 2.15, 3.4; ClassFieldTheory Layers 5, 6, 10 (`invMap`, `sumLocalInv_eq_zero`, real invariant 1/2), 14; QuadraticFormInvariants §§6C, 6E, 7B; ClassicalArithmeticCompletion §§1.14 (Artin-first orientation, Milne is the transpose), 1.24, 1.25, 1.44 (`normResidueSymbol_eq_localSymbol`, ε fixed by the Q₇ witness (7,2)=4, (2,7)=2, consistent with this README's (7,3)=ζ, (3,7)=ζ⁻¹), 1.52.

Ownership by object (roadmaps grep over the 444 open heads and main; board packages): no other roadmap constructs the degree-m symbol algebra on every field, the total conic sign, the adic Tate symbol, the arbitrary-DVR residue bridge, or Tate's global-field Picard sequence; QuaternionArithmetic (#1722) uses Mathlib's quaternion symbol algebra at m=2 only; K2SymbolsBrauer §10.32a owns the prime-degree local function-field algebra, which §2.1 identifies on the overlap; ArithmeticKTheory §6.13 is the one overlap found (R03). Ownership against open pull requests not listed with files in the brief was checked only through the grep index.

### Shape and policy

Headings, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, five layers in build order with Examples and Dependencies, Downstream consumers, References: present. Every definition (§§1.2–1.4, 2.1, 3.3) has an API list and at least three discriminating Checks (5, 5, 4, 4, 7); every theorem carries hypotheses and a locator; no LaTeX, process words, pull-request numbers, `lemma`, `set_option`, algorithm or copied passage was found (gate scanners agree). No route-specific shortcut: wild coefficients, real places, ℓ=2, inseparable transfers and reducible radical polynomials are all kept in scope.

## Not verifiable

- None of the cited texts is behind a paywall; all 15 sampled targets were read in the cache. No manifest edit or missing-reference request was needed.
- The admitted proofs are not verified by this review: elaboration checks statements, the computations above refute particular wrong conventions. In particular R03's equality of the two Picard injections is stated as a target to add, not verified.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmaps grep index of 2026-11-04.

## Source issues

- **Error** in weibel at III, Lemma 6.9.1, printed p.241 (weibel line 13884–13892): the source says a central simple algebra of dimension n² containing a noncentral u with uⁿ=1 is a matrix algebra, its proof taking F[u] to be F[t]/(tⁿ−1); it should require the minimal polynomial of u to have degree n (Mat₂(D) with u=diag(1,−1), n=4, D a nonsplit quaternion algebra over a field containing μ₄, is a counterexample); affects a stated result.
- **Gap** in weibel at III, Example 6.2.3, printed p.233 (weibel line 13427–13431): the source says a nonidentity pairing value (ζ,x) gives a split surjection with inverse ζ^i↦{ζ^i,x}; it should choose x with (ζ,x) a primitive root, since for composite m a nonidentity value need not generate μ_m; affects the proof.
- **Misprint** in weibel at VI, Corollary 6.2(a), printed p.503 (weibel line 30647): the source says the size of S equals s minus one; it should say the unit rank s is the size of S minus one; affects a stated result.
- **Misprint** in soule at Proposition 2.2.3.3, printed p.49 (soule line 1530): the source says the denominator contains the factorial of one minus i; it should contain the factorial of i minus one, as in Proposition 2.2.2.3; affects nothing.
