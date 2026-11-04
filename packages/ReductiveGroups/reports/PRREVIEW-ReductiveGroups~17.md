# Review of ReductiveGroups (pull request #1676 at 72e4141)

**Verdict:** needs changes

This head is the one the previous review read, so no finding of that review is repaired by a change. The disposition of each is in **Verified sound**; two of them (duplicate ownership of rational cohomology and of the classical topology) are dropped there, because their stated repair produces an UPWARD line in the dependency check.

## R01 (P2) — The companion files admit data, import roadmap modules and name unavailable declarations

**Location:** `TauCetiRoadmap/ReductiveGroups/SpecialLinearCoordinateTargets.lean:16`, "noncomputable def coordinatePresentation (n : ℕ) : … := by sorry"; also `SignedADETargets.lean:143`, `:221`; `FoldingADETargets.lean:248`, `:269`; `SpectralWeylTargets.lean:63`, `:77`, `:81`, `:118`; `CoverLiftTargets.lean:1`, `:30`, `:38`.

**Claim:** The Lean form rules apply to all nine listed files. Eight companions remain construction catalogues with admitted data (`def`/`abbrev` whose body is `sorry`), individual `Mathlib.*` imports and imports of roadmap modules; `CoverLiftTargets.lean` refers to `CoverLifts.LiftGroup` and `CoverLifts.projection`, which its imports do not provide. The new file `SpecialLinearCoordinateTargets.lean` is this pull request's own addition: it admits the equivalence `coordinatePresentation`, has no `import Mathlib`, duplicates `determinantRelation` of `Suggested.lean`, and carries four bare `#check` lines. The README no longer mentions any companion (main's references to `IntegralRationalTargets.lean`, `SignedADETargets.lean`, `OrbitGeometryTargets.lean` and `BruhatCoordinateTargets.lean` were deleted), so they are orphaned files in the folder.

**Witness:** `git diff --quiet origin/main -- <file>` is clean for seven companions; `SpecialLinearCoordinateTargets.lean` exists only on this branch. Admitted bodies: `rootLineQuotientEquiv` (SignedADE 143), `normalizationEquiv` (221), `rationalLieEquiv` (FoldingADE 269), `simpleRoot` (248, admitted proof field), `centerHomeomorph` (SpectralWeyl 63), `planeBraidEquiv` (77), `matrixSpectrum` (118).

**Repair:** Delete the eight companion files; the README keeps every specification and Check. `Suggested.lean` already states the only companion endpoint that is statable (`exists_coordinatePresentation`, with n=0,1,2 giving ℤ, ℤ[x]/(x−1), ℤ[a,b,c,d]/(ad−bc−1)); relocate no admitted data. At minimum the new file is inside this pull request's edit set and must go.

Re-raised: H01. The repair report's reason ("deleting the companions is outside the explicit README/Suggested edit allowance") fails: this brief names all nine `.lean` files as reviewed and the stray-file repair is deletion; the new companion is the pull request's own file; and the sibling pull request on this same folder (#1332) performed exactly this deletion at its commit f80fc350 after the finding had been raised three times.

## R02 (P2) — Layer 6A's Levi-complement theorem is statable at the pins but absent from Suggested.lean

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1155–1167`, "A Levi complement is a closed k-subgroup L⊂G for which q|L:L→Q is a group-scheme isomorphism. Construct such L"; `Suggested.lean:25–62` (the module docstring names neither Layer 6A nor its carrier).

**Claim:** Every carrier of the Layer 6A end theorem exists at the pin: the k-unipotent radical ideal `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal` (Unipotent/Radical/Construction.lean:72), the right-coinvariant subalgebra `TauCeti.HopfIdeal.coinvariants` (HopfIdeal/Coinvariants/Basic.lean:92), Hopf-ideal quotients, `Algebra.Smooth` and `geometricallyConnectedCommHopfAlgProperty`. Over a field the coinvariants of a normal Hopf ideal are the coordinate ring of the quotient (the Layer 3 target, Milne Theorem 5.14), so "q|L is an isomorphism" is exactly bijectivity of coinvariants(I_u) → H → H/J.

**Witness:** The statement below elaborated with `lake env lean` at the pins with only its `sorry` warning (scratch file `LeviProbe.lean`, exit 0):

```lean
theorem exists_levi_complement {k : Type v} [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    ∃ J : TauCeti.HopfIdeal k H,
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal H).coinvariants.val) := by
  sorry
```

Instances: G=𝔾_a⋊𝔾_m has I_u = ideal of the 𝔾_a factor, coinvariants k[t,t⁻¹], and J the ideal of 𝔾_a gives the identity k[t,t⁻¹]→k[t,t⁻¹]; G=𝔾_a has coinvariants k and J the augmentation ideal, composite k→k; G=SL₂ has I_u the augmentation ideal, coinvariants all of O(SL₂), J=0. Over 𝔽_p the statement is false for the Witt-vector extension of 𝔾_a by 𝔾_a, which the `CharZero` hypothesis excludes.

**Repair:** State this theorem under a `/-! ## Layer 6A -/` section in `Suggested.lean` (docstring: Mostow's theorem, McNinch §§4.3–4.5), name it in README §6A, and keep the hypotheses above: characteristic zero, smooth, geometrically connected.

