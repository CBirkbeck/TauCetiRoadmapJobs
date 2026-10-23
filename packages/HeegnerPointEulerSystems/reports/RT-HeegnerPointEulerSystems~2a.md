<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/159#issuecomment-6355552076 -->
Red team round 2 pass a (codex) of 6f4ac32

Verdict: needs_changes

1. **F01** (P3) Boundary calculations and definition laws remain in the acceptance test

   **Location:** `packages/HeegnerPointEulerSystems/Suggested.lean:33`: “conductorPoint cuspMap x c = cuspMap (x c) := rfl”; also lines 64, 70, 89, 111, 131, 159, 220, 224, 248, 268, 291, 315, 340, 367 and 392.

   **Claim:** These sixteen named theorems belong among the finished roadmap's headline acceptance statements.

   **Witness:** `conductorPoint_cusp` and `stabilizedPoint_first_level` are `rfl`; `lambdaDerivativeClass_restrict` is `e.apply_symm_apply _`. The coefficient examples compute (10,20)=(5) and (5)+(25)=(5); the remaining declarations are boundary Checks or elementary laws.

   **Exact repair text:** Delete from `Suggested.lean` the sixteen theorems at the listed lines, excluding `coefficientIdeal_normal_form` and `non_torsion_point_prime_divisibility`. Keep their mathematical statements as README Checks or API prose. Delete the routine proved examples as well; retain at most a handful only if they test a nontrivial definition needed by a retained headline. Do not replace deletion by proofs: fourteen of the sixteen are already proved.

   **Retest:** Removing the two coefficient computations leaves their true values (5) in the README; removing `conductorPoint_cusp` loses no acceptance condition beyond definitional equality. The full declaration table below identifies each deletion individually.

2. **F02** (P2) Generic wrappers replace headline statements and the missing-headline inventory

   **Location:** `packages/HeegnerPointEulerSystems/Suggested.lean:4–8`: “representative target signatures”; “Light algebraic definitions take their maps as data”.

   **Claim:** The fourteen light definitions and their elementary consumers provide the roadmap's acceptance test.

   **Witness:** `heegnerIwasawaClass` is an arbitrary additive equivalence applied to an arbitrary element; `determinantalHeegnerElement` inverts an arbitrary tensor equivalence. Neither statement contains Iwasawa cohomology or a Selmer determinant. No missing headline is named in the module docstring.

   **Exact repair text:** Replace the module heading by “HeegnerPointEulerSystems: target signatures” and say: “README.md is the roadmap. This file states its headline theorems against the pinned APIs.” Name each unstated arithmetic headline and its missing construction explicitly, using the headline inventory below. Delete every light definition used only by S01's padding, including the arbitrary point, descent, correction, transport and determinant wrappers. Keep a definition only when it is needed by a retained genuine headline. The generic finitely generated group assertion at line 168 belongs in README background unless restated as an actual statable headline. Do not fill the arithmetic gaps with freely supplied maps.

   **Retest:** The models `L=C=ℤ`, `shapiro=id`, `q=1` and `D=S⊗S`, `e=id` satisfy the wrappers without any number field, curve or Selmer theory. Deleting them prevents those models from masquerading as arithmetic acceptance tests. The coefficient-ideal normal form itself is true at its explicit generality; its full arithmetic interpretation remains a separate question.

3. **F03** (P3) Identity transport does not force an optimal local embedding

   **Location:** `packages/HeegnerPointEulerSystems/README.md:230,232`: “The unramified quadratic field with g=1 has the maximal order O_E”; “For a ramified quadratic extension with g=1 the maximal order remains O_E”.

   **Claim:** These Checks apply to the arbitrary specified embedding of §0.1.

   **Witness:** Embed ℚ₅(√2) into M₂(ℚ₅) by √2↦[[0,10],[1/5,0]], take O=M₂(ℤ₅), g=1. The preimage is ℤ₅+5ℤ₅√2, not O_E; √2 itself has nonintegral lower-left entry.

   **Exact repair text:** “With an embedding satisfying ι(O_E)=ι(E)∩O_v and g=1, the local order is O_E, in both unramified and ramified cases. Without this optimality condition, g=1 can give a nonmaximal order: the displayed ℚ₅(√2) embedding has conductor 5.” Keep the existing split nonmaximal Check and add this negative control.

   **Retest:** For the regular integral embedding √2↦[[0,2],[1,0]], the preimage is O_E; for its conjugate above the conductor is 5. Over ℚ₂(i), i↦[[0,−2],[1/2,0]] similarly gives ℤ₂+2ℤ₂i, so dyadic ramification does not fix the omission.

4. **F04** (P1) The cited image supplier supplies no open-image or homothety theorem

   **Location:** `packages/HeegnerPointEulerSystems/README.md:144`: “R28.4: open-image extension with residual surjectivity almost everywhere, integral openness, homotheties and matrix-evaluation bounds”; used in §§7.2–7.4.

   **Claim:** FaltingsFinitenessAndIsogenyTheorems R28.4 and ArithmeticGaloisRepresentations §§6.4–6.4a supply all arithmetic image inputs.

   **Witness:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:1651` titles R28.4 “Semisimplicity and the Tate conjecture”. `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3919` defines open-image predicates; it does not prove them for non-CM elliptic curves or RM quotients.

   **Exact repair text:** “FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.6 supply rational Tate endomorphism/Hom comparison; R28.6.7 supplies almost-all integral commutant generation. ArithmeticGaloisRepresentations §6.4 supplies coefficient decomposition and image predicates.” Repoint the matrix-algebra part accordingly. Declare separate precise supplier gaps under ArithmeticGaloisRepresentations for (i) Serre's adelic open-image theorem for non-CM elliptic curves over number fields, with full residual image almost everywhere for E/ℚ, and (ii) the Bogomolov/Serre scalar-image bound for the stated RM quotients: for each coefficient prime a nonidentity scalar in the image, with scalar-minus-one a unit at almost every prime. Put the same slugs in plan.json and use them in §§7.2–7.4. Do not assume these conclusions as new hypotheses of the arithmetic endpoints.

   **Retest:** A commutant calculation can be scalar for a proper image (e.g. SL₂ has scalar commutant); it supplies no index in GL₂ and no scalar of arbitrary cyclotomic determinant. For the C₃ matrix bound the actual available R28.6.7 statement must be used; the remaining scalar input is explicitly owned by the new contract.

5. **F05** (P1) RM descent uses finite generation that its cited elliptic input does not supply

   **Location:** `packages/HeegnerPointEulerSystems/README.md:1185`: “Write C₀=max{c:y∈A(K)_tors+𝔭^cA(K)}”; also §§7.7,7.10,7.12.

   **Claim:** C₀ is finite and zero almost everywhere for the general RM abelian variety, with finite Selmer input available for that variety.

   **Witness:** `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:3090` explicitly assumes (MW) for this use. §7.1 here concerns only E(K). The earlier owner is `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:615`, §1.7, which proves finite generation for every abelian variety over a number field.

   **Exact repair text:** Add “From HeightsRationalPointsAndObstructions §1.7 Mordell–Weil: for every abelian variety A over a number field K, A(K) is finitely generated.” Cite it before defining C₀ in §7.6 and in the RM almost-all-prime and finiteness applications. Cite SelmerIwasawaCohomology §2.12a's `abelianSelmerGroup_finite` for §7.7, rather than the multiplicative limit-Kummer §§0.6,0.8.

   **Retest:** Without finite generation, M=ℚ and y=1 have y∈p^cM for every c, so C₀ has no finite maximum. In M=ℤ² with y=(12,18), C₀(2)=C₀(3)=1 and C₀(p)=0 otherwise; the imported finite-generation theorem gives exactly the needed argument without assuming rank one.

6. **F06** (P1) The square-index prerequisite is expressly excluded by the cited supplier

   **Location:** `packages/HeegnerPointEulerSystems/README.md:204`: “Its original proof is a separate prerequisite of EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19”; §7.13 uses that prerequisite.

   **Claim:** The cited earlier sections supply the K-independent classical square-index cardinality bound.

   **Witness:** `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:3098` explicitly says its result does not prove the all-prime square-index length theorem with a constant independent of K. §§4.18–4.19 are twisted-system bounds, not that theorem.

   **Exact repair text:** Replace the assertion of supply by a declared contract: “What EulerSystemsAndKolyvaginSystems must provide (gap:classical-uniform-square-index): In Kolyvagin's Theorem A setting, supply the integral length descent yielding a positive d_E independent of the classical Heegner field K, with v_ℓ(d_E)=0 at the full Tate-image primes B(E), and #Sha(E/K) dividing d_E[E(K):ℤy_K]², including the Cartan/CM and dyadic error terms.” Add the same named entry to plan.json, and make §7.13 an arithmetic application of that contract rather than of the exponent theorem. Alternatively move the full original length argument into §7.13 with explicit intermediate targets; the citation alone is not an implementation input.

   **Retest:** `(ℤ/p)^r` has annihilator p for every r but order p^r. An exponent bound with constants independent of M cannot bound its order by a fixed square index; the new contract asks for precisely the missing length assertion.

7. **F07** (P1) Odd-prime branches still depend on a comparison restricted to p>3

   **Location:** `packages/HeegnerPointEulerSystems/README.md:1997,2069`: §8b.4 and §8b.10 both require §8b.2; §8b.2 says “For the integral statement p>3”.

   **Claim:** The integral residual-surjective bound of §8b.4 and the Eisenstein integral equality of §8b.10 include p=3 with the displayed proof dependencies.

   **Witness:** At p=3, the inequality p>3 is false. The rational variant in §8b.2 inverts p, so it loses integral p-content. CGS Theorem C includes p=3 (`cgs` lines 156–169); `gap:primitive-toric-mu` additionally assumes p≥5.

   **Exact repair text:** Give the p=3 integral formulation comparison its own named target before §8b.4, with the hypotheses actually used in that branch and an explicit proof from integral reciprocity/local-control inputs, or declare a matching supplier gap. For §8b.10 use the odd-prime Eisenstein comparison and Greenberg reformulation of CGS Theorem C directly under its local-character hypotheses; do not route it through the p>3 BCK comparison or the p≥5 primitive-toric contract. Record its integral normalization inputs explicitly. Keep p=3 in both claimed endpoints.

   **Retest:** Ideals (3) and (1) become equal in Λ[1/3] but differ in Λ. Thus the rational CGLS comparison cannot fill the p=3 integral dependency; the separate odd-prime contract must retain that factor. This is distinct from the settled p=3 rigidity gap, which concerns §8.40.

8. **F08** (P2) The conductor-unit sequence already has an owner on main

   **Location:** `packages/HeegnerPointEulerSystems/README.md:82,283`: “The conductor-change unit sequence ... [is] proved in Layer 0 here”; “prove conductorPicardMap_unitExact”.

   **Claim:** This roadmap owns construction of the quadratic-order conductor residue-unit exact sequence.

   **Witness:** `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:43–49`, H1.4, already constructs that sequence for every f≥1, the class-number product and exceptional-unit indices for discriminants −3,−4.

   **Exact repair text:** “ImaginaryQuadraticClassNumber H1.4 supplies the conductor residue-unit exact sequence, class-number formula and exceptional-unit indices. Section 0.4 applies its compatible extension/contraction maps at f=c and f=cℓ to identify the successive kernel and its cardinality.” Remove the duplicate construction/API ownership and cite H1.4 in Exact supplier contracts and §0.4. Keep the successive-tower application and its Checks here.

   **Retest:** For K=ℚ(i), f=3, the imported formula gives 3·(1+1/3)/2=2; dividing the cℓ and c class-number formulas recovers u·#ker=ℓ−χ(ℓ), and the repeated-prime quotient gives u·#ker=ℓ.

9. **F09** (P2) The weak-torsion ordinary branch drops the source's discriminant condition

   **Location:** `packages/HeegnerPointEulerSystems/README.md:1846`: “Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists”; ordinary context at line 33 only requires odd D_K.

   **Claim:** The CGLS family and localized divisibility are supplied on that context, including D_K=−3.

   **Witness:** `cgls` line 81 defines (disc) as odd D_K with D_K≠−3; line 1417 imposes it on §4.1, including the theorems cited here. Oddness alone does not exclude −3.

   **Exact repair text:** “For this application of CGLS Theorems 4.1.1–4.1.2 assume (disc): D_K is odd and D_K≠−3, together with the ordinary Heegner context and E(K)[p]=0.” Define (disc) once and carry it into the CGLS applications in §§8.2–8.6, 8.13 and 8.37, or explicitly prove their exceptional-unit extension before using it. Keep the general quadratic-order and unit-corrected CM constructions, including D_K=−3, in their existing generality.

   **Retest:** K=ℚ(√−3) has D_K=−3 odd and u_K=3; it passes the old discriminant context but fails the cited source's (disc). K=ℚ(√−7) has odd D_K≠−3 and u_K=1 and passes both. This is unsupported generality, not a claimed counterexample to a suitably extended theorem.

10. **F10** (P3) Residual supplier suffixes do not resolve to targets

   **Location:** `packages/HeegnerPointEulerSystems/README.md:838,1402`: “finite-condition-lattice-duality”, “lattice-pairing-compatibility”, “determinants/iwasawa-cohomology”.

   **Claim:** These strings are exact locators of SelmerIwasawaCohomology prerequisites.

   **Witness:** The readable open-head copy of `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` contains none of these three suffixes. Its §2.17 states integral local duality and §3.1 constructs Iwasawa cohomology; §3.2 supplies Shapiro.

   **Exact repair text:** Replace the two suffix citations in §5.5 by “SelmerIwasawaCohomology §§2.13–2.17, duality and integral local duality”, and the suffix citation in §8.6 by “SelmerIwasawaCohomology §3.1 Iwasawa cohomology”. Keep the existing §3.2 Shapiro citation. Use the actual current headings rather than appended invented anchors.

   **Retest:** The finite/torsion orthogonality and inverse-limit cohomology objects are now attached to existing numbered targets. No missing-theory gap is inferred merely from a malformed suffix.

11. **F11** (P3) Planned API identifiers are still presented as undeclared Lean names

   **Location:** `packages/HeegnerPointEulerSystems/README.md:435,1004`: “parameter_choice_and_degree”; “ribet_takahashi_tamagawa_comparison”.

   **Claim:** Backticked own names identify acceptance declarations, while the README separately says most of them are future library APIs.

   **Witness:** Neither identifier occurs as a declaration in `packages/HeegnerPointEulerSystems/Suggested.lean`; the same holds for the repeated “Prove the mathematical target” names and many fully qualified API/Check names.

   **Exact repair text:** Rewrite planned API bullets, Checks and unstated theorem labels as mathematical prose without code-formatted own identifiers. Reserve backticked own Lean names for the declarations retained in the acceptance file after S01–S02. Keep all mathematical targets and source locators; do not add an API catalogue to Suggested.lean to make the names resolve.

   **Retest:** The Ribet–Takahashi formula remains an explicitly sourced README target, while its absence from the Lean file is recorded by the missing-headline inventory instead of a nonexistent Lean identifier.

12. **F12** (P2) The classical bottom trace duplicates the earlier EffectiveClassNumbers construction

   **Location:** `packages/HeegnerPointEulerSystems/README.md:410`: “Define y_K=Tr_{K[1]/K}P_1 separately”; §1.6 also plans its classical conjugation and cusp-torsion law.

   **Claim:** The classical conductor-one trace and its Galois/conjugation construction are new ownership here.

   **Witness:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:633–641` at the supplied open head already constructs the trace for arbitrary admissible N,K, its arithmetic-Artin law, K-rationality, and conjugation formula with the cusp-torsion correction.

   **Exact repair text:** “EffectiveClassNumbers §2.8, Classical Heegner construction, supplies the cusp-normalized conductor-one trace and its arithmetic-Artin and conjugation laws. The modular branch of §1.5 extends this supplied normalization to every conductor; its conductor-one trace agrees with that construction.” Import the already owned classical laws in §1.6. Keep higher conductors, integral quaternionic Hodge maps, derivative classes and their new comparisons here.

   **Retest:** At N=37,D_K=−139 both definitions are the sum of the same three CM divisor classes under the same quotient. At N=5077,D_K=−7 both have one summand. The import preserves these sums and creates no dependency on a later roadmap.

