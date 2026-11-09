# Review of DerivedModuleAlgebra (pull request #1701 at db95654)

**Verdict:** needs changes

This is a full review of the folder at db95654. That is the head r24 read, and the folder has not changed since. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`. Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d.

There are two findings, both P3 locator defects. No finding is blocking. Two source issues are listed at the end.

## R01 (P3) — §0.2 cites the wrong lemma for its K-flat tensor clause

**Location.** README:795–798:

> "the termwise tensor product with a K-flat complex sends quasi-isomorphisms to quasi-isomorphisms ([StacksMA] Definition 15.60.1, Lemmas 15.60.7, 15.60.10, 15.60.12; Tags 06XZ, 064K, 06Y4, 064L, pp.144–147)"

The same reading recurs in two places:
- README:812–813, "Both rest on K-flat resolutions of one variable ([StacksMA] Lemmas 15.60.10 and 15.60.12)";
- the docstring of `hasLeftDerivedFunctor₂_tensor` (Lean:127–134), "Lemmas 15.60.10 and 15.60.12 … tensoring with a K-flat complex preserves quasi-isomorphisms".

**Claim.** The clause "tensoring with a fixed K-flat complex preserves quasi-isomorphisms" is Lemma 15.60.2 (Tag 06Y0, p.144), which none of these passages cites. Lemma 15.60.12 is the other variable. The derived bifunctor needs both lemmas: Q ∘ ⊗ must invert quasi-isomorphisms in the free variable and in the K-flat one.

**Witness.** StacksMA line 6711 (Lemma 15.60.2, Tag 06Y0, p.144): for a K-flat `K•`, the functor `L• ↦ Tot(L•⊗K•)` preserves quasi-isomorphisms. StacksMA line 6824 (Lemma 15.60.12, Tag 064L, p.147): a quasi-isomorphism between K-flat complexes stays one after tensoring with any `L•`.

**Repair.**
- In README:797, cite "Lemmas 15.60.2, 15.60.7, 15.60.10, 15.60.12; Tags 06Y0, 064K, 06Y4, 064L".
- In README:812–813, write "Lemmas 15.60.2, 15.60.10 and 15.60.12".
- In the `hasLeftDerivedFunctor₂_tensor` docstring, write "with Lemmas 15.60.2, 15.60.10 and 15.60.12, Tags 06Y0, 06Y4 and 064L".

The single-variable uses stay as they are, because 064L is exactly what they need:
- the `hasLeftDerivedFunctor_extendScalars` docstring;
- README:833–835, "with `L• = S[0]`".

**Test.** Take `R = ℤ`, the K-flat `K• = [ℤ --p→ ℤ]`, and the quasi-isomorphism `L• = [ℤ --p→ ℤ] → L′• = F_p[0]`.
- Lemma 15.60.2 gives that `Tot(L•⊗K•) → Tot(L′•⊗K•) = [F_p --0→ F_p]` is a quasi-isomorphism: both sides have `H⁰ = H⁻¹ = F_p`.
- Lemma 15.60.12 does not apply, because `F_p[0]` is not K-flat.

The repaired locator therefore covers the clause it is attached to.

## R02 (P3) — The GR entry names two editions, but every GR page locator is from arXiv v3

**Location.** README:2832:

> "**GR**: Ofer Gabber and Lorenzo Ramero, *Almost ring theory*. LNM 1800 (2003); arXiv:math/0201175v3."

The page locators that depend on it are at README:1370 (p.30), 1435 (pp.34, 41), 1500 (pp.219–220) and 1810 (pp.35, 41–42). The link at README:2862 has no version.

**Claim.** README:2813 says "Source locators above use the cited edition's page numbering". The entry cites two editions, and every GR page number is that of the 234-page arXiv v3 PDF, not of the LNM volume. A reader holding the published book is sent to the wrong pages. The numbering of the LNM volume cannot be checked here, since it is paywalled, so the README should name the version it reads, as it already does for [Chenevier].

**Witness.**
- GR line 5: "arXiv:math/0201175v3 … sixth (and final) release".
- GR line 10572: the printed page number "219", where Proposition 8.1.7 begins (GR line 10619).
- Theorem 2.5.30 is under printed page 34 (GR line 1640).

**Repair.**
- Change README:2832 to "*Almost ring theory*, sixth release, arXiv:math/0201175v3; pages of that version (published as LNM 1800, 2003)".
- Point the link at README:2862 to `https://arxiv.org/abs/math/0201175v3`.