## R03 (P3) — The Kummer exact sequences need n ≥ 1

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:997–998`, "the exact sequence `0 → ℤ → ℤ → ℤ/n → 0` (multiplication by `n`) corresponds to `1 → μ_n → 𝔾_m → 𝔾_m → 1` with `t ↦ tⁿ`".

**Claim:** Neither this Check nor the Conventions restrict n. At n=0 both displayed sequences fail, although `D(ℤ/0)=𝔾_m` is still correct.

**Witness:** n=0: ker(ℤ →0 ℤ)=ℤ ≠ im(0→ℤ)=0; t↦t⁰ has image {1}, and 2∈𝔾_m(ℚ) has no preimage after any field extension. n=1: both middle maps are identities, kernels 0 and 1. n=2: multiplication by 2 is injective with cokernel ℤ/2; squaring has kernel μ₂ of length 2 and is fppf-surjective, including characteristic 2.

**Repair:** Write "for n ≥ 1" before the two exact sequences and keep `D(ℤ/0)=𝔾_m` as the separate degenerate case. The previous review rated this P2; it is a Check bullet, so P3 here. Unrepaired since that review.

## R04 (P3) — One-tactic padding in the companions

**Location:** `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:85` (`continuous_forgetOrder`), `FoldingADETargets.lean:329` (`fixedCartan_eq_kernel`), `BruhatCoordinateTargets.lean:119` (`coveringHomeomorph_apply`).

**Witness:** In a scratch file at the pins, `exact continuous_quotient_mk'` and `exact LinearMap.fixedSubmodule_eq_ker _` closed the first two statements without warnings (`SignatureCheck.lean`, exit 0); the third is proved by `rfl` in its own file. Values: −id on ℤ has fixed submodule 0 = ker(−2); on ℤ/2 both are the whole module; the identity covering evaluates e ↦ e.

