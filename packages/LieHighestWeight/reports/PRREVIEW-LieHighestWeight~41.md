# Review of LieHighestWeight (pull request #1220 at beea1d2)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

15 findings: 2 P1, 4 P2 and 9 P3; 6 blocking.

Paths `README.md` and `Suggested.lean` below are relative to that folder. Library paths start with `Mathlib/` or `TauCeti/` and refer to the pins, not upstream HEAD. This is a full review of the 3,027-line README and 201-line acceptance test, including unchanged passages. Findings are followed by the previous-finding audit, computed tests, source audit and limitations.

## R01 (P1) — The compact applications close a supply cycle with LieGroups

**Location:** `README.md:459–464`, “LieGroups Layers 2–4, 6–7”; `README.md:1258` and `README.md:2836`.

**Claim:** LieGroups supplies maximal tori, integration and complexification to this roadmap's compact applications.

**Witness:** On main, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:789` consumes LieHighestWeight Layer 7's Chevalley/Serre presentation. This head supplies that presentation at `README.md:1890–1924` and consumes LieGroups Layer 7 at `README.md:1258`: both supply directions remain.

**Repair:** Keep the algebraic Serre and highest-weight exports here. Move the applications requiring LieGroups' compact structure/complexification to a continuation placed after LieGroups, with explicit ownership of the moved targets. Do not make LieGroups consume this continuation. The SU(2) compact-form construction still receives the algebraic Serre presentation; its later character application then consumes LieGroups in one direction. The mechanical dependency check below misses this textual edge; its zero count is not evidence against the cycle.

## R02 (P1) — The adjoint-weight contract omits the zero weight

**Location:** `README.md:522–523`, “the weights of T on the complexified adjoint representation are the characters whose differentials are the roots”.

**Claim:** All adjoint weights correspond to roots.

**Witness:** For SU(2), conjugation fixes h=diag(1,−1), while e and f have characters z² and z⁻². The adjoint weights are {2,0,−2}; the roots are {2,−2}. This README itself uses all three weights at line 1759.

**Repair:** Say that the **nonzero** adjoint weights are the roots and identify the zero-weight space with the complexified toral Lie algebra. Retain a Check with multiplicities 1,1,1 for SU(2), and a torus Check with only weight zero. When replacing the duplicate gap under R06, preserve this corrected distinction in the consumer's conventions.

## R03 (P2) — Layer 6 rebuilds native orbit sums, lower sets and density

**Location:** `README.md:1297`, “Define the orbit sum”; `README.md:1315`, “define the predicate”; `README.md:1338–1347`, “Prove polynomial_eq_zero_of_dominantIntegral”.

**Claim:** These constructions and the triangular character expansion are new precursors owned here.

**Witness:** The pin has `RootPairing.weightOrbitSum`, `dominantWeightsBelow`, `TauCeti.formalCharacter_irreducibleQuotient_eq_orbitSum_add_lower`, and `TauCeti.polynomial_eq_zero_of_dominantIntegral`. The exact files, hypotheses and lines appear in the library table below. In A₁ both expansions give ch V(2)=m₂+m₀.

**Repair:** Delete these construction targets and cite the native objects and theorems in Scope and Exact supplier contracts. Retain only a genuinely additional comparison, explicitly distinguished from the native theorem. Use the native integral lower set: below 2 it is {0,2}, not {0,1,2}. Do not reintroduce these as sorried acceptance-test statements.

## R04 (P2) — Layer 7 replans native inner actions, density, trace powers and center symbols

**Location:** `README.md:1601–1613`, “Own the Lie-algebraic inner-automorphism precursor”; `README.md:1643–1725`; `README.md:1789–1794`, “export centerPBWGradedInvariantIso n”.

**Claim:** Int(L), its Lie adapter, Cartan density/conjugacy, trace-power polynomials and the degreewise center-symbol isomorphism need construction here.

**Witness:** Native `intLieAlgebra`, `intLieAlgebraLieEquiv`, Cartan parametrization/conjugacy, `tracePowerPolynomial`, its restriction theorem, and `centerPBWGradedInvariantIso` implement these objects. The library table gives exact locators. The native sl₂ trace restriction is h²/32 for the standard representation, exactly this target's normalization.

**Repair:** Move these existing results to the supplier contracts and delete the duplicate build instructions. Also consume native polynomial-dominance and leading-term/translation results listed below. Keep the global normalized symmetrization and genuinely additional graded multiplication/assembly, with their extra conclusions stated explicitly. On sl₂ retain the checks exp(ad e)h=h−2e, trace restriction h²/32, and symbol Ω↦h²+4ef as checks of the imports. An alternate proof route is not a second library target.

## R05 (P2) — The split Albert determinant and Jordan identities already exist

**Location:** `README.md:2029`, “Prove the Jordan”; `README.md:2034`, “On this native split carrier build `TauCeti.AlbertAlgebra.det`”; `README.md:2041–2047`.

**Claim:** The native split Albert carrier still needs its determinant, cubic characteristic identity, trace-power formula and Jordan identity.

**Witness:** `TauCeti/Algebra/AlbertAlgebra/Determinant.lean:101,248,310,319` defines that determinant and proves those formulas. `TauCeti/Algebra/AlbertAlgebra/Jordan.lean:71` supplies `IsCommJordan`, over a commutative ring with 2 invertible. At diag(1,2,3), both determinant formulas give 6.

**Repair:** Cite these declarations and remove their construction targets, including the statement at `README.md:423` that Jordan identification remains a target on this native carrier. Keep the compact real carrier, its explicit comparison after complexification, and the split exceptional Lie identification. The /6 formula must still assume 3 invertible; the native undivided identity gives 6·6=36 over ℚ and remains meaningful in characteristic 3.

## R06 (P2) — Four supplier gaps ask for already-owned results

**Location:** `README.md:507–539`, the three `gap:torus-*` contracts and `gap:skew-lr-tableaux`.

**Claim:** These results are absent from suppliers and must be added to LieGroups and SchurWeyl.

**Witness:** On main, `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:40–50` owns the full period/weight dictionary. `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:628–643` defines finite LR tableaux and their product formula. These are the same requested objects, not merely analogous constructions.

**Repair:** Remove the four redundant gaps and cite ConvexityToric T1 and SchurWeyl §7.2 at their existing generality. Route the compact application through the downstream ownership repair of R01, rather than adding another backward edge here. The matching normalizations are Λ=2πℤ·diag(i,−i), root/cocharacter pairing 2, and LR coefficients 1,1 in s₍₁₎²=s₍₂₎+s₍₁,₁₎. SchurWeyl's zero-indexed letters agree after shifting labels by one.

## R07 (P3) — Remaining supplier gaps are not registered

**Location:** `README.md:79–86` and `README.md:484–505`, including “Seven inputs … are not supplied”.

**Claim:** The named gaps form declared supplier contracts for this package.

**Witness:** `packages/LieHighestWeight/` has `sources.toml` and `reports/`, but no readable `design/plan.json` with a matching `gaps` list. The job accordingly declares no gaps. This is the unrepaired registration part of previous R06.

**Repair:** After removing the redundant gaps and moving the cyclic applications, register each genuinely remaining gap in the consuming package's `design/plan.json` with its identical slug, supplier, section and precise need, matching its README. In particular, any retained regular-extension contract must distinguish t↦t⁻¹ from conjugation: they agree on U(1) but give 1/2 and 2 at t=2. Do not register results already owned on main.

## R08 (P3) — The G₂ existence theorem fails statement hygiene

**Location:** `Suggested.lean:155–157`, `derivationOctonion_equiv_g2` concludes `Nonempty` of a Lie equivalence.

**Claim:** The declaration is presented as a named equivalence, but it only asserts existence.

**Witness:** The worker's gate reports `statement-hygiene` at line 156, P3. Its name is neither `nonempty_*` nor `exists_*`. This is one of the two failing checks at this exact head.

**Repair:** State the normalized map and its isomorphism property when that map is available; retain an existence corollary only under a `nonempty_*` name, such as `nonempty_derivationOctonion_equiv_g2`, and update its README reference. Do not add sorry'd data. The split real form must remain the input: its dimensions are 14=14, without identifying compact Der(𝕆_div) with split G₂(ℝ).

## R09 (P3) — The F₄ existence theorem fails statement hygiene

**Location:** `Suggested.lean:160–162`, `derivationAlbert_equiv_f4` concludes `Nonempty` of a Lie equivalence.

**Claim:** The declaration is presented as a named equivalence, but it only asserts existence.

**Witness:** The worker's gate reports `statement-hygiene` at line 161, P3. Its name is neither `nonempty_*` nor `exists_*`. Elaboration does not clear this rule.

**Repair:** State the normalized map and its isomorphism property when available; retain an existence corollary only as `nonempty_derivationAlbert_equiv_f4`, updating the README. Keep the split native Albert carrier and the arbitrary characteristic-zero field; its derivation dimension is 52, and the compact real carrier is a different form. Do not introduce admitted map data.

## R10 (P3) — Removed layer numbers still have downstream citations

**Location:** `README.md:554,706,913`: the layer sequence skips 1, 2 and 4 without an old-to-new map.

**Claim:** Consumers can follow the revised ownership from the scope paragraph alone.

**Witness:** #1815 cites Layers 1–2 at `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1555`; #1069 cites Layers 2–7 at `TauCetiRoadmap/AutomorphicBundles/README.md:321,3069`; #871 cites Layer 4 at `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1153`. The cited numbers disappear here.

**Repair:** Add an explicit former-numbering → present-owner map for former Layers 1, 2 and 4, including the exact native declarations now supplying their content. Preserve the old identifiers as aliases if preferred. Test it by following each of the three citations above to its replacement; do not recreate the deleted foundational targets.

## R11 (P3) — The family dependency paragraph still assigns native PBW to this roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82–84`, “The highest-weight roadmap owns the concrete PBW project”.

