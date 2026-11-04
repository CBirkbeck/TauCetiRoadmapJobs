<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6398948684 -->
Review (codex) of 6faad34

Verdict: needs_changes

1. **F01** (P1) The dyadic Check uses the wrong degree-three Selmer group

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:172`, “the polarized Selmer Euler count must retain h³”.

   **Claim:** In the newly imported dyadic ordinary setting, a scalar adjoint invariant forces h³=1; the numerical example then asserts h¹=5 rather than 6.

   **Witness:** BCGP25 line 5567–5571 gives h³=0 for nonempty T. The named supplier, `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md:125`, says the same. The Check has #T=3, so its asserted h³=1 contradicts 0.

   The scalar invariant calculation itself is correct. The inference to this deformation complex is not. BCGP uses Thorne's complex, the full polarized strict-conjugacy group and the local classes µ_v. Its surviving scalar class is in the dual H¹, identified with H²: BCGP25 line 5640–5649. By contrast, `TauCetiRoadmap/GlobalGaloisDeformations/README.md:2055` gives a degree-three invariant formula in its odd-p polarized problem; line 2057 explicitly uses prime-to-p index-two descent. That formula cannot be transported to p=2 by substituting transpose for negative transpose. The repair report's numerical Euler row does not check this carrier change.

   **Exact repair:** Replace this Check with the dyadic supplier's actual assertions: for T nonempty, h³=0 and h²=h¹ of the dual Selmer group; the scalar class survives in that dual group at sufficiently deep Taylor–Wiles level. Retain a discriminating scalar-pairing calculation: for n=2 in characteristic two, Tr(I₂)=0, so the scalar-class pairing is zero. Remove the h¹=5/6 comparison, whose Euler formula is not supplied for this complex. Cite BCGP25 §5.4, pp.122–123, and Lemma 5.5.3, p.125. Do not change the supplier to agree with the erroneous Check.

   **Repair test:** On the original n=2, #T=3 instance, the replacement gives h³=0 and Tr(I₂)=0. If h²=1, it gives dual-Selmer dimension 1; it makes no unsupported numerical assertion about h¹. This preserves the genuine dyadic scalar phenomenon in the correct degree.

2. **F02** (P2) Multiplicity one is measured over the wrong field at a general point

   **Location:** `packages/GSp4NonregularModularityLifting/README.md:1546`, “Let q′ be a characteristic-zero point” and “dimE(M_w/q′M_w)[1/p]=1”.

   **Claim:** Every nonzero sufficiently regular arithmetic fiber on the specified component is one-dimensional over the fixed coefficient field E.

   **Witness:** BCGP25 line 8085–8086 requires q′=ker(RS→O). A rank-one fiber with residue field E′=ℚ₇(√3), over E=ℚ₇, has dimensions dim_E=2 and dim_E′=1. The squares modulo seven are 0,1,2,4.

   The source's E-dimension conclusion, BCGP25 line 8096–8098, is for an O-valued point. The package's standing finite coefficient field does not split every later arithmetic point. For example, the free module A over A=E[t] has fiber E[t]/(t²−3) at that closed point: nonzero rank one, but E-dimension two. This is a coefficient-field witness to the omitted hypothesis, not a purported construction of an automorphic counterexample.

   **Exact repair:** State the result for closed arithmetic q′ with finite residue field E′=κ(q′), using `dim_E′(M_w ⊗_RS E′)=1`. Explain application of the source after a finite coefficient extension containing the point and its refinements; retain the chosen component, conductor, regularity and nonzero-support hypotheses. Equivalently, make O′-valued points and the enlargement E′/E explicit throughout the application. Update the fiber Checks in §§11.3 and 11.5 to name the fiber's residue field. This retains the intended generality instead of silently restricting all points to E.

   **Repair test:** The same quadratic fiber has E′-dimension 1; an E-rational fiber has E-dimension 1; the zero fiber has dimension 0 and remains excluded. Restriction of scalars gives the correct formula dim_E=[E′:E] for a rank-one fiber.

3. **F03** (P3) Correct two BCGP25 locators

   **Locations:** `packages/GSp4NonregularModularityLifting/README.md:152`, “hypotheses used in BCGP25 Lemma 7.5.2”; and line 1338, “Definitions 7.1.1–7.1.2”. The first also occurs in the matching `gsp4-ordinary-neat-refinement-lines` entry of `packages/GSp4NonregularModularityLifting/design/plan.json`.

   **Claim:** Lemma 7.5.2 supplies the selected p/r refinement lines, and 7.1.2 is a definition.

   **Witness:** BCGP25 line 8026–8033 concerns conductor constancy away from p. The p/r refinement-line argument is at line 8119–8126. BCGP25 line 6933 labels 7.1.2 a lemma giving examples, following Definition 7.1.1.

   **Exact repair:** Point the refinement-line contract, in both README and the corresponding top-level plan gap, to the proof of Lemma 7.5.8, pp.176–177, especially p.177; it invokes BCGP21 Propositions 2.4.24 and 2.4.26. Keep Lemma 7.5.2 for its actual conductor use in §11.3. Replace the second locator by “Definition 7.1.1, Lemma 7.1.2 and Hypothesis 7.1.3, pp.153–154”. The requested objects and supplier ownership need no change.

   **Repair test:** At ℓ=p the revised passage explicitly supplies the simultaneous ordinary eigenspace; at ℓ=r it supplies the selected Iwahori eigenspace. At ℓ≠p,r the existing conductor citation still applies. Definition 7.1.1 and Lemma 7.1.2 now resolve to the two different source objects.

Three findings: one P1, one P2 and one P3. The package is repairable. Its previous ownership and theta-range defects have been repaired, subject to the settled external supplier-admission issue. The new dyadic Check imports the wrong Selmer-complex convention, and the regular multiplicity statement drops a coefficient-field hypothesis. No package mathematics, metadata, plan or source-manifest entry was changed by this review.

## Previous findings checked

The round-two review and the round-three repair report were read first. The changed passages were then compared with the earlier input and checked independently. The repair report calls the three prior findings F01–F03.

| Prior finding | Repaired passage in the present README | Status and verification |
| --- | --- | --- |
| F01: vector-theta domain | Line 731: “For p>3, j≥k+2≥4 and j−k<p−2” | **Repaired.** CG20 Proposition 8.9, line 2403, and Theorem 8.11, line 2449, distinguish the construction and injectivity ranges. At p=7, (2,2) has impossible target symmetric degree −2 and is now excluded; (4,2) gives degree 0; (6,2) is constructible but fails 6<6 for the injectivity application. The uses in §§4.5,4.7,4.8,5.1 retain the narrower range. |
| F02: wrong local-condition owner | Line 110: “§2.25 supplies `GSp4.MinimalAt`” and “Section 6.14 supplies `GSp4.SiegelOrdinary`” | **Repaired.** Both names and their Artinian-orbit/split-plane conditions exist at the cited open head. The rest of the package now distinguishes §6.3 full flags, §6.26 tangent comparison, odd-p §6.27 and all-p §6.29. The square-zero orbit and flagged-plane controls below discriminate the conditions. |
| F03: duplicate ordinary-support construction | Line 13: “The arbitrary-rank dyadic definite-unitary ordinary tower, control, finiteness and reduced R=T are stated by OrdinaryAutomorphicFormsAndModularityLiftingPartII OL.1–OL.3” | **Package ownership repaired; external admission settled.** The duplicate layers are gone; §11.4 applies the imported results. OL.1–OL.5 exist at the supplied board head. The repair report's reason that admission and merge-order placement of that separate design cannot be effected by this package is correct. It is not re-raised. R01 concerns a new mathematical Check, not that settled administrative issue. |

The recurring patterns were searched throughout the README, its dependencies, gaps and Lean docstring. No unrestricted vector-theta use, old §2.12/§6.28 local-condition substitution, or second construction of the regular ordinary support theorem remains.

## Verified sound

**Coverage and principles.** Read all four package inputs, all 61 numbered targets and their APIs, all 65 Checks blocks, all 12 layer Examples and Dependencies, every Needs line, the 20 gap entries, and the prior computed review tables. The Checks blocks contain 209 bullets, with at least three per block. The changed passages and all 15 seeded targets were reviewed afresh. For unchanged passages, reuse was confined to the earlier review's rows containing explicit computed values; those include the remaining target/API/convention and layer-example controls. R01 shows why a previous numerical row is not evidence for identifying two different complexes.

The scope builds a genus-two application on named earlier owners. General coefficient, deformation, analytic-family, classification and patching theories are imported. The CG and P12 prime/weight ranges remain the ranges of those distinct results; the BCGP branch retains p=2 and does not replace it by an odd-prime shortcut. No computational algorithm, copied source passage, sorry'd data, free-Prop headline, `set_option`, or duplicate Lean declaration was found. The package does not re-plan a main-branch roadmap. Main-branch `TauCetiRoadmap/ModularForms/README.md` and `TauCetiRoadmap/ClassFieldTheory/README.md` were read as shape comparisons. The package has the requested summary, scope, conventions, exact contracts, layered prose, examples, dependencies, downstream consumers and references. Definition APIs and Checks remain in the README.

**Source sample.** All seven manifest texts were readable from the supplied legal cache. The manifest fixes the actual preprint/author-version numbering; CG20 printed pages equal its PDF pages plus 800. There were no author-flagged unverified locators. The following are the 15 independently read seeded targets; each row records the locator and the hypothesis comparison, not merely a title match.

| Target | Source text read | Result |
| --- | --- | --- |
| 2.1 coefficient fields | P20 line 1055–1110; Theorem 5.3.1, pp.24–25 | Canonical/subcanonical coherent eigensystems in all stated degrees; finite number field and semisimple realization supported. The preceding parameter-sign misprint is recorded below. |
| 2.5 ordinary weight-two representation | BCGP25 line 605–678; Theorem 1.8.17, pp.13–14 | Ordinary weight two, split coefficient prime, full multiplier ε⁻¹ and ordered triangular shape retained. |
| 2.6 monodromy upgrade | BCGP25 line 679–691; Remark 1.8.20, p.14 | General type, purity and adjoint holomorphy are retained; semisimplification alone is not claimed to determine monodromy. Local uniqueness is a named gap. |
| 2.7 dual-spin interpolation | BCGP25 line 5008–5038; Lemma 4.12.1, p.112 | Both smooth characters, full multiplier, Weyl chamber and cyclotomic factors retained; the double-inverse misprint is not propagated. |
| 4.3 source/enlarged spaces | CG20 line 2523–2539 and 2616–2744; Theorem 8.13 and Lemmas 8.15–8.17, pp.864–871 | Source section space and U-stable formal envelope are distinct; primary decomposition is used for the normalized projector. |
| 4.8 two injections | CG20 line 2525–2556, 2817–2868 and 2925–2994; Theorem 8.13 and its proof, pp.864–877 | Both labelled roots, cuspidality, Hasse shift and corrected theta range retained. Finite-length induction uses a nonzero torsion layer, not only direct reduction of a vector. |
| 5.1 unramified plane | CG20 line 1789–1821; Theorem 6.17, pp.845–846 | The two lines lie in the same representation; residual independence and the multiplier comparison give the split isotropic plane. |
| 7.2 H² and torsion-free homology | CG20 line 1997–2020, line 931–966 and line 2999–3034; Assumption 7.7, Remark 7.8, Lemma 7.9, Theorems 5.1 and 9.1(6), pp.851–852, 822–823, 878 | Vanishing implies divisibility of the correct E/O cohomology and torsion-freeness of its dual. The selected rank comparison remains an independent supplier contract. |
| 8.3 a≥4 minimal theorem | CG20 line 38–81, 519–542 and 2999–3080; Theorems 1.1–1.2 and 9.1, pp.801–803, 813–814, 878–880 | Full big-image/local hypotheses and 4≤a<p−1 retained. The selected-balance and fixed-multiplier corrections are explicit, rather than consequences inferred from whole-module balance. |
| 9.1 P12 admissibility | P12 line 639–691, 952–1005, 1129–1150 and 1768–1800; §§3.2,5,7.1, pp.13–14,19–20,23–24,35–36 | Ordered flag, tame hypotheses and p ranges retained. Opposite ratio directions and exponent signs are quarantined in the declared orientation contract. |
| 9.4 parabolic lifting | P12 line 1849–1896; §7.4 and Theorem 7.3, pp.37–38 | One-variable parallel-weight branch, middle-character ratio and minimal ordinary hypotheses retained; no automatic identification with the opposite flag convention. |
| 10.1 characteristic-zero data | BCGP25 line 6927–6969 and 7683–7691; §7.1 and Definition 7.4.1, pp.153–154,167–168 | Integral enormousness, purity, actual unramifiedness of ρ, stabilization and separate dyadic congruence retained. Minor locator correction R03. |
| 10.2 four modules | BCGP25 line 7641–7767; §§7.3–7.4, pp.167–169 | Four chambers, dual Iwasawa modules, inverse torus convention, partial central condition and two torus directions per auxiliary prime retained. |
| 10.3 freeness | BCGP25 line 7662–7680 and 7768–7771; Lemmas 7.3.8 and 7.4.7, pp.167,169 | Projectivity precedes freeness over the local diamond algebra. The central quotient has odd order in the dyadic neat case; no division by the Weyl order eight. |
| 11.3 regular multiplicity | BCGP25 line 8011–8033 and 8082–8126; Proposition 7.5.1, Lemmas 7.5.2/7.5.8, pp.174–177 | Nonzero support, component, conductor and regularity inputs are present. The O-valued-point hypothesis was dropped: R02. The refinement gap has the incorrect pinpoint in R03. |

The changed ordinary imports were additionally checked against BCGP25 line 6088–6109 (all six hypotheses of Theorem 5.7.14), line 6620–6696 (Hypothesis 6.3.1 and Theorem 6.3.4), and line 8169–8239 (the singular-support application). This exposed R01 when the new Euler Check was compared with §5.4, not just with the final lifting theorem.

**Adversarial values.** These are finite calculations and countermodels to missing hypotheses, not numerical proofs of the deep conditional theorems. The table covers the seeded targets, headline results, repaired domains and every finding. Native matrix, finite-field, square-zero and six-subset computations were recalculated; simple dimensions and valuations are displayed explicitly. Unchanged ancillary targets retain the computed evidence of the previous review rather than an uncomputed “sound” summary.

| Statement | Instances tried | Values on the two sides or competing models | Result / change |
| --- | --- | --- | --- |
| Coefficients and zero boundaries | O/ϖ², O/(1), E/O, k[[t]] | Lengths 2,0; ϖ(E/O)=E/O but ϖk=0; char(k[[t]])=p versus char(O)=0 | Keep m≥1 and the arithmetic coefficient category; generic supplier algebra is not restricted to ℤ_p. |
| Frobenius and polynomial conventions | q=3, r(F)=diag(1,3), N=E₁₂; roots 2,3 | r(F)Nr(F)⁻¹=N/3, inverse gives 3N; X²−5X+6 versus 1−5X+6X² | Geometric convention and reciprocal normalization agree. |
| 0.1 root predicate | F₁₁ pairs (2,3),(2,6),(1,3),(0,2); F₂,F₃ unit pairs | Four-factor products 7,0,0,5; small fields have 0 admissible unit pairs | Units are an independent premise; no small-field existence asserted. |
| 0.3 minimality / repaired F02 | N₀=E₂₃, B=E₁₂−E₃₄ over F₇[η]/η² | Both Lie equations give 0; N₀²=0 but (N₀+ηB)²=η(E₁₃−E₂₄)≠0 | Reduction alone cannot impose Artinian orbit membership; §2.25 is the correct owner. |
| 0.3 split plane / repaired F02 | I+ηB on first plane | Upper-right plane entry η≠0 versus 0 for a split unramified plane | A full flag does not substitute for §6.14. |
| 1.1 normalized integral p-actions | d=0,r=2; coefficient O/p³; Q empty | Normalizing valuations 4,3,3; p³·1=0 after reduction; empty diamond acts by 1 | Division before coefficient reduction and actual action image retained. |
| 2.1 number field | [[0,2],[1,0]]; zero module | Characteristic polynomial X²−2, eigenfield degree 2; zero has 0 nonzero eigencharacters | No arbitrary scalar/zero-eigensystem surrogate. |
| 2.3 interpolation and lattices | Roots 1,2,3,6; O and ϖO in E | Reciprocal coefficients (1,−12,47,−72,36); equal E-spans, reduction images k and 0 | Rational interpolation alone supplies no integral lattice equality. |
| 2.4 crystalline qualification | (m₁,m₂,w)=(1,0,0),(1,0,1); repeated roots | Parities agree 1=1, then disagree 0≠1; repeated-root difference 0 | Parity, simple-generic and distinct-root premises remain. |
| 2.5 ordinary shape | Diagonal α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹; geometric F₃ | Paired products ε⁻¹; ν=3 and det=9, not 1/3 and 1/9 | Full multiplier and dual convention agree. |
| 2.6 monodromy | Same r(F)=diag(1,3), N=0,E₁₂ | Same semisimple part; ranks 0,1; both obey q⁻¹ scaling | Purity/adjoint uniqueness cannot be deleted. |
| 2.7 dual spin | w=0,2 and χ₂(u)=ζ₃ | Exponents (−1,−1,−2,−2), (−2,−2,−3,−3); ζ₃⁻¹≠ζ₃ | Smooth inverse retained; source misprint excluded. |
| 2.8 completed isotypy | Multiplicity dimensions 1,2; E[t]/t² | Total dimensions 4,8; quotient and socle each 1, extension nonzero | Actual annihilation and nonzero multiplicity are indispensable. |
| 3.1 Hasse lifts | p=5,m=3; shift factors 5,25; ϖ²=2 | Required p-depth 25: 5 fails,25 passes; (1+ϖ)²−1=ϖ²(1+ϖ) | General DVR and depth distinctions retained. |
| 3.1a secondary Hasse | p-rank one; p=5; dual numbers | Primary section 0, secondary section a unit; exponent p²−1=24; η≠0 with every geometric value 0 | Secondary geometry is distinct; reducedness is needed for pointwise-to-sheaf deductions. |
| 3.4 regular Hecke representation | (a,b)=(4,3), then b=2 | Exponents (0,−1,−3,−4), paired sums −4; singular specialization has two zeros | Regular shape alone does not give a second singular unramified line. |
| 4.2 vector theta / repaired F01 | p=7, (j,k)=(2,2),(4,2),(6,2) | Target symmetric degrees −2,0,2; construction false,true,true; k=2 injectivity false,true,false | Correct construction and application ranges now differ explicitly. |
| 4.2 contraction and scalar exception | e₂²⊗f₁²; Hasse series at k=6,p=7 | Contraction −2=5 mod7, determinant 0; multiplying by determinant gives 0; Hasse q-series 1 has theta 0 | Corrected contraction and Hasse exception retained. |
| 4.3 normalized projector | α=2,β=4 over F₁₁; two-dimensional Jordan block | Projector on β-line is 1; (U−α)² acts by 4; kernel dimensions of N,N² are 1,2 | Normalized primary decomposition, not an unnormalized power or ordinary eigenspace. |
| 4.8 Hasse-projection injections | O/ϖ² and vector ϖv; two distinct roots 2,3 | Direct reduction of vector is 0; its first nonzero torsion layer has coefficient 1; two labels differ | Correct finite-length argument; a zero projector would have rank 0. |
| 5.1 ordinary plane | Reductions e₁,e₂ versus e₁,e₁; p=7,a=4, ε=3 | Leading minors 1,0; ε⁻³=6≠1, so invariant alternating pairing satisfies 5b=0 and hence b=0 | Independence, same representation and multiplier comparison matter. |
| 5.2 singular deformation | Q empty; inertia χ,χ,χ⁻¹,χ⁻¹ | Base ring Rmin; both paired products 1 | Full multiplier is fixed; determinant alone is insufficient. |
| 6.4 Klingen comparison | Empty Q; lengths m=1,2; selected residual trace | Identity maps for empty Q; lengths 1,2; four weights 1/4 sum to 1 | Integral connecting maps and selected trace, not covering degree, are retained. |
| 7.2 torsion-free homology | E/O and k; a=4 dual coefficient | Duals O and k; ϖ-divisibility true,false; L=ω(1,−1) pairs with ω(4,2) | H² vanishing and fraction-quotient duality do real work. |
| 7.4 selected balance | S=O[C_p], modules S,k,S⊕k | Defects 1,−1,0; projectors onto the two summands give 1 and −1 | Whole balance does not imply selected balance; retain the named selected-rank gap. |
| 8.2 minimal R=T | Free ranks 1,0; O[η]/η²→O | Annihilators 0 and whole ring; quotient kernel (η)≠0 | Positive faithful freeness is essential. |
| 8.3 a≥4 endpoint | (p,a)=(7,4),(5,4),(7,2) | 4<6 true; 4<4 false; 2≥4 false | Endpoint range remains exact. |
| 8.4 exceptional finite-group model | Even subsets of six points modulo complement; transposition, 3-cycle | 32 subsets→16 vectors; fixed counts 8,4; 720 distinct permutation actions=16·3·15=|Sp₄(F₂)| | Nonabelian and small-characteristic controls pass. The Jacobian application is a different owner. |
| 8.5 classical CG endpoint | a=4, geometric F₃; weight-two comparison | HT weights (0,0,3,3); ν=27, det=729; slope gaps 3 versus 1 | No general weight-two monodromy vanishing inferred. |
| 9.1 ordered P12 admissibility | ε(g)=3 in F₇ | ε⁻¹(g)=5, different from both 3 and 1 | Opposite ratio/sign conventions remain an explicit gap. |
| 9.2 variable-weight R=T | Λ=O[[w₁,w₂]], M=Λᵈ; Λ/(ϖ) | Augmentation gives Oᵈ; torsion quotient is killed by ϖ | Finiteness alone is not control or freeness. |
| 9.3 p-adic modularity | Weights (4,2),(2,2),(1,1) | Exponent lists (0,0,−3,−3),(0,0,−1,−1),(0,1,0,1) | Integral weight is not automatic holomorphic classicality. |
| 9.4 parabolic branch | Parallel k=3; opposite flags | Exponents (0,−1,−2,−3) versus (0,1,2,3); middle ratios ε⁻¹ versus ε | Needs the declared flag comparison, not an identity. |
| 10.1 neat dyadic prime | p=2,r=7,13 | Mod4 residues 3,1; both mod2 residues 1 | Alternatives, not simultaneous exclusions, are required. Locator repair R03. |
| 10.2 four modules | p=2, one depth-one auxiliary prime; torus character ζ₃ | Four chambers; |Δ|=2²=4 versus rank-one diamond order 2; ζ₃↦ζ₃⁻¹ | Chamber count, torus rank and inverse action are separate. |
| 10.3 freeness | Δ=(C₂)², module rank d=1 or 0; r=7 | Weight ranks 4,0; |F₇×/{±1}|=3; v₂(8)=3 | Zero rank allowed here; valid odd-order central quotient does not justify Weyl averaging. |
| 10.8 local freeness | (1+t)^(2ᴺ)−1; E[[x]]→E[[x]]/(x²) | Linear coefficient 2ᴺ≠0, hence not in (t²); relative differentials 0 but kernel (x²)≠0 | Correct open cutoffs and surjectivity/image comparisons retained. |
| New dyadic imports | n=4,2, degree1; diag(1,3); scalar twist −1 | Divisibility residues 0,2 mod4; weight/dual factors 1/3; −1 reduces to1 but inertia eigenvalue≠1 | Numerical controls and tame unipotence condition pass. |
| New dyadic Euler Check | n=2, #T=3; full dyadic Thorne complex | Transpose fixes I₂; Tr(I₂)=0; source h³=0 versus README h³=1 | **Fails R01.** The invariant line does not identify this complex's H³. |
| New odd-p support import | p=3,q_v=7,19; E[x,y]/xy at origin | Residue pairs mod(3,9)=(1,7),(1,1); origin lies on 2 components | Mod9 and unique seed-component conditions retained. |
| 11.1 regular weights | R=3, (−4,−1),(0,3),(−1,−4) | Gap pairs (3,3),(3,−5),(−3,9) | Both ordered inequalities are necessary. |
| 11.3 regular multiplicity | Three local lines; quadratic residue field; zero fiber | Tensor ranks 1 and 2 if first line doubled; dim_E E′=2 versus dim_E′ E′=1; zero dimension0 | Local uniqueness passes; **field omission R02**; local locator R03. |
| 11.4 singular support | E×E with module E×0; E[η]/η² acting on E | Fibers 1,0; full topological support in the second example but annihilator (η)≠0 | Support is not scheme-theoretic faithfulness; selected components retained. |
| 11.5 four rank-one chambers | Four rank-one modules, each at its residue field | Each rank1, total rank4 | Transport rank chamber by chamber; clarify field as in R02. |
| 11.6 classical weight two | Four multiplicities1; Sen matrix [[a,1],[0,a]] | Total multiplicity4=4·1; nilpotent part rank1 versus rank0 for de Rham semisimple Sen | Singular comparison and de Rham hypotheses cannot be suppressed. |

**Pinned-library audit.** The installed revisions agree with the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Content-main HEAD was `98a9b7af364bff4bdaabf4b6e74785b283c80c87`. These definitions were opened, rather than inferred from a declaration-name search:

| Pinned file and line | Actual native object and limitation |
| --- | --- |
| `Mathlib/Data/ZMod/Defs.lean:138` | ZMod has zero-modulus branch ℤ and positive-modulus finite branch; field conclusions require prime modulus. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71` and line 89 | `Module.End.genEigenspace` is the supremum of kernels of powers, with the finite-exponent membership formula. It assumes a module over a commutative ring, not semisimplicity or finite dimension. |
| `Mathlib/Algebra/Group/Idempotent.lean:37` | `IsIdempotentElem` is a·a=a with multiplication; no canonical projector or splitting is built into it. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:58` and line 101 | `Matrix.J` uses blocks (0,−1;1,0); `Matrix.symplecticGroup` imposes AJAᵀ=J. This is not the prescribed-full-multiplier automorphic Galois object. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:171` | `AdicCompletion` is the compatible sequence of module quotients. Completeness for arbitrary ideals is not part of its bare definition; the local Noetherian uses retain their hypotheses. |
| `Mathlib/NumberTheory/ModularForms/Basic.lean:72` and line 80 | `ModularForm`/`CuspForm` are analytic upper-half-plane modular forms. They do not supply Siegel coherent eigensystems or the required integral moduli carriers. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:696` and line 712 | `TauCeti.ContCohomology.H1` is Z¹/B¹ under continuous-smul/topological-additive-group assumptions. Its inherited pointwise quotient topology is not asserted discrete; `DiscreteH1` is separate at line 721. |

Object searches at both pins included Siegel coherent coefficients, higher-Hida modules, GSp₄/full similitudes, deformation rings, generalized eigenspaces, matrix groups and continuous cohomology. They found the elementary carriers above, not the heavy headline carriers. No existing pinned theorem was restated in Suggested.lean.

**Ownership and resolved supplier citations.** The board package index was read before absence claims. Read the cited sections at main or the indexed open heads, using the roadmap service for open files and object searches. The current resolver reported no unresolved roadmap citations or Lean names. Its two supplied earlier leads, `GSp4.MinimalAt` and `GSp4.SiegelOrdinary`, resolve as supplier API names, not as declarations already in the pins. The following compact ledger gives the actual locations opened. Paths in this table are relative to the corresponding repository; line numbers refer to the underlying README, not a locator-service header.

| Supplier file | Resolved ownership and comparison |
| --- | --- |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3416` | §5.11 Frobenius-to-group annihilation; §§6.4,7.3–7.6 at lines 3895,4182,4218,4395,4429; semisimplicity criteria near 4640. §§7.9–7.12 at 4751,4840,4896,4995 distinguish adequacy, enormousness and CG big image. BCGP integral/dyadic extensions remain gaps. |
| `TauCetiRoadmap/AutomorphicBundles/README.md:1702` | B3–B5 supply boundary coefficients, Schur weights and expansions. Rational period tower/torsor/cohomology are specifically B3.HT.4/.7/.8 at 3448,3647,3697; the broader B3.HT citation includes these, beyond the separately highlighted .1–.3. B4.16 at 4297 supplies Schur coefficients. |
| `packages/AutomorphicBundlesPartII/design/README.md:69` | IC.1 duality, IC.2 projective coherent models, IC.3 correspondences, IC.4 normalization, IC.5 vanishing at 253,381,719,850. IC.6–IC.8 begin 1175,1384,1528. The conditional whole-cohomology equality at 1661 does not already supply the selected-projector inequality. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:488` | AG2.P regular spin construction; AG2.5 local comparison at 1758; AG2.6 crystalline/ordinary comparisons at 2826–2853. The package specializes actual selected Hecke images rather than reconstructing the generic carrier. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2758` | AL.4 unramified/WD determinant comparison, finite-dimensional parameter and residue cardinality q>1. |
| `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1831` | §§3.2,3.5,3.9,3.26 at 1831,1944,2040,2429. Generic-member/adjoint-holomorphy equivalence and packet normalization are present. The weighted stabilization premise is retained. |
| `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:526` | §§3.1–3.3 depth/action comparisons; §§5.1–5.9 at 1019–1202 distinguish balanced, equal-variable and characteristic-zero patching. §§6.1–6.7 at 1213–1315 and §§7.6–7.10 at 1450–1547 supply support, correct duality and coefficient/action comparisons. No generic patching theory is rebuilt. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4153` | §11.1 general-type transfer under its classification inputs; §13.2 at 4783 supplies solvable descent with restriction irreducibility and the Tate twist. |
| `TauCetiRoadmap/GlobalGaloisDeformations/README.md:398` | R04.3/.4/.5/.6 at 398,685,1061,1461 and G7 at 1947 exist. The three requested specialized presentation/Taylor–Wiles contracts remain gaps. Its odd-p Euler formula is not the dyadic Thorne formula: R01. |
| `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:196` | §§0.2–0.5 at 196,224,241,270 supply actual HT maps and functoriality; §§0.14–0.15 at 452,478 supply Hasse/ordinary criterion. A pointwise map is not substituted for the period torsor. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1155` | §0.7 invariant evaluations; §§1.1–1.7 at 1864–2787; §§2.1–2.3 at 2829–3036; IHG.3a–IHG.4 provide spin/residual/determinant interfaces. Symplectic descent at §1.5 still has p>2; §1.7 GL reconstruction does not discharge the declared GSp₄ reconstruction gap. §1.6 needs the whole Cayley–Hamilton ideal. |
| `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1856` | §2.7 types; §2.17 at 2036 ordered TW inertia; §2.25 at 2182 minimal Artinian orbits; §6.3 at 3117 full flags; §6.14 at 3390 split plane; §§6.26/.27/.29 at 3612,3622,3683. All repaired references resolve, with the stated characteristic distinctions. |
| `packages/PadicFamiliesPartII/design/README.md:1057` | E6/four-pieces, S7/sen-cousin at 1151, S7/de-rham-classicality at 1189, F8/four-modules through central-character at 1219–1330. K2 begins 329. D4's ordinary-open doubling at 813 differs from this package's cuspidal Hasse shift into a higher-weight global section space. |
| `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1462` | §§8.6–8.7 at 1462,1494 supply analytic Bruhat/distribution coefficients, root shifts, finite-flat covers and quasi-Stein hypotheses. No integral averaging theorem is inferred from rational Banach projectivity. |
| `TauCetiRoadmap/PadicHodgeTheory/README.md:659` | §§3.2–3.6,4.4,5.3–5.4 at 659–771,887,1020–1074. Its HT(χ)=+1 is transported to the package's sign; geometric Frobenius inverts the arithmetic WD scaling. |
| `TauCetiRoadmap/ShimuraCompactifications/README.md:1676` | C3.9/.10 refinement and completion; C5.13–.18 at 2497–2641 distinguish toroidal semiampleness from minimal ampleness, and ordinary from derived inverse limits. The package keeps good-model and coefficient hypotheses. |
| `TauCetiRoadmap/ShimuraData/README.md:1336` | §§5.9/.10 at 1336,1360 and §5.18 at 1535 supply the CG/Pilloni root, Kostant and weight dictionaries. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1833` | SR.2.1–.3 at 1833,1962,2122 and SR.4.1–.5 at 3083,3178,3247,3351,3489 supply induction, modulus and Satake interfaces. Specialized newvector/refinement/conductor comparisons remain named gaps; R03 corrects one source pinpoint. |
| `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md:215` | OL.1–OL.3 at 215,313,470, with finiteness/reduced R=T at 607,628; OL.4/.5 at 650,872, with seed/selected problem at 771,812 and R=T/finiteness at 943,966. OL.0 line 125 is the decisive dyadic complex comparison for R01. Read at supplied board head 7e88c38. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1261` | R07.1.17 differentials; R07.2.2 filtration at 3028; R07.2.21/.22 BT₁ Hasse and duality at 3751,3798. The secondary genus-two determinant section is the package's new application. |

