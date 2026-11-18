# Review of PotentialAutomorphyInfrastructure (pull request #1081 at 5b0a4d9)

**Verdict:** accepted

**Summary.** Accepted: a full read of the folder at this head found no false or unsupported statement, and the passages rewritten since the last review (§§0.13 and 1.0, now resting on IgusaVarietiesAndTorsionConcentration IG.7.14–IG.7.15) agree with the supplier as it stands at its open head. There are five small corrections (supplier export names that the suppliers do not use, an out-of-date statement of the library pins, a misleading "for `n ≥ 2`", one sentence of the description, two hypotheses the new route no longer needs) and three format notes, none blocking. Two points are left to the human reviewers: archived author copies of two sources, and a supplier that is still a draft pull request.

## C01 — Sixteen export names are attributed to IgusaVarietiesAndTorsionConcentration, HodgeTateAndCanonicalSubgroups and PerfectoidShimuraVarieties, which do not use them

An implementer who searches the supplier for `unitaryTorsionResidual` or `heckeRestrict` finds nothing and cannot tell which statement of the supplier is meant. The names occur in §0.7a (lines 288, 307, 311, 313), §0.7b (line 331) and the supplier table (lines 2248, 2249, 2251). At the suppliers' open heads, neither README nor `Suggested.lean` contains `UnitarySimilitudeDatum`, `heckeRestrict`, `boundaryGLResidualRepresentation`, `unitaryTorsionResidual`, `coefficientChange`, `removeAuxiliaryPrime`, `coefficientCover`, `compactDual` or `frobenius` (IgusaVarietiesAndTorsionConcentration); `ShimuraTower.pLevel`, `infiniteLevel`, `TauCeti.HodgeTate.openTowerHodgeTateMap`, `canonicalSubgroup` or `quotientHasseRadius` (HodgeTateAndCanonicalSubgroups; three of these occur only in PerfectoidShimuraVarieties' README, as names it too attributes to that roadmap); `HodgeTower.imageCompactification` or `minToImage` (PerfectoidShimuraVarieties). The cited sections exist and do state the content: IG.0.3–IG.0.6, IG.6.6a (the twist `ρ = σ ⊗ ε`, the finite-cover filtration, the compact-support form), IG.6.6b (the residual system, the two-prime removal of auxiliary ramification), and the cited sections of the other two.

Smallest change: cite each export by its section and say what it is in words ("IG.6.6b's residual representation and its two-prime removal of the auxiliary ramification"), or keep a name only where the supplier's README carries it. The TorsionCohomologyInfrastructure names in the same rows (`perfectoidComparison`, `heckeContinuity`, `finiteLevelDescent`, `classicalAmbientDeterminant`, `unitarySimilitudeBoundaryAdapter`, `finiteTorsionDeterminant`, `residualRepresentation`, `completedCohomology_vanishing`) do occur there and need no change.

## C02 — The supplier contracts name library commits that are not the pins

Line 2218 reads "Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`." The branch's `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, so a reader who checks a declaration at the commits the README names is looking at another library. Every declaration of the two tables is present at the actual pins (file and line under Verified sound), so nothing else changes. Would either state the manifest's commits or drop the hashes and say "at the pins of the manifest".

## C03 — The unitary positive monoid is a proper submonoid of the `GLₙ` one for every `n ≥ 1`, not only for `n ≥ 2`

§3.19 (line 1315) has "`T(F_p^+)^+ ⊂ T_n(F_p)^+` (strictly for `n ≥ 2`)", its third Check (line 1330) and the route of §3.20 (line 1338) repeat the restriction, and a reader takes equality at `n = 1`. At `n = 1` the Levi torus has `N₁` trivial, so `T₁(F_p)^+` is all of `T₁(F_p)`, while `T(F_p^+)^+` is the set of `(t₁,t₂)` in the diagonal torus of `GL₂(F_ṽ)` with `v(t₁) ≥ v(t₂)`; the element `(1, ϖ_ṽ)` lies in the first and not in the second. The second Check of the same section (exponents `(1,0)` at `n = 1`) already uses this. Smallest change: "strictly, for every `n ≥ 1`", in the three places.

