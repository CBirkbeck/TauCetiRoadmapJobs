# Review of ClassicalGroupsPartII (pull request #1492 at 110ca61)

**Verdict:** needs changes

:robot: Independent AI review, full pass, at the same head as the previous review. Four findings: one P2 and three P3. The P2 is new. PELModuli, an open roadmap earlier in the merge order, already plans the GSp₂g group scheme (it is that roadmap's Siegel similitude group) and its connected reductivity. This README plans both again in CG.0.1–CG.0.2 and does not cite PELModuli. The previous review's P3 is not repaired: the head and the pull request's description are unchanged. The mathematics of every statement I tested holds; the computed witnesses are below.

## R01 (P2) — The GSp₂g coordinate Hopf algebra and its connected reductivity are already owned by PELModuli M0.7–M0.8

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:75` (“This roadmap owns the coordinate presentation of the symplectic-similitude subfunctor of Mathlib's `Matrix.GeneralLinearGroup` cut out by hJhᵀ=sJ.”). The same object is built in CG.0.1 (lines 345–387: Hopf algebra, points equivalence, multiplier uniqueness, s=1 fibre is Sp, rank one is GL₂) and CG.0.2 (lines 389–441: connected reductivity).

**Claim:** PELModuli is an open new-roadmap pull request (#966, head 697b514), and it comes before this roadmap in the merge order (line 112 against line 200). Its §M0.7 builds the similitude group of a PEL datum. That group is a closed subgroup scheme of GL(L)×G_m given by an explicit commutative Hopf algebra over ℤ, with a rational coordinate algebra and points over ℚ-algebras, a multiplier and multiplier uniqueness. M0.7 also identifies the multiplier-one subgroup with Tau Ceti's `Symplectic.groupScheme`, and its genus-one Check is GL₂=GSp₂. §M0.8 proves that GSp₂g is connected reductive with derived group Sp₂g. This roadmap's GSp₂g is that same group: every characteristic-zero field K is a ℚ-algebra, so O_g(K) is K⊗_ℚ of the Siegel coordinate algebra. The README never mentions PELModuli, so the object now has two owners.

**Witness:** `TauCetiRoadmap/PELModuli/README.md` at #966's head: line 155 constructs the group there; line 662 gives Gram matrix `−Matrix.J` (this README's J); line 743 says “For the Siegel datum `G = GSp_{2g}`”; lines 751 and 783 give GL₂=GSp₂ and connectedness.

**Exact repair:**
1. Add `### From TauCetiRoadmap.PELModuli` to the supplier contracts. Cite §M0.7 (the rational coordinate algebra and points of the Siegel datum `IntegralPELDatum.siegel`, the multiplier and its uniqueness, the multiplier-one comparison with `Symplectic.groupScheme`) and §M0.8 (Case C: connected reductive, derived group Sp₂g).
2. In CG.0.1, construct O_g(K) as K⊗_ℚ of that Siegel coordinate algebra. Keep the displayed presentation K[x_ab,D,s,s⁻¹]/(…) only as a comparison, together with its points equivalence over K-algebras.
3. In CG.0.2, cite §M0.8 for connected reductivity. Reductivity is a geometric property, so it carries over to K. Keep the central isogeny, the μ₂ kernel and the fppf lift.
4. Rewrite the sentence at line 75 accordingly.
5. Name PELModuli's pull request in the merge-order paragraph.

Tested on the instance that shows the overlap: at g=1, PELModuli's line 751 states this README's rank-one Check (s=det on GL₂). The two conventions agree on h=diag(2,3): hᵀ(−Matrix.J)h=6(−Matrix.J) and hJhᵀ=6J give the same multiplier, 6.

## R02 (P3) — The §3A citations resolve only at an open ClassicalGroups revision that the pull request does not name

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:34` (“Its Layer 3A owns the complex Sp₂g theory: the maximal torus and dominant weights (§3A.1), the group–Lie comparison (§3A.2), and in §3A.3 …”). The anchors are at lines 526, 849, 892 and 983 (`#3a1-…`, `#3a2-…`, `#3a3-…`), and §3A is also cited at lines 62, 286–301, 509, 821, 853, 863, 870 and 943.

**Claim:** ClassicalGroups on main (content 3b3f7ef) has Layers 0–6 and no Layer 3A. Its headings are at `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:237` (Layer 3) and `:272` (Layer 4). §§3A.1–3A.3 exist only at the head 3eb0c3a6 of the open ClassicalGroups revision #1192, at lines 658, 749 and 801 there. The pull request's description still says “In open pull requests of ours: none”. Its merge-order paragraph says “It depends on no other author's open pull request”.

**Witness:** The worker's overlap report lists all six ids under “Ids this README cites that only an open revision defines”, each resolving to #1192 and none to main. `grep -n 3A` on main's ClassicalGroups README returns nothing.

**Exact repair:** No README change is needed: at that head the citations are accurate and given by name and section. In the pull request's merge-order paragraph and description, name the ClassicalGroups revision (#1192) as a pull request that must merge first. Re-citing main's Layer 3 is not an alternative, because it does not state the commutator, the kernel's simplicity or the Cartan components. This is the previous review's R01, unchanged.

## R03 (P3) — CG.1.5 needs a later section, CG.1.6

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:876` (“The Hom comparison of CG.1.6 for ℂ/Q then gives End(P_k)=Q over Q”) and the *Needs:* line at 892 (“[Hom spaces and torus weights commute with field extension](#cg16-…) for the endomorphism comparison”). Step 2 at line 875 (“P_k over K is P_k over Q extended to K”) also uses CG.1.6's Hopf comparison O_g(K)≃K⊗_F O_g(F).

**Claim:** A target needs a later one. CG.1.6 itself needs only CG.0.1, CG.0.4 and CG.1.1, so there is no cycle, but the layer is not written in build order. Renumbering would break ClassicalGroups #1192's citations of “CG.1.4–CG.1.5” and “CG.1.7” at its lines 54–55 and 1895.

**Witness:** CG.1.6's *Needs:* at line 930 lists CG.0.1, CG.0.4, CG.1.1, Tau Ceti and ReductiveGroups Layer 1, and nothing from CG.1.4–CG.1.5. CG.1.5's *Needs:* at line 892 lists CG.1.6.

**Exact repair:**
1. Move the Hopf comparison O_g(K)≃K⊗_F O_g(F) into CG.0.1, where the presentation is built. Its proof is CG.1.6 step 1: quotients and localizations commute with scalar extension. After R01 it is just transitivity of base change.
2. In CG.1.5 step 3 and its *Needs:*, replace CG.1.6 with ReductiveGroups §10A, which covers invariants and scalar extension (Milne, Corollary 4.34, p.96). Apply it to End(P_k)=(P_k^∨⊗P_k)^GSp.
3. CG.1.6 keeps its Hom, weight and reflection statements and cites CG.0.1.

Tested at g=1, k=1 (P₁=V): (V^∨⊗V)^GSp has dimension 1 over ℚ, and Corollary 4.34 gives dimension 1 over ℂ. CG.1.6 is no longer needed.

## R04 (P3) — `MultLaurent`, `coeffT` and `coeffTInv` restate Mathlib's `LaurentPolynomial ℤ` and `T`

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean:106–112` (`abbrev MultLaurent := MonoidAlgebra ℤ (Multiplicative ℤ)`, `coeffT := MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1`). README lines 1207–1219 describe these names and give two Checks about them.

**Claim:** At the pin, Mathlib already defines ℤ[T;T⁻¹] as `LaurentPolynomial ℤ`, together with its monomials `T n`. These three declarations re-create that object under new names, outside the library's API (`T_add`, `isLocalization`, …). What exists at the pins should be cited, not restated.

**Witness:** At Mathlib 6b7abb3c, `Mathlib/Algebra/Polynomial/Laurent.lean:84` has `abbrev LaurentPolynomial (R) := AddMonoidAlgebra R ℤ`, and line 155 has `def T (n : ℤ) : R[T;T⁻¹] := .single n 1`.

**Exact repair:**
1. Delete the three declarations.
2. State `fullInvariantPresentation` over `MvPolynomial (Fin g) (LaurentPolynomial ℤ)` with `MvPolynomial.C (LaurentPolynomial.T 1)` ↦ `t g` and `MvPolynomial.C (LaurentPolynomial.T (-1))` ↦ `tInv g`.
3. Add `LaurentPolynomial` and `LaurentPolynomial.T` to the Mathlib contract.
4. Rewrite README lines 1207–1214, and drop the two Checks at 1218–1219, which would then test a library object.

Tested: this exact statement elaborates on a scratch copy of the file, with `sorry` as the only warning.

## Previous findings

- R01 (previous review), “The §3A citations resolve only at an open revision of ClassicalGroups, which the pull request does not name as a merge-before”: **not repaired**. The folder diff since the head it read is empty. The description still reads “In open pull requests of ours: none”, and the merge-order paragraph still reads “No open pull request of ours must merge before this one”. It is carried forward as R02. The supplier revision moved to head 3eb0c3a6. I re-read §3A there; every consumed statement is still present (table below).

## Verified sound

**Gate, order, build.** I re-ran the gate at this head. Every count was 0, `outside-folder=0`, `stray-files=0`, `dirty=0`, and it ended `OK`. The worker's gate also shows `build=0`. The dependency check printed

```text
depcheck: 244 roadmaps, 2460 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. ClassicalGroupsPartII is line 200 of the merge order. ReductiveGroups and ClassicalGroups are on main, and PELModuli (R01) is line 112. `lake env lean` on `TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exited 0 in 38 s with exactly three `sorry` warnings, at lines 116, 137 and 143. The file imports only `import Mathlib` and has no `set_option`, no sorry'd data and no `lemma`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean signatures and padding.** The worker's signature listing has the 24 elaborated types. Every declaration carries its binders explicitly (there is no `variable` block), so none can drop a hypothesis. I re-checked `Weight`, `Laurent`, `monomial`, `exteriorCharacter`, `fundamentalCharacter` and `invariantSubring` with `#check @…` in a scratch file, and they match the README's generality: all g for the full presentation, `0 < g` for the two positive statements. The one-tactic probe on a scratch copy failed on every headline. `simp` made no progress on `fullInvariantPresentation` or `positiveInvariantPresentation`. `simp [positiveSubring, coneValue]` left the closure/support equivalence open. `rfl` and `⟨inferInstance, _⟩` were rejected. None of the three is padding. The docstring correctly names the eight headlines that cannot be stated at the pins (no GSp coordinate Hopf algebra): `grep` for `Similitude|GSp` in pinned Tau Ceti and Mathlib returns nothing.

**Pinned declarations opened** (Tau Ceti a91d3aaf, Mathlib 6b7abb3c). Each was opened at the cited place, and its statement matches the README's use:

- `FGComoduleCat` (`Comodule/Finite/Basic.lean:96`), `instMonoidalCategory` (`Monoidal.lean:161`), `instBraidedCategory` (`Symmetric.lean:81`), `hasBinaryBiproducts` (`Product.lean:158`).
- `SplitK0` (`GrothendieckGroup/Split.lean:114`, requires `EssentiallySmall`), `liftRingHom`, `of_mul_of`, `mapRingHom` (`Monoidal/Basic.lean:263, 179, 324`).
- `DiagonalizableGroup.weightSpace` (`Weight.lean:83`), `Comodule.baseChange` (`BaseChange.lean:166`), `matrixCoefficientSubcoalgebra` (`Subcoalgebra.lean:53`), `Comodule.Hom.ker`/`ker_finite` (`Subcomodule/Comap.lean:238, 249`).
- `exteriorPower`/`exteriorPowerMap`/`baseChange_subtype_endOfPoint_ιMulti` (`ExteriorAlgebra/Power.lean:73, 110, 166`).
- `JFin`, `JFin_two_eq` (`Symplectic/Basic.lean:243, 263`: upper-right −I).
- `GLSymplecticFin.diagonal` (`Diagonal/Basic.lean:95`), the three Weyl elements (`Weyl.lean:79, 422, 428`), `repRing` (`RepresentationRing/Basic.lean:106`).
- `smoothCommHopfAlgProperty_of_charZero`/`HopfAlgebra.isReduced_of_charZero` (`Smooth/CharZero.lean:148, 166`), `isCompletelyReducible_of_isSimpleOrder` (`LinearlyReductive.lean:154`), `eq_augmentation_of_isNormal_of_smoothUnipotent_of_isFaithful` (`Unipotent/Radical/Faithful.lean:62–66, 94–100`).
- `char_extPowerRep_diagonal` (`ExteriorPower.lean:138`), and the two Lie classification theorems (`HighestWeight/Existence.lean:240`, `FiniteDimensional.lean:126`).
- Mathlib: `GeneralLinearGroup` (`Defs.lean:42`), `MonoidAlgebra.domCongr` (`Basic.lean:302`), `MvPolynomial.esymmAlgEquiv` (`FundamentalTheorem.lean:340`, any `CommRing R`, no denominators).

**Declared gaps.** The three slugs match `design/plan.json` and README lines 216, 236 and 258. Each has supplier ReductiveGroups. Each is minimal, because what it asks for is absent at the pins and on main:
- `Subcomodule` has only joins (`Subcomodule/Lattice.lean:57–149`), so there is no least subcomodule containing a vector.
- No `EssentiallySmall`, `Linear` or `MonoidalPreadditive` instance exists for `FGComoduleCat`. Only `homModule` on `ComoduleCat`, at `Cat.lean:109`, exists.
- ReductiveGroups Layer 3 on main (lines 234–247) states the fppf quotient but no representation descent.

**Cross-roadmap citations resolved.**
- ReductiveGroups on main: Layer 0 (129), Layer 1 (176), Layer 3 (234), Layer 6 (466, with central isogenies and the characteristic-zero equivalence of reductive and linearly reductive), Layer 7 (627), §7C (652), §10A “The rational category and actual torus lattice” (1733), §10B “Induction, Weyl modules and simple heads” (1759: classification by X⁺, absolute simplicity, End=k, base change).
- ClassicalGroups on main: Layers 0, 1, 2 and 4 at lines 175, 200, 216 and 272. Every anchor resolves.
- ClassicalGroups §3A at #1192's head, compared item by item:

| This README (line) | #1192 head 3eb0c3a6 | Agrees |
| --- | --- | --- |
| native `Matrix.J`=[[0,−I],[I,0]] on `(Fin g ⊕ Fin g)→ℂ` (286–287) | 623–626 | yes |
| torus diag(t,t⁻¹), dominant λ₁≥⋯≥λ_g≥0 (288–289, 509) | 666–671, 736–737 | yes |
| group-stable ⇔ Lie-stable, smooth connected, algebraically closed characteristic 0 (289–292) | 751–756 | yes |
| κ with (−1)^(a+b−1); L by the bivector of any basis with ω(a_i,b_j)=δ_ij; commutator (g−k)·id (292–296) | 806–816 | yes |
| surjective 1≤k≤g; kernel simple, highest weight ω_k, dimension binom(2g,k)−binom(2g,k−2) (296–299) | 816–820 (surjective for k≤r+1) | yes |
| Cartan component of the highest tensor; exhaustion (299–301) | 886–898 | yes |

**Sources: the seeded sample.** I read the “Construction and proof” blocks of CG.0.1, CG.0.3, CG.0.4, CG.0.5, CG.1.2, CG.1.4, CG.1.5, CG.1.6, CG.1.7, CG.2.4, CG.3.1 and CG.3.2. I read the “Consequences to check” blocks of CG.0.1, CG.1.5, CG.2.5, CG.3.4 and CG.3.6. I checked their locators in the cached texts, using printed page = PDF page − 11 for Milne:
- `yu line 3729–3770` is §7.1, (7.1.1) and Remark 7.1.1 on printed p.64. The GSp there uses J=[[0,I],[−I,0]] and the torus diag(z,t/z). The remark gives the representation ring R(GSp₂g) as polynomial in t^±1 and ∧^kV−t∧^(k−2)V, and the tensor-constituent subring. Yu credits Deligne at line 3744.
- `milne line 3740–3763` gives (24)–(25) on p.84. `milne line 3834` is Proposition 4.7 in §c on p.86; its proof is the coefficient span.
- `milne line 4245/4256/4281` give 4.32 and 4.34 on p.96 and Exercise 4-4(a,b) on p.97.
- `milne line 4370/4380` are §b, Lemma 5.9 and Proposition 5.10, on p.100. `milne line 4517` is Proposition 5.21 in §c (begins at line 4433), on p.104.
- `milne line 15761` is Theorem 17.93(a) on p.382 (perfect field, so G(k) is dense when k is infinite). `milne line 16482–16502` give 19.16–19.19 on p.401.
- `milne line 19149` is Summary 21.98 on p.461. `milne line 19287–19319` give the root order, Definition 22.1, Theorem 22.2 and 22.3–22.6 on pp.464–465. `milne line 19367` is 22.12 on p.466. `milne line 19813/19859` are 22.39 and 22.42 on pp.477–478.
- `sternberg line 5019–5058` (p.131: Cartan product; contraction surjective for j=2,…,n; kernels are the fundamental representations of C_n) and `sternberg line 5112–5149` (pp.132–133: second fundamental dimension (2n+1)(2n−2)/2 = binom(2n,2)−1).

Each source supports the statement as written. The descent to every characteristic-zero K and the ν-twist are the roadmap's own, as its text says.

**Adversarial table.** Machine-checked rows were computed by a pure-Python script (exterior algebra over ℚ, Laurent polynomials as exponent dictionaries). Every other row was computed by hand.

| Statement (line) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (Lean 116; README 1194) | g=0,1,2,4 | g=0: invariantSubring=⊤≅ℤ[t±1]≅MvPolynomial (Fin 0) ℤ[T±1], with T,T⁻¹↦t,t⁻¹. g=1: X↦z+t/z, z²+(t/z)²=x²−2t (machine). g=2: F₂=e₂(x)+t. g=4: F₄=e₄+t e₂+2t² (machine) | True in every rank, diagonal coefficient 1; retain (carrier per R04) |
| `mem_positiveSubring` (Lean 137; 1334) | g=1: 56 weights; g=2: 392 weights; g=0 | cone≥0 against “∃a,b≥0, Σb=m, a−b=u”: 0 mismatches (machine). At g=0, weight (1,()) has cone 1 but is not in B₀=ℤ | `0<g` is necessary and present; retain |
| support examples (1356–1374) | g=1: t⁻¹, −x, z⁻¹; g=2: z₁/z₂ | h=−1, 0, −1; z₁/z₂: h=0+1·0+(−1)=−1, so t⁻¹ would be needed | Exclusions correct; retain |
| `positiveInvariantPresentation` (Lean 143; 1382) | g=1, g=3, g=0 | g=1: T↦t, X↦x, z²+(t/z)²↦X²−2T, 1↦1. g=3: F₂=e₂+2t, F₃=e₃+t e₁, all t-powers ≥0 (machine). g=0: t∉B₀ | True for g≥1; retain |
| cone value is invariant under flips (1300, 1364) | 2000 random (g,m,u,i) | h(m,u)=h(m+u_i,u[i:=−u_i]) in all samples (machine); h(0,1)+h(0,−1)=−1<h(0,0)=0 | Superadditive, not additive; retain |
| E_k generating formula (1069, 1205) | g=1..4, every 0≤k≤2g | E_k=Σ_j binom(g−k+2j,j) t^j e_(k−2j)(x) for all (g,k) (machine) | Holds; retain |
| F_k triangular and augmentation (1071–1076, 1186) | g=2..4, 1≤k≤g | F-coefficients [1,1], [1,2], [1,1], [1,3], [1,2], [1,1,2]; augmentations 5, 14, 14, 27, 48, 42 = binom(2g,k)−binom(2g,k−2) | Diagonal 1, integral; retain |
| orbit recurrence (1053–1055, 1203) | g=1, n=0..5 | p₀=2, p₁=x, pₙ=xpₙ₋₁−tpₙ₋₂ equals zⁿ+(t/z)ⁿ (machine); the single zero orbit is 1 | No division by orbit size; retain |
| `exteriorCharacter`/`fundamentalCharacter` (Lean 96, 102) | k=−1,0,1 at g=0; g=1: E₂, E₃ | E₋₁=0, E₀=1, E₁=0 at g=0. At g=1, E₂=t and E₃=0. F₁=E₁−t·E₋₁=E₁ | No truncated subtraction; retain |
| `flipWeight`/`permWeight` (Lean 49, 57) | g=1: (−1,2); g=3: cycle (1 2 3) | (−1,2)→(1,−2)→(−1,2). With u∘σ⁻¹, z₁↦z₂; with u∘σ, z₁↦z₃ | Matches README 531–532, 583; retain |
| CG.0.1 rank one and multiplier (365–383) | h=[[a,b],[c,d]]; 2I; g=0; zero algebra | hJhᵀ=(ad−bc)J. 2I gives 4J. At g=0, s=1 and s=2 both work. Over the zero algebra both point sets are singletons | Uniqueness needs g≥1; retain (ownership per R01) |
| CG.0.1 s=1 fibre (380) | Tau Ceti `Symplectic/Basic.lean:80–88`, XJFinXᵀ−JFin | J=−JFin, so XJXᵀ−J=−(XJFinXᵀ−JFin): the same ideal | Correct; retain |
| CG.0.2 kernel and fppf lift (418, 428–430) | ca=I; diag(1,2) over ℚ; ℚ[ε]/ε² | a=c⁻¹I∈Sp forces c⁻²=1, so the kernel is (I,1),(−I,−1). The lift needs c²=2; ℚ[C]/(C²−2) supplies it. (1+ε/2)²=1+ε | Correct; retain (reductivity cited per R01) |
| CG.0.3 cover pullback (449–452) | z_i=cy_i, t/z_i=c/y_i | t=c², so t^m∏z^u ↦ c^(2m+Σu) y^u, i.e. (m,u)↦(u,2m+Σu). (u,d)=((1,0),0): d−Σu=−1 is odd, so not in the image | Injective with the parity image; retain |
| CG.0.3 coroots (458) | α_g^∨: z_g=λ, t=1; α_i^∨: z_i=λ, z_{i+1}=λ⁻¹ | Pairings u_g and u_i−u_{i+1}; ⟨α_g,α_g^∨⟩=2 on (−1,2δ_g); ⟨e_t,α^∨⟩=0 | Dom_g correct, m unrestricted; retain |
| CG.0.4 closed immersion and centralizer (508–509) | g arbitrary | x_ii↦z_i, x_{g+i,g+i}↦t/z_i, s^±↦t^±, D↦t^−g, z_i⁻¹=image of x_{g+i,g+i}s⁻¹. Weights e_i and e_t−e_j have m=0 and m=1, so all are distinct and the centralizer is diagonal | Surjective, maximal; retain |
| CG.0.6 parity (595–617) | (u,d)=((1),0), ((1),1), (0,2), (0,−2) | μ₂ acts by ε^(d+Σu): −1, +1, +1 (ν), +1 (ν⁻¹) | Correct; retain |
| CG.1.1 split ring (694) | g=1, V⊗V | (z+t/z)²=z²+2t+(t/z)²=ch Sym²+ch ν; dimensions 3+1=4 | Retain |
| CG.1.2 coaction and density (705, 766–767) | δ(e_b)=Σe_a⊗x_ab; g=1 big cell (2,3,5,7); 𝔽₄ point | (id⊗Δ)δ=(δ⊗id)δ=Σe_a⊗x_ac⊗x_cb, so it is a left action. The cell is [[5,15],[10,37]], det 35=rs. α²−α=1 and det=1 over 𝔽₄ | Correct; retain |
| CG.1.4 sign transport (807–844) | g=1: e₁∧f₁ | ω(e₁,f₁)=e₁ᵀJf₁=1, while native ω_J(e₁,f₁)=−1, so κ=−κ_J with the same kernel. hᵀJh=ν(h)J gives the ν-twist; at 2I, 4 | Correct; retain |
| CG.1.5 commutator (870–884) | g=1,2,3, every degree k | κ_(k+2)L_k−L_(k−2)κ_k=(g−k)·id on every basis wedge (machine) | Holds, including negative g−k; retain |
| CG.1.5 surjectivity and kernels (853–859, 887) | g=2: k=2..5; g=3: k=2..7 | g=3: ranks 1, 6, 15, 6, 1, 0 against target dimensions 1, 6, 15, 20, 15, 6, with kernels 14, 14, 0. g=2: κ₃ 4→4 rank 4. Surjective exactly for k≤g+1 (machine) | Range 1≤k≤g for P_k correct; retain |
| CG.1.5 characteristic-2 control (886) | g=2, κ₂(e₁∧f₁+e₂∧f₂) | Equals 2 (machine), which is 0 in 𝔽₂ | Characteristic-0 hypothesis used; retain |
| CG.1.5 Consequences (890) | k=1; g=2 | [P₁]=[Λ¹V]−[ν]·0=[V]; dim P₂=6−1=5 | Retain |
| CG.1.6 Hom and reflection (899–912, 923–926) | unit over ℚ⊂ℂ; Hom(V,ν) | dim_ℂ(ℂ⊗Hom_ℚ)=1=dim Hom_ℂ. Central degrees 1 and 2 force both to be 0. The det polynomial on Hom_F(M,N) is nonzero, so infinite F has an invertible F-point | Correct; retain |
| CG.1.7 Cartan model (934–967) | g=2, u=(3,1); g=1 Check 961 | a=(2,1); weight 2(1,0)+(1,1)=(3,1); degree 4. A module generated by v with a one-dimensional top weight space is indecomposable (v=v₁+v₂ forces v∈W₁), hence simple. e₁⊗e₁ spans a 3-dimensional space under GL₂ and SL₂; n+1 spans a line under Sp and a plane under GSp | Correct; retain |
| CG.1.8 rank one (999) | z=a, t=ab | t^m z^u=a^(m+u)b^m = highest weight of det^m Sym^u | Retain |
| CG.2.1/2.6 characters (1121–1122, 1272) | V and ν⁻¹ at diag(2,3); Sym²V | Characters 2+3=5 and 1/6 agree with the traces. ch Sym²V=x²−t (machine), inverse [V]²−[ν] | Retain |
| CG.3.4 occurrence (1444–1457) | g=1: V^⊗2, V^⊗3; (m,u,d)=(−1,2,0) | V^⊗2=L(0,2)⊕L(1,0) and V^⊗3=L(0,3)⊕2L(1,1), with d=2m+Σu in each case. (−1,2,0) has d=2m+Σu=0, but every weight of V^⊗d has m≥0, so it does not occur | Exact criterion correct; retain |
| CG.3.5/3.6 Consequences (1486, 1509) | g=1, [Sym²V]; rank one | z²+t+(t/z)² has cone values 0, 1, 0. R=ℤ[ν±1,V] and C=ℤ[ν,V]; [P₁]=[V] | Retain |
| §3A transport (302–306, 870) | g=1, native form | Ω_J=f₁∧e₁=−Ω; ω_J(e₁,−f₁)=1. Negating κ and L leaves κL−Lκ unchanged; negating only κ gives −1 | Correct; retain |
| R01 convention match | h=diag(2,3), g=1 | PELModuli: hᵀ(−Matrix.J)h=6(−Matrix.J). Here: hJhᵀ=6J. Same group and the same multiplier | Overlap confirmed (R01) |
| R03 order | *Needs:* graph of Layer CG.1 | Every edge goes from a later section to an earlier one, except CG.1.5→CG.1.6 | Repair per R03 |
| R04 carrier | `LaurentPolynomial ℤ`, `T 1`, `T (-1)` | `T 1 * T (-1) = T 0 = 1` (`T_add`, `T_zero`); the restated headline elaborates | Repair per R04 |

**Ownership and duplication.** I searched by object with `roadmaps grep` over main and the 477 open heads, and read the sibling checkouts of ClassicalGroups #1192 and ReductiveGroups #1676/#1332:
- The GSp group scheme is owned by PELModuli (R01). ShimuraVarieties §P.4 has the Siegel Shimura datum but no coordinate algebra. No ReductiveGroups revision mentions GSp.
- Yu's ring (the integral presentation and the support cone) has no other owner. Other roadmaps cite Yu only for §7.2 or Appendix C (ClassicalArithmeticCompletion, WeilConjectures).
- The one-variable coefficient ring is Mathlib's (R04).
- The overlap report finds no other pull request changing this roadmap, no dropped id, and the six revision-only ids (R02). The citation resolver found nothing unresolved.

## Not verifiable

- None of the three cited texts was inaccessible; no fetch or manifest change was needed.
- PELModuli was read at its open head 697b514 through the roadmap index (`roadmaps show/grep`), not from a sibling checkout. The pull request's description was judged as the worker quoted it, not from the live page.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source says the contraction-kernel dimension subtracts binom(2n,2j−2); it should be binom(2n,j−2), the dimension of the target; affects a stated result.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the source says the second difference-factor product has numerator j; it should be j−1, which gives the displayed telescoping product; affects the proof.
- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5025`): the source names the second highest weight σ; it should be µ, as in the following sum and highest vector; affects nothing.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5106`): the source says r_i=a+n−i; it should be r_i=a_i+n−i; affects nothing.
- **Misprint** in milne at Chapter 4 §i, Exercise 4-4(b), printed p.97 (`milne line 4286`): the source repeats the word “if”; it should appear once; affects nothing.