13. **F13** (P3) The inverse and involution Checks do not distinguish the claimed conventions

   **Location:** `packages/HeegnerPointEulerSystems/README.md:805–807,1750–1752`: “χ=negation on ℤ and κ=3 gives −3”; “With identity involution ... scales by p²”. Also §§4.4 and 8.33.

   **Claim:** These Checks pin inverse correction/descent and the determinant's nontrivial involution.

   **Witness:** Identity, zero and negation give the same answers for χκ and χ⁻¹κ. All displayed determinant scalar tests use the identity involution, so a² and aι(a) agree on every tested scalar.

   **Exact repair text:** Add the following README Checks: “On ℤ² let χ(x,y)=(x+y,y). For κ=(0,1), inverse correction/descent gives (−1,1), whereas forward application gives (1,1).” Apply the same test with the derivative equal to the identity in §8.33. In §8.30 add: “For a=γ in Λ with ι(γ)=γ⁻¹, simultaneous Heegner rescaling multiplies the determinant by γγ⁻¹=1; replacing aι(a) by a² gives γ²≠1.” Retain these as README convention tests, not new Lean padding.

   **Retest:** χ(−1,1)=(0,1), whereas χ(1,1)=(2,1). For an infinite-order generator γ, γ²−1≠0 in ℤ_p⟦Γ⟧, including p=2; the involution test therefore separates the wrong square normalization.

## Verified sound

Read: **32 named Lean declarations** (14 definitions, 18 theorems), **28 proved examples**, **132 README target sections**, and **103 explicit Checks** in 33 blocks. Compared all 32 named types against the supplied elaborated signatures: **zero dropped binders**. Verified **24 pinned Mathlib citation rows**; the source audit records **19 source-locator groups** with exact cached lines. Resolved **27 supplier families**, with **22 readable** and five explicitly limited below; checked all **17 supplied sibling folders** and three additional ownership witnesses. The findings concern the exceptions identified in the tables; numerical tests do not replace the deep proofs.

The package diff is confined to its folder. The Lean file has one `import Mathlib`, no Tau Ceti import, no `set_option`, no admitted data, no admitted examples, no `lemma` declarations and no free `Prop` placeholder. Its 397 lines are below the limit. Source entries are distinct, legal and versioned. No new source was needed or requested. No package content was changed by this review.

### Earlier findings: individual repair verification

The findings below use the identifiers of the original reviews, not the repair report's repeated heading numbers. Quoted passages are from this head. “Repaired” concerns the original witness; a newly introduced acceptance-test defect is recorded separately.

| Earlier finding | Status | Repaired passage and current locator | Verification/witness |
| --- | --- | --- | --- |
| r1a:F01 admitted data | Repaired | Suggested.lean:22 “φ (x c)”; :78 “resInv.symm z” | All 14 definitions have real bodies. Four `sorry`s remain, all in theorems. |
| r1a:F02 false arbitrary-carrier arithmetic | Repaired | README:39 “generic maps ... are data”; arithmetic targets have explicit objects in §§0–8b | The former arbitrary-order and zero-localization theorems are absent. New stand-ins are S02, not a claim that their elementary equalities are false. |
| r1a:F03 wrong pins | Repaired | README:47–74 links contain “6b7abb3c7686292736be2955bd3eb9ebf63b456a” | Matches supplied manifest; Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. |
| r1a:F04 ineligible suppliers | Repaired under this round's contract | README:108–194 names the five now-authorized suppliers and explicit gaps | All five are expressly earlier in this brief; AutomorphicPadicLFunctions and RankZeroOneBSD are absent as suppliers. Their unavailable text is a verification limitation, not renewed ineligibility. |
| r1a:F05 admitted examples | Repaired | Suggested.lean:29–30 “norm_num [conductorPoint]” | All 28 examples are proved. Their lack of acceptance-test purpose is S01. |
| r1a:F06 imports/options/namespace | Partly repaired | Suggested.lean:1 “import Mathlib”; :14 “namespace TauCetiRoadmap.HeegnerPointEulerSystems” | Single import, no options, mathematical docstrings and ordered layer comments. Module still says “representative target signatures” and lacks unstated headline inventory: S02. |
| r1a:F07 source manifest | Repaired | sources.toml:1 “schema = \"tauceti-roadmap-sources/v1\"” | Nineteen distinct certified source entries with provenance; no duplicate work keys found. |
| r1a:F08 cone shift | Repaired | README §8.18 “Cone(global → local)[−1]” | G=0,L=R[0] gives fibre R[−1], H¹=R. Unshifted cone would give H⁰=R. `cs` lines 673–683. |
| r1a:F09 isogeny invariance | Repaired | README:433 “For ... a fixed E, I_K/c_φ is independent”; “changes by j/\|a\|” | j=5,a=1 multiplies ratio by5; changing parametrization by [5] multiplies both index and differential by5. |
| r1a:F10 wrong supplier scope | Partly repaired | README:82 “conductor-change unit sequence ... proved in Layer 0 here” | GlobalNumberFields no longer credited with missing sequence, and PMIA characters repointed. Sequence already owned elsewhere: S08. |
| r1a:F11 group-ring content versus augmentation | Repaired | README §8.19 “Φ₀=aug(Φ)” | p=5,a=1,C₃: Φ=27−s−s², content valuation0, augmentation25 valuation2. |
| r1a:F12 elementary arithmetic replacements | Repaired | README §§0.6,6.19,7.8,8.20 state the actual arithmetic assertions | Old arbitrary functions/integers/finite-type injection replacements removed; remaining wrapper issue is S02. |
| r1a:F13 missing coefficient normal form | Repaired mathematically | Suggested.lean:55–61 “(hs : s.Nonempty)”; zero valuation “⊤” | s={19,149}, a=(10,25) at5 gives exponent min(1,2)=1; empty s excluded. |
| r1a:F14 missing convention/construction Checks | Partly repaired | README §§0.1–0.9,4.4,5.3,8.30 each now have three Checks | 33 blocks/103 bullets present; §0.1 has two false maximality Checks (S03); inverse/involution tests insufficient (S13). |
| r1a:F15 local dynamics | Repaired by declared contract; settled | README:178 “gap:cm-local-dynamics” | Same slug and precise L, r, cocompact-lattice hypotheses in plan.json; `cv-dynamics` 1168,1198,1257. No re-raise. |
| r1a:F16 inert specialization route | Repaired | README:1672 “γ↦(1+p)^(p^r)” | p=3,r=0 gives4; r=1 gives64 and v₃(63)=2. No split/crystalline requirement. |
| r1a:F17 wrong locators | Repaired | README §5.7 “Proposition9.1”; §8.11 “pp.58–59”; §8.44 “§3.4 proof” | `gross`422; `cornut-vatsal`2073–2082; `cs`887; `bcgs`720–722. |
| r1a:F18 p=3 rigidity | Repaired by declared contract; settled | README:1882 “gap:self-dual-rigidity-three” | Same slug in plan; p≥3 endpoint distinct from p>3 printed rigidity. S07 is a different formulation-comparison dependency. No re-raise. |
| r1b:F01 supplier drift | Partly repaired | README:696 “§R02.2.2 ... transgression”; :512 “§17.2 ... Eichler–Shimura” | Corrected low-degree, reduction and hypothesis-record sections exist; false image attribution S04, square-index attribution S06, suffixes S10 remain. |
| r1b:F02 six duplicate law sections | Repaired | README:1389 “level k equals the Kummer class of y_k” is now an API bullet | Six standalone copies removed; direct definition targets now receive their old links. |
| r1b:F03 nine padding theorems/choice wrappers | Repaired for the old declarations | README §8.4 “Finite solvability of the Heegner norm constraints” | Old generic compact-choice construction and nine named stand-ins absent. Newly retained boundary theorems are S01. |
| r1b:F04 package structure | Repaired | README headings “Scope and ownership”, “Exact supplier contracts”, “How to read the build” | Numbered layers, prerequisites, examples/dependencies present. Imported generic CM geometry is distinguished from family applications. |
| r1b:F05 page locators | Repaired | README §7.5 “pp.24–27”; §0.4 “pp.62–63” | `nekovar`1171 starts §4.8 on p24; `cornut-vatsal`2192 starts Appendix §6.1 on p62. |