## C04 — The description says no README identifier is absent from the Lean file, which declares nothing

The description's validation paragraph has "no README identifier absent from the Lean", two sentences after "`Suggested.lean` declares nothing". The README writes about 140 of its own targets in code font (`integral_model_comparison` at line 158, `fontaine_laffaille_automorphy_lifting` at line 2160, …) and none is declared. Text that would be right: "the README's code-font target names are proposed names; `Suggested.lean` declares none of them".

## C05 — §§0.13 and 1.0 keep `[F⁺:ℚ] > 1` and "length at most two", which the route they now rest on does not need

Both statements (lines 398 and 426) are now defined as specializations of IG.7.14–IG.7.15, and IG.7.14 says of its own statement that neither `[F⁺:ℚ] > 1` nor a bound on the length of the residual representation is assumed; the two hypotheses are those of Caraiani–Scholze Theorem 1.1 (`cs` lines 195–203) and ACC Theorem 4.3.3 (`acc` lines 3090–3098), the earlier route. The statements are true as written and every consumer in Layers 1 and 3 has `[F⁺:ℚ] > 1` for other reasons (two `p`-adic places of `F⁺`), so nothing fails; but a reader of the supplier table ("with `d=n²[F⁺:ℚ]`, length at most two and weak decomposed genericity") will think the supplier imposes them. Would either drop the two hypotheses, or say in one clause that they are kept to match ACC Theorem 4.3.3 and are not needed by IG.7.14.

## N01 — About 140 target names in code font are declared nowhere

A reader who searches for `siegel_coefficient_retract` or `ordinary_local_global` finds no declaration and cannot tell a proposed name from an existing one. One sentence in Conventions saying that code-font names of targets are proposed names would settle it.

## N02 — Koshikawa and Caraiani–Newton are named in the text but have no entry in References

Lines 428 and 2251 name "Koshikawa's global vanishing" and "the Caraiani–Newton middle-degree export", and the locator of §0.13 (line 404) still gives only Caraiani–Scholze. Either add the two works to References, or say at the locator that they are cited as in IgusaVarietiesAndTorsionConcentration IG.7.14–IG.7.15.

## N03 — The scope paragraph on highest-weight theory could name the pinned Weyl construction

Line 2206 explains why `RepresentationTheory/LieHighestWeight` supplies no integral lattice. The pinned Tau Ceti also has `TauCeti.YoungTableau.weylModule` (`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean`, line 132), which requires `[Algebra ℚ k]` and so gives no lattice over `O` either; one clause saying so would save a reader the search.

## Previous findings