**Claim:** Ado–Iwasawa receives injectivity, ordered monomials, filtration, domain and Noetherian consequences from LieHighestWeight.

**Witness:** This head's Scope (`README.md:22–23`) explicitly makes PBW basis/filtration native inputs. Its supplier contracts identify the native enveloping results. The revised family entry at lines 36–39 is correct, but this dependency paragraph retains the old ownership.

**Repair:** Make both roadmaps consume the native PBW results directly; name only the remaining Rees, normalization and central-monic comparisons as this roadmap's exports. For a one-dimensional abelian algebra, the ordered PBW basis 1,x,x²,… is already native; the new comparison is not its construction.

## R12 (P3) — The pull-request description denies its family-index edit

**Location:** Pull-request description, outside generated blocks: “Only TauCetiRoadmap/RepresentationTheory/LieHighestWeight/ changes.”

**Claim:** No other path changes.

**Witness:** The head also changes `TauCetiRoadmap/RepresentationTheory/README.md`, including its LieHighestWeight entry at lines 36–39. The brief permits this family-index edit; the description, not the edit, is wrong.

**Repair:** Replace the sentence with one naming the roadmap folder and the family index. The generated `roadmap-summary` already acknowledges both; make the non-generated sentence agree with it and with the diff.

## R13 (P3) — The Cartan-matrix library path is stale

**Location:** `README.md:250`, `Mathlib/Data/Matrix/Cartan.lean`.

**Claim:** The standard integer Cartan matrices are in that pinned file.

**Witness:** That path is absent at Mathlib `1b1ccf4b0`. `CartanMatrix.E₆` is at `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:78`; the other named standard matrices are in the same file.

**Repair:** Use the actual pinned path. Keep the Serre relation convention from `Mathlib/Algebra/Lie/SerreConstruction.lean:102`: HE uses CMᵢⱼ, so the root-pairing matrix is transposed in the headline, as the B₃ check confirms.

## R14 (P3) — Exceptional identification targets lack exact source locators

**Location:** `README.md:2018–2033` and `README.md:2337–2359`; References at `README.md:3009–3015`.

**Claim:** Split G₂/F₄ and the E₆/E₇/E₈ model comparisons are supported by the listed exceptional-algebra references.

**Witness:** The G₂/F₄ claims name no theorem, section or page. Jacobson and Schafer are cited as whole books. Landsberg–Manivel §1.1 concerns complex magic-square background and is explicitly disclaimed as an arbitrary-field bracket comparison source.

**Repair:** Attach an exact theorem/section and printed page to each identification and dimension/type claim, distinguishing split arbitrary-field results from compact real forms and complex background. If the only available statement is complex, give the algebraic descent/generator argument with its owned inputs. A paywalled locator may remain uncertified; a whole-book reference is not an exact locator. Test the resulting scope on split ℝ versus division ℝ, which cannot be identified before complexification.

## R15 (P3) — The representation-ring definition has no specified API or Checks

**Location:** `README.md:1354–1358`, “build the Grothendieck ring (or semiring) of finite-dimensional L-modules”.

**Claim:** This determines the domain of the formal-character ring homomorphism.

**Witness:** Ring and semiring are left as alternatives; no equality relation, additive relations, universe convention or dedicated three Checks are given. The following isotypic-module examples do not test group completion or the character map on virtual classes.

**Repair:** Specify the finite-dimensional Lie-module category and the split/exact Grothendieck construction under the stated semisimplicity hypotheses, its tensor product, unit and character map, with an API and at least three discriminating Checks. For sl₂ use [V₁]²=[V₂]+[V₀], ch([V₂]−[V₀])=z²+z⁻², and [0]=0 versus [V₀]=1. The virtual difference has no representative as an honest module, distinguishing the ring from the semiring. Keep these in the README, not as Lean padding.

## Verified sound