### Lean declaration and instance audit

All 397 lines were read. All 32 named declarations were compared with the supplied elaborated signatures; all 28 anonymous examples were also read. There are no ambient `variable` declarations, local instances or hidden `include` dependencies: the contexts below are explicit declaration binders. `Type*` means independent universe variables; the dependent family in `baseLocus` is not collapsed to one carrier. No Lean was run. The old worker elaboration is evidence of types only, not of mathematical truth.

The following table has one row for each of the 60 declarations, including examples. “Delete” means S01/S02 acceptance-test repair, not that the displayed value is false. AG means AddCommGroup, CG means CommGroup, CR means CommRing; these abbreviations apply only to this audit table.

| Line; section; statement | Variable and instance context | Instances and computed values on both sides | Result/change |
| --- | --- | --- | --- |
| 21;1.5 conductorPoint | X,M:Type*; φ:X→M, x:ℕ→X,c:ℕ | φ=id,x_c=1,c=0,1,2 all give1=φ(x_c); zero φ gives0; orbit trace 1−1=0≠1 | True composition; S02 |
| 25;1.5 example zero | X,M; Zero M; x,c | zero map at c=0 gives0=0 | Delete routine Check |
| 29;1.5 example trace | ℤ | selected1≠1+(−1)=0 | True; delete routine Check |
| 33;1.5 conductorPoint_cusp | X,M, cuspMap,x,c | id at c=2 gives1=1 by reduction | S01, rfl |
| 41;4.1 coefficientIdeal | p:ℕ,Fact p.Prime,a:ℕ→ℤ,s:Finset ℕ | p=2,s={0},a=0: (0,1)=(1); s=∅ gives(0); p=5,s={19},a=0 gives(20)=(5) | Real finite sum; S02 purpose restriction |
| 46;4.1 example empty | p,Fact p.Prime,a | empty sum=(0)=⊥, not(1) | True; delete routine Check |
| 50;4.1 example zero eigenvalue | p,ℓ,Fact p.Prime | p=5,ℓ=19: (0,20)=(20); valuations (∞,1) give1 | True; delete routine Check |
| 55;4.1 coefficientIdeal_normal_form | p,Fact p.Prime,a,s,hs:s.Nonempty | p=5, two pairs(10,20),(25,150): ideal(5), min(1,1,2,2)=1; p=2,s={0}: ideal(1), min(∞,0)=0 | True; hs/primality survive; no forced arithmetic conclusion |
| 64;4.1 coefficientIdeal_min_not_max | Fact (Prime5) | (5)+(25)=(5); min1,2=1, max=2 | S01, delete numerical Check |
| 70;4.1 coefficientIdeal_prime_five | Fact (Prime5) | (10,20)=(5), exponent1 | S01, delete numerical Check |
| 76;4.4 descendedClass | C,I:Type*,AG C,I,e:C≃+I,z:I | e=id,z=3→3; e(x,y)=(x+y,y),z=(0,1)→(−1,1), forward=(1,1) | True inverse; S02/S13 |
| 81;4.4 example zero | AG C,I,e | e⁻¹0=0; zero group also0=0 | Delete routine Check |
| 85;4.4 example identity | AG C,z | id⁻¹3=3 | Delete routine Check |
| 89;4.4 descendedClass_noninjective_obstruction | ℤ additive equivalences | zero(0)=zero(1)=0, but0≠1, so existential=false and negation=true | S01, injectivity boundary |
| 100;5.3 correctedClass | C,AG C,χ:C≃+C,κ | id3=3; neg⁻¹3=−3; shear inverse at(0,1)=(−1,1) | True inverse; S02/S13 |
| 105;5.3 example identity | AG C,κ | id⁻¹3=3 | Delete routine Check |
| 109;5.3 example negation | ℤ | neg⁻¹3=−3=neg3; fails to distinguish direction | Delete; S13 README |
| 111;5.3 correctedClass_zero | AG C,χ | χ⁻¹0=0 | S01, simp |
| 119;6.12 vanishingOrder | C,Zero C,Λ:Setℕ,κ:ℕ→C | Λ=∅→∞; nonzero at1→0,2→1,6→2; junk0 also primeFactors=[]→0 | True set infimum; arithmetic support must exclude0; S02 |
| 124;6.12 example empty | C,Zero C,κ | sInf∅=∞ | Delete routine Check |
| 128;6.12 example one | C=ℤ,Λ={1},κ=1 | card primeFactors(1)=0; inf{0}=0 | Delete routine Check |
| 131;6.12 vanishingOrder_conductor_six | C=ℤ | primeFactors6={2,3}, card2=2 | S01, numerical Check |
| 141;6.13 baseLocus | AG C, L:ℕ→Type*,∀ℓ AG(Lℓ); D,N,p,Λ,loc,κ | D=N=1,p=5,κ=0:2 in,5 out; loc₂κ₁=1 excludes2; D=0 gives no primes since all divide0 | True predicate; S02 |
| 147;6.13 example zero | same; ℓ | ℓ=2,p=5,D=N=1: membership=true=prime-and-good; ℓ=5 givesfalse=false | Delete routine Check |
| 152;6.13 example nonzero localization | same,hn,h:locℓκn≠0 | loc₂κ₁=1 forces ∀loc=0 false; membership=false | Delete routine Check |
| 159;6.13 baseLocus_coefficient_prime | same without primality assumption | p=5 divides5; p=0 divides0 too; good condition false in both | S01, divisibility boundary |
| 168;7.1 non_torsion_point_prime_divisibility | M,AG M,AddGroup.FG M,y,hy:∀n>0,n•y≠0 | M=ℤ,y=6: divisible primes{2,3}; y=1:none. M=0 or finite cyclic:hy false. Without FG,ℚ,y=1 divisible by every prime | True with explicit FG; S02 generic background |
| 177;8.1 initialFactor | R,CR R; split:Bool,p:ℕ,ap,σ,σ* | split5,1,1,1→25; inert→35; zero ring both0. p=0 allowed algebraically, split ap=0,σ=σ*=1→1 | True polynomial; S02 |
| 185;8.1 example split | ℤ | (5−1+1)²=25 | Delete routine Check |
| 188;8.1 example C₃ | ℤ[C₃],s³=1,t=s² | product=27−s−t for (s,t) and(t,s); augmentation25, content1 | Nontrivial polynomial check; keep only if genuine kept headline needs definition |
| 220;8.1 initialFactor_inert_five | ℤ | 6²−1=35≠25 | S01 |
| 224;8.1 initialFactor_augmentation | CR R,S,f:R→+*S,hσ,hσ* | σ,σ*↦1 gives(5−1+1)²=25=(5+1−1)²; zero ring0=0 | S01, map laws/ring |
| 232;8.2 stabilizedPoint | CR R,AG M,Module R M,α:Rˣ,raw,initial,k | Q,α=2,raw0=2,raw1=4: k1=(4−1)/2=3/2; k0=initial=7 independent of raw; α=0 excluded in Q | True formula; S02 |
| 239;8.2 example zero | same, raw=0,initial=0 | k0,1,2 each0=0 | Delete routine Check |
| 244;8.2 example predecessor | Q,unit2 | 2⁻¹(4−2⁻¹2)=3/2 | Delete routine Check |
| 248;8.2 stabilizedPoint_first_level | same,corrected:M | k0,corrected7→7=7 | S01,rfl |
| 253;8.6 heegnerIwasawaClass | AG L,C,shapiro:L≃+C,q | L=C=ℤ,id,1→1 without any tower; zero module→0 | True transport; S02 |
| 258;8.6 example supplied trace | AG L,C,M,e,q,trace,proj,h:∀x,proj(ex)=trace x | e=proj=trace=id,q=3 gives3=3, exactly h(3) | Delete hypothesis application |
| 264;8.6 example nonunit scale | ℤ,id | 5·1↦5≠1 | Delete routine Check |
| 268;8.6 heegnerIwasawaClass_nonzero_not_all_specializations | ℤ²,id | (1,0)≠(0,0); second projection=0 | S01,boundary model |
| 275;8.7 cmCharacterStratum | groups G,H,G0;CG A;π,tors,χ0 | π=id:∅; C₂→1,χ=sign and trivial torsion:member; trivial G→1:∅; S₃→C₂ sign factors,excluded | True abstract character set; S02 |
| 281;8.7 example identity quotient | groups G,G0,CG A,tors,χ0 | ψ=χ gives factorization; member=false for everyχ; set=∅ | Delete routine Check |
| 286;8.7 example wrong type | above,χ,h:restriction≠χ0 | restriction −1 versus1 givesfalse∧anything=false | Delete routine Check |
| 291;8.7 cmCharacterStratum_first_nontrivial | G=A=ℤˣ=C₂,H=G0=Unit | χ(−1)=−1, every factoredχ(−1)=1; nonfactor=true | S01,finite example |
| 302;8.14 nearTrivialCharacter | Group G,CG A,ξ,p,m:ℕ | (5,1)exp4;(5,2)exp20;(5,0)exp4; p0 or1 exp0→trivial | True total power function; not a crystalline theorem; S02 |
| 308;8.14 example first | G,A,ξ | (5−1)5⁰=4 | Delete routine Check |
| 312;8.14 example next | G,A,ξ | (5−1)5¹=20 | Delete routine Check |
| 315;8.14 nearTrivialCharacter_torsion_counterexample | same,h:ξ⁴=1 | conclusion reduces to ξ⁴=1, identical to h | S01 |
| 320;8.15 heegnerDivisibilityProfile | index:ℕ→ENat,degree:ℕ→ℕ,allowed:Setℕ,r | empty→∞; same-degree indices2,5→2; degrees0,1 with indices3,1→3,1 | True infimum; S02 |
| 326;8.15 example all∞ | degree,allowed,r | inf{∞}=∞ and inf∅=∞ | Delete routine Check |
| 333;8.15 example two strata | explicit index/degree,{1,2} | M₀=3,M₁=1, each singletoninf | Delete routine Check |
| 340;8.15 heegnerDivisibilityProfile_sum_not_max | explicit data | inf{2,5}=2; sum7,max5 differ | S01 |
| 347;8.30 determinantalHeegnerElement | CR R;AG D,S,Sι;three Module instances;e:D≃ₗS⊗Sι,y,iy | identity tensor model5⊗1→5; e=multiply2 overQ,y=iy=1→1/2, not2 | True supplied-equivalence inverse; S02/S13 |
| 355;8.30 example zero | same,e,iy | e⁻¹(0⊗iy)=e⁻¹0=0, also zero ring | Delete routine Check |
| 361;8.30 example square scale | same,a | a=5,y=iy=1,id:25⊗1→25=5²·1; assumes identity involution | Delete routine Check; S13 |
| 367;8.30 determinantalHeegnerElement_rational_not_basis | ℤ,identity tensor map | lid(5⊗1)=5; unitsℤ={±1}, so IsUnit5=false | S01 |
| 378;8.33 lambdaDerivativeClass | AG L,C,I,e:C≃+I,D:L→+I,q | id,id,3→3; shear e,idD,(0,1)→(−1,1); D0=0 | True supplied descent; S02/S13 |
| 383;8.33 example identity | AG C,q | id⁻¹(id3)=3 | Delete routine Check |
| 388;8.33 example zero | AG L,C,I,e,D | e⁻¹(D0)=e⁻¹0=0 | Delete routine Check |
| 392;8.33 lambdaDerivativeClass_restrict | AG L,C,I,e,D,q | shear at(0,1): e(−1,1)=(0,1)=Dq | S01,e.apply_symm_apply |

