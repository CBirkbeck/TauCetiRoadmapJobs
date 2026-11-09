# Review of EnriquesSurfaces (pull request #1286 at e852f4d)

**Verdict:** accepted

:robot: Independent AI-assisted full re-review (192 changed lines since 959683b, the head the previous review read). All five findings of the previous review are repaired (details under "Previous findings"). The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with exactly its two `sorry` warnings, every sampled locator supports the statement it is cited for, every cross-roadmap and library citation resolves where it is cited, and the adversarial table below was computed exactly, including a Schreier–Sims count of the mod-two reflection group that confirms both headline statements' image claims. No finding.

## Previous findings

- R01 (P2, Cossec–Dolgachev Proposition 1 statable but absent) — **repaired.** `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:62` declares `IsParabolicLongest` and `:97` declares `reyeCongruenceKernels` with the hypotheses the repair gave (ρ fixed on generators, `B`, `K`, `K'` longest on {0,2,…,8}, {0,1,…,6}, {0,2,…,7}; conclusions `ρ.ker = normalClosure {B, K}` and "trivial on the quotient by the polar radical iff in `normalClosure {B, K, K' * s₉}`"). The module docstring (`:7–13`) now names both statable headlines and no longer calls the normal-closure description unstatable. `README.md:531` defines the predicate, `:536` states its uniqueness clause, `:537` and `:591` name `reyeCongruenceKernels`, and `:545–546` and `:601` add the Checks.
- R02 (P3, E₇/E₈ models attributed to IntegralLattices §6C/6F) — **repaired.** `README.md:25`, `:38`, `:246`, `:508`, `:523`, `:529` and `:551` now cite `TauCeti.DynkinType.rationalRootSystem`, `rationalBase`, `cartanMatrix_rationalBase`, `simpleSupportEquiv` and `TauCeti.IntegralLattice.typeE₇RootLattice`; IntegralLattices is cited only for Layers 0–1, Layer 5 and 6A. No "6C/6F" remains.
- R03 (P3, five locators) — **repaired.** (a) `:685` reads "§2, pp. 1602–1606, and Proposition A.6, p. 1625"; (b) `:666` cites Peters–Sterk Lemma A.2(i), p. 1623 and Dolgachev §3, p. 11 for O⁺(M); (c) `:471` reads "Dolgachev, §4, p. 15 … and §5, p. 16"; (d) `:355` cites Cossec–Dolgachev–Liedtke Example 1.6.5, pp. 246–247, and `:342` now states the branch octic; (e) `:109–111` construct the polarized groupoid as a fibre product of §2.1 `homAndIsomSchemes` with §7.3 `PicardStackSpaces` and use §7.6.3 `polarisedIsomScheme` only for the class-level comparison.
- R04 (P3, embedded resolution planned without citation) — **repaired.** `:340` states the theorem with its hypotheses (Noetherian regular of dimension 2, Z containing no component, one-dimensional components with finite normalization) and cites Stacks Lemma 54.15.6 (0BIC) with its proof route through 54.15.5 (0BIB), 54.4.1 (0AHH) and 54.15.4 (0BI8). The theorem stays a target of §2.3, which is correct: no supplier states it (SchemeAndStackFoundations §4.17 `nc_to_snc` at `README.md:6086–6090` on main only turns a normal-crossings divisor into a strict one; §4.13 `resolution_of_curves` at `:5656` is normalization of a curve; `roadmaps grep '0BIC|embedded resolution of curves'` finds no other roadmap).
- R05 (P3, "AM7.3", run-together citations, "commission") — **repaired.** `:129` reads "AlgebraicModuliForArithmeticGeometry §7.3's", `:246` "IntegralLattices 6A", `:477` "without assuming a reductive GIT theorem", `:701` "These outputs constitute". No "AM", "commission" or "programme" remains (scanned).

## Verified sound

**Gate, dependency check, build.** The worker's gate at e852f4d passes every check (`scratch/gate.md`). I reran the prescribed dependency check against the candidate order, where EnriquesSurfaces is line 135 after K3Surfaces at 134; it returned exactly