- The previous review (of `eeb6a5b`) was an acceptance with no finding; there is nothing to repair. Its two earlier points about the description stay repaired: the description still reads "`Suggested.lean` declares nothing" and still attributes the review repairs.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, degrees | `n=2, f=2` | `d=8`, `qGL=2`, `ℓ₀=3`, `2·2+3=7=d−1`; dual of degrees 2–5 under `i ↦ d−i` is 3–6, `qpatch=3` | holds |
| §0.3 unitary row | `(2),(−3)`; `(2,1),(−3,−4)`; `n=1`, both `(1)` | `(3,2)`; `(4,3,2,1)`; `(−1,1)`, dominance needs `−1 ≥ 1`, fails | holds |
| §0.4/0.6 lattices | `GL₂`: `(p−1,0)`, `(p,0)`, `(0,1)` | pairing `⟨λ+ρ,β^∨⟩ = p`; determinant `∏ a!(p−1−a)!` unit; `(p,0)`: factor `0!·p!`; `(0,1)`: zero | holds |
| §0.7a exponent | general `a,j`; inert `q_{v⁺}=3` | `j(1−2a+j)/2 + j(a−1) = j(j−1)/2`; `q_v=9`, constant coefficient `9·T̃_{v,2}` | holds; agrees with IG.6.6b |
| §0.7b polynomials | `m=1,q=3,T=2`; `m=2,q=2,T=(3,5)` | `1−6X` ↔ `Y−2`; `1−6X+40X²` ↔ `Y²−3Y+10` | holds; same values as IG.6.6a's Checks |
| §0.13 (changed; C05) | dual ideal at split `l`; `S` smaller than supplier's | eigenvalues `l^{2n−1}α_i⁻¹`; `α_i ≠ lα_j` ⇔ dual condition; `H_𝔪` is a summand of `H` at the contracted ideal | holds |
| §1.0 (changed; C05) | long exact sequences | `H^{d−1}(V/ϖ)=0 ⇒ H^d(V)[ϖ]=0`; `H_c^{d+1}(V)/ϖ ↪ H_c^{d+1}(V/ϖ)=0`, Nakayama, so `H^d → H^d_∂` onto | holds; IG.7.6, IG.7.15 say the same |
| §0.9/0.10 Siegel retract | `n=1`: `(2,−3)`; both `1`; zero | `λ̃=(3,2)` dominant; `(−1,1)` not, `V_λ̃=0`; zero weight dominant with equality | holds |
| §1.16 FL compatibility | `n=2,p=7`; general | bound `≤ p−2n−1 = 2`; `λ₁−λ_n+n−1 ≤ p−n−2 < p−2`; `{5,2,1,0} ⊂ [0,5]`, `⊄ [0,4]` | holds |
| §1.14 | `m=1`; `m=2`, `C={3,4}, D={1,2}` | `a=d` forces `d+1 ∈ {c+1,d}`, impossible; of six `A`, only `{3,4}` keeps `2m` elements after the shift | holds |
| 2.5 Auxiliary extensions | `N=1`; unramified quadratic completion | `E=F`, also when `A=F`; local degree 2 ≠ 1, not split; `blggt` lines 4120–4154 | holds |
| §2.6 congruences | `p_b=5, p_c=41` | `41 ≡ 1 mod 20`; `−41 ≡ 4`, square mod 5; `−5 ≡ 36 = 6²` mod 41; `p_c ≥ 21 > 6` | holds |
| §2.3 base change | `E=F`; CM-induced `π` | identity; `r|_{G_E}` reducible, base change not cuspidal; `r ≅ r⊗η` forces reducible restriction | holds |
| §2.12 large image | `M=ℚ(√2)`; `ℓ=2,3` | `(X²−√2X+1)(X²+√2X+1)=X⁴+1`; `SL₂(𝔽₂)≅S₃`, `SL₂(𝔽₃)^{ab}=ℤ/3`; `acc` lines 7698–7703 | holds |
| 2.15 Symmetric-power avoidance | `n=1`; bound against §2.14 | `Sym⁰` trivial, no pair `i≠j`; `m=n−1`: `2m+3 = 2n+1 < 2n+5`; `qian` lines 479–486 | holds |
| §2.16 inversion | `𝔽₇`, `A=diag(2,3)` | `P_A=X²+2X+6`; `P_{A⁻¹}=X²+5X+6`; `6·(1+2X+6X²)=X²+5X+6` | holds |
| 2.19 Pure upgrade | equal moduli; `χ₂=χ₁∣·∣` | ratio of modulus `1 ≠ q^{±1}`, irreducible; ratio `q`, reducible; `bcgnt` lines 2922–2936 | holds |
| 2.26 Prime-field image | quartic twist, `M=ℚ(i)`, `l ≡ 3 mod 4` | residue field `𝔽_{l²}`; projective image inside `PGL₂(𝔽_l)`, cannot contain `PSL₂(𝔽_{l²})`; `bcgp` lines 12145–12146 | holds; README's restriction needed |
| 3.15 Classical control | `b=0`; `(b,c)=(1,1)` | `T_n(O)(0)=T_n(O)`, quotient trivial; quotient `∏ T_n(k_v)`; `acc` lines 4142–4147 | holds |
| §3.19 monoids (C03) | `n=1`, `t=(1,ϖ)` | `v(t₁)=0 < v(t₂)=1`: not in `T(F_p^+)^+`; in `T₁(F_p)^+` since `N₁=1` | strict at `n=1` too |
| §3.20 Satake images | relation `Ũ_{vᶜ,i}=Ũ_{v,2n−i}Ũ_{v,2n}⁻¹` | `i<n`, `i=n`, `i>n`: both sides give `U_{v,n−i}U_{v,n}⁻¹`, `U_{v,n}⁻¹`, `U_{vᶜ,i−n}U_{v,n}⁻¹` | holds |
| 3.35 Degree shifting | `w=1`; `w=w₀^P`; `n=1,f=2` | `l(x)=d−l(w)`: `d`, `0`; target degree `j−l(w)`; `d=2`; `acc` lines 4698–4705 | holds |
| §3.36 weights | `i=1..n²`; `i=0` | shuffle length `Σ X_i − n(n+1)/2 = nx+n−r = n²−i`; block exchange `n²`; `a_i ≡ M/8 mod M/2`, `(p−1) ∣ M/8` | holds |
| 3.38 Determinant torus | `f=1,2`; neat `K` | dimensions `0`, `1`; `det g` a root of unity lies in every eigenvalue group, so `F^×∩det K` torsion-free; `acc` lines 4877–4885 | holds |
| 3.39 Component product | `n=1`; degrees | `Γ¹_g` trivial, map `z ↦ det(g)z`; `f(n²−1)+(f−1)=d−1`; `acc` lines 4886–4920 | holds |
| §3.41 all degrees | `k ≤ f(n²−1)` | `i=⌈k/f⌉ ≤ n²−1`, `j=if−k ∈ [0,f−1]`: every fibre degree occurs in some `H^{if}` | holds |
| 3.41b Refinements | `n=1`; conjugate place | values `Ũ₁`, `ε⁻¹Ũ₂/Ũ₁`, product `ε⁻¹(Art ϖ_v)Ũ₂`; index `j ↦ 2n+1−j`; `acc` lines 5134–5156 | holds |
| §3.43 ordinary compatibility | `n=2`, `ρ` upper triangular | `A=[[0,a],[0,c]]`, `B=[[e,b],[0,0]]`: `AB=0`, `BA=[[0,ea+bc],[0,0]]` | holds; order matters |
| §3.46 Steinberg | `GL₂(ℚ₅)`: `ψ(5)=1`; `ψ(5)=25, c=2` | `δ_B=1/5`, `U=1`; `25, 625` normalized to `1, 1`; reversed sign `625, 390625` | holds |
| §4.4/4.5 Hida twist | `μ=(2,0)`; `O[C_p]`, `κ(t)=ζ_p` | `ν+w₀μ=(0,3)`; `t ↦ ζ_p` on `B`, `ζ_p²` in the other order (`≠ ζ_p`, also at `p=2`) | holds |
| 4.8 Component comparison | general; `n=2,f=2` | `dim S∞ = n²∣S∣+qn`; `dim R∞ = 1+g+n²∣S∣+n(n−1)f = dim S∞−(nf−1)`; `ℓ₀=3`; `acc` lines 6244–6251, 7010–7015 | holds |
| 4.9 Derived support | zero complex; nilpotent `J` | hypothesis (3) of the assumption fails, no vacuous conclusion; `V(J)=Spec`; `acc` lines 6273–6308 | holds |
| §5.3 Hecke algebra | `n=2`; `k=𝔽₅`, `M=𝔽₂₅`, `γ²=2` | `[K:B]=q+1 ≡ 2`; Frobenius sends `γ ↦ −γ`; `dim k[S₂]⊗M_𝔪 = 4 ≠ 2`; `[K]M=𝔽₅` | holds; splitting needed |
| 5.4 Properness | `T=O×O` over diagonal; `q ≡ 1` | two maximal ideals above `(ϖ)`; `q^{i(1−i)/2}α₁⋯α_i ≡ α₁⋯α_i`; `acc` lines 6829–6839, `kt` lines 1208–1215 | holds |
| 5.6 Hecke locality | `Q=∅` | `Δ_Q` trivial, map the identity; nilpotent annihilator gives full support; `acc` lines 6862–6870 | holds |
| 5.12 FL lifting, good level | `n=2, λ=0`; `n=1` | `HT={1,0}`; `{λ}`; conclusion as `acc` lines 6757–6768 | holds |
| 5.16 Ordinary diamond map | `Q=∅`; `C_p` factor | recovers §4.7; `t ↦ ζ_p` with diamonds adjoined; `acc` lines 7386–7392 | holds |
| §5.13 auxiliary places | degree-one `v`, unramified `l` | `l` splits in every quadratic subfield; scalar Frobenius, `q_v ≢ 1`: `H⁰(ad ρ̄(1))=0` | holds |
| §5.22 FL lifting | `n=1` | weight bound `0 < p−2`; `ad ρ̄` trivial, (4) reads `ζ_p ∉ F`; no polarization hypothesis | holds |
| §5.23 ordinary lifting | `n=2, λ=(2,0)`; `n=1` | exponents `−(λ₂+0), −(λ₁+1)`: weights `{0,3}={λ_i+n−i}`; forced `λ_τ+λ_{τc}` constant | holds |