### README target and Check audit

All 132 numbered target sections were read in full, including their APIs, prerequisites and locators. The table contains every numbered target. Each of the 103 explicit Check bullets in 33 blocks was evaluated against its definition; the relevant rows group their values. Deep arithmetic assertions are tested by their source hypotheses and by conditional rank/length/normalization calculations; a numerical ledger is not claimed to be an independently constructed elliptic-curve example or a proof of the theorem.

Field and characteristic-zero hypotheses exclude zero rings, inseparable extensions and nonreduced schemes in the arithmetic targets. The Lean algebra permits zero rings where indicated above. Finite support, nonzero bottom classes, compactness, exact conductor and odd-prime hypotheses are not silently dropped. Tests of S₃/C₃ occur in §§0.6 and 8.7; characteristic two and ramified coefficient valuations occur in §§3.6,5.5,7.4,7.6,8.40.

| Target; README line | Instances tried | Computed values / two sides | Result or change |
| --- | --- | --- | --- |
| 0.1 Local toral order; 215 | Unramified Q₅√2, conjugated embedding, g=1; split shear; dyadic Q₂i | Order Z₅+5 Z₅√2≠O_E; split a−b∈πO; dyadic conjugate Z₂+2 Z₂i≠O_E | S03 fixes two false Checks |
| 0.2 Transported global order; 234 | All maximal; Q(i) conductor 3; one nonmaximal place | O_E; index[Z[i]:Z+3 Zi]=3 and disc=−4·3²=−36; omitting 3 changes order back to Z[i] | Consistent |
| 0.3 Toral orbit and ideal-class comparison; 253 | Identity/principal ideles; K=Q√−5 | Unit ideal class 1; multiplying by a changes class by(a)=1; ideal(2, 1+√−5) has norm 2, no element norm 2 since x²+5 y²=2 insoluble | Consistent; zero/noninvertible ideal excluded |
| 0.4 Conductor-change kernel; 272 | New inert/split/ramified ℓ=5; repeated prime; Q(i), ℓ=3 | Ordinary-unit kernels 6, 4, 5; repeated 5; exceptional 2·2=3−(−1)=4 | Formula correct; ownership S08 |
| 0.5 Ring-class tower and finite Galois quotients; 291 | c=1, K=Q√−5; c=d; c=1→3 in Q(i) | Hilbert degree 2≠1; identity restriction kernel 1; degree[K[3]:K]=2 and restriction kernel 2 | Consistent; nontrivial field does not force every chosen point nonrational |
| 0.6 Dihedral action on the tower; 310 | C₃⋊C₂; cyclic C₂; trivial class group | τsτ⁻¹=s²≠s gives S₃; C₂ inversion=id; trivial group gives quadratic K itself | Generalized dihedral, not necessarily CM extension |
| 0.7 Relative CM conductor tower; 320 | Local degrees 1, 2; Q(i), P=3 first/repeated steps | Z_p ranks 1, 2; initial degree 2≠3, subsequent degree 3=normP | Finite initial shifts retained |
| 0.8 Norm, reciprocity and level compatibility; 339 | Identity; C₃ Artin switch; degree 2 norm | Identity squares x=x; s↦s², 27−s−s² fixed; norm of embedded scalar a is a², not a | Direction consistent |
| 0.9 Different of the local toral order; 356 | Unramified; split conductorπ; Q₂(i) | Different unit; (π, −π) signed norm−π², discriminant ideal(π²); (2 i) norm 4, valuation 2 | Source sign misprint not copied |
| 1.4 Jacobian basepoint and Hodge denominators; 389 | Cusp d=1; ξ=D/2, degD=2; denominator 5 at p=5 | deg(x−∞)=0; deg(2 x−D)=0 but deg(x−D)=−1; v₅(1/5)=−1 | Denominators retained |
| 1.5 Heegner point family; 408 | Cusp; zero quotient; two-element negation orbit | φ[x−∞]; zero gives 0; selected 1 versus trace 1−1=0 | True normalization; S02/S12 |
| 1.6 Parametrization choice, degree and torsion; 431 | [5] on fixed rank-one target; isogeny j=5, a=1 | I↦5 I, c↦5 c so ratio unchanged; different-curve ratio multiplies 5/1=5 | Correct repaired formula |
| 2.1 Hecke neighbors of a CM point; 454 | NormP=5; inert/ramified/split; positive conductor | Horizontal 0, 1, 2 plus ascending 6, 5, 4 each total 6; positive 1+5=6 | Unit stabilizers indispensable |
| 2.2 Inert Heegner norm relation; 464 | Ordinary units; Q(i), ℓ=3; raw point 0 | u=1:Tr=aℓP; u=2:2 Tr=a₃P; zero both 0 | No erased exceptional factor |
| 2.3 Split and ramified first-step relations; 474 | Split σ=σ*=1, ramifiedσ=1; aℓ=3 | After valid quotient split trace coefficient 3−2=1; ramified 3−1=2 | Not identical first steps |
| 2.4 Repeated-conductor predecessor relation; 484 | NormP=5 positive chain; predecessor value 2, Hecke value 7 | Repeated trace 7−2=5, not first-step degree 6; total neighboring count 1+5=6 | Requires n≥2, fixed central scaling |
| 2.5 Distribution at nonmaximal local level; 494 | P-new δ1, typeI/II; δ2, typeI/II; typeIII | Predecessor class z=1 gives−1 atδ1, 0 atδ2; typeIII premise=false | Orientation/type conditions retained |
| 2.6 Heegner reduction congruence; 504 | Residue extension F_ℓ²; point coordinates in F_ℓ versus nontrivial extension | Power Frobenius fixes F_ℓ; on F_ℓ² it has square=id but need not equalid | Pointwise reduction distinct from trace and Artin convention |
| 2.7 Quaternionic CM reduction and specialization; 514 | q inert, λ=qO_K; principal λ away from conductor | Artin class[λ]=[(q)]=1 so splits in K[n]; residue field sizeq², notq | Zhang reduction domains consistent |
| 3.1 Heegner Kummer classes; 539 | Zero; point p^m z; negation orbit of 1 | δ0=0; δ(p^m z)=0; δTr(1)=δ0=0 versus raw 1 | Actual Kummer maps required |
| 3.2 Good-place Kummer condition; 558 | Good ℓ≠p; finite unramified cyclic coefficient A with Frob=id | H¹_unr=A/(Frob−1)A=A; for A=F₅ dimension 1; not all H¹ forced unramified | Hypotheses exclude v\|p |
| 3.3 Component obstruction at bad places; 568 | Split multiplicative component Z/5 at p=5; component trivial | Defect length 1 versus 0; residual irreducibility alone does not change 1 to 0 | Explicit obstruction retained |
| 3.4 Kummer condition at the coefficient prime; 578 | Lattices Z_p and pZ_p; zero point | Rationalizations bothQ_p but integral quotient sizep; δ0=0 | No false integral equality |
| 3.5 Saturated integral Kummer comparison; 588 | Rank-one Kummer lattice, quotient Z/25; zero quotient | Index 25 has length 2, not 0; rational quotient 0; Sha correction remains 2 | Saturation kept separate |
| 3.6 Archimedean Tate correction; 598 | Complex place; real sign module Z₂; odd coefficientp=3 | H¹(C, −)=0; H¹(C₂, Z₂(sign))=Z/2; 2 invertible in Z₃ | Dyadic correction needed |
| 4.1 Heegner conductor coefficient ideal; 621 | Empty; a=0, ℓ19; p=5 with 19, 149 | Ideal 0; (20)=(5); pairs(10, 20), (25, 150) sum(5), min 1 versus max 2 | Correct; Lean algebra broader than arithmetic support |
| 4.2 Differentiated point invariance; 646 | n 1; C₃ derivative; mod 5 invariance only | D₁=1; D=s+2 s², (s−1)D=2−s−s²=3−(1+s+s²); integers 1 and 6 equal mod 5, unequal integrally | Sign and quotient tested |
| 4.3 Vanishing of ring-class torsion invariants; 665 | Zero versus full GL₂ residual action; p=3 | Standard F₃² under full GL₂ has invariants 0; trivial action has invariants dimension 2; any p^m torsion gives p-torsion by multiplication | Full-image hypothesis essential |
| 4.4 Descended Heegner derivative class; 675 | Zero; identity; noninjective zero restriction | Inverse 0=0, id⁻¹3=3; zero sends 0, 1 to 0, so inverse uniqueness=false | Correct inverse; S13 direction Check |
| 4.5 Explicit cocycle and divisibility criterion; 698 | Identity descent, group Z, p=5, m 1; classes 5 and 1 | 5 in 5 Z gives class 0; 1 not in 5 Z gives class 1≠0; quotient by whole Kummer lattice gives d₁(1)=0 | Both directions use invariant-vanishing hypothesis |
| 4.6 Bottom class is the trace Kummer class; 708 | n 1; two-element negation orbit | Empty derivative 1; trace 1−1=0, so bottom Kummer 0 and d(1)=0; raw point 1 differs | Consistent |
| 4.7 Generator change and intrinsic tensor coefficient; 718 | One cyclic factor, coefficientF₅, generator exponentu=2 | Scalar transforms by 3, tensor by 2; 3·2=1 mod 5; raw scalar 1↦3≠1 | Compensating tensor required |
| 4.8 Coefficient reduction and auxiliary-prime restriction; 728 | m 2→m 1 at p=5; reverse direction | Residue 25→5 carries 7↦2; reverse 2 admits lifts 2, 7, 12, 17, 22, no preferred coefficient inclusion | Direction correct |
| 4.9 Parity of the Heegner derivative class; 738 | ε=1, ν=0, 1, 2; w=−1; p=2 | Signs+1, −1, +1 from both ε(−1)^ν and w(−1)^(ν+1); mod 2 signscoincide | Odd-prime splitting only |
| 5.1 Transverse condition of the descended class; 761 | ℓ=5, p=3; dyadic versionp=2 | Σi=15=5·6/2 divisible 3, but not divisible 2 although 6 is | p odd required for transverse proof |
| 5.2 Heegner finite–singular correction automorphism; 771 | Identity; negation; non-equivariant shear and C₂ actiondiag(1, −1) | Identity 3=3; neginverse 3=−3; shear of cocycle(0, −2) gives(−2, −2), cocycle sum atτ²=(−4, 0)≠0 mod 5 | Global change-of-group requirement substantive |
| 5.3 Corrected Heegner Kolyvagin system; 790 | Empty conductor; zero; negation 3; shear | χ₁=id so κ₁ unchanged; zero 0; neg 3=−3; inverse shear(0, 1)=(−1, 1)≠forward(1, 1) | S13 test improvement; construction not supplied by wrapper |
| 5.4 Tate coefficient and big-image hypotheses; 813 | p=3 fullimage; trivialrank 2; CM character split | Central−1 has−1−1=−2 a unit at 3; trivial invariants dimension 2; two CM lines eachrank 1, imageproper | S04 distinguishes actual image theorems |
| 5.5 Cartesian, self-dual and conjugation local conditions; 830 | Split nondegenerate pairing on F₅⁴; component order 5; τ swaps Z₂² | Finite plane dimension 2=its annihilator; component length 1; (1+τ)(1, 0)/2=(1/2, 1/2) not integral | Selfduality/error tests consistent |
| 5.6 Residual Kummer field and detection pairing; 847 | Residual class-space dimension 0, 1, 2; coefficient V=F₅² | Hom dimensions 0, 2, 4; cardinalities 1, 25, 625; zero class pairs 0 with every Frobenius | Finite-subspace condition retained |
| 5.7 Heegner class detection by auxiliary primes; 857 | Nonzero versus zero class; finite excluded prime set | Nonzero evaluation e.g 1∈F₅ survives; zero evaluation 0 cannotbe detected; deleting finitelymany primes density 0 does not change positive density | Correct quantifier dependence |
| 5.8 Arithmetic local error lengths; 867 | Tamagawa group Z/25; unitcomponent; localtorsionZ/5 | Component length 2 versus 0; torsionlength 1 retained separately | No replacement by residual irreducibility |
| 5.9 Tamagawa and local torsion obstruction examples; 877 | Split Tate curve with v(q)=5, p=5; v(q)=1 | Componentp-parts 5 versus 1; valuations 1 versus 0 | Genuine obstruction, not global image hypothesis |
| 6.1 Howard’s Heegner rank-one theorem; 900 | Nonzero bottom with index 1 orp²; rank 0 boundary | len M≤0 givesM=0; indexp² giveslen M≤2, Sha length≤4; rank 0 incompatible κ₁≠0 | Source-backed conditional length checks |
| 6.2 Opposite Selmer eigenspace vanishing; 910 | Bottom modp nonzero, one opposite class | Forced opposite dimension 0; independent class would demand dimension≥1 | Conditional deduction agrees with Gross |
| 6.3 Same Selmer eigenspace generation; 920 | Bottom nonzero in a one-dimensional eigenspace | Spanκ₁ dimension 1; zero bottom wouldspan 0 and violate premise | Conditional deduction agrees with Gross |
| 6.4 Gross’s clean mod-p descent; 930 | Nonzero modp bottom; residual Selmer structure | Selmer dimension 1; MW/p dimension 1 and Sha[p] dimension 0 satisfy 1=1+0 | No claim for bottom zero |
| 6.5 Sha square-index bound; 940 | Index p^r with r=0, 2 | Sha length≤2 r gives≤0, ≤4; paired summands length r each give 2 r | Square, not linear index |
| 6.6 Primitivity and sharpness comparison; 950 | Primitive exponent d=0 versus d=1 | Exact length 2(M₀−d); M₀=3 gives 6 versus 4; nonprimitive case not sharp upper bound 6 | Requires source self-dual rigidity hypotheses |
| 6.7 Zhang’s Heegner congruence after level raising; 960 | Normalized one-dimensional comparison; scalar u=2∈F₅× | Values 1 and 2 agree up to fixed unit 2, but not exact 1=2; zero matches zero | Matching generators/types required; declared level-raising gap |
| 6.8 Heegner rank lowering through an admissible prime; 970 | Nonzero map F₅³→F₅ versus zero map | Surjective rank 1, kernel dimension 2=3−1; zero map kernel dimension 3 | Rank lowering conditional on nonzero localization |
| 6.9 Auxiliary rank-zero formula over K; 980 | Finite Selmer length 2, local sum 1; vanishing L-value | v(Lalg)=2+1=3; L=0 has infinite valuation, paired with positive corank rather than finite index | Source formula, declared rank-zero contract |
| 6.10 Jochnowitz unit criterion; 990 | Definite pairing norm unit/nonunit | Lalg=1 unit gives nonzero local class; Lalg=5 gives zero residual class at 5; unit equivalence requires normalized period ratio | Normalization retained |
| 6.11 Ribet–Takahashi period and Tamagawa comparison; 1000 | η valuation 3, ξ valuation 1; two local lengths 1, 1 | v(η/ξ)=2=1+1, while raw η valuation 3 is wrong | Source supports ratio; generic proof prerequisites partly unverifiable |
| 6.12 Heegner-system vanishing order; 1010 | Empty; nonzero at 1; supported at 6 | ν=∞, 0, 2 respectively; supported at 4 would count distinct primes 1, though non-squarefree outside arithmetic domain | Support convention correct |
| 6.13 Heegner-system base locus; 1035 | Zero system, D=N=1, p=5; nonzero loc₂; p=5 | 2 belongs for zero; loc₂κ=1 excludes 2; 5 excluded even zero | True predicate, boundary Checks |
| 6.14 Residual Heegner local pairing; 1060 | Two finite/transverse planes in F₅⁴ | Total dimension 4, each plane 2, each sign 1; same-sign perfect pairing matrix(1), opposite-sign matrix(0) | Pairing-sign model consistent |
| 6.15 Residual Heegner reciprocity; 1070 | ν=0/1 root number w=−1; finite/transverse comparison id | Signs+1/−1; comparison 1↦1; at zero 0↦0 | GL₂-type relation has own hypotheses |
| 6.16 Simultaneous residual prime detection; 1080 | Independent classes modeled by evaluations on F₅² | Linear forms x, y both nonzero on(1, 1); excluded union of axes has 9/25, complement 16/25>0 | p≥5 and independence make detection feasible |
| 6.17 Residual ramification selection; 1090 | Relaxation permits singular coordinate zero | Nonzero finite class(1, 0) remains nonzero while singular coordinate 0; existence≠nonzero singular localization | Wording avoids false strengthening |
| 6.18 Triangular Heegner Selmer basis; 1100 | ν=0, 1, 2 | Preferred eigen-dimension 1, 2, 3; opposite≤0, 1, 2; detecting primes 1, 3, 5 | Triangular numerical bounds consistent |
| 6.19 Zhang’s Heegner indivisibility theorem; 1110 | Residual primitive value≠0 | Some index 0 implies M∞=0; all values 0 would give∞ and violate conclusion; p=3 excluded by p≥5 | Source-backed nonvanishing, no Lean substitute justified |
| 7.1 Prime divisibility of the non-torsion Heegner point; 1133 | Free group Z, y 6; rank 0; non-FG Q | Prime divisors{2, 3}; rank 0 lacks nontorsion; Q, y 1 divisible by all primes | True FG argument; S05 for RM use |
| 7.2 Non-CM open-image application; 1143 | Full GL₂ versus SL₂; non-CM versus CM | SL₂ commutant scalars yet determinant image{1}, index in GL₂ infinite; CM over endomorphism field has 2 invariant character lines | S04 missing arithmetic supply |
| 7.3 Integral Tate image errors; 1153 | M 0; identity matrix algebra; scalar image only | A[p⁰]=0, restriction kernel 0; full matrix span C₃=0; scalar span omits offdiagonal E₁₂ so no finite C₃ | Actual RM hypothesis needed; S04 |
| 7.4 Integral CM prime detection; 1163 | p=3 versus p=2 conjugation losses | 4 v₃2=0; 4 v₂2=4, multiplier 2⁴=16; rank 0 class-space evaluation 0→0 | Dyadic factors retained |
| 7.5 Arithmetic derivative denominators at exceptional primes; 1173 | C₁=0 or 1; local component Z/5 | 0-error yields κ₁=δy; C₁=1 gives κ₁=5δy and kills component 5; zero term gives 0 | Uniform denominators are arithmetic, not inverse restriction |
| 7.6 Dyadic integral conjugation descent; 1183 | All C_i=0; coefficient p=3/p=2; ramified dyadic DVR e=2 | B=0 at 3, 21 at 2, 42 if v_𝔭(2)=2; 2²¹=𝔭⁴² times a unit in the last case | Formula correct; S05 finite C₀ supply |
| 7.7 Exceptional primary Sha exponent bound; 1193 | Bound B=2; unbounded primary group Q_p/Z_p | Bounded group lies in Sha[p²]; Q_p/Z_p has elements of order p³, p⁴, ... and fails uniform B | Exponent plus finite-level finiteness, not separately finite at all levels |
| 7.8 CM and Heegner fields; 1203 | E with CM Q(i), conductor 32; Heegner K | Prime 2 ramifies in Q(i), so K=Q(i) fails splitting at 2; distinct quadratic fields intersect Q, degree of compositum 4 | Correct CM-field distinction |
| 7.9 CM character descent and error bounds; 1213 | p outside finite error set; p=2 | All C_i=0, v_p(2)=0 gives B=0, Sha[p∞]=0; at 2 B includes 21 even if other constants zero | No fictitious full GL₂ CM hypothesis |
| 7.10 Almost-all primary Sha vanishing; 1223 | Nonzero p-primary element of order p³ | p²x has order p≠0; hence Sha[p]=0 forces whole primary 0 | No circular finiteness premise |
| 7.11 Classical full Sha finiteness; 1233 | Rank r free MW, one nonzero line, uniform bounded quotient | At level p^m quotient free rank r−1 has exponent p^m unless r=1; r=1 compatible with uniform B | Correct full-finiteness logic subject S04/S05 |
| 7.12 Admissible RM Kolyvagin–Logachev application; 1243 | RM degree d=1, 2 | O_L-line has Z-rank 1, 2; expected MW ranks 1, 2; finite quotient rank 0 | S05 missing MW theorem; non-CM over K condition matches source |
| 7.13 Classical square-index bound; 1253 | Index I=5, d=1; exponent-only group(Z/5)^r | Bound requires order dividing 25; r=3 has order 125 yet annihilator 5 | Source length theorem true; missing supplier S06 |
| 8.1 Heegner initial Euler factor; 1276 | Split/inert p=5, ap 1; C₃ group ring | 25, 35; Φ=27−s−s², augmentation 25/content unit; v₅=2 versus 0 | Correct repaired normalization |
| 8.2 Ordinary stabilization of Heegner points; 1301 | Zero family; α2 over Q, raw (2, 4); initial 7 | 0; stabilized 3/2; level zero 7 regardless of raw; inverse unit needed | S09 source scope and S02 wrapper purpose |
| 8.3 Norm compatibility of stabilized Heegner points; 1326 | Formal recurrence with α2, p=5, ap=9/2, raw 0=2, raw 1=4 | Cor(raw 2)=16, Cor(raw 1)=20; α⁻²(16−10)=3/2=stabilized 1 | Unit root relation gives exact recurrence; first step separately corrected |
| 8.4 Finite solvability of the Heegner norm constraints; 1338 | Z/7 bottom Φ5; zero projection; conflicting self-edge | q 5 solves id q 5; 0 q=1 has no solution; q=1 and q=0 separately solvable but jointly false | Simultaneous finite solvability substantive |
| 8.5 Howard universal-norm Heegner family; 1352 | Z/7 bottom 5; auxiliary a 0; Z/2 self-edge; two impossible models | Bottom 5; trace 0; q 0, q 1 both solutions and difference 1 homogeneous; 0 q=1 impossible; q=1/q=0 impossible | Existence not uniqueness; generic compactness not re-owned |
| 8.6 Anticyclotomic Heegner class; 1379 | Two-summand trace; p=5 isogeny scalar; identity on Z² | Trace 1−1=0; lattice index multiplies 5; class (1, 0) nonzero, projection 0 | S02 wrapper; S10 locator |
| 8.7 Primitive CM character stratum; 1404 | Identity quotient; wrong torsion; C₂→1 | Primitive empty; wrong restriction false; sign character−1≠1 yields nonfactorization true | Small levels before G₀ embeds are excluded |
| 8.8 Generic CM root-number parity; 1429 | F=Q, zero/one inert odd prime; conductor P special | Real place count 1 sign−1; plus one: count 2 sign+1; small conductor has no eventual sign promise | Parity Checks consistent |
| 8.9 Joint distribution of CM reductions; 1448 | Constant test f 1, f 0; duplicate indices; r 1 | Integrals 1−1=0 and 0−0=0; identical components force diagonal, so independence premise fails; r 1 has no pair condition | Declared dynamics contract accepted |
| 8.10 Surjectivity onto CM reduction fibres; 1460 | Finite fibre 2 points, full orbit versus one point | Characteristic function of missing point has orbit average 0 versus fibre average 1/2; convergence forces eventual coverage | No unjustified forbidden-component coverage |
| 8.11 Definite primitive-character toric nonvanishing; 1470 | C₂ Fourier toy θ=(1, −1); zero θ | Nontrivial character sum 1+1=2≠0, trivial sum 0; zero θ gives all sums 0 and is excluded | Existence of one character, not all |
| 8.12 Cornut–Vatsal definite nonvanishing; 1482 | Same Fourier witness, definite sign+1 | One coefficient 2≠0, other 0; existential true while universal false | Correct quantifier; source CV 1.4 |
| 8.13 Unit comparison of Heegner normalizations; 1492 | Formal unit root α2, p=5, β5/2, u 1 | Split factor 4·(3/2)²=9; inert 4·(25/4−1)=21; both v₅=0, whereas Φ augmentation 25 has v₅=2 | Unit comparison distinct from Φ; S09 scope |
| 8.14 Crystalline characters near the identity; 1504 | p=5, m 1, 2; order-four character; m 0 | Exponents 4, 20; order four becomes 1; m 0 outside arithmetic domain but Lean returns 4 | Nontorsion arithmetic input essential |
| 8.15 Heegner divisibility profile; 1529 | Zero; indices 3 and 1 at degrees 0, 1; indices 2 and 5 at the same level | All M_r=∞; M₀=3, M∞≤1; min 2 rather than sum 7 / max 5 | Correct support infimum |
| 8.16 Optimal and distinguished lattice comparison; 1554 | Index pair(I, C)=(5, 1) versus(1, 5) | Both products 5, individual factors 5≠1; arbitrary isogeny index not claimed preserved | Correct product comparison |
| 8.17 Tamagawa factors near the identity; 1566 | Two split places, rational Tamagawa part 5; m 3 | Product 5·5=25; total valuation=2; a p-power congruent to 5 mod 125 must equal 5 | Both K-primes retained |
| 8.18 Arithmetic strict ordinary Selmer complex comparison; 1578 | G 0, L=R[0]; G=R[1], L 0; H⁰ map Z_p→Z_p multiply p | Fibre H¹=R not H⁰; second H¹=R; coker H⁰=Z/p contributes length 1 | Correct shift and H⁰ correction |
| 8.19 Ordinary local specialization defect; 1599 | p=5, ap 1; split/inert | #E(F₅)=5; split L_p=25; a_p²−2 p=−9 so #E(F₂₅)=26−(−9)=35 | Scalar augmentation matches both counts |
| 8.20 Finite torsion in the relative ring-class tower; 1612 | Two residue characteristics 2, 3; torsion prime 2, 3, 5 | 2-primary bounded by 3-reduction; 3-primary by 2-reduction; 5-primary by both; a single place 2 leaves 2-primary uncontrolled | Tower-specific bounded local degrees essential |
| 8.21 Indefinite primitive-character Heegner nonvanishing; 1624 | Nonzero weighted point in Z⊗C versus order-five torsion | 1⊗1≠0; torsion point⊗1=0 | Nonvanishing is nontorsion, not nonzero point |
| 8.22 Cornut–Vatsal indefinite nonvanishing; 1636 | Indefinite sign−1; nonzero height toy 1 | Central value forced 0; derivative formula positive constant·1≠0; definite central-value claim would be the wrong type | Source CV 1.5 hypotheses explicit |
| 8.23 Cornut’s higher Heegner point theorem; 1648 | Bottom trace 0; later trace nontorsion 1 | Conductor one 0 permitted, existential higher trace 1 suffices; universal nonvanishing of all traces false | Source Cornut matches quantifier |
| 8.24 Non-torsion Λ-adic bottom class; 1658 | Λ=Z_p[[T]], element T versus zero | T has annihilator 0 and line free rank 1; evaluation T↦0 at identity=0; zero family line rank 0 | No everywhere-specialization inference |
| 8.25 Continuous anticyclotomic characters near one; 1670 | p=3, r 0, 1; limit r∞ | 4−1=3 v₃1; 64−1=63 v₃2; values→1 but finite values≠1 | Works inert as well as split |
| 8.26 Nonzero bottom classes near the identity; 1685 | f(T)=T and f(T)=T(T−p) | Identity value 0; nonzero T sufficiently close to 0 gives nonzero f once v_p(T)>1; root p excluded by shrinking the neighbourhood | Nontriviality essential |
| 8.27 Near-trivial logarithm index formula; 1697 | p=5, t 2, q 5, I 25, C 5 | p^tq=25·5=125=IC; dropping q gives 25≠125 | Conditional integral index ledger; declared log gap |
| 8.28 Twisted anticyclotomic control formula; 1709 | Sha 25, C 5, two local factors 5, 5, q 5 | Order 25·25·25·25=5⁸=390625; omitting one K-prime loses factor 5 | Propagated Sha and exact local factors necessary; declared JSW gap |
| 8.29 Integral main conjecture and twisted index square; 1721 | p=5, q 5, C 1, local product 1, Sha 25 | Control F=25·1·1·25=625, L=25; log I=Lq=125; I²=15625=25·5⁴ | q⁴, not q²; integral equality required |
| 8.30 Determinantal Heegner element; 1733 | Zero; scalar 5; tensor(5, 1); γ involution | 0; scale 25; coefficient 5 nonunit; γιγ=1 versus γ²≠1 | S02 stand-in and S13 missing involution Check |
| 8.31 Heegner determinant and characteristic ideals; 1759 | S/H=Λ/(f), ι-invariant f; torsion X=(Λ/f)² | Product ideals(f)(f)=(f²)=char X; rationalizing p makes (p²)=(1), loses basis index | Both directions preserve integrality |
| 8.32 Specialized Heegner determinant lattice; 1771 | L_p=5, Tam=5, X order 25 | Determinant lattice factor 5²·5²·25=5⁶; replacing either square by its first power changes valuation 6→5 | Source CS 3.3.2; conditional ledger |
| 8.33 Λ-adic Heegner derivative class; 1784 | Empty derivative; zero family; noninjective zero; shear | Identity recovers 3; zero 0; two zero-preimages 0, 1; inverse(0, 1)=(−1, 1) | S02/S13; arithmetic descent input distinct |
| 8.34 Λ-adic Heegner local conditions; 1810 | Ordinary rank 2 lattice with Fil⁺ rank 1; component order 5 | Quotient rank 1; local unramified class at a bad place can have component length 1 | Actual local conditions cannot be simplified to rational ones |
| 8.35 Λ-adic finite/singular Heegner compatibility; 1822 | Corrected comparison χ=−1; raw value 3 | χ⁻¹3=−3 and χ(−3)=3; wrong raw 3 gives χ3=−3≠3 at p=5 | Local/global compatibility is substantive |
| 8.36 Howard’s anticyclotomic divisibility theorem; 1832 | S=Λ, Heegner line fΛ, paired M=Λ/(g) | Rank X 1; char X_tors=(g²); g divides f gives length bound v(g)≤v(f); f=p, g=1 gives strict inequality | Divisibility not equality |
| 8.37 Weaker torsion hypothesis and localized bound; 1844 | Λ=Z₅[[T]], M=Λ/(T) | char M=(T) becomes a unit after inverting T, but not in Λ[1/5]; extra augmentation hypothesis needed | Source localization correct; S09 disc |
| 8.38 Heegner specialization with the initial factor; 1856 | p=5, ap 1, split; I_n=(25), m 1 versus I_n=(5), m 2 | C=(α−1)²(β−1)²=(p+1−ap)²=25; (25)⊂(5) true; (5)⊂(25) false | Nonunit retained; correct ideal direction |
| 8.39 Uniform arithmetic Kolyvagin error bound; 1868 | ind=3, E=2; t=0/7; zero bottom | len M≤5 for both t values; residual surjectivity E=0 gives≤3; zero bottom excluded | Uniform quantifier order checked, no dependence on t |
| 8.40 Exact paired Selmer length for a Heegner system; 1880 | M₀=3, M∞=1; residue field size p^f | Length Sha=2(3−1)=4; cardinal=p^(4 f), not always p⁴; p=3 uses declared rigidity gap | DVR length normalization correct |
| 8.41 BCGS nonvanishing from the main conjecture; 1892 | κ₁=0, one higher κ_n≠0 | Bottom index∞ permitted; support minimum finite (e.g. ν=1), so existential nonvanishing true | No analytic-rank-one assumption |
| 8.42 BCGS refined divisibility from the integral conjecture; 1904 | Tamagawa parts 5 and 25 | M∞=1+2=3; sum over K-primes 6, half=3; M₀ may be 5 giving Sha length 4 | Rational/integral distinction correct |
| 8.43 Twisted index square from the determinant conjecture; 1916 | L_p=5, Tam=5, X=25 | Index square=5⁶, index=5³; valuations 6=2·3 | Conditional determinant identity |
| 8.44 Castella–Sano refined conjecture equivalence; 1928 | Tamagawa valuation 3; conjecture true/false logicaldirections | Refined equality M∞=3 iff integral basis; rational basis alone permitsfactor 5, index 1 and fails the integral assertion | Inert branch conditional, not claimed proved |
| 8b.1 BDP square-root convention comparison; 1953 | Root L=5, unit u=2 | Single-power function ideal(uL²)=(25);  root squared 25≠root 5 | Equality of ideals removes unit 2 only |
| 8b.2 Anticyclotomic main-conjecture comparison; 1963 | p=3 versus p=5; ideals(3), (1) | p=3 fails integral premise p>3; both ideals become units after inverting 3 but differ integrally | S07 missingodd-primecomparison |
| 8b.3 Auxiliary quadratic fields for BCS descent; 1975 | ℓ≡−1 mod 5 versusℓ≡1 mod 5 | Prescribed inert/split respectively; p=5 exception F=Q√5 excluded; discriminant avoidance finite | Source conditions retained |
| 8b.4 Heegner Euler-system divisibility for BCS; 1987 | p=3 odd, residual surjective branch | Odd=true, p>3=false; rational p-factor can be 1 rationally, 3 integrally | Endpoint source exists; Needs chain S07 |
| 8b.5 BCS anticyclotomic reverse divisibility; 1999 | Nonzero factors f 5, g 25 and possible unit u | Product 125; cancellation 5·x=5·25 yields x=25 in domain; zero-factor 0·x=0 supplies no information | Nonzero and μ conditions indispensable |
| 8b.6 Rational Heegner-point main conjecture; 2011 | p=5, irreducible nonsurjective; ideals(p²f²), (f²) | Equal after inverting p; integral valuations differ by 2 | Exactly rational claim |
| 8b.7 Integral Heegner-point main conjecture; 2023 | Residual surjectivity; S/H=Λ/(pT) | Required char X=(p²T²), retains valuation 2 at(p), unlike(T²) | Integral chain conditional on suppliers |
| 8b.8 Rational Greenberg–BDP main conjecture; 2035 | L_BDP=pT | Torsion char=(p²T²) becomes(T²) rationally; module Λ/(T²) rank 0 versus all-p dual rank 1 | Correct Greenberg carrier |
| 8b.9 Integral Greenberg–BDP main conjecture; 2047 | Same L=pT | Integral char(p²T²), p-content 2 retained | Correct integral distinction |
| 8b.10 Eisenstein anticyclotomic theorem interface; 2059 | p=3; local characters 1, ω, unramified quadraticε | First two excluded; ε(Frob)=−1, ε inertia 1 distinct from 1 and ramified ω; p=3 allowed | Declared elliptic-unit gap accepted; S07 comparison |
| 8b.11 Split-prime Kolyvagin nonvanishing branches; 2071 | p=3 Eisenstein versus p=3 irreducible branch | Eisenstein allowed; p>3 condition false for the irreducible branch; existence of higher κ_n, not κ₁ | No extra p=3 irreducible claim |
| 8b.12 Split-prime refined Kolyvagin divisibility; 2083 | Same Tamagawa parts 5, 25 | M∞=3, not 6 or M₀; rational branch would leave p-content undetermined | Integral BCS discharge matches source |
| 8b.13 Split determinantal Heegner main conjecture; 2095 | Split/inert p=5 | Split integral basis implies determinant index 0 and M∞=vTam; inert flag false leaves the main-conjecture hypothesis | No inert unconditional claim |