**Test.** After the edit, each GR locator, for example "Proposition 8.1.7 … pp.219–220", resolves in the named version: GR lines 10572–10621 cover pages 219–220.

## Previous findings

r24 had a single finding.

- **r24 R01** (the pull-request description claimed `Suggested.lean` was unchanged): **repaired**. The description no longer says "README only; `Suggested.lean` is unchanged". Its Summary now reads: "The head replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need." That agrees with `git diff --numstat origin/main...HEAD` (`575 1227` for Lean).

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Gate.** My run at this head ends:
  ```text
  gate DerivedModuleAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  It exits 0, and `gate.md` agrees.
- **Dependency check.** Full output:
  ```text
  depcheck: 239 roadmaps, 2336 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- **Elaboration.** `lake env lean` on Lean exits 0. Its only messages are 33 "declaration uses `sorry`" warnings, one per theorem. All 11 `TauCeti.*` imports have built object files at the pin.
- **Signatures.** I elaborated `#check @name` for all 43 declarations in one scratch copy; the 44th item is the local instance `moduleDerived`. Every elaborated type keeps its hypotheses, for example `I.FG →` in `completeNakayama` and `derivedCompleteness_isRightAdjoint`, `[Module.Flat R ↑N]` in both décalage theorems, and `hsurj`/`hnil` in `ringTowerLimit_jacobson`. All binders are explicit, so no section variable can drop. Each type matches its README statement in generality.
- **Padding.** On a scratch copy I replaced each of the 33 `sorry`s by `first | rfl | (simp; done) | infer_instance | exact?`. All 33 fail (33 errors), so none is padding.

### Seeded source sample

Every sampled locator was checked at its line in the cached text, for statement, number, page and hypotheses. All match except the clause in R01.

