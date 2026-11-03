# Review of SheafTheoreticSmithTheory (pull request #1734 at 98ab730)

**Verdict:** needs changes

Gate at 98ab730: every check passes (`build=0`, `depcheck=0`, `set_option=0`, `sorry-data=0`). Dependency check run from the worktree: `depcheck: 204 roadmaps, 1629 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The outside-folder diff against `origin/main` is empty. One blocking finding (a supplier section that does not exist at the cited head), three notes.

## R01 (P2) — LanglandsParameterStacks has no section LP3.0; the cited theory is its §4.1

Location: `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md` line 101 ("section LP3.0, *Highest-weight modules and good filtrations*, supplies good/Weyl filtrations and the Donkin–Wang–Mathieu tensor theorem"), and the same label at lines 15, 103, 105, 107, 648, 659, 673, 694, 696, 709, 711, 726 and 843, including the three declared gap contracts `gap:finite-highest-weight-ideals`, `gap:integral-highest-weight-orders` and `gap:integral-tilting-lifts`, whose `section` is `LP3.0` in the package plan as well.

Claim: LanglandsParameterStacks §LP3.0 supplies good filtrations, Donkin's criterion, the tensor theorem and the Ext computation `Hom(Δ(λ),∇(μ))`, and the three gaps extend "LP3.0".

Witness: `roadmaps show LanglandsParameterStacks` (the open head, #1202) has no string `LP3`; its good-filtration section is `### 4.1 Highest-weight modules and good filtrations` (line 919 of that README, under `## Layer 4: good filtrations, fixed groups and wild reduction`), and that section does state tensor stability, Donkin's criterion and that `H^i(G,∇_λ⊗∇_μ)` is `k` for `i=0`, `μ=−w₀λ`, and zero otherwise, exactly what this README consumes. GeometricSatakeAndFusion §4.10 cites the same section as "LanglandsParameterStacks §4.1". The worker's citation check lists LP3.0 as found nowhere.

Repair: replace every `LP3.0` by `4.1` (fourteen occurrences in the README; the contract sentences then read "the finite saturated highest-weight-ideal categories associated to §4.1"), and have the board set `section` to `4.1` for the three `gaps` entries of `packages/SheafTheoreticSmithTheory/design/plan.json`, so that the intake announces them on a section that exists. Nothing else changes: the mathematics consumed is present in §4.1 at the generality used here (split reductive over a field; rational modules; finite filtrations).

## R02 (P3) — GeometricSatakeAndFusion "GS0" citation should name §0.29

Location: `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md` lines 14, 93, 633, 726 and 807 ("GeometricSatakeAndFusion GS0, *Equal-characteristic Schubert models and coefficient comparison*").

Claim: the Schubert-model supplier is "GS0" with that title.

Witness: at #1235 the title belongs to `### 0.29 Equal-characteristic Schubert models and coefficient comparison` (line 802), one of thirty subsections of Layer GS0; GlobalShtukasAndFunctionFieldLanglands §1.14 cites it as "GeometricSatakeAndFusion §0.29".

Repair: write "GeometricSatakeAndFusion §0.29" at the five places (keeping the title is fine).

## R03 (P3) — the plan's self-gaps G1–G5 are owned here but declared nowhere

Location: `packages/SheafTheoreticSmithTheory/design/plan.json` target prerequisites `gap:SheafTheoreticSmithTheory/G1` … `/G5` (lines 699–1939), which the intake reads as declared gaps with supplier `none`; `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md` mentions none of these slugs.