### Headline inventory and statability at the pins

A generic cohomology carrier does exist: `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` defines `ContinuousCohomology.tateShafarevich` as the intersection of localization kernels. Thus “continuous Galois cohomology is missing” would be too broad. What is missing for the headlines below is the specified arithmetic object or its comparison, not merely notation for an arbitrary abelian group. Object searches covered Mathlib, Tau Ceti, the main active/completed folders, board packages, the seventeen specified sibling folders, and the roadmap tool's current index. No duplicate fully qualified declaration in the roadmap's namespace was found.

| Headline targets in README | Carrier/construction needed to state the actual result | Current acceptance coverage |
| --- | --- | --- |
| §§6.1,6.4–6.6 Howard/Gross rank one, Sha index bound and primitivity | Actual Tate-lattice Selmer groups and the CM derivative Kummer system, including its chosen bottom class | No arithmetic statement; arbitrary descent/correction wrappers do not supply these objects |
| §§6.7–6.11 Zhang level-changing congruence, rank lowering, rank-zero and period identities | Matched quaternionic forms, integral eigenfunction pairing and GL₂-type residual Heegner classes | No statement or missing-carrier explanation |
| §§6.18–6.19 triangular basis and Zhang indivisibility | Actual residual Selmer representation and its Heegner family | Abstract support infima do not state these theorems |
| §§7.11–7.13 full elliptic/RM finiteness and classical square index | Elliptic/RM variety over a number field with the actual CM trace and arithmetic Sha comparison | Generic FG divisibility is background, not any of these endpoints |
| §§8.9–8.12 joint CM distribution, reduction surjectivity and definite nonvanishing | CM orbit/reduction maps and toric periods with fixed component measures | No statement; an arbitrary compact-space theorem would not be a substitute |
| §§8.21–8.24 indefinite and higher-point nonvanishing; non-torsion Iwasawa class | Geometric CM classes, their arithmetic tower, specified universal norms and ordinary Selmer lattice | Arbitrary additive-equivalence transport is insufficient |
| §§8.27–8.29 logarithm, control and index-square formulas | Integral family regulator, BDP function, propagated finite Sha and normalized lattices | No arithmetic statement; declared supplier contracts describe necessary missing constructions |
| §§8.31–8.32 determinant/characteristic equivalence and specialization | Actual Selmer perfect complex, determinant line and canonical arithmetic comparison | Freely supplied tensor equivalence does not determine them |
| §§8.36–8.40 Howard/weak-torsion divisibility, uniform errors and exact paired length | Actual Λ-adic Heegner system, cartesian local conditions and finite/DVR specializations | No arithmetic statement; scalar and support Checks are not replacements |
| §§8.41–8.44 conditional finite-system nonvanishing/refinement and Castella–Sano equivalence | The same specified systems plus their integral main-conjecture propositions | No missing-headline inventory |
| §§8b.6–8b.10 rational/integral Heegner and Greenberg equalities, including Eisenstein | Arithmetic Iwasawa modules, BDP normalization and integral period comparison | No statement or explicit missing-carrier entry |
| §§8b.11–8b.13 unconditional split applications | The preceding named arithmetic objects | No statement or explicit missing-carrier entry |