**Previous findings, checked first.** The reference review is the supplied review of `024d797`, not the later reviews of the other pull request #1797. No supplied repair disposition settles a finding on this head as not actionable. The #1797 compact-center disposition concerns that other head and is not re-raised here.

| Previous finding | Head passage | Repair status |
| --- | --- | --- |
| R01, five native headlines and four duplicate definitions | Scope: “the minuscule and dual-standard Pieri rules”; “Harish-Chandra isomorphisms with the central-character orbit theorem” (`README.md:33–40`) | The five theorems and four definitions are gone from Lean; their native contracts are present. Broader deletion of native build targets is incomplete: R03–R05 identify remaining objects by their pinned implementations. |
| R02, module-system build warnings | `Suggested.lean:1–3`: `module`, `public import Mathlib`; line 55: `@[expose] public section` | Repaired. Direct elaboration succeeds with only ten sorry warnings. The two new gate hygiene failures are R08–R09. |
| R03, five own identifiers without declarations | `README.md:1542–1546` uses qualified native HC names; the four removed carrier definitions are now described as native | Repaired for the named identifiers. The worker's identifier check is zero; resolver leads supplied by the worker are empty. |
| R04, TangentialBordism/C5 locators | `README.md:58–61`: “CharacteristicClasses, C5”, “§9.1 (B3.6)” and “§9.2 (B3.7)” | Repaired: the cited headings resolve at the supplied TangentialBordism head and CharacteristicClasses main. |
| R05, family entry | Family `README.md:37`: “on top of the native highest-weight theory” | Repaired at the requested entry. The separate old PBW dependency sentence is R11. |
| R06, shared LR slug and registration | `README.md:529–531`: “the needs below are the part this roadmap uses” | Partly: the duplicate `lr-product-rule` slug is gone and subset wording reconciles the shared name. Registration is still absent (R07); on present main the LR contract is already supplied (R06). |

**Gate, build and scope.** HEAD is `beea1d2bb14b600eb277f69adc4a3ddc8dc58ef4`. Main used for ownership is `8101f2c8`; Mathlib is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The prescribed outside-folder diff is empty after excluding this folder and the permitted family index. The worktree remained unchanged.

The worker's gate has `statement-hygiene=2`, `build=0`, `depcheck=0`, every other counter zero, and verdict `FAIL`. Both failures are recorded separately above. Direct `lake env lean` of the requested file returned exit 0 with ten `declaration uses sorry` warnings and no others. No sorry'd data, set_option, admitted examples, stray source files or computational algorithm targets were found.

The requested dependency command returned exactly:

```text
depcheck: 228 roadmaps, 2128 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Manual reading of every Needs line and the supplier passages nevertheless detects R01. RootSystems, ClassicalGroups, SchurWeyl, CompactGroups, LieGroups, ReductiveGroups and ReflectionInvariantTheory exist on main; this is not an absent-roadmap or ordering-list complaint.

**Signatures and padding.** A scratch copy appended `#check @` for all eleven declarations and elaborated successfully. The two heuristic lost-binder leads are false positives: both invariant-form and Serre statements include `LieModule.IsTriangularizable K H L`; the form theorem also retains `IsAlgClosed K`, finite dimension, nonzero form and invariance. `productEnveloping` and its theorem retain `IsLieAbelian Z`; neither incorrectly requires S semisimple. Monic finiteness retains hR and positive-degree relations. A second scratch copy tried `simp`, `rfl`, and `infer_instance` independently through `solve` at all ten admissions: zero closed. The near-match candidates were compared at the pin; none of these ten statements was shown to be one-library-lemma padding. No padding finding is raised.

**Headline coverage.** The ten Lean theorems are the polynomial/symmetric-power dictionary; central-monic finiteness; global normalized PBW symmetrization; invariant-form sign; Serre lift injectivity; split G₂ and F₄ identifications; split E₈ dimension; the combined E₆/E₇ dimensions; and the product-center equivalence. The one definition is the actual native product/abelian enveloping composite needed by the last theorem. The README also seeks Rees fibres/Poisson comparison, compact real-model comparisons, Vinberg/Freudenthal model identifications, affine closed-alcove and compact-center comparisons, the LR application and category-O linkage. The module docstring identifies the unavailable carriers for those statements. The type-A Schur-character theorem is explicitly owned by ClassicalGroups Layer 4. The generic Fourier-distribution reconstruction is owned by TensorProductCombinatorics §1.6. Native classification, Weyl/Pieri and HC/Chevalley results are inputs, not missing acceptance-test headlines. R03–R06 concern remaining false ownership claims in the README.

**Pinned declarations opened.** The following are direct file comparisons, not same-name search hits. This table also gives the longer native witnesses for R03–R05.