Claim (of the brief's gap list): five prerequisites with no supplier.

Witness: each is a README target, so none is unowned. G1 (W(k)-adic uniform operations): the declared gap `gap:witt-adic-uniform-operations` with EtaleDualityAndPerverseSheaves plus §1.1 (lines 65, 281–283, 429) for the Smith-specific conservative quotient comparison. G2 (equal-characteristic modular k/O Satake over arbitrary separably closed F with étale parity/Tate Hom transport): §3.1 (line 629), §4.4 (line 805) and §4.7 (line 856). G3 (good-prime exotic/Soergel engine): §4.5 (line 822). G4 (natural integral comparison on norm-generated maps): §7.6 (lines 1440–1444). G5 (Ĥ-equivariant comparison components): §6.8 (lines 1299–1303).

Repair: board-side only, no README edit: either repoint the five prerequisites in `plan.json` to those sections, or add `gaps` entries with supplier `SheafTheoreticSmithTheory` and those sections. The README should stay as it is: a roadmap cannot declare a gap on itself.

## R04 (P3) — §4.6's Feng locator supports a filtration, not the direct-sum statement

Location: `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md` line 839 ("every normalized O-parity object on `Gr_G≅(Gr_H)^r` is a finite direct sum of `E(λ₁)⊠⋯⊠E(λ_r)` … (Feng24, proof of Lemma 4.14, p.24 …)").

Claim: the locator carries the direct-sum decomposition.

Witness: Feng24 lines 1066–1070 give, for a perverse `F`, a finite `L⁺G`-equivariant *filtration* whose associated graded is a sum of external products; the direct sum for parity objects is proved here from §3.4's product-tilting classification under §4.5 (the proof route says so) and, for `O`, from `gap:integral-tilting-lifts`.

Repair: cite Feng24 for the filtration and the stalk computation only, and point the direct-sum claim at §3.4 and §4.5 (or JMW16 Theorem 1.2 for the field case), e.g. "(Feng24, proof of Lemma 4.14, p.24, for the external-product stalk computation; the direct-sum form follows from §3.4 under §4.5)".

## Verified sound

**Gate and build.** The worker's gate at 98ab730 passes every check. `lake env lean` on a scratch copy of `Suggested.lean` elaborates with `sorry` as the only warning (4 s, cached), and `#check @name` for all six declarations reproduces the elaborated types in the worker's signature file: no section binder is lost; `[Fact p.Prime]`, `[CharP κ p]` and `[PerfectRing κ p]` are explicit in the signatures.

**Headlines and padding.** README headlines: sheaf Tate two-periodicity (§1.2), relative Smith localization (§§2.9–2.10), modular Satake over k/W(k) (§3.1), tilting tensor closure and derived generation (§§3.4–3.5), parity–tilting at good primes (§4.5), the graded Tate Hom formula and normalized lifting (§§4.7, 4.12), the categorical diagonal and linear BC (§§5.5, 5.8), CT comparisons (§§6.3–6.5), Feng's base change theorem (§6.9), exactness (§7.2), Galois descent (§7.4), the integral norm-image comparison (§7.6), the algebra Tate diagonal (§8.1) and character extension (§8.2). Only the last two are statable at the pins (no equivariant étale derived categories, Tate quotients, affine Grassmannians, parity or algebraic-group tilting categories exist in Mathlib f6090c70 or Tau Ceti 358314d4); the module docstring names every other headline and what it lacks. One-tactic probe: replacing each `sorry` by `simp` leaves both goals open; neither theorem restates a definition, mirrors a Check or computes a value. The four definitions have real bodies on native carriers and each occurs in a headline statement. No padding.

**Lean statements (adversarial).** `algebra_tate_diagonal`: for σ with σ^p=1, `cyclicNorm` lands in `fixedSubring` (reindexing the product), `transferIdeal` equals the transfer image because `b·Tr(a)=Tr(ba)` for fixed `b`, and `Nm(a+b)−Nm(a)−Nm(b)` is the sum over non-constant words, which rotation (needs σ^p=1 and p prime) groups into orbits of length p whose sums are transfers; `Tr(1)=p` puts p in the ideal, so no characteristic hypothesis is needed. Uniqueness of δ is forced by the value condition; the zero ring gives the unique zero map. `tate_character_extension`: existence by `a ↦ Frob⁻¹(χ(Nm a))` (additive because χ kills the transfer defect and Frobenius is additive; extends χ since `Nm(a)=a^p` on S ≤ A^σ); uniqueness because any extension kills all transfers, so `Σ_{i<p} χ'∘σ^i = 0`, which contradicts `linearIndependent_monoidHom` (target `[CommRing L] [IsDomain L]`, hypotheses satisfied by a field) unless the orbit has size 1, and then `χ'(a)^p = χ(Nm a)` fixes `χ'` by injectivity of Frobenius. Negative controls computed: p=4, σ swapping x,y on F₂[x,y]: `Tr₄=0` but `Nm₄(x+y)−Nm₄(x)−Nm₄(y)=(x+y)⁴≠0`, excluded by `Fact p.Prime`; A=F_p[x], S=F_p[x^p], κ=F_p(t), χ(x^p)=t: no extension since t∉κ^p, excluded by `PerfectRing`.

**Adversarial table** (statement; instances; values on each side; result).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.1 p=2 coefficients | trivial k, trivial O, regular k[C₂] | Tate (even,odd): (k,k), (k,0), (0,0); on O differentials 0 and 2; N=u | agrees |
| §0.2 free complement affine | scalar ζ-action on A¹, f=x | n=ζ^{p(p−1)/2}x^p: x³ (p=3), −x² (p=2); F[x,x⁻¹] free over F[x^p,x^{−p}] on 1..x^{p−1}; derivative p·x^{p−1} a unit | agrees |
| §0.3 equivariant categories | point; free 3-orbit; ⊕Λ[2n] | D([pt/C_p])=D(A_Λ); q_*Λ regular of rank 3 ≠ Λ³ trivial; H^{−2n}=Λ for all n, unbounded | agrees |
| §0.4 k[C_p]≅k[u]/u^p | p=2 over F₂ and ℤ; p=3 | (1+u)²=1 in F₂[u]/u², =1+2u in ℤ[u]/u²; (1+u)(1−u+u²)=1; N↦u², u resp.; Tor₁^A(k,k)=k | agrees |
| §0.5 flat kernel | A, k, C=[A→u A] over A=k[u]/u³ | amplitude [0,0], ∞, [0,1]; H⁰(C)=(u²)≅k, H¹(C)=k, neither flat | agrees |
| §1.2 periodicity class | C₃ with F₃, σ↦σ⁻¹ | H¹ generator ×2, Bockstein H² generator ×2 (and 2=2⁻¹ mod 3) | agrees |
| §1.4 LES | 0→O→^p O→k→0 | p=0 on T^{even}O=O/p, so T¹k→T²O is onto k→k, iso; T²O→T²k identity | agrees |
| §2.1 Tor bound | A¹→pt, d=1; Kummer j | RΓ_c(A¹,A)=A(−1)[−2]: [0,0]→[0,2]=b+2d; i*Rj* stalk [A→u A] in [0,1] with relative dimension 0 | agrees |
| §2.4 nearby stalk | p=3 | H⁰=(u²)≅k, H¹=A/u≅k(−1), amplitude [0,1], image 0 in quotient | agrees |
| §2.5 i!→i* cone | id; scalar rotation; ⊔Aⁿ | cone 0; cone the perfect [A→u A]; i!k on Aⁿ=k(−n)[−2n], unbounded in n | agrees |
| §2.8 operations | id; K⊗Λ; K⊗A; A¹ | id*=id; K; induced→0; RΓ_c=k(−1)[−2] vs RΓ=k | agrees |
| §2.9 Psm Rf! | free 3-orbit→pt; id; k⊕A | both sides RΓ_c=A→0; scalar 2↦2; k⊕A↦k | agrees |
| §3.3 tilting SL₂, p=3 | Δ(3), T(3) | 0→L(1)→Δ(3)→L(3)→0 dims 2,4,2; T(3)=St⊗L(1), ch Δ(3)+ch Δ(1), dim 6 | agrees |
| §3.4 tensor closure | V⊗V, p=3 | Sym²V⊕Λ²V=T(2)⊕T(0), 3+1; diag(1,2) torus-intertwiner, not SL₂ | agrees |
| §4.1–4.2 parity | A¹, P¹, elliptic E; Λ[1], O/p | Ext²=Λ(−1) even allowed; H¹(E) rank 2 fails; Λ[1] even for †=1; O/p not free | agrees |
| §4.4 wild control | L_ψ(x³) on A¹ over F̄_ℓ, ℓ≠3 | Swan_∞=3, χ_c=1−3, h¹=2; constant h¹=0 (EDPS §5.2 includes finite coefficient fields) | agrees |
| §4.5 goodness | GL₂ p=2,3; SL₂ p=2; G₂ p=3 | good; good not very good (2∣2), via D(GL₂)=SL₂ (JMW16 3.6(1)); bad (coefficient 3), MR18 Cor 1.6 proof reduces to s.c. non-type-A × GL_n | agrees |
| §4.6 products | (P¹)^r; E⊕E | O[r], dense rank 1; dense rank 2; Feng gives filtration only (R04); End(T₁⊠T₂)=End T₁⊗End T₂ local | agrees, locator R04 |
| §4.7/4.9 Tate Hom | E=O_{P¹}[1] | ⊕_i H^{2i}(P¹;k)=k⊕k·h, h²∈H⁴=0, local; Feng p.22 omits nilpotence of positive part (Source issues) | agrees |
| §4.8 Tate parity | O, O[1], regular, k | T¹O=0 even; T⁰(O[1])=0 odd; regular both 0; T¹k=k not even | agrees |
| §4.10 reduction | I⊂O[C₃] | I^{C₃}={cN:3c=0}=0; (I/pI)^{C₃}=k·u², dim 1 | agrees |
| §5.1 fixed Grassmannian | (ν,ν,ν); dims | only constant tuples meet diagonal; d vs p·d, equal parity for odd p; p=2: 1 vs 2 | agrees |
| §5.3/5.5 norm words | basis e₀,e₁, p=3; a∈O | 8 words = 2 fixed + 2 orbits; cycle sign (−1)²=+1; (f+g)^{⊗3}: 6 mixed = 2 transfers; a↦ā³, p↦0 | agrees |
| §5.6/5.7 Frobenius direction | α²=−1 in F₉; β³=β+1 in F₂₇ | Fr(α)=−α; Fr(β)=β+1, Fr⁻¹β=β⁹=β−1; D(Fr⁻¹β)=(β−1)³=β, D(Frβ)=β−1 | agrees |
| §6.1 CT normalization | GL₂ minuscule, E=Λ[1]; nonmonodromic diagonal in A² | ν=(1,0): S_ν∩P¹=A¹ (dim ⟨ρ,(2,0)⟩=1), RΓ_c=Λ(−1)[−1], [+1]→deg 0; ν=(0,1): point, Λ[1], [−1]→deg 0; diagonal: stalk k vs costalk k(−1)[−2] | agrees with MV07 Thm 3.5 |
| §6.2 extreme weights | λ=(1,0), ν=w₀λ=(0,1); ν=(2,−1) | S_{(0,1)}∩Gr^λ one point (MV07 (3.6)); ⟨ρ,λ+w₀λ⟩=0; (2,−1) not a weight, ∅ | agrees |
| §6.4 shifts | ν with ⟨2ρ,ν⟩=±1, p=3; p=2 | 3·1−1=2, 3·(−1)+1=−2; p=2 difference 1, not removable: normalized square needs p odd | agrees |
| §6.6 torus BC | G_m, (2,−1,4); scalar α | weight 5; unlinearized α³=−α, linearized α | agrees |
| §6.7/6.8 naturality | V^{⊗3}, p=3; D=diag(1,2), U=[[1,1],[0,1]] | (x+x⁻¹)³=ch T(3)+ch T(1), 1,3,3,1, dim 8; DU=[[1,1],[0,2]]≠UD=[[1,2],[0,2]]: torus intertwiner not an SL₂-map, so Feng's reduction gives objects not a natural iso | agrees; §6.8 is the right target |
| §7.1 conservativity | K with top stratum λ | stalk at t^{w₀λ} = lowest CT component (one point); minuscule generator rank 1; CT(0)=0 | agrees |
| §7.2 at p=2 | swap on odd-degree component | sign −1 = 1 in k=F̄₂, so the sign obstruction of §6.4 is invisible; mixed term induced → 0 | plausible as stated |
| §7.3 descent | (k,0); ∏_ℕC₂; S₃ on k³ | unit law fails; dense kernel, discontinuous; (P₁₂P₂₃)³=1, P₁₂P₂₃≠P₂₃P₁₂ | agrees |
| §7.4 | trivial Γ; C₃ | BC; u_γ·γ(u_γ)·γ²(u_γ)=1; Feng's "F full" is the ordinary reduction of §4.10 | agrees |
| §7.5/7.6 | h on P¹; f=[[1,[β]],[0,1]] at (0,0,0) | L(h)=0 vs F_T(h)=h≠0; f^{⊗3}(e₂e₂e₂)=[β]³e₁e₁e₁+[β]²N(e₁e₁e₂)+[β]N(e₁e₂e₂)+e₂e₂e₂, fixed-word matrix [[1,β+1],[0,1]]≠[[1,β],[0,1]]; 2³≡2 mod 3 | agrees |
| §8.1 headline | ℤ, σ=id, p=2; ℤ[i], conj; F₂[x]/x³, σx=x+x²; F₃[x]/x⁴, σx=x+x³; B^p rotation; p=4 | Δ₂=reduction mod 2; Δ₂(a+bi)=a²+b²≡a+b, kernel (1+i); σ²=id, fixed F₂+F₂x², Tr=(x²), Nm x=x², Δ₂x=0; σ³=id, Tr=0, Nm x=x³≠0; Tr onto diagonal, T⁰=0; p=4 fails (above) | agrees |
| §8.2 headline | k[x] trivial σ; k^p rotation; F_p[x]/F_p(t); ℤ→F₂; zero ring | Frob⁻¹χ(a^p)=χ(a); 1∈Tr so no χ; t∉κ^p so no extension; unique extension = reduction; no χ since 1=0 in κ would be forced | agrees |
| §8.3 twist | W=k; (λw)⊗μ | a⊗μ↦a^pμ iso, tautological a↦a^p; balancing w⊗λ^pμ, λ acts as λ^{1/p} | agrees |

**Library declarations opened at the pins** (file and line as the README states them, all present): `WittVector.isDiscreteValuationRing` (DiscreteValuationRing.lean:148), `WittVector.quotientPEquiv` and `isAdicCompleteIdealSpanP` (Complete.lean:105, 116), `Module.free_of_flat_of_isLocalRing` (LocalRing/Module.lean:299, needs `Module.Finite` and `Flat`), `tateCohomologyFunctor`/`tateCohomology` (TateCohomology/Basic.lean:140–145), `frobeniusEquiv` (Perfect.lean:121), `linearIndependent_monoidHom` (LinearIndependent/Basic.lean:502, `[CommRing L] [IsDomain L]`, tagged `@[stacks 0CKL]`), `RingHom.eqLocus` (Subring/Basic.lean:867), `Ideal.span` (Ideal/Span.lean:45), `Ideal.Quotient.mk` (Quotient/Defs.lean:83); Tau Ceti `TauCeti.TateCohomology.H0IsoNormQuotient` (LowDegree.lean:152, in namespace `TauCeti.TateCohomology` after `end Zero`), `Rep.FiniteCyclicGroup.periodicIsoOfGenerator`, `tateCohomologyIsoEven`, `tateCohomologyIsoOdd` (Periodic.lean:302, 167, 200, all with `hg : ∀ x, x ∈ Subgroup.zpowers g`), the two `…_hom_comp_…_hom` identities (322, 332), `TauCeti.AffineInvariantQuotient.isFinite_projection` and `…_of_finiteType` (Affine.lean:66, 73). Pins: `lake-manifest.json` gives Mathlib f6090c70 and Tau Ceti 358314d4, the revisions the README names, and `.lake/packages` is at those revisions.

**Cross-roadmap citations resolved** (main 929496d or the open head named): EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4, E3.4, E5:abstract (main); EtaleCohomologyFoundations F.1 with its "Bounded constructible and ctf categories" paragraph, F.2.x–F.3, 0.8, 0.10, F.5, F.6 (main); ModularCurves 0C (main; affine quotients, torsors, free actions with `R=X×_{X/R}X`); SchemeAndStackFoundations §§0.23a, 1.17, 1.21, 1.23 (main); ReductiveGroups Layers 1, 4, 9, 10A, 10B (main); ReductiveGroupsPartII RG2.0a with *weil-restriction-separable-splitting* and *tame-fixed-points-of-weil-restriction* (Edixhoven: DVR `O`, `O'` finite free, `|Γ|` invertible, `X` smooth affine over `O'`, fixed scheme of `Res` smooth, matching the README's paraphrase), RG2.5.1 (*langlands-dual-group*, *galois-action-on-dual-group*), RG2.5.2 (*dual-isogenies-and-products*) (main); DeformationAndDerivedPatchingAlgebra §7.5 (#1034); GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.8–1.9, 1.14 (#1490; §1.14 is Satake over `O_E` finite over `ℤ_ℓ` on the Grassmannian over `F̄_q`, so Layer 3's extension to `F̄_p`, `W(F̄_p)` and arbitrary separably closed `F` is new work, not duplication); GeometricSatakeAndFusion §0.29 (#1235; R02); EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2, 2.4–2.5, 3.1–3.2, 5.2 (with the finite-coefficient-field form of the Euler–Poincaré formula), 7.3 (#1040); AInfCohomology §AI.7.2 (#1044); LanglandsParameterStacks: R01. Supplier direction: every cited roadmap is on main or earlier in the merge order; the depcheck output above.

**Ownership.** `roadmaps grep` over the 439 open pull requests and main for parity sheaves, Smith theory/restriction, Tate quotients/Tate-parity, modular Satake, cyclic base change, exotic tilting, algebraic-group tilting modules and the Tate diagonal: the only other owners are the spectral Tate diagonal (AInfCohomology §AI.7.2, consumed by StableHomotopyKTheoryPartII, RefinedTraceMethods), which the Scope paragraph distinguishes correctly, quantum `sl₂` tilting modules in TemperleyLieb, and perfectoid "tilting". No roadmap states `algebra_tate_diagonal` or `tate_character_extension`, and no other `Suggested.lean` declares these names.

**Sources: the seeded sample** (every locator opened; printed page = the page marker preceding the line). §0.3: Feng24 line 656, §3.2 display (3.2), p.15. §0.5: Feng24 line 595, Definition 3.1 and Lemma 3.2, pp.13–14. §2.1: Feng24 line 709, Lemma 3.9, p.16 (locally finite type, separated, bounded dimension; the `b+2d` sharpening is the roadmap's) and line 684, Lemma 3.7. §2.5: line 703, Lemma 3.8, p.16. §2.8: line 729, §3.3, pp.16–17. §2.9: line 742, Proposition 3.12, p.17. §4.5: Feng24 line 997 (Theorem 4.8, p.23), 1007 (the one constructible-side step), MR18 line 20 (§1.1 hypotheses), 105 (Theorem 1.1, p.3: `[1]↔⟨−1⟩`, `E_λ↦T_{−λ}`), 273 (Corollary 1.6, p.6), 2734–2751 (§6.5, Lemma 6.6, reductions via JMW16 Lemma 3.6, p.60), JMW16 line 415 (Lemma 3.6), MV07 line 259 (Proposition 2.1, p.6). §4.6: Feng24 line 1066 (R04). §4.8: Feng24 line 892 (Definition 4.2, p.20), LL21 line 899 (Definition 5.3.1, p.20). §6.1: Feng24 line 2590 (§A.4, p.58), 2628 (Remark A.1, (A.1)), MV07 lines 356, 427 (Theorems 3.2, 3.5, pp.9–10), Braden03 lines 16–47 (normal variety, weakly equivariant, Theorem 1, p.2) and 175 (Lemma 6, p.5). §6.2: MV07 lines 376–388 ((3.6): `S_ν∩Gr^ν={L_ν}` for antidominant ν), Feng24 line 2742. §6.8: Feng24 line 2701 (p.60). §7.1: line 2742 (Lemma A.3, p.61). §7.4: line 1239 (Lemma 4.22, p.28). §8.2: Feng24 line 1869 (Lemma 5.15 and (5.20), p.42), TV16 lines 512–529 (§3.4, (3.4.1), pp.11–12). Also opened: Feng24 lines 1036, 1045, 1090, 1162, 1189, 1228, 1273, 1863, 1896 (Lemma 4.11, Definition 4.12, Proposition 4.15, Construction 4.17, Definition 4.18, Lemma 4.21, Lemma 4.24, Definition 5.14, Construction 5.17), LL21 lines 624, 641, 1120 (Corollary 4.5.2, Proposition 4.6.1, Theorem 5.6.6), Feng24 line 950 ((4.2)), and the seven Stacks locators in the four chapter extractions the manifest records (051F/051G/051H at algebra lines 11331/11344/11356, 08G1 at sites-cohomology 5207, 0DJJ at 5300, 0A5N at more-algebra 8130, 0CKL at fields 728). The README's Check that `Rep.FiniteCyclicGroup` carries no `TauCeti.` prefix is correct at the pin.

**Declared gaps.** The six `gaps` entries of the plan match the README's six `What <Supplier> must provide (gap:…)` sentences word for word; each `needs` is a single precise statement with hypotheses; none asks for what EtaleDualityAndPerverseSheaves §§3.1–3.2 (finite `O_E` only), GlobalShtukas §§1.1–1.3 (curve setting), SchemeAndStackFoundations §1.17 (affine and projective quotients only) or LanglandsParameterStacks §4.1 (field, no finite-ideal subcategories or integral orders) already provides. Three of them carry the wrong section label (R01).

**Form.** Module docstring, namespace, layer comment, docstrings, `theorem` only, `import Mathlib` under the module system, no `set_option`, no `#eval`/`#print`, every Lean name in the README (§8.1–8.2 and "How to read the build"), README Checks in prose, no LaTeX, no process words, no pull-request numbers, no anchors, no companion files.

## Not verifiable

- Don93, Theorem 1.1 (Math. Z. 212, paywalled at Springer): recorded as `uncertified`, cited by locator; its statement is recalled in JMW16 Theorem 1.1 (line 24), which I read.
- JMW14 locators outside the seeded sample (§§4.1–4.3, 4.10) were not opened in this round; JMW16 Theorems 1.2, 5.1, 5.3 and MV07 §§6, 11–14 likewise.
- Ownership against open pull requests was checked through `roadmaps grep` over the index of 2026-11-03; pull requests opened after that index were not seen.

## Source issues

- **Error** in Feng24 at proof of Lemma 4.24, printed p.29: the right face of cube (4.8) is deduced from the outer square of (4.9) because the middle column is a Verdier quotient of the left; it should be asserted only on morphisms in the image of `T*ε*`, which is not full (on `P¹` with `E=O[1]` the index-one class has `L(h)=0` but reduces to `h≠0`); affects a stated result.
- **Gap** in Feng24 at Appendix A.4, printed p.60, after Lemma A.2: faithfulness of restriction to the dual torus and determination of tiltings by characters are used to pass from the torus case to Theorem 4.20; it should also show the torus comparison components are `Ĥ`-equivariant and natural (a torus intertwiner such as `diag(1,2)` on the `SL₂` standard module is not an `SL₂`-map); affects the proof.
- **Gap** in Feng24 at proof of Proposition 4.5, printed p.22: locality of the graded endomorphism algebra (4.2) is inferred from locality in index zero and vanishing in negative indices; it should add that the positive-index ideal is nilpotent, which holds by finite dimensionality of the Hom groups; affects the proof.