No additional arithmetic headline was found to be expressible merely by adding a few simple definitions on the pins. This does not license the existing stand-ins: S02 requires identifying these particular missing constructions in the module docstring. The normal-form theorem is a statable true algebraic assertion; it is not a replacement for the finite-descent endpoints.

### Library, ownership and dependency checks

The 24 Mathlib rows were checked at the pin, including their defining contexts. The important native boundaries are: `Subring.comap` is an arbitrary preimage, not optimality; `ClassGroup.equivPic` requires a domain but not Dedekindness; `PadicInt` requires `Fact p.Prime`; the principal-ideal theorem requires a nonzero ideal; `Module.length` is extended-natural length, not a cardinality; character homomorphisms alone have no continuity; tensor products alone have no arithmetic determinant comparison; compactness alone has no finite-solvability assertion.

| Pinned declaration or group | File and line at the pin | Boundary checked |
| --- | --- | --- |
| Subring.comap | Mathlib/Algebra/Ring/Subring/Basic.lean:173 | Any ring homomorphism/preimage; no optimal embedding hypothesis |
| ClassGroup.equivPic; CommRing.Pic.mapRingHom | Mathlib/RingTheory/PicardGroup.lean:876; :579 | Domain for class/Pic equivalence; extension of invertible modules, not conductor-unit exactness |
| PadicInt; isUnit_iff | Mathlib/NumberTheory/Padics/PadicIntegers.lean:71; :385 | Prime fact; unit iff norm1 |
| PadicInt.ideal_eq_span_pow_p; mem_span_pow_iff_le_valuation | Mathlib/NumberTheory/Padics/PadicIntegers.lean:545; :472 | Nonzero ideal / nonzero element; zero extended valuation supplied explicitly |
| Affine.Point | Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477 | Infinity and nonsingular affine points; not a modular parametrization or Heegner trace |
| Module.length | Mathlib/RingTheory/Length.lean:30 | ℕ∞; zero module length0, infinite length possible |
| primeFactorsList | Mathlib/Data/Nat/Factors.lean:38 | List with multiplicity; 0,1 give empty list, `toFinset` removes multiplicity |
| Four DihedralGroup identities | Mathlib/GroupTheory/SpecificGroups/Dihedral.lean:97 | sr·sr uses j−i; reflection is its own inverse; does not construct ring-class action |
| hensels_lemma | Mathlib/NumberTheory/Padics/Hensel.lean:459 | Approximate-root norm bound in context; ordinary derivative a_p modp is nonzero |
| MonoidAlgebra.single | Mathlib/Algebra/MonoidAlgebra/Defs.lean:222 | Finite-support group algebra, not completed Iwasawa theory |
| Submodule.span | Mathlib/LinearAlgebra/Span/Defs.lean:46 | Span alone is not saturation |
| LinearMap; MonoidHom | Mathlib/Algebra/Module/LinearMap/Defs.lean:84; Mathlib/Algebra/Group/Hom/Defs.lean:366 | Linear/algebraic morphisms; no automatic Galois equivariance or continuity |
| TensorProduct.tmul | Mathlib/LinearAlgebra/TensorProduct/Defs.lean:97 | Bilinear pure tensor, not an involution or duality |
| Module.finrank | Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 | Cardinal-rank truncation needs finite-dimensionality to interpret an asserted rank |
| ENat | Mathlib/Data/ENat/Defs.lean:17 | WithTop ℕ; empty infimum∞ |
| Pi.compactSpace; IsCompact.inter_iInter_nonempty | Mathlib/Topology/Compactness/Compact.lean:1177; :293 | Compact product; finite intersection property plus closedness required |