```text
depcheck: 238 roadmaps, 2343 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The pins are Mathlib `6b7abb3c` and Tau Ceti `a91d3aa`. A scratch copy of `TauCetiRoadmap/EnriquesSurfaces/Suggested.lean` with `#check @` on all ten declarations and three `decide` probes elaborated with `lake env lean` in 37 s and produced exactly the two `declaration uses 'sorry'` warnings (lines 81 and 97). The ten elaborated types agree with `scratch/signatures.md` and with the README statements; there is no `variable` block, so no binder can be lost. No `set_option`, no sorry'd data, no admitted `example`, no `#eval`, a single `import Mathlib`.

**Headline inventory and padding.** Headlines by layer: E1 canonical cover, Pic→Num kernel {O,K}, Witt lift, Picard specialization, Num ≅ U⊕E₈(−1); E2 hyperelliptic classification and double plane; E3 presentation equivalence; E4 Reye recognition and parameter quotient; E5 T246 comparison (a RootSystems §1.4 instance, README target), the two normal kernels (`reyeCongruenceKernels`), the full mod-two image (`reyeReductionImage`); E6 Aut ≅ W̄(2), curve transitivity, Aut ≅ Γ(2), lifting criterion, generic open; E7 the counts. The two E5 statements are the only ones statable at the pins (the Enriques predicate is WeilConjectures WC.7, still a pull request), both are stated, and the docstring names the missing carrier of every other headline. One-tactic probe: `simp` and `simp_all` each leave both sorried theorems unsolved (scratch copies elaborated); `decide` proves the Check values q(e₀+e₄)=1, M₀₄=3, M₀₃=2, M₀₀=1, b(e₀,e₄)=1, b(e₀,e₃)=0, b(e₀,e₀)=0. Nothing restates a definition, mirrors a Check or computes a value. The three definitions (`reyeDiagram` with its graph and matrix, `IsParabolicLongest`, `ReyeReduction` with `reyeQuadratic`/`reyePolar`) are exactly what the two headlines need.

**Sources (seeded sample and new locators).** Cached texts read at their locators; page offsets: `enriques-one` pdf = printed + 16 (digits remapped Q=1, R=2, S=3, T=4, U=5, V=6, read from context); `peters-sterk` pdf = printed − 1597; `davis` pdf = printed + 19 (printed 42 at line 2025, 48 at 2250, 49 at 2286); `martin` pdf = printed.