| Target | Locators checked (source line, page) | Result |
| --- | --- | --- |
| 0.1 | StacksCt 81 (Def 3.1, 08PM, p.2); 144/169/193 (4.1–4.3, p.4–5); 360–381 (Rem 5.5, 08QI, p.9); 382/395 (5.6–5.7, pp.9–10) | Match. Rem 5.5 assumes `P_n → B` surjective, but each of the three equivalent conditions forces `H₀(P)=B`, so the README's unconditional "equivalently" holds |
| 0.2 | StacksMA 6709 (06XZ, p.144), 6725 (60.5, 06Y2), 6741 (064K), 6753 (60.8, 06Y3), 6781 (06Y4), 6824 (064L, p.147), 6846 (064M), 6918 (06Y6, p.149), 6948–6951 (0GMT, p.149) | Match, except the K-flat-tensor clause (R01) |
| 0.5 | StacksDefos 56–87 (2.1, 08S5, p.2), 127 (2.2, 08S7, p.3), 161–186 (2.3, 0GPT; Rem 2.4, 0GPU, p.4); GR 1454 (2.5.4, p.30) | Match |
| 0.6 | StacksCt 206 (4.5, 08QF, p.5), 933 (11.3, 08RB, p.21); GR 1672 (Thm 2.5.30, p.34), 1946 (Lemma 3.2.1, (3.2.2), p.41); Bhatt12 1188 (Rem 6.6, p.25) | Match |
| 0.8 | StacksCt 704–707 (Prop 7.4, 08QX, p.16) | Match |
| 0.10 | StacksCt 456 (§6, 08QL, p.11), 519–521 (Lemma 6.2, 08QQ, p.12): hypothesis `B⊗^L_A A′ = B′` is the README's Tor-independence | Match |
| 0.11 | StacksCt 108 (3.4, 08S9, p.3), 779 (8.1, 08QZ, p.17), 827 (8.6, 08SF, p.19) | Match |
| 0.12 | StacksCt 847 (9.1, 08R5, p.19), 805 (8.4, 08R2, p.18), 228 (4.7, 08QH, p.6) | Match |
| 0.14 | SAG 62288 (Constr 25.2.2.2, p.1700), 62365 (25.2.3.1, p.1702), 62398/62405 (25.2.3.2–3, p.1703), 62412 (25.2.3.4, p.1703); BL22 10001/10042 (B.1 p.225, B.5 p.226); DoldPuppe §4 from PDF p.28 (printed 227) | Match. The README already corrects SAG's signed coinvariants (Source issues) |
| 0.15 | SAG 62262 (25.2.2.1, p.1699), 62414 (25.2.3.4(1)); DoldPuppe 994 (4.10, p.229) | Match |
| 0.17 | DM 863 (Lemma 3.3, p.21); SAG 62450 (25.2.4.2, p.1704); Bhatt12 523 (Prop 3.22, p.11), 893 (Rem 3.43, p.18) | Match |
| 0.25 | StacksCt 1388–1414 (16.1, 08SP, p.31: ξ ∈ Ext², torsor under Ext¹, automorphisms Ext⁰), 1676 (21.1, 08UZ, p.37); StacksDefos 82–87 (2.1); GR 1685 (2.5.32, p.35), 2016 (3.2.11, p.42) | Match |
| 1.4 | StacksMA 12260–12269 (Situation 93.15, 0BKC, p.266: transitions multiply `e_i` by `f_i^(m−n)`), 12293 (93.18, 0920, p.267) | Match |
| 1.5 | StacksMA 3571 (062F), 3591 (062G: products in the last entry, hence the README's symmetry step), 12496/12520 (091X, 0923: iff bounded torsion, p.271), 12717/12739 (0921, 0922, pp.275–276), 12756 (0A06: all `Hⁿ` finite, no boundedness), 11133 (091L, p.242); Prisms 399 (fn. 5, p.10) | Match |
| 1.7 | BMS19 850–855 (Def 4.1, printed p.220), 872/888 (4.4–4.5), 895 (4.6, p.221), 908–919 (4.7, pp.221–222), 958 (Cor 4.8, p.223); Prisms 406–416 (§1.2, p.11) | Match. Prisms states only one direction; the README's equivalence follows by filtering `N` by `N[Iⁿ]` |

The README flags no locator as unverified.

### Adversarial pass

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Check (README:788–791) | constant `A[t]` → `A[t]/(t²)` | Alternating face complex `A[t][0]` against `B = A[t]/t²`, so `H₀` differs and it is not a resolution | True | none |
| `hasLeftDerivedFunctor₂_tensor` (Lean:135), 0.2 Checks (R01) | `F_p ⊗^L F_p` via `[ℤ --p→ ℤ]`; bi-infinite `ℤ/4`, `d=2`, ⊗`F₂` | `H⁰=H⁻¹=F_p` against termwise `F_p[0]`. Termwise `H^i=F₂` for all `i` against derived `0` (acyclic) | True | locator only (R01) |
| `hasLeftDerivedFunctor_extendScalars`, `nonempty_derivedExtendRestrictScalarsAdj` (Lean:154, 169) | `ℤ→F_p`, `Y=F_p[1]`; reversed adjunction | `Hom(F_p[0]⊕F_p[1], F_p[1]) = 0⊕F_p` against `Ext¹_ℤ(F_p,F_p)=F_p`. Reversed: `Hom_ℤ(F_p,ℤ)=0` against `F_p` | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:186) | Tau Ceti `Bicomplex.lean`:446 places `H_k(K.X p)` at `(−k−2p,p)` on page 2; single column; single row | Page-2 `d` has degree `(2,−1)`: `(−k−2p,p)→(−k−2(p−1),p−1)`, the classical `d¹`. Page 3 has `(3,−2)`, the classical `d²: (p,k)→(p−2,k+1)`. Single column: `H_k(K.X 0)` at `(−k,0)` | True | none |
| S.1 sign Checks (README:1070–1079) | gens `a,b,c,e` at `(0,1),(1,0),(1,1),(2,0)` | Total matrix `[[1,1],[0,1]]`, determinant 1, so `H(Tot)=0`. `E₂`: `R` at `(0,1),(2,0)`. `D(a−b)=−e` gives `d₂[a]=[−e]` and `E₃=0` | True | none |
| `simplicialTensorComparison` (Lean:201) | `a∈X₁`, `b∈Y₁` | `∂∇(a⊗b) = s₀∂a⊗b − a⊗s₀∂b = ∇(∂a⊗b − a⊗∂b)`. With the opposite sign in `(1,1)`, `∂∇ ≠ ∇∂` | True | none |
| `bisimplicialDiagonalComparison` (Lean:224) | constant `P` | Both sides `P` in degree 0, zero above | True | none |
| `quasiIso_whiskering_of_projective` (Lean:241) | `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `F(V)=V⊗V` | `H₁ = Tor₁(ℤ/2,ℤ/2) = ℤ/2` against `0`; excluded because the target is not projective | True | none |
| `exteriorPower_decalage` (Lean:264) | `N=R`, `n=2`; `N=0`; `N=ℤ/2` over `ℤ` | Normalized `∧²X` is `R` in degree 2 (cross-effect) `= Γ²R`. `N=0`: `0 = Γⁿ0` for `n≥1`. `ℤ/2`: `F₂` against `Γ²_ℤ(ℤ/2)=ℤ/4`, excluded by flatness | True | none |
| `symmetricPower_decalage` (Lean:282) | `N=R`, `n=2`, bar model | `N₂ = ℤ(e₁e₂−e₂²)`, `d₀ ↦ −e²` (a unit), so acyclic `= ∧²R = 0` although `Sym²R = R` | True | none |
| 0.5 Checks (README:1356–1381) | `ℤ/4→ℤ/2`; `ℤ/9→F₃`; Baer sum; `ℚ[X]⊕εℚ[X]` | Classes nonzero. `2·[ℤ/4] = 0` in `F₂`. `d/dX` gives `a+εb ↦ a+ε(b+a′)` | True | none |
| 0.6 Checks (README:1423–1446) | `ℤ→ℤ/p`, `M=F_p`; `ℤ/9→F₃` | `Hom(F_p[1],F_p)=0`, `Exal = Hom(F_p[1],F_p[1]) = F_p`. Conormal `3 ↦ 1`, negative `↦ 2`, order 3 | True | none |
| 0.7 Check (README:1402) | `k[x,y]/(x,y)²` | LS kernel `(m r₁+m r₂)/(x r₁, y r₁+x r₂, y r₂) = k·y r₁`, so `H⁻²(L)=k` | True | none |
| 0.8, 0.10 Checks | `ℤ→ℤ→ℤ/3`; `ℤ→F_p`, `A′=F_p` | Second map an isomorphism on `H⁻¹=ℤ/3`. `L_(F_p/F_p)=0` against `L⊗^L F_p = F_p[1]`, `Tor₁=F_p` | True | none |
| 0.4/0.12/0.13 Checks | `k[ε]/ε²`, char ≠ 2 and char 2 | `x² ↦ 2ε dε` with kernel `εk ≠ 0`. In char 2 the map is 0 and `H⁻¹=H⁰=B` | True | none |
| 0.14–0.16 Checks | `Be`; `F₂`; `F_p` | `L∧²(Be)=0` against signed coinvariants `B/2B`. `e·e=2γ₂(e)=0` in `F₂`. `e^p = p!γ_p = 0`, `γ_p ≠ 0` | True | none |
| 0.25 Checks (README:1772–1833) | `F₂[ε]/ε²` over `ℤ/4`, `c=0`; `k[x]/(x³)→k[x]/(x²)→k` | `2B′=0`, `B′/JB′ = B′ ≠ B`, not flat. `x² ↦ 0` in `(x)/(x²)`, so the connecting map surjects onto `k` | True | none |
| `derivedLimit_isTriangulated` (Lean:304), §1.1 Checks | tails `A_n=⊕_(m≥n)k` in `V`; `ℤ` with ×p; ×3 square homotopy | Levelwise-split image not distinguished: `⊕k→∏k` not onto. Boundary `∏k→∏k/⊕k = lim¹A`. `Σ3^(2m) = −1/8 ∉ ℤ` | True | none |
| §1.1 cofinal Check (README:1942) | drop `r` levels of ×p | `p^r·t ≡ s (mod ℤ)`, the inverse of `p^r` on `ℤ_p/ℤ` | True | none |
| `nonempty_derivedTensorHomAdj` (Lean:319) | `A=ℤ`, `K=L=F_p`, `M=ℤ[2]`; `L=ℤ[1/p]` | Both sides `F_p`; underived gives `Ext²(F_p,ℤ)=0`. `Ext¹(ℤ[1/p],ℤ) = lim¹(×p) = ℤ_p/ℤ` | True | none |
| `derivedCompleteness`, generators/radical/cohomology/triangle (Lean:352–384) | `I=0`; `I=ℤ`; `(2,3)⊂ℤ`; `(p)` against `(p²)`; `ℚ_p` | All complete at `I=0`. `I=ℤ`: `Hom(ℤ[n],M)=H^(−n)M`, so `M=0`. `ℤ_2` fails at `f=3`. `ℚ_p` fails at `f=p` and `p²` | True | none |
| `derivedCompleteness_isRightAdjoint` (Lean:389), §1.3 Checks | `I=0`, `I=A`; `·2` on `ℤ[0]` | Left adjoint is the identity, respectively zero. No cokernel: epimorphisms split and `End(ℤ[0])=ℤ` | True | none |
| `completeNakayama` (Lean:400) | `[ℤ --p→ ℤ]`; `ℤ[1/p]`; `m⊂O_(ℂ_p)` | `P⊗F_p = [F_p --0→ F_p] ≠ 0`. `ℤ[1/p]` is excluded by `hc`. `m` is derived complete with `m/m²=0`, excluded by `hI` | True | none |
| `ordinaryQuotientCompletion*` (Lean:417, 436, 458) | `f=0` (`c=1`); `f=1` (`c=0`); `[p,1]`; `[0]`; `ℤ_p⋉ℚ_p/ℤ_p` | Constant tower, `Rlim=P=Λ₀`. Zero tower, `Λ_A=0`. `I=ℤ` weakly regular, so `0`. `[0]` is not weakly regular. `R⋉T` violates bounded torsion (`T[pⁿ]` grows) | True | none |
| `nonempty_ordinaryQuotientCompletionHomologyIso` (Lean:479) | `F_p` via `[ℤ --p→ ℤ]`; `ℚ_p/ℤ_p` over `ℤ_p` | `H⁻¹`-tower `pⁿℤ/pⁿ⁺¹` has zero transitions, so `H⁻¹=0`, `H⁰=F_p`. Without finiteness `H⁻¹=ℤ_p` against `0` | True | none |
| §1.5 `R⋉T` Checks (README:2216–2231) | `A=ℤ_p⋉ℚ_p/ℤ_p` | Koszul `H⁻¹=T[pⁿ]`, ×p onto, so `R`. `Hom_(D(A))(C,R[1]) = H⁰(R[1]) = 0` by adjunction, so the triangle is nonsplit | True | none |
| `cohomologicalAmplitude_of_completeTorAmplitude` (Lean:508) | `∏ℤ/pⁿ` over `ℤ_p`, `[−1,0]`; `ℤ[1/p][−1]`; `R⋉T` | Lands in `[0,0]`. Excluded by `hc`. Excluded by `hA` (BMS19 line 895) | True | none |
| `isAdicComplete_of_isCompletelyFlatModule`, converse (Lean:527, 546) | `A=ℤ/4`, `p=2`, `M=ℤ/4`, `ℤ/2` | `1⊗2 ↦ 2`, `ℤ/2 ≅ 2ℤ/4`. `M=ℤ/2`: `M/4M` not flat over `ℤ/4`, `Tor₁=ℤ/2` | True | none |
| `IsPerfect` family, `isPerfect_baseChange` (Lean:566–613) | `⊕_ℕℤ`; `eA⊂k×k`; `[ℤ --2→ ℤ]`; `ℤ/2` over `ℤ/4` | `H⁰` not finitely generated. Euler ranks `(1,0)`, alternating `1−e,e` model. `[F₂ --0→ F₂]`. `H^(−i)=F₂` for all `i`, excluded by `hK` | True | none |
| `ringTowerLimit_jacobson` (Lean:624) | `k[t]/tⁿ⁺¹`; shifted `k[t]/tⁿ` | `1+t ↦ 1` is a unit. Shifted: `A₀=0`, excluded at `n=0` since `ker(k→0) ∋ 1` | True | none |
| `pseudoCoherent_residueCriterion` (Lean:637) | `[k[[t]] --t→ k[[t]]]`, `[a,b]=[−1,0]` and `[0,0]` | Fibre `[k --0→ k]`. `[0,0]` fails at `i=−1`, consistent with `pd(k)=1` | True | none |
| `Matlis.biduality_of_finite/artinian` (Lean:661, 674) | `ℤ_p`, `E=ℚ_p/ℤ_p`; `ℤ_(p)` | `D(ℤ_p)=E` is Artinian and `D(E)=ℤ_p` finite. `End E = ℤ_p ≠ ℤ_(p)`, excluded by `IsAdicComplete` | True | none |
| §1.E.1 Checks | `[A_n --t→ A_n]`; `k[x_i]/(x_i²)` | `H⁻¹(M_n)=(tⁿ)` with zero transitions, against `H⁻¹(M)=0`. `I^r ∋ x₁⋯x_r ≠ 0` | True | none |
| GR-cited targets (R02) | 0.5/0.6/0.9/0.25 | The mathematics is unaffected; only the edition is ambiguous | True | locator only (R02) |

### Library declarations opened at the pins

- **Cited names.** All 260 dotted Mathlib and Tau Ceti names that the README cites as library declarations resolve in a declaration index of both pinned sources. The only exception is `AlgebraicTopology.DoldKan`, which is a namespace. All 42 cited modules exist as files, or as directories where the README names a directory.
- **Tau Ceti's derived limit** (`Algebra/Category/ModuleCat/Tower/DerivedLimit.lean`):
  - `:122` `homotopyLimitFunctor` is the mapping cocone of `complexShift`;
  - `:165` gives its `CommShift`;
  - `:310` defines `derivedLimit`;
  - `:329` gives its `CommShift` via `commShiftOfLocalization`.

  So `derivedLimit_isTriangulated` is a claim about a specified shift structure, as README:1874–1878 says.
- **Mathlib's derived shifts.** `Mathlib/CategoryTheory/Functor/Derived/RightDerivedCommShift.lean`:71 builds `commShift` for right derived functors only. Neither pin puts a monoidal instance on `DerivedCategory`, which confirms Lean:55–60.
- **Matlis duality.** Tau Ceti `RingTheory/MatlisDuality/Artinian.lean`:91 `isArtinian_of_isNoetherian_linearMap` is the converse direction, and `FiniteLength.lean`:155 `bijective_applyₗ` covers finite length only. The two Matlis headlines are therefore not at the pin.
- **Cotangent complex.** Neither pin has a full cotangent complex. Mathlib's `Extension/Cotangent/Basic.lean`:61 is the naive one, which confirms Lean:78–79.

### AffineCrystalline citations

I read the public Apache-2.0 repository's `main` branch. All the cited names exist with the hypotheses the README states:
- `Envelope/FreeConstruction/DPAlgebraAugmentation.lean` declares `augmentation`, `augmentation_apply_dp`, `augmentation_apply_algebraMap`, `positiveIdeal`, `dp_mem_positiveIdeal`, `positiveIdeal_le_augmentation_ker`, `sub_augmentation_mem_positiveIdeal` and `positiveIdeal_eq_augmentation_ker`, with `{R M : Type u}` as README:381 says.
- `Homology/TotM.lean` declares `RawBi.augRowι_quasiIso` (columns exact) and `RawBi.augColι_quasiIso` (rows exact) on the first-quadrant `RawBi`.
- `Homology/TotQuasiIso.lean` declares `RawBi.totMap_quasiIso`.
- `Cohomology/CechDerived.lean` declares `rightDerivedLimIsoCech`.

### Duplication, ownership, overlaps, supplier order

- **Supplier.** The only cross-roadmap supplier is AlgebraicTopology Stage 6, item 0, on main (its README:954–995). It owns the cone maps of homotopy-commuting product squares, which §1.1 consumes. §1.1 owns only exactness in `D(A)`, which AlgebraicTopology does not claim.
- **Consumers.**
  - Main's RepresentationTheory/ArtinAlgebras consumes §1.M.2 and says this roadmap owns Matlis duality (its README:61, 210, 594, 604), so supply runs one way.
  - Its `bijective_applyₗ_of_isInjectiveEnvelope` lives in another namespace and concerns Artinian rings, so there is no name clash.
- **Ownership against open work.** `roadmaps grep` over main and the 468 open heads, for "Matlis dual", "derived completion", "derived Nakayama", "cotangent complex", "décalage", "tensor–Hom adjunction", `IsPerfect` and "Eilenberg–Zilber", finds consumers citing this roadmap's sections but no second owner.
- **Ids against main.** Section ids at head against main: only §1.T.1 is dropped. README:37–39 maps its citations, including the anchor `#1t1-towers-lim-and-lim¹` that StableHomotopyKTheory (#1227 line 86) uses, to the Tau Ceti tower declarations. Main had no layer ids.
- **Overlaps.** `overlaps.md` shows no other open pull request changing this roadmap and no cited id dropped elsewhere.
- **Citations.** `citations.md` lists no cross-roadmap citation found nowhere. Its 103 Lean-name leads are of three kinds, all accounted for:
  - names other roadmaps cite, which the alias table at README:44–83 maps;
  - this roadmap's own Lean names, all declared (`readme-ids-missing=0`);
  - AffineCrystalline names, checked above.