All 27 roadmap supplier families in the contract table were resolved individually where readable. Five expressly eligible suppliers had no readable copy in the supplied main/checkouts or the current tool index; those are listed under Not verifiable. The other 22 families were inspected at their actual main/open-head copies, not a remembered version. These are family-level counts, not a claim that every repeated citation string is a different checked theorem.

| Supplier | Current section/target checked and outcome |
| --- | --- |
| GlobalNumberFields | Layer11 orders/Picard: existing; conductor exact sequence belongs to ImaginaryQuadraticClassNumber H1.4 (S08) |
| ClassFieldTheory | Layers12–13 relative existence, finite quotients and Artin functoriality: correct scope |
| ComplexMultiplicationAndExplicitReciprocity | CM.1–CM.2 ideal/level action and CM.4 Tate characters: existing; arithmetic conductor formula belongs to ArithmeticGaloisRepresentations §3.5 |
| ModularCurvesPartII | §§9.9,13.1–13.4,17.1–17.3: correspondences, Jacobians, specialization, Eichler–Shimura and cusp map exist |
| HilbertModularVarietiesAndShimuraCurves | R18.1–R18.5: quaternionic levels, embeddings, reduction and graph interfaces exist |
| ShimuraVarieties | §§4.4,7.14 canonical-model targets exist |
| EllipticCurveModularity | R29.5 quotient isogenies/modular parametrizations exists |
| GrossZagierAndArithmeticHeights | Eligible but unreadable; no assertion of missing ownership solely from this limitation |
| EllipticCurves | Layers2,4,6,7 cover elliptic Tate/local/MW/Kummer inputs; not general RM finite generation (S05) |
| NeronModelsAndSemistableAbelianVarieties | R11.2, R11.4–R11.6, §2.6 provide component, monodromy, ordinary and reduction inputs; they do not by themselves assert a congruence-ideal period theorem |
| SelmerIwasawaCohomology | §§2.12a,2.17,2.21–2.22,3.1–3.3,3.9–3.10 and4.12 inspected; JSW exact propagated formula correctly declared separately; suffix repair S10 |
| ArithmeticGaloisDuality | R02.2.2–R02.2.3 low-degree/descent and R02.4/D7 duality exist |
| EulerSystemsAndKolyvaginSystems | §§3.1–3.8,4.13,4.18–4.19,5.2,5.10–5.13,8.28,8.31 exist; p=3 rigidity correctly a gap; square-index assertion expressly not supplied (S06) |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.4 integral/crystalline comparison, with lattice/ramification hypotheses retained |
| FaltingsFinitenessAndIsogenyTheorems | R28.4 Tate/semisimplicity and R28.6.7 almost-all commutants exist; asserted open-image/homothety supply false (S04) |
| ArithmeticGaloisRepresentations | §3.5 and §§6.1–6.4a exist; image predicates and Frattini detection are not Serre/Bogomolov arithmetic theorems (S04) |
| SerreWeightAndLevelOptimisation | §§1.1–1.3,2.4 exist; exact Zhang residual integral comparison correctly separated as declared gap |
| GL2AutomorphicRepresentationsAndTransfer | R17.3.1/global-jl and R17.3.6/multiplicity-one anchors actually exist; characteristic-zero multiplicity one does not discharge declared integral Zhang gap |
| ModularIwasawaMainConjectures | Eligible but unreadable; GL₂ integral rank-zero gap remains declared |
| KatoEulerSystems | Eligible but unreadable; detailed §6.6/§7.4/§7.7 scope not certified here |
| PadicMeasuresIwasawaAlgebras | §§1.6–1.7 character evaluation, §3.1 admissible pseudomeasure evaluation, §3a.1 characters, Layers4–5 module/determinant theory: corrected scope |
| GeometryOfNumbersAndQuadraticArithmetic | §4.2 is real dynamics; local dynamics gap precisely separates its extension |
| PadicHodgeTheory | §3.5 rank-one crystalline classification available on the split ℚ_p local factors |
| PadicHodgeRegulators | Eligible but unreadable; arithmetic family-logarithm gap remains separately owned |
| AutomorphicCongruences | Eligible but unreadable; independent primitive-toric gap does not consume its cyclotomic return |
| EulerSystemsCyclotomicMainConjecture | Existing cyclotomic scope does not supply elliptic units; named gap accepted rather than re-raised |
| Chebotarev | Layer10 finite-avoidance/density applies after constructing the actual finite Kummer extension |

