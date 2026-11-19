# Review of ComplexMultiplicationAndExplicitReciprocity (pull request #1254 at e52ac01)

**Verdict:** accepted

**Summary.** Accepted: a full review of this head found no false or unsupported statement, and the rewritten §1.2 (embedding eigenspaces, lifted CM types, the tensor from a CM subfield, the dual action and the pairings) agrees with Kings–Sprang §§1.1–1.3 and with the supplier sections it cites. There is one small correction (three supplier labels that are not at the supplier's head) and two format notes, none blocking. One fact about the new Provenance section is left for the human reviewers.

## C01 — The three labels cited for ArithmeticStatisticsPartVII are not in that roadmap; its headings carry the content

A reader who searches ArithmeticStatisticsPartVII for `support-cm`, `cm_hecke_character` or `cm_ideal_isogeny_comparison` (README lines 143, 209, 444, 446, 448, 536, 720, 838) finds nothing. At that roadmap's open head the material stands under the heading "CM twist and descent estimates", in the subsections "CM Hecke character" (Rubin, Theorem 5.15 and Corollary 5.16) and "Cm ideal isogeny comparison" (Rubin, Propositions 5.3–5.4 and 3.14), and no line of it contains any of the three labels. The statements cited do match: the character with its norm-ideal and torsion identities, the ideal kernels of degree `N(a)`, the differential coefficient and the change-of-order isogeny for a nonmaximal order.

The smallest change is to cite the two subsections by their headings, as line 838 already does for the parent ("*CM twist and descent estimates*").

## N01 — `cmSerreTensor M A` is in code font but declared nowhere

In "Serre tensoring by a CM ideal" (README line 154) the name `cmSerreTensor` reads as a declaration of `Suggested.lean`, which has none of that name. Say "which we call the CM Serre tensor", or drop the code font.

## N02 — Three sentences use a target's title as a lower-case noun phrase

Line 79 ("On native intermediate fields, a non-galois quartic CM type and its reflex supplies …"), line 107 ("the conductor-three Gaussian order is the actual subring …", after a full stop) and line 158 ("The injectivity argument of serre tensoring by a CM ideal applies") do not parse on a first reading. Quoting the title, or capitalising it as in its heading, would fix each.

## Previous findings

- The previous review (of `fa8fcda`) had no finding. The repairs it recorded still hold at this head: `Suggested.lean` elaborates against the pinned Tau Ceti with `principalIdealAway` at lines 61 and 63; the three genus-two Checks stand at README lines 302–304; the description still reads "imported from ImaginaryQuadraticClassNumber §H3.1, on main".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.2 quartic type and reflex (line 79) | `a=i√(3+√2)`, `b=i√(3−√2)`; `b→−b` | `a⁴+6a²+7=(a²+3)²−2=0`; `ab=−√7`; `(a+b)²=−6−2√7`; `((a+b)²+6)²=28` gives `X⁴+12X²+8`; norm `7`, `14` nonsquares: `D₄` | Pass | None |
| 0.2 reflex order, `ℚ(ζ₅)`, `O=ℤ+2O_E` (line 102) | `Φ={id,σ₂}`; element `(1,0)`; `2(ζ,ζ²)` | `y≡σ₂(y)` mod `2O_E` for `y∈O`, so image in congruence order; `(1,0)` excluded; full rank, closure `O_E²` | Pass | None |
| 0.2 conductor-three order (line 89) | `O=ℤ+3ℤi` | `h=1·3/2·(1+1/3)=2`; forms `[1,0,9]`, `[2,2,5]`, both disc `−36`; units `±1`; `ℤ[i]` gives `1` and `4` | Pass | None |
| 1.1 self-twist (lines 129–139) | `y²=x³−x`, `α=i`; `3i` in `ℤ+3ℤi` | twist by `−1` is `x→−x`, degree `1`; `N(3i)=9`; `N(2+i)=5`; `[n]` degree `n²` | Pass | None |
| 1.2 lifted types (lines 145–152) | `L=ℚ(i,√(1+i))`; `ℚ(ζ₈)⊃ℚ(i)` | `N(1+i)=2` nonsquare, `√2∉L`: one quadratic subfield, `L` not CM; `2²=4` partitions, `2` lifted; `ζ₈↦±ζ₈` both fix `i` | Pass | None |
| 1.2 ideal-inclusion rank (lines 167–169) | `a⊂b`, `x∈c=ab⁻¹` exact at `ℓ`; `c=(n)`; `d=2` | `N(x)=[b:a]·z`, `z=N(xc⁻¹)` prime to `ℓ`, `za⊂xb`; `ℓ`-parts agree; `|n|^{2d}`, `n⁴` for `d=2` | Pass | None |
| 1.2 inseparable Check (lines 199–201) | `𝔽̄₅`, `i(x,y)=(−x,3y)`, `2±i` | `3²=−1`; `i^*(dx/y)=−dx/(3y)=3·dx/y`; `2+3=0` (connected, one point), `2−3=−1` (étale, five points) | Pass | None |
| 1.2 dual type and Hodge splitting (line 173) | `E=ℚ(i)`, `γ=i` | `Lie(A^∨)=H¹(A,O)=conj(ω_A)`: type `Σ̄`; `ω_A(−σ)` gets `σ(γ)⁻¹=−i`; centre `⊂L` since `dim ≤ 2d=[L:ℚ]` | Pass; KS Prop. 1.11, Cor. 1.12 | None |
| 2.1 polarized data (lines 217–249) | `(ℤ[i],i/2)`, `(2ℤ[i],i/8)`, `ξ=−i/2`; `H=[[1,1],[1,2]]` | `Tr((i/2)(−i))=1`; `E(i,1)=−1`; `E_{i/8}(2,2i)=1`, with `i/2`: `4`; `H⁻¹diag(−i,0)H=[[−2i,−2i],[i,i]]` | Pass | None |
| 2.2 reflex ideal map and conjugation (lines 255–282) | `O=ℤ+3ℤi`, `u=i`; `ℚ(ζ₅)` order mod `11` | `iO≠O`; `ζ↦3,9`: `ζ²−ζ→6,6`; conjugate `ζ⁻²−ζ⁻¹→1,9`, so `conj(O)≠O` | Pass | None |
| 2.2 idele dictionary against Milne (lines 259–263) | `f=N_Φ(t)⁻¹`, `s=t⁻¹` | Milne 9.10: `α(N_Φ(s)x)=σx`; 9.17: type `(fa, tχ_cyc/f f̄)`; 9.11(c): `c=χ_cyc/N(s)` | Pass; MilneCM lines 3264, 3364 | None |
| 2.3 reciprocity and stabilizer (lines 306–310) | Streng Thm 2.4, 2.5; `(2+i)`, `N=1,3`; `U=diag(2,2,1,1)` | `ν(M)=N(a)⁻¹`, `U=(M mod N)⁻¹`, `f^U(τ′)`; `5≡2` mod `3`, not `1`; `ν(U)=2`, `ζ₅→ζ₅²`, `det=4` | Pass; Streng lines 324–361 | None |
| 2.3 unit obstruction (line 314) | `g=1`; general `g` | principal `(u)`: `µ=N_Φ(u)`, `µµ̄=N(u)>0`, so `H⊃` principal; `U⁺/U²` order `≤2^{g−1}≤2^g` | Pass; Tsimerman p.386 | None |
| 2.4 surface example (line 353) | `P=(5,i−3)`, `3`-torsion | `3−i=(1−i)(2+i)`; `(−1+2i)/(2+i)=i`; `#E(𝔽₅)=8`, trace `−2`; `π≡2+2i`: `[[2,1],[2,2]]`, det `2=5 mod 3` | Pass | None |
| 3.1 class polynomial (lines 373–389) | `d=3,4,12,36` | `[1,1,1]`: `X`; `[1,0,1]`: `X−1728`; `[2,2,2]` gcd `2` dropped; `[1,0,9]`,`[2,2,5]`: degree `2` | Pass | None |
| 3.2 exact value field (lines 403–420) | `K=ℚ(i)`, `N=1,3,5` | degrees `1`, `8/4=2`, `16/4=4`; `g=1`: `µµ̄=N(a)` automatic, `H(N)` is the ray principal group | Pass | None |
| 3.3 Gaussian example (line 426) | `O=ℤ[i]` | `Pic=1`, `H_{−4}=X−1728`, four units one root; `N(2+i)=5` | Pass | None |
| 4.1–4.2 character and L-factor (lines 446–490) | `y²=x³−x` at `5`, `7`, `2` | `X²+2X+5`; `X²+7`, over `K`: `(X+7)²`, `ψ((7))=−7`; conductor `f(ψ)f(ψ̄)=f(ψ)²`; Cartans `8`, `16` | Pass | None |
| `canonicalGrossExistence` (4.3) | `D=−3,−4,−7,−8,−20` | RHS: F, F, T, T, F. `ζ₃`, `i` break the sign law; `−4m`: `−m` unit square with `χ_{−4}(−m)=−1`; odd: `(−1/\|D\|)=−1` | Pass; Yang (0.1)–(0.3), (B) | None |
| 5.1 Deuring, Frobenius ideal, slopes (lines 544–584) | `𝔽₂`, `𝔽₃`, `𝔽₅`, `𝔽₇`; `ℚ(ζ₅)` at `2` | points `3,4,8,8`, traces `0,0,−2,0`; `v₃(π)=1`, `v₂(π)=0`; slope `2/4` four times | Pass; MilneCM 8.1, 8.12 | None |
| 5.2 isogeny counts and level pairs (lines 590–606) | `l=2`; `(p,N)=(7,1),(7,5),(2,3)` | rows `(2,0,1)`,`(1,0,2)`,`(0,0,3)`,`(0,1,2)`, each `3`; reduced discriminants `7`, `35`, `6` | Pass; MIT22 Thm 22.5 | None |
| `classPolynomialHeightBound` (5.3) | `D=3,4`; `D≡1,2` mod `4`; `h=2` perturbation | `M≈2345.3≥0`, `2650.1≥1728`; empty census: product `1≤⌈1⌉`; `(1+δ)(2+δ)−2=3δ+δ²≤6δ+2δ²` | Pass; CRT Lemma 8 | None |
| 5.4 signed relations and conductor (lines 634–667) | order-3 and order-2 class; `q=641,t=8` | counts `2,0,4`; `64−2564=−2500=25²·(−4)`; `(D1,D2)=(−4,−100)`, `(−100,−2500)`; both directions of Cor. 4 rederived | Pass; Endo lines 235–245 | None |
| 5.5 reduction and reconstruction (lines 671–685) | `D=−23`, `p=5`; `B=10`, `M=20,21` | `(−23/5)=(2/5)=−1`; all three lower coefficients divisible by `5`: `X³`; `−10≡10` mod `20`, distinct mod `21` | Pass | None |
| Supplier labels of C01 | ArithmeticStatisticsPartVII at its open head | labels: `0` occurrences; headings "CM Hecke character", "Cm ideal isogeny comparison" present with the cited statements | Content present, labels absent | C01 |

- Source locators: 74 located at their printed page in 16 sources (Streng 7, KS 12, MilneCM 25, YZ 1, Tsimerman 2, CRT 3, Endo 4, Yang 3, MIT16 4, MIT20 3, MIT21 2, MIT22 3, GZ 2, BT 1, Kato 1, BS 1); 43 read in full against the statement.
- Library declarations opened at the pin: 32 (`LevelOne/JInputs.lean:93,99,105,185,190,395,429,450,456`; `EffectiveBounds/UnitSquares/Basic.lean:62`; `Orders/Basic.lean:63,130`, `ProperIdeal.lean:37`, `Picard.lean:34,39`, `Conductor.lean:38`, `Discriminant.lean:115`, `AwayConductor/Basic.lean:122,264`, `RayClass.lean:189`; `AbelianVariety/Basic.lean:95`, `End/Basic.lean:74,83,86`; `Isogeny/Basic.lean:139`, `Degree.lean:94`; `RankTwoDoubling.lean:51,64`; `BinaryQuadraticForm/Reduced.lean:87`, `Root.lean:65`, `Reduction.lean:177`; `ComplexConjugation/CMField.lean`). No class polynomial exists in the pinned Tau Ceti.
- Cross-roadmap citations resolved: AbelianSchemesAndArithmeticModuli (A1.2(3), A1.3a with its three sub-targets, A1.6, A2.2, A3.1, A3.9, A4.3, A4.5, A4.7a, A4.CR.7.2, A5.8, A6.1, A6.10–A6.12, A6.18, A6.37), PELModuli (M0.25, M0.27 with `unramifiedTauDecomposition` and `tauPart_decomp`, M1.3 with `OFAbelianScheme` and `HasSignatureType`), ShimuraVarieties (§§P.3, 4.2, 5.0–5.11, 8.1–8.3, `CMType` on any commutative ring), SerreWeightAndLevelOptimisation §2.6, AutomorphicGaloisRepresentationsPartII AG2.0, AutomorphicGaloisRepresentations §§1.5 and 7.3, GL2AutomorphicRepresentationsAndTransfer R17.4.16, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–16, CrystallineCohomology CR.4.7, NeronModelsAndSemistableAbelianVarieties §§1.5, 1.8, 5.1, 5.2, 5.3i, 5.6, ImaginaryQuadraticClassNumber §H3.1, ModularCurves (former labels 1A–2E mapped by its table), ModularCurvesPartII, GlobalNumberFields 7–11, Chebotarev 9. All found; ArithmeticStatisticsPartVII as in C01.
- Dependency check: `depcheck: 200 roadmaps, 2205 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No file outside the folder differs from main.
- Elaboration of `Suggested.lean`: no error; the only warnings are `sorry` at lines 72 and 95. `#check @name` for the 5 declarations: types as in the README, no binder lost, nothing changed.
- One-tactic probe on a separate copy of the file (`simp`, `rfl`, `decide`, `aesop`, `tauto`, `simp` unfolding the three definitions): neither theorem closes. No padding. Headlines: reciprocity and value field (CM.2.3, 3.2), character attachment and all-prime factorization (CM.4.1–4.2), reduction products (CM.5.5) are named in the module docstring with the missing carriers; CM.4.3 and CM.5.3 are stated.
- Pull request text: title and description agree with the head (adds a roadmap; 3 files; 5 declarations; the build sentence is true at this head).
- Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, NonordinaryCMSpecialValues, GrossZagierAndArithmeticHeights, AbelianVarietiesOverFiniteFields, AutomorphicPadicLFunctionsPartII, PELModuli, ShimuraVarieties, AbelianSchemesAndArithmeticModuli (EllipticCurveModularityPartIIGL2TypeAbelianVarieties searched only); nothing has two owners. Lifted CM types, the CM Serre tensor and the period pairings: this roadmap §1.2, cited by AutomorphicPadicLFunctionsPartII and NonordinaryCMSpecialValues; the canonical predicate: this roadmap §4.3, cited by NonordinaryCMSpecialValues; level-pair CM embeddings: this roadmap §5.2 over SerreWeightAndLevelOptimisation §2.6, cited by AbelianVarietiesOverFiniteFields; the general tensor: AbelianSchemesAndArithmeticModuli; CM types: ShimuraVarieties §5.1; signature types: PELModuli M1.3.

Source independence: 17 passages compared with 9 sources (KS 5, Streng 2, MilneCM 3, Endo 1, CRT 1, Yang 1, Tsimerman 1, MIT21 and MIT22 2, YZ 1), none shared beyond formulas and hypothesis lists the mathematics forces; largest share MilneCM, 18 of 74 locators; contents compared with MilneCM: independent (Layers 1 and 3 have no chapter there, and its §8 is used in Layer 5 after its §9 in Layers 2 and 4).

Research link: Layers 2–3 state Streng's explicit Shimura reciprocity (arXiv 2012, v4 2024); §1.2 is the CM set-up of Kings–Sprang (Annals 2025); §4.3 is the Rohrlich–Gross canonical character used by Burungale–Kobayashi–Ota (Annals 2021); §0.2 is the reflex order of Yuan–Zhang (Annals 2018). Rests on the README's References and the texts read.

## Not verifiable

- Deuring, pp.197–262: the citation resolves only to a paywalled page; the classification and lifting statements were checked against MIT21 Theorems 21.14–21.15 and MilneCM §8 instead.
- BKO, §3.0.1 and equation (3.8): the deposited copy redirects to storage the sources service does not accept.
- MilneFT §3, AGHMP §3.4 and MIT16 Definition 16.9: not opened in this round (outside the sample's changed passages).
- Provenance section: the directory, author, licence header and the carrier `QuadraticOrder (d : ℤ)` were confirmed at the cited commit; the count "thirteen files" and the contents of `CanonicalForm.lean` and `Prime/` were not.

## Source issues

- **Error** in Yang at Introduction, property (B), printed p.2: the source says canonical characters exist exactly when the discriminant is odd or divisible by eight; it should exclude discriminant −3, where the cube roots of unity violate (0.2); affects a stated result.
- **Error** in MIT21 at Theorem 21.14, printed p.10: the source says the class polynomial has distinct roots over the residue field of any ring-class-field prime of norm prime to D; it should require the rational prime to split in K (discriminant −23 at 5 gives a triple root); affects a stated result.
- **Misprint** in Endo at Proposition 5, proof, printed p.6: the source says the difference of the two prime sets is finite exactly when the first ring class field lies in the second; it should reverse the containment, here and in the next sentence; affects the proof.
- **Misprint** in CRT at Appendix 1, proof of Lemma 8, printed p.31: the source says the product defining the class polynomial runs over indices zero to h; it should run from one to h; affects nothing.
- **Misprint** in Tsimerman at §5, proof of Theorem 5.2, printed p.386: the source says the norm of an ideal of the reflex field is taken from K and counts a quotient of the integers of K; it should use the reflex field in both places; affects nothing.

## For the human reviewers

- The new `## Provenance` section (README lines 699–709) maps three inputs to `LeanPool/lean-pool`, `LeanPool/SingularModuli` (Apache-2.0 header, Caleb L. Geiger, confirmed at commit `f8b9b72`). No declaration of `Suggested.lean` shares a name or statement with it.