**Repair:** Delete them (R01's deletion covers this). Re-raised: H08, for the same reason as R01.

## R05 (P3) — The module docstring does not name the finite-group and Steinberg endpoints it omits

**Location:** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:25–62`.

**Claim:** The docstring lists missing carriers for Layers 0–1, 3, 4–5, 6B, 7, 9, 10 and 11, but not for Layer 7c–7f (Harish–Chandra biadjunction, Mackey decomposition, common-Levi independence, the Gassmann application) nor Layer 9E (Lang–Steinberg for a Steinberg endomorphism). For 7c–7f the missing carrier is the parabolic subgroup (a closed subgroup with complete quotient) of a finite-field form; for 9E it is the 𝔽_{q′}-structure whose Frobenius is a power of the endomorphism.

**Repair:** Add one sentence per omitted endpoint naming the missing carrier, as the docstring already does for the other layers.

## R06 (P3) — Three objects now have a second owner in a later roadmap; the resolution lies outside this folder

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:15–16`, "Layer 7a owns Lang's theorem"; `:3648–3649`, "ReductiveGroupsPartII … consumes … Layer 7a's Lang theorem"; `:3655–3658`, "outputs for IntegralHeckeAndGaloisDeterminants §0.7 … outputs for ComplexComparisonPartII C-1.1".

**Claim:** (a) `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201–5215` on main states Lang's theorem as its own target *lang-theorem* with Lean name `Lang.lang_surjective` (its `Suggested.lean:212` declares it) and calls RG2.3 "the single owner in Tau Ceti of Lang's theorem"; AdelicAlgebraicGroups, NeronModelsAndSemistableAbelianVarieties and FiniteFlatGroupsAndIntegralPadicHodgeTheory cite RG2.3.7 for it. (b) IntegralHeckeAndGaloisDeterminants at its open head (README line 77) says "its layers 6A and 10B consume the generic cohomology and induction constructed here", the reverse of this README's line 3655. (c) ComplexComparisonPartII C-1.1 (its README 724–803) constructs the same classical topology, gluing and smooth charts as §3A.5.

**Witness:** This roadmap cannot consume either open roadmap: appending `*Needs:* IntegralHeckeAndGaloisDeterminants §0.7.` to a scratch copy of the README gives `UPWARD: ReductiveGroups (on main) -> IntegralHeckeAndGaloisDeterminants (#22)`, and `*Needs:* ComplexComparisonPartII §C-1.1.` gives `UPWARD: ReductiveGroups (on main) -> ComplexComparisonPartII (#38)`; main's own citations of these two (main README lines 222 and 342, written without a space before the section number) are not parsed by the check. ReductiveGroupsPartII consumes ReductiveGroups Layers 0–9, so Lang cannot be consumed from it either.

**Repair:** Nothing in this folder can remove the second owners; the later roadmaps must re-point (RG2.3.7, IHGD §0.7, CCPII C-1.1 become consumers of 7a, §1.1 and §3A.5). This needs a human or intake decision, recorded here so the contradiction between the four READMEs is not read as supplier drift in this one. In this README, state in Scope and ownership, in one clause each, that the three later sections state the same objects and are consumers.

## Verified sound

**Disposition of the previous review's findings.** The head is unchanged (`changes.md`: 0 changed lines), so nothing was repaired by an edit.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01, companion form | `SpecialLinearCoordinateTargets.lean:16–20` still "noncomputable def coordinatePresentation … := by sorry"; seven companions byte-identical to main | Not repaired; R01 (re-raised). |
| R02, duplicate rational cohomology | README 439–541 constructs it; 3655 "outputs for IntegralHeckeAndGaloisDeterminants §0.7" | Not repairable as stated: the proposed supplier contract produces the UPWARD line quoted in R06. Dropped as a finding against this roadmap; the two-owner state is R06(b). |
| R03, duplicate classical topology | README 790–835; 3656–3658 "outputs for ComplexComparisonPartII C-1.1" | Same: UPWARD line quoted in R06. Dropped; R06(c). |
| R04, Kummer at n=0 | README 997–998 unchanged | Not repaired; R03 here, re-rated P3 (a Check). |
| R05, padding | The three declarations unchanged | Not repaired; R04 (re-raised H08). |

The repair reply the author posted at this head marks H01 and H08 "answered" (edit allowance) and H02/H03 "applied differently" (ownership moved down to avoid the upward edge). The second reason is right, as the dependency check shows; the first is not, for the reasons in R01.

**Scope, gate and build.** Checked head 72e414118fa7940f8ae0d3b0e1dcdc30ef8f2a65. All ten listed files read. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty; the folder diff touches README.md (+2432 lines), Suggested.lean and the new SpecialLinearCoordinateTargets.lean only. Worktree clean. The worker's gate reports every check zero, including build, stray-files and depcheck. I reran `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` from the worktree: exit 0, exactly the **11 `sorry` warnings** (lines 106, 115, 126, 135, 145, 166, 178, 191, 213, 261, 267), nothing else. Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lake-manifest.json lines 8, 18).

Dependency check on the README as submitted:

```text
depcheck: 203 roadmaps, 1656 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The two probe runs with an added supplier line (R06) each printed one UPWARD line and `1 problem(s)`; main's README gives `203 roadmaps, 1648 edges, 0 problem(s)`.

**Elaborated signatures.** `#check @name` for all 24 declarations of `Suggested.lean` in a scratch file importing the built module (`SignatureCheck.lean`, exit 0). Each elaborated type matches its README statement: the five orbit headlines carry `IsAlgClosed k`, `IsAffine G.left`, `Smooth G.hom`, `QuasiCompact G.hom`, `LocallyOfFiniteType X.hom`, `QuasiCompact X.hom`, `IsSeparated X.hom`, a rational point `x`, and `exists_closed_orbit` carries `Nonempty (Points X)`; `linearlyReductive_of_reductive` carries `CharZero k`; the Borel headline quantifies over `I J : HopfIdeal k H` with both `IsBorelOverAlgClosed` hypotheses and concludes `∃ g, J = I.conjugate g`; `lang_surjective` carries `[Finite k]`, `Algebra.Smooth k H`, geometric connectedness, `[IsAlgClosed K]`, `F : K →ₐ[k] K` and `∀ a, F a = a ^ Nat.card k`; `exists_coordinatePresentation` is for every n; `permutation_nonsplit` has `2 ≤ n`; `plane_braid` is for every n. No binder was lost; no change needed.

**Padding probe.** A copy of `Suggested.lean` with each `sorry` replaced by `first | rfl | simp | infer_instance | sorry` (`Probe.lean`): no headline closed; `simp` only rewrote the goals of the Lang, SL and nonsplitting statements without closing them, and the other eight fell through to `sorry`. The two companion lemmas in R04 closed with one library lemma each.

**Seeded source sample.** Texts read from the sources cache: Jantzen, *Representations of Algebraic Groups I*, MPI preprint 1985 (`jantzen`), and Conrad, *Reductive Group Schemes* (`conrad`). No manifest edited (three fetches for later locators created a board manifest, deleted again at once).

| Target | Locator checked | Lines | Result |
|---|---|---|---|
| 1.1 action/comodule dictionary | Jantzen §2.8, printed pp. 36–39 | `jantzen` 1100–1136 | The comodule map is evaluation at the universal point `id_{k[G]}`; formula (1) recovers the action of every `g ∈ G(A)` on `M ⊗ A`; the two categories are equivalent for arbitrary `k`-modules `M`. Supports the target as written. |
| 1.1 enough injectives | Jantzen §3.9, printed p. 60 | `jantzen` 1688–1707 | Flat subgroup scheme, `M ↪ I` injective `k`-module, `I ⊗ k[G]` injective; no hypothesis on `M`. Supports the target. |
| 1.1 derived invariants and Hochschild complex | Jantzen §§4.2, 4.7(a), 4.14–4.16, printed pp. 69–70, 72–73, 77–79a | `jantzen` 1923–1941, 2001–2021, 2102–2156 | Rational cohomology as derived fixed points over a flat group scheme; `C^n = M ⊗ k[G]^{⊗n}`; `H^n(G, N ⊗ k[G]) = N` in degree 0 and 0 above; Proposition 4.16 identifies the complex's cohomology. Supports the target. |
| 1.1 induction and reciprocity | Jantzen §§3.3–3.7, printed pp. 53–57 | `jantzen` 1507–1645 | `ind_H^G M = (M ⊗ k[G])^H`, functions with `f(gh) = h⁻¹f(g)` and left translation; Frobenius reciprocity via `ε_M`; transitivity; tensor identity. The README's equalizer for an arbitrary Hopf map is its own generalisation and says so. Supports the subgroup form. |
| 8.1 split data | Conrad Definition 5.1.1, printed p. 136 | `conrad` 5651–5668 | Non-empty base, `T ≃ D_S(M)`, roots and coroots constant sections, root spaces free of rank one; disconnected bases allowed. Matches §8.1, including the "both lattices" clause. |
| 8.2 pinnings | Conrad Definition 6.1.1 and Remark 6.1.2, printed pp. 186–187 | `conrad` 7725–7751 | Positive system plus trivialising sections `X_a` of the simple root lines; on a disconnected base a Borel containing `T` need not come from a constant `Φ⁺`. Matches §8.2 and its fourth Check. |

Further locators opened this round (all agree with the README's theorem numbers and pages): Milne 2017 Props 1.21, 1.34, 1.65–1.66, Def 3.10, Props 3.11, 3.15, 4.7, Thm 4.9, Cor 4.10, Thm 4.14, Thms 5.14, 5.34 (monomorphism ⇔ closed immersion, p. 107), Props 5.18, 5.58, Thms 9.17–9.18, 12.8–12.9, 12.12, 12.23, Def 12.52, Prop 12.54, Rem 12.56, Prop 14.3, Thm 14.5, Prop 14.21, Thms 16.30, 16.33, Def 17.6, Thm 17.9(b) (conjugacy by a rational point, p. 354), Thm 17.10, Def 17.15, Thm 17.16, Cor 17.62(b)–(c) (radical = largest central subtorus, commutes with field extension, p. 372), Rem 17.94, Def 17.95, Thm 17.96, Cor 17.97 (p. 383), Props 19.9, 19.11, Thms 21.11, 21.37, 21.45, 22.2, 22.4–22.5, Prop 22.27, Thm 22.42 (characteristic zero, p. 477), Cor 22.43, Thm 22.48, Thms 23.25, 23.58, 23.74; Conrad Thms 3.3.4 (p. 98), 4.1.7 (p. 112), 5.1.13 (p. 143), 6.1.16 (p. 196), 6.1.17 (p. 197), Def 3.1.1 (p. 81, any scheme); Conrad–Feng Prop 12.3.1 (p. 127), Def H.1.1 (p. 238); Dudas–Michel Prop 7.5, Lemma 7.6 (p. 25: (i) is the coset bijection for connected `A`, (ii) needs normality), Prop 8.7 (p. 31), Prop 8.9 (p. 32), Def 9.2 (p. 35), Prop 9.4 (p. 36), Thm 9.6 (p. 37), Lemmas 9.9–9.11 (pp. 38–39), Thm 10.1 (p. 41); SGA 1 XII Prop 3.1 (viii) = séparé and (iii)–(iv) = étale, lisse (p. 244), Prop 3.2 (v) = propre (p. 245); Frenkel–Kac §2.3, (2.3)–(2.6) and Prop 2.2 (pp. 40–41, GDZ scan read by OCR; its bracket uses `ε(γ,β)`, the transpose the README names); Gros–Kaneda (2.1), p. 6; Birman–Brendle p. 69 (Fox–Neuwirth cell structure and asphericity); Riche §2.9.1, p. 50 and Remark 1.23, p. 27.

**Headline inventory.** End theorems named by the README: the three-way dictionary and comodule/Tannakian transport; locally closed reduced orbits, strict boundary dimension, closed orbits; homogeneous-quotient representability and Matsushima; Jordan, tori, unipotent structure; characteristic-zero linear reductivity and Levi complements; Borel conjugacy, root data, parabolics, Bruhat coordinates; Lang, Lang–Steinberg, Harish–Chandra functors, Mackey, common-Levi independence and Gassmann; pinnings, Chevalley–Demazure existence and classification; integral PBW and distributions; signed ADE covers and folding; pseudo-reductive examples; highest weights, Steinberg module, contraction, Peter–Weyl; SL coordinates; plane braids, Weyl arrangements, spectral monodromy. `Suggested.lean` states the five orbit headlines, linear reductivity, Borel conjugacy, Lang, SL coordinates, plane braids and nonsplitting. The absent statable one is R02; the unnamed unstatable ones are R05.

**Adversarial calculations.** One row per statement; each row records the values computed on both sides. A passing instance is evidence about that instance only.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0: convolution is the group law | 𝔾_a, f(t)=a, g(t)=b | (f∗g)(t)=a+b from Δt=t⊗1+1⊗t; pointwise product gives ab | Pass |
| 0: points need not commute | GL₂(ℤ), [[1,1],[0,1]], [[1,0],[1,1]] | Products [[2,1],[1,1]] and [[1,1],[1,2]] | Pass |
| 0: fppf quotient is not pointwise | 𝔾_m/μ₂ over ℚ, class of 2 | No rational square root; (√2)²=2 over ℚ(√2) | Pass |
| 1: faithfulness needs the antipode term | 𝔾_m standard character | t generates k[t]; with t⁻¹ it generates k[t,t⁻¹] | Pass |
| 1: μ_p is faithful on GL₁ | characteristic p | t⁻¹=t^(p−1) since t^p=1; μ_p(k̄)={1} | Pass |
| 1: S₃ two-dimensional rep faithful | ℂ; characteristic 3; characteristic 2 | V⊗V=1⊕sign⊕V, 4 coefficients span 6-dim k[S₃]; (1,1,1) has coordinate sum 3=0 in char 3 and lies in the augmentation plane; sign trivial in char 2 | Pass |
| 1.1: invariants as equalizer | ℤ[t,t⁻¹], weights 0 and 1 | ker(ρ−id⊗1)=ℤ for weight 0, 0 for weight 1 | Pass |
| 1.1: d⁰ and d¹ on the weight-one line | 1 ↦ 1⊗t | d⁰(1)=1⊗(t−1); d¹(t−1)=t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0 | Pass |
| 1.1: trivial group complex | H=ℤ, n+2 identity cofaces | d⁰=0, d¹=id, d²=0 (alternating sums of 2, 3, 4 identities) | Pass |
| 1.1: nonflat coefficients | M=ℤ/2 | H⁰=ℤ/2, H¹=ker(id)=0, H²=ker 0/im id=0 | Pass |
| 1.1: cofree ≠ injective | cofree ℤ | 2ℤ→ℤ, 2↦1, needs f(1)=1/2 | Pass |
| 1.1: cotensor induction ranks | 1⊂C₂; C₂⊂S₃ | ranks 2 and 3 = indices | Pass |
| 1.1: nonsurjective Hopf map | ℤ→ℤ[t,t⁻¹] | induction = invariants: weight-one 0, trivial ℤ | Pass |
| 1.1: Ind_B^{SL₂} k | ℙ¹ | regular functions on ℙ¹ = k | Pass |
| 1.1: Jantzen's convention | functions f(gh)=h⁻¹f(g) vs README F(hg)=hF(g) | antipode g↦g⁻¹ intertwines; evaluation at 1 fixed | Pass (source read) |
| 2: bracket and adjoint conventions | GL₂ | [E₁₂,E₂₁]=diag(1,−1); Ad(diag(t,1))E₁₂=tE₁₂ | Pass |
| 2: tangent of nonsmooth groups | μ_p, Frobenius of 𝔾_a, SL₂ in char 2 | dim μ_p=0 but tangent 1 ((1+ε)^p=1); dFrob=0; tr I=2=0 | Pass |
| 3: Hopf ideal of μ_n | (tⁿ−1) | Δ(tⁿ−1)=(tⁿ−1)⊗tⁿ+1⊗(tⁿ−1); ε=0; S=−t⁻ⁿ(tⁿ−1); ε(t−2)=−1 | Pass |
| 3: Borel ideal not Ad-stable | GL₂, swap matrix | upper Borel ↦ lower Borel; (det−1) stable | Pass |
| 3: components of μ₃/ℚ | t=1 and t²+t+1=0 | 2 components, 3 geometric points | Pass |
| 3: monomorphism ⇔ closed immersion | Milne 5.34 | statement read at `milne` 4643–4644 | Pass |
| 3A: 𝔾_m on ℙ¹ | x=[1:1] | orbit ℙ¹∖{0,∞}, dim 1; boundary 2 points, dim 0 | Pass; headline instance |
| 3A: trivial action on dual numbers | Spec k[ε]/ε² | reduced model Spec k, length 1 vs 2; empty boundary ⊥<0 | Pass |
| 3A: disconnected group | constant S₃ on itself | 6 points, dim 0, boundary ⊥ | Pass |
| 3A: empty X | no rational point | `Nonempty (Points X)` fails; no conclusion asserted | Pass |
| 3A: 𝔾_a on 𝔸² | (x,y)↦(x+ay,y) | closed orbits of dimensions 1 (y≠0) and 0 (y=0) coexist | Pass |
| 3A: GL₂ on 𝔸² | x≠0 | boundary {0}, 0<2; ℙ¹ transitive; r: V≅H⁰(O(1)) | Pass |
| 3A.5: separatedness | doubled line | two origins share every punctured neighbourhood | Pass |
| 3A.5: properness | ℙ¹(ℂ) vs 𝔸¹(ℂ) | compact vs the escaping sequence 1,2,3,… | Pass |
| 3A.5: étale vs non-étale point | z↦z² | derivative 2 at 1, 0 at 0 | Pass |
| 3A.5: SGA1 locators | XII 3.1(viii), 3.2(v), 3.1(iii)–(iv) | séparé, propre, étale/lisse | Pass (source read) |
| 4: Jordan decomposition | [[2,1],[0,2]] over ℚ; 𝔽₂(a) | s=2I, u=[[1,1/2],[0,1]]; det 0 in char 2; x²−a=(x−√a)² needs √a | Pass |
| 4: Kummer at n=0,1,2 | multiplication by n | n=0 not exact (ker=ℤ); n=1 identities; n=2 cokernel ℤ/2, kernel μ₂ | n=0 fails: R03 |
| 4: pairing of characters and cocharacters | t↦tᵃ, t↦tᵇ | composite t↦t^(ab); sign flip gives −ab | Pass |
| 4: nonsplit torus | x²+y²=1 over ℝ | X*=ℤ with conjugation −1 | Pass |
| 5: unipotence by comodules | μ_p, α_p | k_t has no fixed vector although μ_p(k̄)={1}; α_p unipotent nonsmooth | Pass |
| 5: character test one-way | SL₂, diag(2,1/2)−I | invertible, so not unipotent; no nontrivial characters | Pass |
| 5: Lie–Kolchin hypotheses | S₃/ℂ; SO₂/ℝ | irreducible 2-dim rep; rotation by 90° has no real eigenline | Pass |
| 5: radical ideals | 𝔾_a, SL₂ | ideal 0 (radical 𝔾_a); augmentation ideal (radical 1) | Pass |
| 5P: exponential denominators | X=E₁₂+E₂₃ | X²=E₁₃, exp X=I+X+E₁₃/2; fails over 𝔽₂ | Pass |
| 6: SL_p in char p | centre | Z=μ_p=Z°, ring k[ε]/(ε^p), reduced neutral part 1; R(SL_p)=1 | Pass |
| 6: SL₂ not linearly reductive in char p | R_p | submodule ⟨x^p,y^p⟩ without complement | Pass |
| 6: ℤ/p in char p | regular representation | k[x]/(x^p−1)=k[u]/(u^p) indecomposable | Pass |
| 6A: 1-cocycles of 𝔾_m on weight-one 𝔾_a | a(ts)=a(t)+ta(s) | coefficients force a_n=0 for n∉{0,1}, a_0=−a_1, so a(t)=c(t−1)=coboundary of c | Pass |
| 6A: Levi complement existence | 𝔾_a⋊𝔾_m, 𝔾_a, SL₂; Witt extension over 𝔽_p | coinvariants k[t,t⁻¹], k, O(SL₂); composite bijective for J as in R02; char p counterexample excluded | Statable: R02 |
| 6A: nonunique conjugators | L×𝔾_a | every u centralizes L; U(k)/C_U(L)(k) has one element | Pass |
| 6B: 𝔾_m/μ₂ | ℂ[t,t⁻¹]^{±1} | =ℂ[t²,t⁻²], quotient 𝔾_m via t² | Pass |
| 6B: GL₂/O₂ invariant | g=diag(2,1), h=swap | ggᵀ=(gh)(gh)ᵀ=diag(4,1); gᵀg=diag(4,1), (gh)ᵀ(gh)=diag(1,4) | Pass |
| 6B: SL₂/N⁺ | invariants k[a,c] | quotient 𝔸²∖{0}, not Spec k[a,c] | Pass |
| 7: Borel conjugacy | w=[[0,1],[−1,0]] | w[[a,b],[0,d]]w⁻¹=[[d,0],[−b,a]] | Pass; headline instance |
| 7: Borel headline for nonsmooth or disconnected G | G_red°, constant S₃ | Borels of G are those of G_red°; conjugate by G_red°(k)⊂G(k); S₃ has one Borel | Pass |
| 7: root data of SL₂ and PGL₂ | T=diag(t,t⁻¹) | α=2e, α∨ primitive; PGL₂: α primitive, α∨=2y; same A₁ | Pass |
| 7: GL₃ cells and parabolics | W=S₃ | 6 cells, 4 standard parabolics | Pass |
| 7C: rank-one identity | a=b=1 | x_α(1)x_{−α}(1)=[[2,1],[1,1]]=[[1,0],[1/2,1]]·[[2,1],[0,1/2]] | Pass |
| 7C: Weyl representative | n_α(1) | [[1,1],[0,1]][[1,0],[−1,1]][[1,1],[0,1]]=[[0,1],[−1,0]] | Pass |
| 7C: A_w, I_w in A₂ | w=s₁ | A={α₂,α₁+α₂}, I={α₁}; A_{w₀s₁}={α₂} overlaps; A_{s₁w₀}={α₁}=I_w | Pass |
| 7C: non-normal H_w | w=s₁s₂ | A_w={α₂}; [x_{α₁},x_{α₂}] has an x_{α₁+α₂} term | Pass |
| 7a: Lang values | 𝔾_a/𝔽₂, θ²+θ+1=0; 𝔾_m; SL₂ | θ²−θ=1; θ⁻¹θ²=θ, θθ⁻²=θ²; u(θ)⁻¹F(u(θ))=u(1) | Pass; headline instance |
| 7a: q=3 | η²=−1 in 𝔽₉ | η³−η=−2η=η | Pass |
| 7a: disconnected control | constant C₂ | F=id, Lang image {1} | Pass |
| 7a: Lang over non-algebraic K | T^q−T−a | degree q≥2 has a root for transcendental a | Pass |
| 7a: coset lifting needs the hypothesis | J={±1}, q odd, a^(q−1)=−1 | Lang map of J is x^(q−1)=1, misses −1; coset {a,−a} σ-stable with no fixed point | Pass |
| 7a: SL₂(𝔽_q) counts | B⁺ | q(q²−1), q(q−1), q+1 | Pass |
| 7a: two owners | RGPartII RG2.3.7 `Lang.lang_surjective` | main README 5203–5215 and Suggested 212 | R06(a) |
| 7b: common-torus hypothesis | GL₂, P=B⁺, Q=uB⁻u⁻¹ | L∩M = scalars (dim 1); P∩Q = uTu⁻¹ (dim 2) | Pass |
| 7c: induced dimensions | GL₂(𝔽_q), S₃⊃C₂ | q+1; 3=3·1; e_U needs q invertible | Pass |
| 7d: Mackey for T | GL₂ | *R∘R(θ)=θ⊕θ^w, dimension 2 | Pass |
| 7e: Weyl twist | GL₂(𝔽₃), t=diag(2,1), w=swap | wtw⁻¹=diag(1,2); second columns of tw and wt are (2,0),(1,0); right U⁻ fixes the second column | Pass |
| 7f: fixed-coset identity | S₃, H=⟨(12)⟩, g=(12) | 1·2 = 2·1; g=1 gives |G/H||H|=|G| | Pass |
| 7f: GL₃(𝔽₂) | P, Q | orders 168, 24, index 7, nonconjugate | Pass |
| 8.1: rank-0/rank-1 tori | r=0,1 | X=Y=0 or ℤ, no roots | Pass; sample |
| 8.1: SL₂/PGL₂ data | A₁ | root index 2 vs 1 in X | Pass; sample |
| 8.1: nonsmooth centre | SL₂/𝔽₂ | μ₂ of length 2 | Pass; sample |
| 8.1: disconnected base | Spec(k₁×k₂) | Conrad Ex. 5.1.2: (1),(2) hold, (3) fails for PGL₂×𝔾_m ⊔ GL₂ | Pass; source read |
| 8.2: pinning generator | SL₂ over ℤ/4, ℚ | x_α(t)=I+tE₁₂ tangent E₁₂; x_α(2t) tangent 2E₁₂ | Pass; sample |
| 8.2: torus | empty Δ | one empty family | Pass; sample |
| 8.2: Borel on k×k | B⁺,B⁻ | signs (+,−) not constant; Remark 6.1.2 | Pass; sample |
| 9A: cocycle values | A₂, α₁<α₂ | ε(α₁+α₂,−α₁−α₂)=(−1)^(1·(−1))=−1; ε(α₂,α₁)=−1, ε(α₁,α₂)=1 | Pass |
| 9A: commutator formula | ε(a,b)ε(b,a) | =(−1)^(Σ_{i≠j}bond a_ib_j)=(−1)^(B(a,b)) | Pass |
| 9A: cocycle identity | a=(1,0),b=(0,1),c=(1,0) | ε(a,b)ε(a+b,c)=1·(−1); ε(b,c)ε(a,b+c)=(−1)·1 | Pass |
| 9A: inverse in the cover | (a,s)⁻¹ | (−a, sε(a,−a)) since (a,s)(−a,t)=(0,stε(a,−a)) | Pass |
| 9A: change of order | reversed edge {i,j} | ratio (−1)^(a_ib_j+a_jb_i) equals σ(a)σ(b)/σ(a+b) | Pass |
| 9A: kernel of lifts | Hom(Q,{±1}) | order 2^rank; A₁ lift group order 4 | Pass |
| 9A: folded A₃ | O={1,3}, P={2} | d_O=2, C_{O,P}=−2, C_{P,O}=−1: [[2,−2],[−1,2]], norms 1 and 2 (type C₂) | Pass |
| 9A: folded A₄ | O₁={1,4}, O₂={2,3} | d_{O₂}=1, c=2; [[2,−1],[−2,2]], no fixed vertex | Pass |
| 9A: D₄ triality | O={1,3,4} | C_{O,P}=−3, C_{P,O}=−1: [[2,−3],[−1,2]] | Pass |
| 9A: fixed dimensions | D₄ triality; E₆ reversal; identity | 2+6+6=14; 4+24+24=52; 28 | Pass |
| 9A: A₂ exchange frame | e,f,h | [e,f]=h, [h,e]=e; (2h,e,2f) is an sl₂ triple, index 4 | Pass |
| 9A: negative cycle | μ=−1 | 2t=0: ℤ gives 0, 𝔽₂ gives A[2]=𝔽₂ | Pass |
| 9A: order-three γY | [[0,−1],[1,−1]] | γY−I has det 3, Smith (1,3); kernels 0 over ℤ and 𝔽₂, ⟨(1,2)⟩ over 𝔽₃ | Pass |
| 9A: Frenkel–Kac convention | (2.6) | [E_β,E_γ]=ε(γ,β)E_{β+γ}: transposed argument order | Pass; source read |
| 9A: Kostant relations | sl₂ | E⁽¹⁾E⁽¹⁾=2E⁽²⁾; a=b=1 rule gives EF=FE+H | Pass |
| 9B.1: SL₂ big cell | g=[[a,b],[c,d]] | u₋(c/a)diag(a,a⁻¹)u₊(b/a) has entry (1+bc)/a=d | Pass |
| 9B.1: charts over ℤ/4 and ℤ | 48 points; [[2,1],[3,2]] | ideal (a,c)=(1); det 1 with 2,3 non-units | Pass |
| 9B.2: SL₂→PGL₂ | diag(2,1) | λ²·2=1 has no rational solution; kernel μ₂ of length 2 in char 2 | Pass |
| 9B: elementary subgroups | 𝔾_m/ℚ; SL₂(ℤ/4) | E={1}, GE=ℚˣ; [[0,1],[3,0]] = x(1)x₋(−1)x(1) | Pass |
| 9B: special isogeny B₂ | τ* | α↦β↦2α, β↦2α↦2β; root subgroups return to t² | Pass |
| 9B: Chevalley constants | G₂, F₄ short pairs | strings of length 4 and 3: ±3, ±2 | Pass |
| 9B: tripled D₄ | 8ᵥ⊕8ₛ⊕8꜀ | dimension 24; no zero weight; triality cycles the summands | Pass |
| 9C: distributions of 𝔾_m | binom(H,2) on weight 3 | 3 | Pass |
| 9C: Frobenius on Dist(SL₂) | p | E⁽ᵖ⁾↦E⁽¹⁾, E⁽¹⁾↦0; kernel algebra dimension p³ | Pass |
| 9D: forms of 𝔾_m over ℝ | H¹(ℤ/2,ℤ/2) | ℤ/2: split and norm-one | Pass |
| 9D: Res_{K/k}𝔾_m | K=k(a^{1/p}) | dimension p; kernel 1+nilradical of dimension p−1; k-radical trivial | Pass |
| 9D: non-Noetherian base | 𝔽₂[x₀,x₁,…] | SL₂ relative dimension 3; μ₂: t²−1=(t−1)², derivative 0 | Pass |
| 9E: Steinberg endomorphisms | τ^(2m+1) in Sp₄/𝔽₂ | square = Frob_{2^(2m+1)}; identity on positive-dimensional G is excluded | Pass |
| 10A.1: contraction | 𝔾_m weights p and 1; p=2 tensor | binom(p,p)=1; binom(1,p)=0; weight 2 contracts to weight 1 | Pass |
| 10B: Steinberg module | SL₂, p=2,3; PGL₂ | dimensions 2=2¹, 3=3¹; ρ=α/2∉ℤα | Pass; Riche §2.9.1 read |
| 10C: Lucas digits | p=3, n=4; p=2, n=2 | (1+1)(1+1)=4, socle misses x²y²; y²↦span(x²,y²), xy generates R₂ | Pass |
| 10D: torsor charts | s_a, s_c | s_a·n(−1/(ac))=[[a,−1/c],[c,0]]=s_c; u_c=u_a+1/(ac) | Pass |
| 10D: global functions | k[a,c]_a∩k[a,c]_c | =k[a,c] | Pass |
| 11A: left action | σ=(012), z=(0,1,2) | (σ·z)_i=z_{σ⁻¹i}=(2,0,1); forward index gives (1,2,0) | Pass |
| 11A: degenerate n | n=0,1,2 | π₁=1,1,ℤ; B₀=B₁=1, B₂=ℤ | Pass; headline instance |
| 11A: nonsplitting | B₂=ℤ→S₂ | 2m=0 and m odd impossible; n≥2 general: an order-two lift has even exponent sum | Pass; headline instance |
| 11B: A₁ arrangement | ℂ* / ±1 | quotient z↦z², π₁=ℤ | Pass |
| 11C: regular vs regular semisimple | [[0,1],[0,0]], I | centralizers ℂ*×ℂ and GL₂ | Pass |
| 11E: spectral projectors | diag(1,3) | P₁=diag(1,0), P₂=diag(0,1); sum I, product 0 | Pass |
| SL presentation | n=0,1,2 | relations 0, x−1, ad−bc−1; over ℤ/4, [[1,1],[0,1]]⁻¹ has entry −1=3 | Pass; headline instance |
| Companion: covering evaluation | identity covering | e ↦ e by `rfl` | Padding: R04 |
| Companion: fixedCartan | −id on ℤ, ℤ/2 | fixed = ker(−2): 0 and the whole module | Padding: R04 |
| Companion: forgetOrder continuity | n=2 | quotient map continuous by `continuous_quotient_mk'` | Padding: R04 |

**Pinned-library audit.** Declarations opened at the pins (paths relative to their repositories): `TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean:82–148` (`IsBorelCandidate` = smooth ∧ geometrically connected ∧ geometrically solvable points; `IsBorelOverAlgClosed` = `IsAlgClosed k ∧ Minimal …`, so the headline's "any two" is over maximal smooth connected solvable subgroups); `Reductive/Basic.lean:70`, `LinearlyReductive.lean:64`, `Connected/CommHopfAlgCat.lean:61` (the three predicates of the Layer 6 and 7a headlines); `FunctorOfPoints.lean:154` (`mapValue φ f = toConv (φ.comp f.ofConv)`, postcomposition, so `F ∘ g` is the q-Frobenius twist of the point `g`); `HopfIdeal/Conjugation.lean` (`conjugate : HopfIdeal R H → WithConv (H →ₐ[R] R) → HopfIdeal R H`); `Unipotent/Radical/Construction.lean:72` (`unipotentRadicalDefiningIdeal : HopfIdeal k H` for `H : FiniteTypeCommHopfAlgCat.{u,u} k`); `HopfIdeal/Coinvariants/Basic.lean:92` (`coinvariants I : Subalgebra R H`, the equalizer of `(id ⊗ π)∘Δ` and `includeLeft`); `SpecialLinear/Basic.lean:380, 445, 574` (`pointsMulEquiv`, `pointsMulEquiv_mapValue`, `pointsNatIso`) and `GeneralLinear/StandardComodule.lean:69` (`genericMatrix`); `GroupTheory/SpecificGroups/Braid/Basic.lean:97, 304, 394` (`BraidGroup n = ArtinGroup (CoxeterMatrix.A (n−1))`, `permHom`, `pureSubgroup = ker permHom`); Mathlib `Topology/Constructions.lean` (`continuous_quotient_mk'`) and `LinearAlgebra/FixedSubmodule.lean` (`LinearMap.fixedSubmodule_eq_ker`), the two one-lemma proofs of R04. `#check @AlgebraicGeometry.Smooth` confirms the morphism property used by the orbit headlines.

**Supplier and ownership audit.** Every `*Needs:*` line and supplier citation was read against the layer order; the dependency check is clean. Cross-roadmap citations resolved on main: SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.5, 1.13–1.15, 2.6, 4.12; ModularCurves §§0E–0F; RootSystems Layers 1–6 and Layer 4 (chamber simple transitivity); LieHighestWeight Layers 3–4 and 7; LieGroups Layers 2, 7, 8; SmoothBundlesConnections B1.0, B1.1, B1.4; InductionRestriction Layer 2.1 (`Gassmann.almostConjugate_iff_permutation_equiv` at its README lines 198 and 378, which explains the resolver's one non-local lead); GroebnerGeometry G5; AlgebraicVectorBundles; AlgebraicTopology; DGFloer Layer 1.2; ReflectionInvariantTheory; IntegralLattices; downstream consumers CFSGStatement, NilpotentOrbits, SchubertGeometry, ReductiveGroupsPartII and ChevalleyGroups exist on main; FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups are open roadmaps cited only as consumers. The resolver's 22 leads are the 21 `Suggested.lean` names plus that Gassmann name; none is a missing dependency. Ownership of the objects this review touches was searched by object over the roadmap index (441 open pull requests, 363 new roadmaps, index of 2026-11-04): Lang's theorem (RGPartII RG2.3.7 on main, R06(a)); rational cohomology and cotensor induction (IntegralHeckeAndGaloisDeterminants §0.7, R06(b)); classical topology and charts (ComplexComparisonPartII C-1.1, R06(c)); Matsushima affineness (only consumers found: FormalConnectionsOpers F6); Levi complements (only this folder and its sibling pull request #1332); Fox–Neuwirth and Brieskorn presentations (only this folder and #1332). The sibling pull request #1332 revises this same folder and declares the same `TauCetiRoadmap.ReductiveGroups` namespace; which of the two revisions proceeds is a human decision already recorded in that pull request's reviews.

**Shape and principles.** RootSystems, ReflectionInvariantTheory and Completed/EffectiveBounds were consulted as shape examples. Each definition in the seeded sections has an API list and at least three discriminating Checks; every layer ends with Examples and Dependencies; the README has no LaTeX delimiters, process words, round labels or pull-request numbers of this repository (`mathlib4#39281` in the Acknowledgements is on main unchanged). No route-specific shortcut, re-planned roadmap, copied passage, algorithm, `set_option` or edit outside the folder was found. Layers 5P → 6A/7C, 9A → 9B → 9C → 10A → 10A.1 and 7a → 7b → … → 7f → 9E are ordered as stated.

## Not verifiable

- The companion files' signatures cannot be elaborated as a whole: `CoverLiftTargets.lean` names `CoverLifts.LiftGroup` and `CoverLifts.projection`, which none of its imports provides (R01); admitted equivalences and homeomorphisms have no values to inspect.
- Conrad–Feng Appendix F locators (Proposition F.5.10, p. 218; Theorem F.3.7, p. 208) and Brieskorn's Proposition 1 (p. 25) were not located in the cached extractions by search this round (OCR), and were not re-read page by page; they are cited by locator as before.
- Salvetti (Invent. Math. 88), Callegaro (Ann. Fac. Sci. Toulouse 23), Fox–Neuwirth and Fadell–Neuwirth (Math. Scand. 10), SGA 3 Exposé XIX, Jantzen's 2003 edition, Waterhouse, Borel, Springer, Carter, Serre, Lang 1956, Steinberg 1968, Howlett–Lehrer, Dipper–Du, Gassmann, and Conrad–Gabber–Prasad were not read this round; they are cited by locator only (paywalled or not fetched). None of them is in the seeded sample.
- Ownership against open pull requests whose files this brief does not give was checked only through the roadmap index (`roadmaps grep`/`show`), not by reading their checkouts.

## Source issues

- none