| Pinned file and line | Declaration and comparison |
| --- | --- |
| `TauCeti/LinearAlgebra/RootSystem/Weyl/WeightOrbitSum.lean:92,97,154,225` | `weylWeightOrbit`, `weightOrbitSum`, coefficient 0/1, triangular expansion of Weyl invariants; finite Weyl group, distinct orbit elements. |
| `TauCeti/LinearAlgebra/RootSystem/DominantCone.lean:369,377` | `dominantWeightsBelow` and membership: the finite set defined using the positive integral root cone and natural simple-coroot values, over a characteristic-zero domain. |
| `TauCeti/Algebra/Lie/HighestWeight/OrbitSum.lean:66,89,114` | Lower-set membership and the highest-weight/irreducible-quotient character expansions; split finite-dimensional Killing algebra, characteristic zero, algebraically closed for the character statements. |
| `TauCeti/Algebra/Lie/HighestWeight/Weight/Density.lean:63` | `polynomial_eq_zero_of_dominantIntegral`; split characteristic zero, no algebraic-closure assumption. |
| `TauCeti/Algebra/Lie/InnerAutomorphism.lean:139` | `expAd_symm`: the inverse is exp(ad(−x)). |
| `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70,96,108` | `intLieAlgebra`, bracket preservation and `intLieAlgebraLieEquiv`; the subgroup is generated by the actual nilpotent exponentials, not all arbitrary linear maps. |
| `TauCeti/Algebra/Lie/AdjointAction/RootExponential.lean:83,180` | `LieSubalgebra.exists_rootExponentialPolynomialParametrization`, `polynomial_eq_zero_of_intCartan`; finite-dimensional split Killing algebra in characteristic zero, actual polynomial coordinate family and surjective Jacobian. |
| `TauCeti/Algebra/Lie/AdjointAction/CartanConjugacy.lean:74` | `LieSubalgebra.exists_map_intLieAlgebraLieEquiv_eq`, algebraically closed characteristic zero. |
| `TauCeti/RingTheory/MvPolynomial/Dominant.lean:107,128` | Polynomial vanishing from a surjective Jacobian over an infinite domain; a dominant polynomial image contains a principal open over an algebraically closed field. These are stronger than the corresponding proposed generic adapters. |
| `TauCeti/Algebra/Lie/TracePowerPolynomial.lean:201,217,228,249` | Actual trace polynomial in S(L*), evaluation, homogeneity and coadjoint invariance, with finite free representation carrier. |
| `TauCeti/Algebra/Lie/HighestWeight/TracePower.lean:198,221` | Cartan restriction as weight power sum and its actual Killing-transported square. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Center.lean:290,299,312` | `centerPBWGradedInvariantIso`, its symbol and inverse formulas: L free and n! invertible; includes every characteristic-zero field and arbitrary-dimensional L. |
| `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/LeadingTerm.lean:202,238`; `TauCeti/LinearAlgebra/SymmetricAlgebra/Translation.lean:178` | Degreewise symmetrization/restriction leading term and translation lower-degree discrepancy. These do not by themselves provide the global graded-algebra assembly. |
| `TauCeti/Algebra/AlbertAlgebra/Determinant.lean:101,138,248,310,319`; `TauCeti/Algebra/AlbertAlgebra/Jordan.lean:71` | Cyclic determinant, cubic scaling, characteristic identity, undivided Newton formula, /6 formula and Jordan instance; 2 invertible for the product, additionally 3 for /6. |
| `TauCeti/Algebra/Octonion/Serre.lean:267,397`; `TauCeti/Algebra/AlbertAlgebra/Derivation/Finrank.lean:384`; `TauCeti/Algebra/Lie/E8/Vinberg.lean:79` | A surjective G₂-to-derivations map, dim Der J=52 and dimension 248 of the Vinberg vector space. None alone is the corresponding requested Lie equivalence or dimension of the Serre E₈ algebra. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Symmetrization.lean:78,85,412`; `TauCeti/Algebra/Lie/UniversalEnveloping/CenterFinite.lean:51` | Degreewise averaging and centrality; prime-characteristic finiteness over the full center. These differ from global symmetrization and arbitrary-field central-monic finiteness over a specified R. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Prod.lean:164`; `TauCeti/Algebra/Lie/UniversalEnveloping/Abelian.lean:178` | Native product and abelian comparisons used in the real-bodied `productEnveloping`; the requested center inclusion square is extra. |
| `Mathlib/Algebra/Lie/SerreConstruction.lean:102`; `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:78` | HE relation convention and standard Cartan matrices; transpose is required in this roadmap's convention. |

**Cross-roadmap audit.** Object searches used the roadmap service over main/open heads, and the relevant board package and supplied head texts were read. Main's RootSystems Layers 1–6 contain its realization, presentation, classification and metric comparisons and cite native chamber/longest-element data; the root conventions were checked against those native inputs. SchurWeyl §7.2 supplies the LR count (R06), CompactGroups Layers 0–6 supply Haar/character theory, LieGroups Layers 2–4 supply integration and Layers 6–7 compact structure (R01), ReductiveGroups Layer 2 supplies the tangent comparison and §5P consumes native Cartier smoothness at line 1912. ReflectionInvariantTheory §2 states finite-orbit separation on Sym(V*) over an algebraically closed characteristic-zero field; this matches the dual-space application. CharacteristicClasses C5 owns the compact invariant comparison; PseudodifferentialOperators §3.1 supplies periodic Fourier theory; LieGroupoidsPoisson G4.6A uses the same positive linear Poisson bracket. TensorProductCombinatorics §§1.5–1.6 and 2.6 own distributional cone reconstruction and type-A coordinates, distinct from the finite identity here.

At the five closest supplied heads: ClassicalGroups #1192, Scope lines 12–44, owns rational Schur/group comparisons and assigns the GL differentiation application here; CompactGroupsPartII #1047, Scope lines 35–59, explicitly assigns periods to ConvexityToric T1; ExceptionalThetaCorrespondencesForG2 #1736, Scope, consumes this roadmap's real exceptional algebra inputs and owns the exceptional theta constructions; SpinRepresentations #1207 owns Clifford/spin carriers, whereas the CAR paragraph here is an application/check; AutomorphicFormsOnReductiveGroups #1037, line 55, requests precisely the reductive-center inclusion/HC comparison of §9.2. No new duplicate owner of those distinct applications was established. R06 records the actual duplicate supplier contracts.

All four overlap leads were resolved: the three dropped-layer citations are R10. The #1797 conflict is acknowledged by the PR's generated `merge-order` block, which orders #1797 before #1220 and requires rebasing. The same block orders #1146 before the family-index change. Thus no missing-order finding is raised. Open requests lacking supplied text were not independently searched beyond the roadmap service.

**Source sample (all 14 requested subsections).** Printed pages, rather than PDF page indices, were used. The Etingof 18.755 page numbers in the README refer to the linked MIT Spring 2024 edition; the manifest's older arXiv extraction has different pagination. The exact MIT edition was read through the sources service under the same work identity, without editing the manifest. Entries marked partial below are not certifications of unread books.

| Sample | Text and locator read | Result and scope |
| --- | --- | --- |
| 0.1 | EtingofLieGroupsLieAlgebras lines 2450–2540, Thms 11.16/11.18, pp. 65–68 | Rank-one strings and Clebsch–Gordan decomposition support the route. The normalized Hermitian norms are the roadmap's explicit calculation, checked below; the source's reversed monomial in the proof is listed under Source issues. |
| 3.1 | EtingofLieGroupsLieAlgebras lines 5127–5145, Prop. 26.3/Thm 26.4, pp. 139–140; native PBW | PBW and its graded form support the input. Rees fibres over a free Lie algebra over a general ring are an additional construction; no unsupported division by a parameter is used. |
| 3.2 | GuttDeformationQuantization lines 899–947, Lecture 1 slide 14 | Positive bracket and averaged PBW convention agree. Ordered arbitrary-ring products are derived separately; the symmetrized half-bracket requires 2 invertible. |
| 5.1 | EtingofLieGroupsLieAlgebras lines 6640–6670, Ex. 32.13/Prop. 32.14, pp. 176–177; EtingofRepresentationsLieGroups lines 3469–3478, §17.2 p. 81 | The complex-simple sign argument is correctly supplemented by componentwise algebraic principal-sl₂ construction for algebraically closed characteristic-zero fields. Actual compact lattices still require R01/R02/R06. |
| 5.2 | WoitWeylCharacterFormula lines 94–132, Thm 1 pp. 2–4; lines 192–244, Thm 2 p. 5; EtingofLieGroupsLieAlgebras lines 5898–5950, Prop. 30.4/Cor. 30.5/30.7 pp. 159–160 | Haar normalization 1/|W| and integer squared-coefficient argument agree. The roadmap explicitly builds virtual-character integrality before using norm one. |
| 6.1 | EtingofLieGroupsLieAlgebras lines 5898–5945, Prop. 30.4 and Cor. 30.5 pp. 159–160 | Root order must be integral; general orbit sums are defined beyond the minuscule character case. The proposed formal results are native (R03). |
| 6.2 | Same Weyl character source; DeConciniProcesiVergneBoxSplines lines 475–480, 653–663, 838–864, Thms 2.15/2.29/3.3 and Prop. 3.2 | Unimodular inversion is distinguished from general vertex sums. These are background for the named distributional owner, not premises for the finite Fourier identity. No singular torus point is evaluated by division. |
| 7.1 | EtingofRepresentationsLieGroups lines 2147–2216, Thm 10.1/Rmk 10.2 pp. 51–52; lines 2981–3003, Thm 13.5 p. 69; lines 3030–3082, Thm 14.1 pp. 70–71; EtingofLieGroupsLieAlgebras lines 4763–4845, Thm 24.2/Lemma 24.3 pp. 130–132 | Chevalley, equivariant symmetrization, HC shift and Serre route agree; complex-source hypotheses are identified and algebraic extensions described. Most auxiliary constructions are already native (R04). |
| 7.2 | EtingofRepresentationsLieGroups lines 2207–2216, Rmk 10.2 p. 52; native symmetric/Cartan carriers | Killing duality changes S(L*) to S(L), with the actual restriction square. This section now describes native carriers rather than missing Lean definitions. |
| 9.1 | Stembridge2002LR lines 109–122, second Corollary p. 3; EtingofLieGroupsLieAlgebras lines 8808–8850, Thm 43.4/Cors 43.5–43.6 pp. 231–232 | LR coefficients support the application after the owned differentiation comparison. Stembridge uses column-suffix tableaux and notes equivalence with the word formulation; SchurWeyl owns that convention bridge. General reductive textbook locators remain uncertified below. |
| 9.2 | EtingofRepresentationsLieGroups Thms 13.5/14.1 above; Stacks02ML lines 13996–14006, Lemma 10.122.11; native product/abelian maps | Semisimple HC input and finite-localization route match their hypotheses. Algebraic fixed-point comparison is characteristic zero and connected; no positive-characteristic or disconnected assertion is made. General reductive book text unavailable. |
| 9.3 | Native product/abelian enveloping comparisons; Dixmier §1.6 named in References | Generator/inclusion normalization checked directly below. Dixmier text could not be read legally; this source component is not certified. |
| 10.1 | GarnierAlcoves lines 231–280, Thms 1.3.2/1.3.5 p. 5; lines 389–414, Prop.-Def. 2.2.1 pp. 7–8; line 642 onward, Cor. 2.2.7 p. 10; lines 1161–1204, Prop. 2.3.1 pp. 16–17 | Coroot translations, closed alcove and intermediate lattices agree. Pointwise uniqueness is separated from freeness at walls. Quotient-topology adapters are additional targets. Source slips below are not adopted in the checks. |
| 10.2 | Garnier's lattice statements above; main ConvexityToric T1; SU(2)/SO(3) normalization | The algebraic quotients are consistent; the compact exponential/root bridge is not a theorem of Garnier. Its supplier ownership and direction need R01/R06. |

Additional Layer 8 sources were opened: BaezOctonions lines 340–408 (§2.2, equations (2)–(3), Propositions 4–5, pp. 8–10) and 1468–1481 (§3.4 p. 32); LandsbergManivelMagicSquare lines 45–81 (§1.1 pp. 2–3). The map (a,b)↦(a,conj b) relates Baez's doubling convention to the README's. The native cyclic Albert determinant is correct despite the conjugation slip in Baez's displayed matrix formula. The accessible Schafer text identifies itself at lines 20–41 as the 1961 notes, not the expanded 1966 book cited here.

**Computed adversarial pass (124 rows).** Each row records an actual value, including negative controls. “Keep” means no mathematical repair in that row; ownership and form findings remain applicable. These computations cover the sampled targets, all ten Lean headlines, the one retained definition, and each principal construction/convention in the remaining layers. Formal-identity rows are not claims of completed Lean proofs. Exact rational computation independently checked all 140 highest-vector norm sums with 0≤m,n≤6 and 0≤r≤min(m,n), plus the displayed Gram and Jordan commutator calculations.

| Statement/object | Instance(s) | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| Polynomial/symmetric-power headline | d=0,1,2; i=0,1,2 where valid | empty tensor ↔1; e₀↔x, e₁↔y; e₀e₁↔xy; d−i=0 at i=d | Keep; Fin(d+1) excludes underflow inputs. |
| Polynomial GL₂ action | [[a,b],[c,d]] | x↦ax+cy, y↦bx+dy; determinant vector maps by ad−bc | Keep column convention. |
| E,F,H normalization | x²,xy,y² | E(xy)=x², F(x²)=2xy, H(xy)=0; [E,F]x²=2x²=H(x²) | Keep. |
| Highest determinant vector | m=n=1,r=1 | v=x₁y₂−y₁x₂; Ev=0; Hv=0 | Keep; reversed determinant changes marked vector's sign. |
| Lowering string | m=n=2,r=0,N=4 | F²v=(2,8,2); E F²v=2(4−2+1)Fv=6Fv; F⁵v=0 | Keep endpoints. |
| Symmetric-tensor Hermitian metric | d=2,i=1 | norm²(xy)=1/binom(2,1)=1/2; norm²(2xy)=2 | Keep averaging, not unnormalized sum. |
| Highest-vector norm sum | (m,n,r)=(2,2,0),(2,2,1),(2,2,2) | binomial sums 1,1,3; factorial expression 1,1,3 | Keep; 140 exact cases matched. |
| Lowering norms | N=4,k=2; m=n=2,r=0 | k!N!/(N−k)!=24; norm²(2,8,2)=24 | Keep. |
| Tensor orthogonality | m=n=2, middle weight | Gram diag(1,1/4,1); columns (2,8,2),(1,0,−1),(1,−2,1) give diag(24,2,3) | Keep; all three off-diagonal products zero. |
| Inverse projections | above middle-weight vector A=(1,0,0) | coefficients 2/24,1/2,1/3; reconstructed vector (1,0,0) | Keep; inverse norm factors fixed. |
| Clebsch–Gordan dimension | m=n=2; m=0,n=2 | 5+3+1=9=3·3; 3=1·3 | Keep. |
| PBW ordered basis | abelian dimension 1; zero algebra | 1,x,x²,…; U(0)=K and S(0)=K | Native input. |
| Rees relation | [x,y]=y | jx·jy−jy·jx=t²ιy=t·jy | Keep positive sign. |
| Rees zero fibre | generator jx=tιx | residue corresponds to x≠0 in S(L); ambient evaluation at t=0 gives 0 | Keep distinct fibre map. |
| Rees unit fibre | t=1 or invertible a | jx↦ιx or aιx; inverse scales by a⁻¹ | Keep; no inverse asserted for a=0. |
| Parameter injectivity | zero coefficient ring | source/target each singleton; multiplication by t injective | Keep free-module formulation including zero ring. |
| Central-monic headline | L=Kx,R=K[x²],d=2 | x²−x²=0; spanning remainder basis {1,x} | Keep arbitrary field. |
| Monic negative control | L=Kx,R=K | x transcendental; no positive-degree monic relation; U infinite-dimensional | hmonic essential. |
| Central-monic empty basis | L=0,R=K | no relations required; U=K, rank 1 | Keep, no vacuity defect. |
| Global PBW headline | empty word; [x,y]=y | sym(1)=1; sym(xy)=(xy+yx)/2=yx+y/2 | Keep linear, not algebra, equivalence. |
| Symmetrization equivariance | [h,e]=2e | ad h(sym(e²))=4e²=sym(ad h(e²)) | Keep. |
| Ordered product formula | X²Y | Y(X+ħ)²=YX²+2ħYX+ħ²Y | Keep all terms. |
| Ordered first-order coefficient | (p,q)=(x,y),(y,x) | B_ord=y,0; difference y | Keep; neither coefficient individually is the bracket. |
| Symmetrized product/change | x,y | B_sym=y/2; reversed −y/2; T(xy)=xy+ħy/2 | Keep characteristic-zero branch. |
| Poisson evaluation | ξ(x)=2,ξ(y)=3 | {x,y}(ξ)=3; {x²,y}(ξ)=2·2·3=12 | Keep. |
| Characteristic 2 control | [x,y]=y over F₂ | ordered XY=YX+ħY valid; 1/2 undefined | Excluded only from averaging, not ordered theory. |
| Rees Casimir | sl₂ | Ω=H²+2tH+4FE; symbol h²+4ef; [E,Ω]=0 | Keep. |
| Ordinary dual | A₂ standard; A₁ V₁ | −w₀ω₁=ω₂≠ω₁; −w₀(1)=1 | Keep; ordinary dual has minus action. |
| Opposition involution | A₂ fundamental coordinates (1,0) | δ(1,0)=(0,1), δ²(1,0)=(1,0) | Keep. |
| All-modules self-duality | D₄; rank zero | w₀=−I, δ=I, diagram group S₃; rank-zero δ is identity | Keep; converse about diagram group excluded. |
| Form-sign headline | sl₂ V₁,V₂,V₀ | sum positive-coroot pairings 1,2,0; signs −1,+1,+1; forms alternating,symmetric,symmetric | Keep nonzero-form hypothesis. |
| Compact FS convention | SU₂ standard; circle z | indicator −1; integral of z²=0 | Keep χ(g²), not χ(g). |
| Circle dual negative control | z=i | χ(i)=i; χ*(i)=−i | Keep central-torus qualification. |
| Adjoint weights | SU₂ | weight set {2,0,−2}; root set {2,−2} | Fails R02; retain zero Cartan space. |
| Rational extension gaps | U₁ character z⁻¹; t=2 | regular extension 1/2; conjugation 2; both agree on unit circle | Correct regularity witness; ownership/registration R01/R07. |
| Distinct type-A orbit | (1,1), S₂ | orbit size 1, orbit sum t₁t₂; group sum 2t₁t₂ | Keep. |
| Root order and score | (1,1,−2),(2,−1,−1), score (3,2,1) | both score 3; prefix inequalities go opposite ways | Keep score distinct from order. |
| Bounded lower region | n=2,total=0,bound score≤1 | dominant tuples (0,0),(1,−1) | Keep finite box. |
| Virtual-character integrality | GL₂ orbit (2,0) | m₂₀=t₁²+t₂²=χ₂₀−χ₁₁; at (1,1),2=3−1 | Keep signed virtual class. |
| Haar normalization | regular alternant S₂ | torus norm² 2; divided by |W|=2 gives 1 | Keep 1/|W|. |
| Rational Weyl numerator | λ=(1,0),t=(2,3) | D=−1/2,P=5,N=−5/2; N/D=5 | Keep normalized denominator. |
| Weyl rational summands | same | −4+9=5 | Keep; individual terms have denominators. |
| Singular torus point | λ=(1,0),t=(1,1) | polynomial character 2; numerator/denominator expression 0/0 | Evaluate polynomial identity, not quotient. |
| Stable tensor inequality | standard GL₂ squared | gap 1=spread 1; dimensions 4=3+1 | Weak inequality works. |
| Stable-range negative control | λ=(0,0),μ=(1,0) | gap 0<1; translate (0,1) not dominant | Exclusion correct. |
| Branching | GL₃ λ=(2,1,0) | interlacing GL₂ dimensions 2+1+3+2=8 | Keep all four rows. |
| Orbit carrier/sum | A₁ λ=0,1,2 | {0},{−1,1},{−2,2}; sums 1,z+z⁻¹,z²+z⁻² | Correct but native, R03. |
| Integral lower set | A₁ λ=2 | {0,2}; 2−1=1 not in 2ℕ; 2−4=−2 excluded | Correct native lower set. |
| Triangular expansion | sl₂ V₂ | ch=z²+1+z⁻²=m₂+m₀ | Correct but native, R03. |
| Character determines multiplicity | V₂+2V₀ | orbit coefficients (1,3), irreducible multiplicities (1,2), dimensions 3+2=5 | Keep triangular inversion. |
| Character equality both directions | V₁⊗V₁ and V₂+V₀; 2V₁ | first two z²+2+z⁻²; last 2z+2z⁻¹ despite same dimension 4 | Keep. |
| Grothendieck ring | [V₂]−[V₀] | character z²+z⁻²; not character of an honest sl₂ module | R15: specify group completion. |
| Minuscule multiplicity | A₁ λ=0,μ=1 | dominant translate +1 has coefficient1; −1 not dominant | Native rule's hypothesis retained. |
| Finite Fourier coefficient | character z | coefficient at +1: ∫z·z⁻¹=1; at −1: ∫z²=0 | Keep negative-frequency factor. |
| Kostant multiplicities | A₂ adjoint | root coefficients1, zero coefficient2; total 6+2=8; partition P(α₁+α₂)=2 | Keep. |
| Raw HC | Ω=h²+2h+4fe | HC_dot Ω=t²+2t; at λ=2 gives8 | Native convention correct. |
| Linear HC | same Ω | τ₋₁(t²+2t)=t²−1; at λ+ρ=3 gives8 | Keep shift −ρ. |
| Translation inverse/degree | h², translation by−1 | h²−2h+1; discrepancy degree1; τ₁(h−1)=h | Keep; native lower-degree API. |
| Central-character orbit iff | A₁ λ=2,μ=−4 or1 | χ₂(Ω)=χ₋₄(Ω)=8; χ₁(Ω)=3; s·2=−4 | Both directions tested. |
| Freudenthal recursion | sl₂ λ=2,μ=0,(α,α)=2 | left ((3²−1²)/2)·1=4; right 2·(α,α)·m₂=4 | Keep top multiplicity1 and finite sum. |
| Casimir nonseparation | A₂ highest weights ω₁,ω₂ | both (λ,λ+2ρ)=8/3; highest weights distinct and central characters distinct | Keep full-center, not single-Casimir, criterion. |
| Killing normalization | sl₂ | κ(h,h)=8,κ(e,f)=4; Ω=8·Casimir_κ | Keep. |
| Lie invariants | sl₂ h and h²+4ef | ad e(h)=−2e≠0; ad e(h²+4ef)=−4he+4eh=0 | Native invariant carrier correct. |
| Inner automorphism/inverse | exp(ad e) | h↦h−2e; f↦f+h−e; inverse h↦h+2e | Correct but native, R04. |
| Inner bracket law | transformed h,f | [h−2e,f+h−e]=−2(f+h−e) | Correct. |
| Killing coadjoint action | φ=κ(h,−),g=exp(ad e) | (φ∘g⁻¹)(f)=−8=κ(h−2e,f); φ∘g gives+8 | Keep inverse transpose. |
| Polynomial coordinates | dimension2,(2,3) | dual basis evaluates2,3; product6; degree0 unit1 even at rank0 | Correct coordinate adapter. |
| Polynomial differential | p(t)=t²,t=2,v=3 | dp(v)=12; d(t⁴) at1=4=2·2 | Correct, generic theorem native. |
| Differential negative controls | t² at0; Frobenius in char p | derivative0; derivative of t^p=0 though polynomial nonconstant | No surjectivity premise; no false extension. |
| Root-exponential parametrization | sl₂ at h; at0 | derivative images −2e,2f,h have rank3; at0 rank1 | Correct but native, R04. |
| Principal-open image | t↦t² over ℂ | image all ℂ, choose g=1; over ℝ image [0,∞) | Algebraic-closure hypothesis required for that route. |
| Trace powers | standard sl₂ at h; at e | m=0,1,2,3 values2,0,2,0; tr(e²)=0 | Correct but native. |
| Trace direct sum/zero | two standard copies; zero module | degree2 at h:4=2+2; degree0 zero module:0 | Keep. |
| Killing trace restriction | standard/adjoint sl₂ | h²/32 evaluates2t² at λ(h)=8t; h²/8 evaluates8t² | Correct native square. |
| Center symbol | sl₂ Ω | top h²+4ef; lower term2h; HC top h² | Correct; degreewise native, graded assembly extra. |
| Degree-zero center symbol | scalar c | sym c=c; restriction c=c; discrepancy0, predecessor⊥ | Keep natural-subtraction boundary handled separately. |
| Serre headline rank1 | A₁ normalized e,f,h | [h,e]=2e,[e,f]=h; Cartan matrix [2] | Keep, hspan excludes zero-generator model. |
| Serre transpose | B₃ long α₂,short α₃ | A₂₃=−2,A₃₂=−1; [h₂,e₃]=−e₃, so CM₂₃=−1 | Transpose correct. |
| Serre exponents | same B₃ pair | ad(e₂)²e₃=0; ad(e₃)³e₂=0 | Asymmetric exponents consistent. |
| Split G₂ headline | char0 split octonions | dim Der=14; rank2 plus12 roots=14; imaginary dimension7 | Consistent; existence naming R08. |
| Split F₄ headline | char0 split Albert | dim J=27,trace-zero26,Der52; rank4 plus48 roots52 | Consistent; native preliminaries R05, naming R09. |
| Cayley–Dickson unit/star/norm | x=(i,0),y=(0,1) | x²=y²=−1,Nx=Ny=1; x*=−x | Keep positive real conjugation. |
| Cayley–Dickson nonassociativity | i,j,ℓ | (ij)ℓ=(0,k),i(jℓ)=(0,−k); associator2(0,k) | Keep; no associative algebra instance. |
| Doubling convention comparison | T(a,b)=(a,conj b) | T(product) second coordinate=conj(a)conj(d)+c conj(b), matching Baez after T | Keep actual comparison. |
| Split/compact distinction | nonzero split isotropic vector; real division x | split N(x)=0 possible; division N(x)=sum eight squares>0 | No real-form identification before complexification. |
| Scalar trace | division octonion1, imaginary i | T(1)=2; T(i)=0; x+x*=T(x)1 | Keep factor2. |
| Cross-product associator sign | i,j,ℓ | (i×j)×ℓ−i×(j×ℓ)=2(0,k); associator+metric terms=2(0,k)+0−0 | Keep associator correction. |
| Albert determinant/Newton | diag(1,2,3) | T=6,T₂=14,T₃=36; (216−252+72)/6=6=det | Correct but native on split carrier. |
| Albert cubic identity | same diagonal | each t∈{1,2,3}:t³−6t²+11t−6=0 | Correct native identity. |
| Albert cyclic off-diagonal | a=(3,1,1),x₀=1,others0 | determinant3−3=0 if offDiag0; x₁=1 instead gives3−1=2 | Fixes cyclic index, no interchangeable coefficient. |
| Compact Jordan metric | B=E₀₁+E₁₀ | B²=E₀₀+E₁₁, tr(B²)=2>0 | Keep compact positivity. |
| Complex-linear conjugation | i⊗1 | star fixes scalar i; norm quadratic value−1; trace2i | Keep complex-linear extension, not Hermitian conjugation. |
| Complex isotropic norm | 1+i u,N(u)=1,u imaginary | quadratic norm1+i²=0 | No positivity after complexification. |
| Complex cubic scaling | i·diag(1,2,3) | determinant i³·6=−6i | Keep. |
| Albert product comparison | B=E₀₁+E₁₀,C=E₁₂+E₂₁ | B∘C=(E₀₂+E₂₀)/2; BC=E₀₂ differs | Keep symmetrized product. |
| Albert complex bilinearity | iB | (iB)²=−E₀₀−E₁₁,trace−2 | Keep. |
| Derivation base change | D=[L_E₀₀,L_B] | D(1)=0,D(E₀₀)=−B/4; iD(E₀₀)=−iB/4 | Keep, excludes zero and conjugate-linear maps. |
| Derivation bracket/transport | D₁₂=[L_E₁₁,L_C] | [D,D₁₂](E₀₀)=−(E₀₂+E₂₀)/16; conjugation by e transports exactly this value | Keep. |
| E₈ dimension headline/model | sl₉+Λ³K⁹+(Λ³K⁹)* | 80+84+84=248; E₈ rank8 plus240 roots248 | Keep; model bracket not replaced by dimension assertion. |
| E₆/E₇ dimension headline | Albert/Freudenthal decompositions | 52+26=78;78+1+27+27=133; rank6+72=78,rank7+126=133 | Keep. |
| Freudenthal module | scalar/J/J*/scalar | 1+27+27+1=56 | Keep distinct from Lie algebra dimension133. |
| Reductive semisimplicity | abelian generator N=[[0,1],[0,0]] | only eigenweight0, kernel one-dimensional, no invariant complementary line | Correct negative control. |
| Reductive irreducible reconstruction | central functional1/2 | center acts by1/2; derived trivial; no integral group character | Keep arbitrary central shift. |
| GL₂ Casimir | μ=(3/2,1/2) | dim2; central scalar2; 3/2·5/2+1/2·(−1/2)=7/2 | Keep Lie/group distinction. |
| GL₁ and GL₀ | μ=1/2; empty tuple | GL₁ Lie dimension1 module with scalar1/2; GL₀ trivial unit | Keep separate n>0 uses. |
| Differentiation | torus t^λ | derivative at1 in direction a is λa; λ=−1 gives−a | Keep sign/determinant twist. |
| Group/Lie fixed comparison | characteristic p weight-p character; disconnected C₂ sign | derivative0 but character nontrivial in both controls | Excluded by characteristic zero and connectedness. |
| LR product | λ=μ=(1),n=2,1,0 | counts1,1; (x+y)²=(x²+xy+y²)+xy; n1:x²=x²+0; n0 only empty unit | Correct; supplied by SchurWeyl§7.2. |
| LR reading convention | shape(3,2)/(1),content(2,2) | right-to-left word1010 fails first prefix;0011 passes; coefficient1 | Keep supplier's order, shifted labels. |
| Product-enveloping definition | Z=Kz,S=sl₂ | z↦z⊗1; e↦1⊗e; [z,e]↦0 | Keep actual factor order. |
| Product-center headline | Z=Kz,S=sl₂ | centers K[z,Ω] and K[z]⊗K[Ω]; z↦z⊗1,Ω↦1⊗Ω | Inclusion square agrees. |
| Product-center degeneracies | Z=0 or S=0; both0 | Z(U(S)); S(Z); K respectively | Keep no unnecessary semisimplicity. |
| Trace splitting | gl₂ A=I | tr(A)=2,c=tr/n=1; n1 c=tr; n0 no1/n | Keep coordinate versus trace polynomial. |
| Characteristic-p trace failure | n=p,I | tr(I)=0 although I≠0 | Char-zero matrix splitting restriction needed. |
| Integral lattice comparison | A₁ α=2ω | Q=2ℤω,P=ℤω,index2; distinct from rank1 | Keep actual indices. |
| Affine Weyl action | coordinate α(x),A₁ | translations2ℤ; reflections x↦−x and2−x; closed alcove[0,1] | Keep coroot translation. |
| Closed representative uniqueness | x=2/3; endpoint0 | affine representative2/3; endpoint stabilizer{1,s₀} of order2 | Unique point, not free action. |
| Extended affine quotient | A₁,Y=P∨ | Ω=C₂,x↦1−x;2/3 identified with1/3; midpoint1/2 fixed | Keep finite quotient of alcove. |
| Rank-zero affine geometry | empty root system | point alcove, trivial affine and Ω groups, quotient point | Keep empty node set. |
| Ω and diagram action | A_r,D₄,E₆ | Ω=C_(r+1),V₄,C₃; D₄ extension V₄⋊S₃=S₄, E₆ C₃⋊C₂=S₃ | Keep nonabelian diagram extensions. |
| Compact period calibration | SU₂,H=diag(i,−i) | exp(2πH)=1; root differential2i; pairing2 | Correct; existing owner R06. |
| Compact center versus Ω_Y | SU₂; SO₃ | SU₂:Y=Q∨,center2,Ω_Y1;SO₃:Y=P∨,center1,Ω_Y2 | Keep distinct quotients P∨/Y and Y/Q∨. |
| Central torus control | S¹ | center infinite; root system empty | Semisimple hypothesis necessary. |
| CAR scalar and multiplicity | N=2 | ΣFᵢᵢ=N²/2=2; Clifford dimension16, irreducible dimension2,multiplicity8 | Consistent application, not new Clifford carrier. |

## Not verifiable

- `HumphreysIntroLieAlgebras` is settled uncertified. Its cited §§17,20–24 and other textbook locators were not reopened or guessed.
- `GoodmanWallachSymmetry` and `BourbakiLie78`: the sources service found publisher/paywall records, not readable text. General reductive representation/center claims attributed to them remain uncertified; the numerical and pinned-library checks above are independent evidence, not source certification.
- `DixmierEnveloping` (§1.6), `HumphreysCategoryO`, `JantzenQuantumGroups` and `MolevYangians` (Chs. 1–2): service lookups returned AMS landing pages without an accessible legal text. `SerreComplexSemisimple`, `FultonHarrisRepresentation` (Lectures 12–13,25), `JantzenAlgebraicGroups` and `JacobsonExceptional`: legal citation/title lookup returned no readable text. Their missing records and attempted locations were retained in `needs-references.toml`; the review is finished, not parked for them.
- `SchaferNonassociative`: the cached legal text is the 1961 Oklahoma notes. Its own introduction distinguishes the expanded 1966 Academic Press book cited in this README. No unprovided 1966 theorem/page was certified from the 1961 notes.
- The arbitrary-field exceptional model brackets and compact real-form constructions are mathematical targets, not implemented carriers at the pins. Small-model computations check normalization; they do not constitute proofs of all exceptional identifications. Exact source locators still need R14.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at proof of Theorem 11.16(iii), printed p. 67, line 2500: the source sends the mth lowered vector to x^m y^(n−m); it should be the stated falling-factorial coefficient times x^(n−m)y^m; affects the proof.
- **Misprint** in EtingofLieGroupsLieAlgebras at proof of Theorem 24.2(iii), printed p. 132, line 4835: the source counts indices with coefficient at least zero; it should count strictly positive coefficients; affects the proof.
- **Misprint** in WoitWeylCharacterFormula at proof of Theorem 2, printed p. 5, line 241: the source labels the top alternant by λ plus the denominator δ; it should be λ+ρ; affects the proof.
- **Error** in WoitWeylCharacterFormula at the partition-function definition, printed p. 6, lines 286–288: the source counts arbitrary integral combinations of positive roots; it should count nonnegative integral combinations; affects a stated result.
- **Error** in WoitWeylCharacterFormula at Corollary 3, printed p. 6, lines 295–299: the source multiplies Weyl lengths in the sign and mismatches the output weight; it should use length sum and w(μ+ρ)+w′(ν+ρ)−λ−2ρ; affects a stated result.
- **Error** in GarnierAlcoves at §2.2 before Proposition-Definition 2.2.1, printed p. 7, lines 381–383: the source tests minuscule weights using highest-root coefficients; it should use highest-coroot coefficients, or call the corresponding coweights minuscule; affects a stated result.
- **Gap** in GarnierAlcoves at proof of Proposition 2.3.1, printed p. 17, line 1191: the source infers discreteness from countability; it should infer discreteness from containment in the coweight lattice; affects the proof.
- **Error** in BaezOctonions at §3.4 determinant display, printed p. 32, lines 1475–1479: the source uses 2Re(xyz) with z conjugated in the displayed cyclic matrix position; it should use 2Re(xy conjugate(z)); affects a stated result.