Additional ownership searches used the objects, not just the package's names: secondary Hasse, theta injectivity, six-point/even-subset representations, higher Hida, selected rank inequalities, coefficient descent and ordinary component support. `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1682`, A3.12, uses the exceptional six-point description in Jacobian two-torsion; it does not supply the separate finite-group construction and its arithmetic-image application of §8.4. `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:1614`, §8.3, is rank-two and odd-prime; it is correctly a transitive input, not the claimed owner of the dyadic arbitrary-rank tower.

At the board heads supplied in the index, `packages/HigherHidaAndColemanTheory/design/README.md:7` (519048f) owns general supported higher Hida/Coleman theory, and its X8 singular Klingen control at line 1333 is distinct from the present minimal modularity-lifting application. That theory is not constructed again here. `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/README.md:7` (777a863) owns general GL_d local component detection/density, with p∤2d, not this global four-chamber singular lifting theorem. No declaration-name collision is possible in this package's declaration-free Lean file.

**Gaps and supply direction.** All 20 README slugs occur with the same named supplier and needs sentence in the plan's top-level gaps list; none has supplier `none`. They concern precise specialized extensions, not unnamed future prerequisites. Grouped by owner, they are:

- IntegralHeckeAndGaloisDeterminants: `gsp4-pseudocharacter-reconstruction`, `symplectic-descent-every-residue-characteristic`.
- AutomorphicBundlesPartII: `normalized-integral-siegel-p-actions`, `selected-coherent-rank-inequality`.
- PadicFamiliesPartII: `p12-ordinary-horizontal-control`.
- LocalGaloisDeformationRings: `p12-flag-orientation`, `dyadic-ordinary-local-regularity`.
- ArithmeticGaloisRepresentations: `integral-enormity-and-oddness`, `weil-restriction-big-image`.
- GlobalGaloisDeformations: `gsp4-cg-selmer-presentation`, `gsp4-torus-tw-data`, `p12-variable-weight-patching-data`.
- SmoothRepresentationsOfLocalGroups: `gsp4-steinberg-u-eigenvalue`, `gsp4-klingen-level-comparison`, `gsp4-paramodular-newvector`, `gsp4-ordinary-neat-refinement-lines`, `gsp4-pure-monodromy-uniqueness`, `projective-finite-group-satake`.
- OrdinaryAutomorphicFormsAndModularityLiftingPartII: `dyadic-ordinary-support`, `symplectic-ordinary-component-support`.