- **Form.** The README has no process words, LaTeX or `lemma`. Every layer ends with Examples and Dependencies, and every definition has at least three Checks.

## Not verifiable

- **NSW** (2.1.1), (2.1.2), (2.2.4), printed pp.99 and 105 (untouched text). The cached NSW entry is the authors' landing page only (41 lines). The same claims check against StacksHom Tags 0130, 0132 and 0133.
- **IllusieCC** is uncertified in the manifest, which settles it.
- **AffineCrystalline.** I checked the names on the repository's `main` branch, not inside the Zenodo v1.0.0 archive. The cached text is the Zenodo landing page.
- **GR as LNM 1800.** The volume is paywalled, so I could not compare its pagination with arXiv v3 (R02).

## Source issues

- **Error** in StacksMA at §15.96, opening paragraph, Tag 0BKH, printed p.275: the source says the derived completion of `A[0]`, for `A = ℤ_p ⊕ ℚ_p/ℤ_p` square-zero and `I=(p)`, is `ℤ_p[1] ⊕ ℤ_p[0]`; it should say its cohomology is `ℤ_p` in degrees −1 and 0, splitting only in `D(ℤ_p)`, since `Hom_(D(A))(K^∧, ℤ_p[1]) = 0`; affects nothing.
- **Error** in SAG at Construction 25.2.2.2, printed p.1700 (repeated in Proposition 25.2.3.4(2), p.1703): the source defines exterior powers as signed-permutation coinvariants yet claims the usual free basis; it should be the alternating quotient, since for `M=ℤ` coinvariants give `ℤ/2` and break Proposition 25.2.4.2; affects a stated result.