Additional owners checked: HeightsRationalPointsAndObstructions §1.7 (general Mordell–Weil, S05); ImaginaryQuadraticClassNumber H1.4 (S08); EffectiveClassNumbers §2.8 at the specified sibling head (S12). The other sixteen supplied sibling folders produced no additional duplicate construction matching this package's actual Heegner/Euler-system endpoints. In particular SelmerIwasawaCohomologyPartII supplies its unitary-group comparisons, not this elliptic Heegner family, and ColemanIntegrationPartII's abelian logarithm is not the missing integral family reciprocity identity. None of these searches justifies duplicate generic foundations here.

The eight declared gaps have identical slugs in plan.json and the README, each a named earlier supplier, explicit source/hypothesis domain, and an identified missing interface. No gap has supplier `none`. The pairs of adjoining assertions in the local-dynamics and rigidity contracts form the specified single proof input, not an unrelated bundle. No already-present complete substitute was found for these contracts. They are accepted conditionally and are not findings. The p≥5 toric contract does not, however, supply the p=3 consumer in S07.

Dependency check run without editing package or order:

```text
depcheck: 18 roadmaps, 144 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The direct internal *Needs* links were also scanned against section positions: no explicit forward link or cycle was found. This mechanical result does not certify the missing mathematical inputs in S04–S07. No owner was moved in this read-only review.

### Source-locator audit

All nineteen manifest works have legal cached text and certified provenance. The entries below record nineteen source-locator audit groups, with exact text starts for the inspected statements. The numbering is that of the recorded version, not an assumed published renumbering. Broader section citations were used as proof-route context; an author's citation of another theorem was not treated as ownership by a roadmap.

| Source | Inspected locators and cached-line witnesses | Result |
| --- | --- | --- |
| howard | Theorems A,B: lines56,80; §1.7 correction, Proposition1.7.4/Theorem1.7.5: lines912–965; §2.3 augmentation calculation: lines1588–1594 | Odd/full-image and class-number hypotheses distinguish A/B; group-ring content not scalar augmentation |
| gross | Proposition2.1 line59; Proposition3.7 line174; Lemma4.3 line198; Propositions4.7/5.4 line242; Proposition6.2 line254; Proposition8.2 line388; Proposition9.1 line422; Proposition9.3 line447; Claims10.1/10.3 lines506,511 | Numbering corrected; OCR interleaves page columns, so surrounding mathematical argument checked rather than line order alone |
| cornut-vatsal | Theorems1.4/1.5 lines190/196; Theorem4.10 line1407; Proposition4.17 line1751; Proposition5.6 line1948; Proposition5.8 line1981; Theorem5.10 lines2073–2082; Appendix6.1 line2192 | Fixed torsion character, P-new, nonexceptionality and indefinite coprimality retained; p58–59 and p62 corrected |
| nekovar | Theorem3.2 line901; norm relation4.8 line1171; §6.1 scalar bounds line1631; §6.2 commutant criterion line1645; §6.3 evaluation line1783; §6.5 detection line1952; Theorem7.3 line2209; constants/C₀ lines2218–2234 | RM/no-CM-over-K context and dyadic factors consistent; arithmetic image and MW inputs still need correct owners |
| pollack-weston | Theorem6.2 line991; Theorem6.8 lines1128–1138 | Squarefree theorem uses congruence-ideal/pairing-norm ratio; Zhang supplies the stated extension |
| kolyvagin-structure | TheoremA and B(E) definition lines56–70, printedp95 | d_E independent of K and full Tate-image condition verified; source truth does not fill S06 supply gap |
| skinner | TheoremB lines54–73; §3.2 starts line779 | Residual irreducibility and residually ramified q∥N, not full integral SL₂; multiplicative exceptional condition is irrelevant to the good-ordinary specialization |
| zanarella | Theorem2.3.6 lines630–660 | p>4, dual/self-dual/cartesian hypotheses and sufficiently deep prime sets are part of primitivity use |
| cornut | Introduction theorem line49, manuscriptp2 | Existence of a non-torsion higher trace, not nonzero conductor-one trace |
| cv-dynamics | Theorem2.29 line1168; Lemma2.30 line1198; Proposition2.35 line1257 | Finite-extension local field, product of cocompact quotients and noncommensurability precisely motivate declared gap |
| bcgs | Lemma1.2.3 line546; Lemma1.2.5 line583; Theorem1.2.7 line640; Lemma1.2.8/Remark1.2.9 lines682/690; Corollary1.2.12 line705; Theorem1.2.13 lines716–722; Proposition2.2.1/Theorem2.2.2 lines832/835; Lemma2.2.4 line905 | q⁴ index formula, both K-primes and p=3 rigidity boundary verified; no source misprint about signed discriminant copied |
| bcs | Theorem1.2.2 line114; Theorem1.2.4 line136; Theorem4.2.1 line413; Proposition5.2.1 line479 | Odd-prime Euler-system bound distinguished from p≥5 reverse-divisibility chain |
| cgls | (disc) line81; §4.1 assumptions line1417; family/stabilization and Remark4.1.3 lines1420–1504; localized bound/corollary lines1406–1415 | S09 missing discriminant restriction; actual shift and predecessor stabilization otherwise agree |
| cs | Complex definition lines673–683; determinant comparison lines698–715; Proposition3.3.2 line742; Corollary3.3.4 line856; §3.4 line887 | Outer fibre shift, ι-twist, propagated quotient, L_p²Tam² and inert continuous-specialization route agree |
| bck | Theorem5.2 begins line693; §5 standing split and p>3 context | Integral comparison has the restricted prime domain used in S07 |
| cgs | TheoremC lines156–169; p=3 discussion line265 | Odd-prime Eisenstein branch includes p=3; it needs its own integral normalization comparison |
| khayutin | Proposition2.2 line857; Lemma2.3 line875; Definition5.7 line1646; Lemma5.8 line1659 | Full local-order hypothesis does not impose optimal embedding (S03); ideal-discriminant repair avoids signed norm claim |
| zhang | Theorem4.3 line935; Lemma5.1 line1066; Theorem5.2 line1095; Proposition5.4 line1164; Corollary6.2 line1241; Theorem6.4 line1291; Theorem6.5 line1332; Theorem7.1 line1374; local pairings lines1489–1521; Lemmas8.1,8.2,8.4 lines1525,1532,1554; Theorem9.1 line1671 | General k₀ representations, three-clause ♥, same-sign local pairing and triangular basis dimensions are retained |
| wuthrich | Theorems1/2 lines54/78; distinguished lattice discussion lines74–79; Theorem13 lines715–717 | Distinguished Tate lattice is essential; no arbitrary-isogeny integral identification follows |

## Not verifiable

- No fresh Lean elaboration or build was run. All 32 supplied elaborated signatures were compared with this head's source and README. This verifies the recorded contexts, not kernel correctness of new proofs or arithmetic truth.
- GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, KatoEulerSystems, PadicHodgeRegulators and AutomorphicCongruences are explicitly permitted suppliers, but their detailed current source was not present in the supplied main/checkouts or returned by the roadmap index. Their exact section contents and any return edges hidden inside them remain uncertified. They are not reported as ineligible or unowned merely because their files were unavailable.
- In particular, the independent period proof in §6.11 needs its exact congruence-module/modular-degree inputs matched to an owner. The readable Néron-model supplier alone does not establish them; the unavailable height/congruence suppliers prevent certifying the whole proof route. No additional P1 is asserted without that evidence.
- The eight declared gaps are future supplier contracts. Their declaration, domain and placement were checked; their mathematical implementation was not certified. Neither settled finding r1a:F15 nor r1a:F18 is re-raised.
- Source-locator checks use the recorded legal extractions. Gross and Kolyvagin contain OCR/column-order defects; only the legible located statements and formulas described above are certified. There is no unresolved request for a different source text.
- The deep arithmetic rows use source comparisons and conditional length/rank calculations. They do not assert that a new explicit elliptic curve with every specified global hypothesis was constructed for each row. No Lean build or finite collection of these tests can certify those theorems in full.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6f4ac32009fae818c5243400b2a6ce7716517616", "job": "RT-HeegnerPointEulerSystems~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