The requested gap objects are not already supplied at the cited scope: examples are odd-p versus all-p symplectic descent, GL versus GSp₄ reconstruction, whole-module versus selected-projector balance, and ordinary image schemes versus pure dyadic local regularity. R03 changes a locator, not the refinement contract's ownership. These contracts are legitimate conditional inputs and are not counted as unowned prerequisites. This verdict is needs changes, so no accepted-only conditional_gaps field is emitted.

The prescribed dependency check with `--movable` exited zero and printed exactly:

```text
depcheck: 52 roadmaps, 602 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The separate unadmitted ordinary Part II design's eventual placement is the settled external matter above, not a claim that this graph output has admitted it. No merge-order or tooling file was edited.

**Headlines and Lean acceptance.** The module docstring explicitly accounts for every headline group:

| Headline targets in README | Missing pinned carriers named in Suggested.lean |
| --- | --- |
| §1.1 integral p-actions; §3.1a secondary Hasse; §4.2 theta/injectivity | Integral genus-two moduli, automorphic coefficients and differential operators. |
| §§2.3–2.4 coherent interpolation/crystalline specialization | Siegel coherent eigensystems and crystalline periods. |
| §§2.5–2.8 ordinary interpolation, monodromy, dual spin and completed isotypy | Automorphic local parameters, reductive pseudocharacters and higher-Coleman eigenspaces. |
| §3.4 regular Hecke representation; §4.8 two injections; §5.2 singular deformation | Actual coherent Hecke images, geometric Hasse maps and local deformation conditions. |
| §6.4 finite-coefficient Klingen comparison | Compactified covers and their actual coefficient pullback/trace maps. |
| §7.4 selected balance; §§8.2–8.3 minimal R=T/freeness; §8.5 classical CG lifting | Selected coherent modules/idempotents, universal symplectic deformation ring and Siegel forms. |
| §§9.2–9.4 variable-weight R=T, p-adic and parabolic lifting | Hida families and universal ordinary deformation rings. |
| §10.8 local freeness; §§11.3–11.6 multiplicity, support, rank one and classical weight two | Four actual higher-Hida modules, arithmetic specialization, support and singular classicality comparison. |

The native searches and opened definitions above support the docstring's distinction. Stating these using arbitrary modules or Prop fields would replace the headline by a stand-in. The finite six-point example is not an omitted lifting headline.

`Suggested.lean` has 44 lines, one `import Mathlib`, one module docstring, the correct namespace, and zero declarations. The required absolute-path `lake env lean` invocation from the content repository completed with exit code 0, no output and no warnings. No TauCeti object build was required. There are zero own signatures for a scratch `#check @name` pass, zero sorried theorems for the one-tactic probe, and zero padding declarations; those tests have empty domains, not unrun failing cases. README and Lean agree on this absence. The successful elaboration does not certify the two mathematical assertions raised above.