- Source locators read against the text: 34, in `acc`, `qian`, `bcgnt`, `bcgp`, `blggt`, `kt` and `cs` (the fifteen sampled targets, §§0.13, 1.0, 2.1, 2.12, 2.14, 2.17, 2.20, 2.24–2.25, 3.37, 3.41a, 5.2, 5.5, 5.14–5.15); every page locator among them agrees with the printed page.
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): `CategoryTheory.Retract` (`Mathlib/CategoryTheory/Retract.lean`:27, `map` :58, `refl` :76), `DerivedCategory.Q` (`Algebra/Homology/DerivedCategory/Basic.lean`:95), `Module.support` (`RingTheory/Support.lean`:47), `Matrix.charpoly` (`LinearAlgebra/Matrix/Charpoly/Basic.lean`:140), `Matrix.reverse_charpoly`, `Matrix.charpoly_inv` (`Charpoly/Coeff.lean`:292, 313), `Subgroup.goursat_surjective` (`GroupTheory/Goursat.lean`:107), `rank_two_simple` (`Projectivization/PSL/PSL2.lean`:139, `4 ≤ Nat.card F`); `isSolvable_algEquiv` (`TauCeti/NumberTheory/LocalField/Solvable.lean`:52), `hasDirichletDensity_frobeniusPrimeSet`, `hasDirichletDensity_splitCompletely`, `infinite_frobeniusPrimeSet` (`Chebotarev/Density/Chebotarev.lean`:51, 67, 74), `frobeniusPrimeSet` (`Chebotarev/FrobeniusPrimeSet.lean`:93).
- Cross-roadmap citations resolved: IgusaVarietiesAndTorsionConcentration IG.0.3–0.6, 5.1, 6.6a, 6.6b, 7.4, 7.6, 7.14, 7.15 read in full at its open head; the cited headings of TorsionCohomologyInfrastructure, HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties and PotentialModularityAndCompatibleSystems (§§1.9, 1.14, 1.21, 2.15, 2.16) confirmed; 29 cited names or sections of roadmaps on main confirmed (C01 lists the names that fail).
- Headline theorems (§§0.9–0.10, 1.16, 2.3, 2.12, 3.43, 3.48, 4.5, 5.11, 5.22, 5.23): none is statable at the pins, which have no automorphic representations of `GLₙ(𝔸_F)`, crystalline or Hodge–Tate conditions, deformation rings, arithmetic locally symmetric spaces or integral dual Weyl lattices; the module docstring names the missing carriers layer by layer. `Suggested.lean` declares nothing, so there is no padding probe and no `#check` comparison to run.
- Automatic checks: all passed at this head. `lake env lean` on `TauCetiRoadmap/PotentialAutomorphyInfrastructure/Suggested.lean`: exit 0, no output. Dependency check, verbatim: `depcheck: 206 roadmaps, 2253 edges, 0 problem(s)`. No file outside the folder differs from the merge base.
- Overlap check: read CrystallineLocalGlobalCompatibilityCM, PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, AutomorphicGaloisRepresentationsPartII, ArithmeticLocallySymmetricSpaces, LocalGaloisDeformationRings; integral dual Weyl modules, soluble and cyclic auxiliary extensions and `ι`-ordinarity are owned here and cited from the first two by section; general algebraic induction is ReductiveGroups §1.1's and is cited; rank-two reducibility and density-one statements of PotentialModularityAndCompatibleSystems §§1.14, 1.21 have other hypotheses (weak systems over `ℚ`, regular weak systems), as §§2.24 and the supplier table say. Nothing has two owners. No open pull request changes this roadmap and no cited id is dropped.
- Source independence: 34 passages compared with 7 sources, none shared (longest common word run outside bibliographic titles 12 words, in a statement whose formulas force it; the one-sentence definition of "nearly faithful" in §5.6 is the standard one); largest share `acc`, 123 of 167 locators; contents compared with `acc`: independent as a whole (Layer 0 draws on §§2 and 4.2, Layer 2 on §§6.5.12 and 7.1 and four other papers and stands before Layer 3, §6 is divided between Layers 4 and 5, §3 has no layer); `Layer 1 ↔ §4` and `Layer 3 ↔ §5` keep the source's internal order, which the *Needs* lines force (1.4 needs 1.2–1.3, 1.8 needs 1.4, 1.11 needs 1.8–1.10, 1.15–1.16 need 1.11–1.14; 3.12 needs 3.8–3.11, 3.15 needs 3.12–3.14, 3.33 needs 3.28–3.32, 3.43 needs 3.42).
- Research link: Layers 1, 3 and 5 are the local–global compatibility and automorphy lifting theorems of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne (2023); Layer 2's lemmas are those Qian (2023) and Boxer–Calegari–Gee–Newton–Thorne use for potential automorphy and Sato–Tate over CM fields. Rests on the README's Summary and References and on `acc` §6.1, `bcgnt` §6.1, `qian` §2.