| Target | Locator opened | Result |
| --- | --- | --- |
| 0.1 | SchemeAndStackFoundations main §§2.6 (`:3437`), 2.20 (`:4275`), 5.2–5.3 (`:6653`, `:6701`), 5.6 (`:6921`), 5.9–5.10 (`:7129`, `:7175`); StableReduction main Layer 4 (`:529`); AlgebraicVectorBundles L0A (`:215`), L1A–B (`:269`, `:290`) | all exist; adapters only |
| 0.2 | SSF §2.6, §4.9 (`:5448`); AlgebraicModuliForArithmeticGeometry (#853) §§1.1–1.3 (`amag.md:306`, `:505`, `:602`); StableReduction Layer 2 (`:405`), Layer 4 | supports |
| 0.3 | AMAG §2.1 `homAndIsomSchemes` (`:1096`), §2.2 `automorphismGroupScheme` (`:1112`), §7.3 `PicardStackSpaces` (`:9299`, "all isomorphisms"), §7.6.3 `polarisedIsomScheme` (`:9733`, class-level) | fibre-product construction matches the supplied objects |
| 1.1 | `cossec-dolgachev-1985`; AMAG §7.3 `picard_infinitesimal_lifting` (`:9399`: small Artinian thickening, kernel killed by the maximal ideal, obstruction in H²(O)⊗I); AbelianSchemesAndArithmeticModuli (#849) A4.8 (`asam.md:2325`, Stacks 089A at `:2335`); `stacks-089A` lines 3641–3654 (Thm 30.28.4) | supports |
| 1.3 | `dolgachev` lines 319–334 (§3, pp. 8–9); ComplexComparisonPartII (#848) C1.9 (`ccii.md:1917`), C3.2d.1–2 (`:2418`, `:2436`, `relative_picard_algebraicSpace` at `:2438` with the O_T ≅ f_*O hypothesis), C5.4 (`:3520`); AlgebraicTopology main Poincaré–Lefschetz (`:1515`); WeilConjectures (#1208) WC.7 (`wc.md:1541`, Enriques condition `:1757`) | supports |
| 1.4 | EtaleCohomologyFoundations main F.0.3 (`:231`), F.2.1–2 (`:504`, `:522`), F.4.1–4 (`:959`–`:1021`), 0.9 (`:1120`), F.5–F.6 (`:1179`, `:1200`, `etaleGaussBonnet` `:1219`); CCII C6.3 (`:4702`), C6.5 (`:4851`), C6.6 (`:4949`); K3Surfaces (#1285 at 920b522) Layer 2 §2.1 simple connectivity (`:539`) | supports |
| 1.5 | IntegralLattices main 6A (`:2019`, indefinite classification), Layer 0 (`:536`), 0G row `:438` (`typeE₇RootLattice`) | supports; the overlap leads "6A/Layer 0 only at #1411/#1797" are false positives |
| 1.6 | `dolgachev` lines 442–483 (§4, pp. 11–13); NeronModelsAndSemistableAbelianVarietiesPartII (#870) §2.1 (`nmii.md:3785`) | supports |
| 2.1 | `enriques-one` lines 14195, 14245, 14358, 14963 (Props 2.6.1, 2.6.4, Cor 2.6.5, Prop 3.2.1) | supports |
| 2.2 | `dolgachev` lines 468–470 (§4, p. 12: degree-2 map after blowing up two base points, Enriques octic) | supports |
| 2.3 | `stacks-0C5R` lines 2016–2021 (Lemma 54.15.6), 2003–2015 (54.15.5, applying 4.1), 1989–2000 (54.15.4), 419–425 (54.4.1), 1918–1924 (54.15.1 (4): finite normalization); `enriques-one` lines 12282–12303 (Example 1.6.5, pdf 262–263 = pp. 246–247: two lines, sextic with a double point at their intersection and two tacnodes where the lines meet it with multiplicity 4); SSF §0.20 (`:1302`), §4.11 (`:5528`), §4.13 (`:5643`), §4.17 (`:6075`) | supports; README hypotheses at least as strong as the source's ("containing no irreducible component" for "proper") |
| 3.1 | `cossec-dolgachev-1985` lines 42–46 (Thm 2); AMAG Layer 2 (`:1071`) | supports |
| 3.2 | `stacks-0BXJ` lines 3204–3206 (Lemma 31.29.5); `stacks-0C5R` lines 2335–2337, 2390–2394 (54.17.1–2); `enriques-one` line 10108 (Thm 1.1.3) | supports |
| 4.1 | `cossec-dolgachev-1985` lines 77–82 (Prop 2 and the Reye definition, p. 248); `dolgachev` lines 583–589 (§4, p. 15), 622–624 (§5, p. 16) | supports |
| 4.2 | `cossec-dolgachev-1985` lines 16–20 (§1, 9-dimensional variety), 81–82 | supports |
| 5.1 | `peters-sterk` lines 1036–1049 (Lemma A.5, pdf 27–28 = pp. 1624–1625) | supports |
| 5.2 | `davis` lines 2040–2043 (Cor 4.1.5, p. 42: l_T = l_S on W_T), 2265–2274 (Lemma 4.6.1, pp. 48–49: w₀ exists iff W finite, unique, l(w₀)=|R|; a maximal-length element satisfies (b) by length parity, hence is w₀), 4738, 4745 ((6.32)–(6.33), p. 108); `cossec-dolgachev-1985` lines 56–68 (B, K, G and Prop 1); RootSystems main §1.3 (`:515`, reindexing, `parabolicHom`, finite-index transport), §1.4 (`:564`, `integral_geometric_realization` with basis transport), §2.1 (`:616`, `weylCoxeterHom_injective/_surjective`), boundary `:63–68` | supports |
| 5.3 | `cossec-dolgachev-1985` lines 32–35 (§2), 62–68 (Prop 1 (i) W(2), (ii) W̄(2)) | supports; (ii) follows from (i) and the full image as `README.md:591` says |
| 6.2 | `peters-sterk` lines 194–198 (§2 starts pdf 5 = p. 1602), 1008–1009 (Lemma A.2(i), pdf 26 = p. 1623), 1076–1078 (Prop A.6, pdf 28 = p. 1625); `dolgachev` lines 413–419 (§3, p. 11: O(E₁₀)=W(E₁₀)×{±1}); K3Surfaces K0.A (`:275`), K6.A–B (`:777`, `:819`), K7.A (`:866`, swap convention Check `:899`), K7.B (`:1007`), §7.3 (`:1098`), ownership `:43–46` | supports |
| 6.3 | `martin` lines 710–720 (Lemma 5.4, pdf 16–17), 831 (Cor 5.5, p. 19), 104, 117, 151–154 (Thms 1.2, 1.4, Prop 1.9 with 527 = 17·31), 527 (Thm 3.7), 853 (dimensions 5 and 2) | supports |
| 7.1 | `cossec-dolgachev-1985` lines 42–46, 112–115 | supports |
| 7.2 | `cossec-dolgachev-1985` lines 21–24, 42–46, 117–118 ([AS]) | supports the counts and the referral |

**Pinned Tau Ceti declarations opened (a91d3aa).** `TauCeti.DynkinType.rationalRootSystem` (`LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Rational.lean:80`), `rationalBase` (`:87`), `simpleSupportEquiv` (`:213`), `cartanMatrix_rationalBase` (`:235`, Cartan matrix of the base through the Bourbaki numbering equals `t.cartanMatrix`), with instances `IsCrystallographic` (`:129`), `IsRootSystem` (`:174`), `IsReduced` (`:182`); `E7` and `E8` are valid types with pinned data (`Assembly.lean:87–88`). `TauCeti.longestElement` (`LongestElement.lean:194`) under `[CharZero R]`, `[Finite ι] [IsDomain R] [P.IsCrystallographic]`, `[P.IsReduced]`, `[P.IsRootSystem]`, exactly the hypotheses `README.md:25` and `:551` state. `TauCeti.IntegralLattice.typeE₇RootLattice` (`IntegralLattice/RootLattice/TypeE.lean:382`, namespace `TauCeti.IntegralLattice` at `:96–98`). `CoxeterSystem.geometricRepresentation` and `_simple` (`Coxeter/Geometric.lean:479`, `:485`), `strongExchange`/`deletionCondition` (`StrongExchange.lean:413`, `:463`), `TauCeti.matsumoto` (`Matsumoto.lean:138`), `exists_isMinimalCosetRep`/`length_mul_of_isMinimalCosetRep` (`Parabolic.lean:236`, `:280`), `baseRingToGlobalSections`/`globalSectionsSmul_naturality` (`Modules/GlobalSections.lean:199`, `:143`), `coxeterMatrixOfBase` (`RootSystem/Coxeter/Matrix.lean:278`).

**Cross-roadmap citations resolved.** On main: RootSystems (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`, the path the table links) §§1.1–1.4, §2.1 and its Enriques boundary; IntegralLattices Layers 0–1 (`:536`, `:560`), Layer 5 (`:1770`), 6A (`:2019`); SchemeAndStackFoundations §§0.3, 0.20, 1.13, 1.23, 2.6, 2.11, 2.19–2.20, 4.6, 4.9–4.11, 4.13, 4.17, 5.1–5.3, 5.6, 5.9–5.10 (all headings found); StableReduction Layers 2 and 4; ModularCurves 0G (`:901`); JacobianChallenge Layers A–C (`:111`, `:135`, `:143`); AlgebraicVectorBundles L0A, L1A–B; AlgebraicCurves dictionary (`:48`); EtaleCohomologyFoundations as tabled above. At open heads: K3Surfaces #1285 (920b522), AlgebraicModuliForArithmeticGeometry #853, ComplexComparisonPartII #848, AbelianSchemesAndArithmeticModuli #849, NeronModelsAndSemistableAbelianVarietiesPartII #870, WeilConjectures #1208, all earlier in the candidate order; FourManifolds #936 §7.3 "The Enriques cover" (`:2976`, uses it as an example only, `:2018`); EnriquesSurfacesAndIntegralNonexistence #1488 consumes E0–E1f, which `README.md:50` defines. The description's six "Depends on" entries are exactly these open suppliers. No forbidden roadmap is cited.

**Ownership by object.** `roadmaps grep` over main and all 466 open heads for `0BIC|embedded resolution of curves` finds only this roadmap; for T246/Reye objects only this roadmap and RootSystems' explicit assignment to it. The overlaps file lists no other pull request changing this roadmap and no dropped id. The closest roadmaps (#1488, #1285, #1375) own, respectively, the characteristic-two and arbitrary-field extensions, K3 theory with no Enriques consumption, and K3 boundedness; no object has two owners.

**Adversarial table.** Values computed by hand or in exact pure-Python scripts (`scratch/compute.py`, `scratch/ss2.py`), or with `decide` at the pins.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.3 scalar kernel | geometrically integral S; S⊔S; λ=2 then 3 | H⁰(O)=k ⇒ k×; k××k×; 6 on sections, identity on P(H⁰) | holds |
| §1.1 Pic→Num kernel | L numerically trivial, L≠O | χ(L)=1+½L(L−K)=1 ⇒ h⁰(L)+h⁰(K−L)≥1; effective numerically trivial ⇒ trivial ⇒ L=K | holds |
| §1.1 evenness | D arbitrary | D²≡D·K=0 mod 2 by RR | holds |
| §1.1 lift obstruction | W(k)/pⁿ⁺¹→W(k)/pⁿ | kernel pⁿW/pⁿ⁺¹W≅k, square-zero, killed by p; H²(T)⊗I=H²(O)⊗I=0 | holds |
| §1.2 reduction of Pic | same thickening | H¹(O)⊗I=0 injective, H²(O)⊗I=0 surjective | holds |
| §1.2 RR polarization | F,G rulings; P¹×P¹ | 2−1−1+1=1 | holds |
| §1.3 Chern sign | u=0,1; O(±1) on P¹ | exp(2πiu)=1, kernel ℤ; degrees 1, −1 | holds |
| §1.3 integral Pic | H¹=H²=0 | Pic≅H²(S,ℤ)≅ℤ¹⁰⊕ℤ/2; signature (1,0,9) by Hodge index | holds |
| §1.4 ℓ=2 tower | n=1,2,3 | H³(C)=H₁(S)⊗ℤ₂=ℤ/2; Br[2ⁿ]=ℤ/2; transitions ×2=0; limit 0 | holds |
| §1.4 ℓ odd | ℓ=3 | ℤ/2⊗ℤ₃=0 | holds |
| §1.5 normal form | (1,9); U⊕E₇(−1)⊕⟨−2⟩; scaling by 2 | 6A: k=8/8=1 copy of E₈(−1), det −1; det(U)·det(E₇(−1))·det(⟨−2⟩)=(−1)(−2)(−2)=−4; det×2¹⁰ | holds |
| §1.6 Φ | D=2F₁+F₂; D=0 | D²=4, D·F₁=1 ⇒ Φ=1; 0 excluded | holds |
| §2.1 squares | F₁+F₂, 2F+R, 2F₁+F₂, 3F+R | 2, 2, 4, 4; (2F+R)·R=0; (3F+R)·R=1; +K changes nothing | holds |
| §2.1 n=2 | h⁰=D²/2+1 | 3; 4−1−1=2 ⇒ degree 2 onto P² | holds |
| §2.2 canonical formula | A=O(4), O(3) on P² | ω_Y=f*O(1); f*O; b∈H⁰(O(8)), O(6) | holds |
| §2.3 branch transform | m=1,2,3 | B′=strict+E, strict, strict+E; A′=σ*A, σ*A−E, σ*A−E; 2A′=σ*B−2⌊m/2⌋E=B′ | holds |
| §2.3 odd–odd crossing | t²=xy, y=xv, t=xw | w²=v smooth after the extra blowup; t²=xy singular at the origin | holds |
| §2.3 embedded resolution hypotheses | Z=X (excluded); Z a reduced plane curve | Stacks 0BIC needs Z proper with finite normalization of 1-dim components; finite type over a field ⇒ Nagata ⇒ finite | holds; README hypotheses at least as strong |
| §3.2 square root | Pic(P²)=ℤ; b∈H⁰(O(8)); c=0 | A=O(4) unique; b↦c²b via t↦ct, c≠0 | holds |
| §3.2 minimal models | P², P¹×P¹ | ρ=1,2; κ=−∞ so Remark 1.1.4(1) does not apply | holds |
| §3.3 isotropic pair | h=f+g, e=af+bg+v with h·e=1, e²=0 | a+b=1 ⇒ ab≤0 ⇒ v²=−2ab≥0 ⇒ v=0 | pair unique; holds |
| §3.3 special h | h=2F+R, F·R=1, R²=−2 | h²=4F²+4F·R+R²=0+4−2=2; h·R=2F·R+R²=2−2=0, so h is not ample | holds |
| §4.1 degeneracy | ranks 4→3 | codim (4−2)(3−2)=2 in dim 4; rank 2 ⇒ 2-dim kernel (pencil) | holds |
| §4.1 symmetroid | 4×4 linear symmetric | det degree 4 vs Plücker degree 10 | holds |
| §4.2 dimensions | Gr(4,10), PGL₄ | 24, 15, 24−15=9; trivial action leaves 24 | holds |
| §5.1 Gram (f₁..f₉,δ) | all entries | det −1; δ²=10, δ·fᵢ=3; f₁₀=3δ−Σ₁⁹fᵢ verified | holds |
| §5.1 β pairings | 100 pairs | βᵢ²=−2; pairing 1 exactly on {(0,4),(1,2),(2,3),…,(8,9)}; others 0; det −4; signature (1,0,9) | holds |
| §5.1 r | r=δ−2f₁₀ | r²=−2; r·β=(0,…,0,−2); r·f₁=1 | holds |
| §5.2 A=2B | all entries | A=−(β Gram) equals the matrix with 2, −1 on edges, 0 elsewhere; generator formula x−(Σxⱼ Aᵢⱼ)eᵢ equals s_βᵢ on all ten basis vectors; signature of A (9,0,1), det −4, chain minor 10 | holds |
| §5.2 Coxeter relations | all 45 pairs | integral sᵢsⱼ has order 3 on the 9 edges, 2 on the 36 non-edges | holds |
| §5.2 subdiagrams | {0,2..8}, {0..6}, {0,2..7} | arms from node 4: (1,2,4), (1,3,2), (1,2,3) ⇒ E₈, E₇, E₇; positive roots 120, 63, 63 | holds |
| §5.2 B, K, K′ | −1 on the node span, +1 on its complement | integral, involutions, preserve the β Gram (checked entrywise); B≡I and K≡I mod 2; K′≢I mod 2 | holds |
| §5.2 IsParabolicLongest | J={i}, ∅, {1,2}, all ten | {1,sᵢ}: sᵢ length 1 wins; ∅: only 1; s₁s₂s₁ length 3 beats s₁s₂; T246 infinite ⇒ no maximum | holds |
| §5.2 Davis uniqueness | maximal-length w | l(rw)≠l(w) by parity and ≤ by maximality ⇒ (b) of Lemma 4.6.1 ⇒ w=w₀ | citation supports |
| §5.3 q | 0, e₀, e₀+e₄, u, z, u+z | 0, 1, 1, 0, 1, 1; polar b(e₀,e₄)=1, b(e₀,e₃)=0, b(e₀,e₀)=0 | holds; `decide` |
| §5.3 radical | all 1024 vectors | {0, u={0,5,7,9}, z={1,3,5,7,9}, u+z={0,1,3}} | holds |
| §5.3 generators mod 2 | all i, all x | mod-two formula x+b(x,eᵢ)eᵢ equals the integral reflection mod 2 on every basis vector; all preserve q; all fix the radical | holds |
| §5.3 G | G=K′s₉ (s₉ first) | G≡(x↦x+x₈u) on all ten basis vectors; K′(e₈)−e₈=e₀+e₅+e₇∉rad; G(e₈)=e₈+u | holds |
| §5.3 counts | q, radical class | 510 nonradical q=1, 510 nonradical q=0, 2+2 radical; orbit of e₀ has 510 elements | holds |
| §5.3 orders | Sp₈(F₂) | 2¹⁶·3·15·63·255=47,377,612,800=2¹⁶3⁵5²7·17 | holds |
| `reyeReductionImage` | Schreier–Sims on 1024 points, base e₀… | ⟨ρ(sᵢ)⟩ has order 12,128,668,876,800 (transversals 510·252·128·64·30·16·6·4) = 2⁸·\|Sp₈(F₂)\|; upper bound: kernel to Sp(V) is φ:H→{0,u} vanishing on rad, at most 2⁸ | true; `simp`, `simp_all` fail |
| `reyeCongruenceKernels` (i) | B, K | both in ker ρ (computed); the reverse inclusion is CD Prop 1(i) | consistent with the source |
| `reyeCongruenceKernels` (ii) | G | G∈ker(W→Sp(V)), G∉ker ρ; Sp(V) transitive on V*∖0 ⇒ normal closure of Ḡ is V* | follows from (i) and the full image |
| §6.1 primes | p=11; 2,3,5,7,17 | 11∤\|Sp₈(F₂)\|; each listed prime divides | holds |
| §6.2 U0 scaling | e·f=1 | (π*e)·(π*f)=2 | holds |
| §6.2 U1 | e′−f′∈U(2); e−2f∈U | squares −4, −4; divisibility 2, 1 | holds |
| §6.2 U2 | A_T | (ℤ/2)¹⁰ of exponent 2 ⇒ +id=−id; Γ(2) excludes −id since −id∉O⁺ | holds |
| §6.2 U3 | α basis | α₀=δ−f₁−f₂−f₃ meets α₃; Gram det −1 | holds |
| §6.3 527 | split q on F₂¹⁰ | 2⁹+2⁴=528 singular with 0 ⇒ 527 | holds; `martin` line 154 |
| §7.1 orbit identity | (S₃,A₃,⟨(12)⟩); H=1; H=W | 1=1; 3=3; 1=1 | holds |
| §7.2 counts | 34,780; 136 | 2²·5·37·47 with 37, 47∤\|Sp₈\| (remainders 23, 42); 2³·17=136 even forms in dimension 8 | holds |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 each ending with Examples and Dependencies, Downstream consumers, References. Every definition has an API list and at least three Checks (counted 3–7 per subsection); every target a locator and a `*Needs:*` line; no LaTeX, no process words, no pull-request numbers in the README (scanned for programme, commission, PR, review, round, checkpoint, handoff, so far, current, removed, deferred, optional).

## Not verifiable

- **Averbukh, Chapter X** (Shafarevich (ed.), *Algebraic surfaces*, Proc. Steklov 75, 1964). No legal text through the sources service; `cossec-dolgachev-1985` line 117 names only the editor. The README keeps the relation behind 34,780/136 as a reconstruction target (`README.md:755–757`), which is the right treatment.
- **Cossec–Dolgachev 1985 is an announcement.** Proposition 1 (i) is stated with "Our proof follows the idea of Looijenga" (`cossec-dolgachev-1985` lines 69–72) and no proof; `reyeCongruenceKernels` (i) rests on it. Its consistency was checked as far as finite computation allows (B, K ∈ ker ρ; the (ii) reduction to (i)).
- **Cossec–Dolgachev–Liedtke manuscript typography.** Digits are remapped in the extraction; Example 1.6.5 was read from context (lines 12282–12303).

## Source issues

- **Error** in stacks-0BXJ at Lemma 31.29.5 (tag 0BXJ), printed p. 70: the source says the Picard group of projective n-space over a UFD is ℤ with no restriction on n; it should require n ≥ 1, since projective 0-space is the base with trivial Picard group; affects a stated result.
- **Misprint** in stacks-0C5R at the proof of Lemma 54.17.1 (tag 0C5R), printed p. 52: the source says the maximal open V contains all codimension-one points of V; it should say of Y; affects the proof.