## Not verifiable

- No cited source was inaccessible; no missing-reference request or manifest addition was needed. The seven supplied cached texts were readable, including the numbered passages used for the findings.
- The 20 declared supplier contracts are future mathematical obligations. Their declaration, ownership, scope and present supplier interfaces were checked; their missing proofs were not treated as already established.
- Admission and final placement of the ordinary Part II supplier are outside this package and remain settled for this review. The supplied design was read; the dependency command cannot certify a future admission.
- Ownership against open pull requests for which the brief supplied neither readable files nor an indexed head was not checked. The named/indexed roadmap-service heads and the relevant supplied board heads were searched/read as recorded above.
- The finite controls do not prove the automorphic, local-global or patching theorems. Those statements remain roadmap targets with the specified source and supplier hypotheses; the declaration-free Lean build only checks the present file's form.

## Source issues

- **Misprint** in P20 at §5.3, displayed holomorphic parameter before Theorem 5.3.1, p.24 (P20 line 1064): the source says the first coordinate is 1−k+r; it should be 1−k−r, as in Remark 5.3.1 and the theorem's proof; affects a stated result.
- **Misprint** in CG20 at Proposition 8.9(2), p.861 (CG20 line 2417): the source says the vector coefficient includes a determinant prefactor; it should be the contraction coefficient alone, consistent with the proof of Theorem 8.13; affects a stated result.
- **Error** in CG20 at Theorem 8.10, p.861 (CG20 line 2425): the source says the scalar injectivity assertion includes the Hasse weight p−1; it should be qualified to exclude the nonzero Hasse section whose q-expansion has zero theta; affects a stated result.
- **Error** in CG20 at proof of Theorem 9.1(a), p.879 (CG20 line 3063): the source says its auxiliary inertia tuple has two trivial and two equal diamond characters; it should be adjusted by a square-root character to preserve the fixed full multiplier; affects the proof.
- **Gap** in CG20 at proof of Theorem 9.1(c), p.880 (CG20 line 3076): the source says whole-module balance supplies balance after ordinary selection; it should be justified by the selected rank inequality or an equivalent argument; affects the proof.
- **Gap** in P12 at §3.2, Definition 5.3 and §7.4, pp.13–14,19–20,38 (P12 line 665, 675 and 987): the source says automorphic and deformation ordinarity use opposite ordered ratios and opposite exponent prescriptions; it should be accompanied by the ordered-flag, dual and Ext convention comparison before transporting control; affects the proof.
- **Misprint** in BCGP25 at Lemma 4.12.1, p.112 (BCGP25 line 5027): the source says the final two smooth factors have a second inverse; it should be a single inverse, as required by dual spin and the paired multiplier; affects a stated result.
- **Misprint** in BCGP25 at proof of Lemma 7.3.8, p.167 (BCGP25 line 7678): the source says projectivity is over the quotient with the smaller level group in the numerator; it should be the larger group modulo the smaller, as in the lemma's statement; affects the proof.
- **Misprint** in BCGP25 at Definition 7.4.1, pp.167–168 (BCGP25 line 7685): the source says exclude residue one modulo p and additionally modulo four when p=2; it should be the odd-p exclusion or the dyadic modulo-four exclusion, as alternatives; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6faad34864a5ab56c86821d01ae672f8af8fe1f9", "job": "REV-PKG-GSp4NonregularModularityLifting~3", "model": "gpt-6-astra", "worker": "chris-20"} -->