## Not verifiable

- Koshikawa's Theorem 1.3 and Caraiani–Newton's Theorems 2.1.26 and 2.1.28: not opened; §§0.13 and 1.0 were checked against IG.7.14–IG.7.15 as that roadmap states them, not against its sources.
- Jantzen II.5.5–5.6, Platonov–Rapinchuk–Rapinchuk Theorem 2.15, Harris–Taylor Lemma VII.2.6, Arthur–Clozel Chapters I and 3: books, no legal copy read.
- Geraghty's 2010 manuscript, Larsen, Larsen–Pink, Newton–Thorne, Chenevier, ERA 979, Zelevinsky and Scholze's torsion paper: not opened this round (none is in the sample).
- Qian's journal pagination (pp. 1241, 1251, 1273–1274): read in the NSF-hosted PDF, where Lemma 2.6 is on physical page 13 as the README says; the journal page numbers are the README's concordance.
- The works cited "as the sources cite them" in the last paragraph of References.

## Source issues

- **Misprint** in acc at the proof of Theorem 6.5.4, printed p. 1070 (two occurrences): the source says the number of power-series variables is `g = qn − n[F⁺:ℚ]`; it should be `qn − n²[F⁺:ℚ]`, as defined on p. 1067 and as its own dimension count requires; affects nothing.
- **Misprint** in acc at the proof of Theorem 6.6.2, printed p. 1081: the source says `g = qn − n[F⁺:ℚ]`; it should be `qn − n²[F⁺:ℚ]`, as defined on p. 1080; affects nothing.
- **Error** in bcgp at Lemma 9.1.10(3), printed p. 252: the source says the residual image contains `SL₂` of the full coefficient residue field for a density-one set of primes; it should be a conjugate of `SL₂(𝔽_l)`, which is what the cited ACC Lemma 7.1.3 gives (a quartic twist with `l` inert in `ℚ(i)` is a counterexample); affects a stated result.
- **Misprint** in kt at the paragraph between Lemmas 5.2 and 5.3, manuscript p. 26: the source says the isomorphism of the centre with the spherical algebra sends `e_i` to `q^{i(n−i)/2}T_i`; it should be `q^{−i(n−i)/2}T_i`, the Satake transform sending `T_i` to `q^{i(n−i)/2}e_i`; affects nothing.

## For the human reviewers

- Licence: References link Geraghty's 2010 manuscript and Larsen's "Maximality of Galois actions for compatible systems" through web.archive.org snapshots of the authors' former pages (`TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md` lines 2339 and 2345), not a live author page or the publisher.
- Merge order: §§0.7a, 0.7b, 0.13 and 1.0 rest on IgusaVarietiesAndTorsionConcentration, whose pull request (#1090) is still marked draft; its IG.7.14–IG.7.15 were read at that head.
