# Review of AbelianVarietiesOverFiniteFields (pull request #1720 at da7f7cd)

**Verdict:** needs changes

## R01 (P1) — The Deligne-module carrier does not imply even rank

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:360–395`; README §9.1, lines 1124–1136, 1169. **Claim:** the three structure conditions imply even rank and reciprocal characteristic polynomial.

**Witness:** At q=4, M=ℤ and F=2 satisfy all three fields, but rank M=1. The README's own q=2 module ℤ[√2] has polynomial T²−2, whose constant coefficient is −2, not 2.

**Repair:** Keep the general lattice-with-Frobenius category, but state parity and positive reciprocity on the ordinary/no-real-root subcategories, or on a precisely defined admissible subcategory imposing the required real-root multiplicities. Do not exclude the real Honda–Tate classes from the library. The rank-one example must cease to satisfy the parity theorem's hypotheses; the existing T²−2 Check must remain a negative control for positive reciprocity. Deligne's Theorem 7 includes the ordinary condition: `deligne1969` lines 113–135.

## R02 (P1) — The Lean reciprocal identity has its coefficients reversed

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:394–395`. **Claim:** qʲ a₂ɡ₋ⱼ = qᵍ aⱼ for the characteristic polynomial.

**Witness:** On ℤ[2i], F=1+2i and q=5 give P=T²−2T+5. At j=0 the displayed equality is 1=25, even though this module is ordinary.

**Repair:** For ascending coefficients of P, write qʲ aⱼ = qᵍ a₂ɡ₋ⱼ, with the admissibility hypotheses from R01. At j=0 the repaired equality is 5=5; at j=2 it is 25=25. README §1.3 already distinguishes the characteristic polynomial from its reverse correctly; carry that distinction into Lean.

## R03 (P1) — Dualizing Frobenius gives Verschiebung

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:377`. **Claim:** the Frobenius on the dual equals the dual of Frobenius.

**Witness:** For the ordinary elliptic class q=5, π=1+2i. Under its principal self-duality, π∨=1−2i, whereas the dual variety's Frobenius is 1+2i. These differ by 4i.

**Repair:** State (π_A)∨=V_(A∨) and (V_A)∨=π_(A∨), retaining πV=q. This gives (1+2i)(1−2i)=5 on the witness and agrees with `TauCetiRoadmap/JacobianChallenge/README.md:385` and the module dual in §9.1.

## R04 (P1) — Weak-equivalence theorems are quantified over arbitrary subalgebras

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:209–216`. **Claim:** local Λ-module isomorphism is detected by colon products and determines the multiplier ring, without requiring Λ to be an order.

**Witness:** Let E=ℚ², Λ=diagonal ℤ, I=ℤ², J={(a,b):a≡b mod 2}. I≅Λ J, but (I:J)(J:I)=2ℤ² excludes 1; their multiplier rings are ℤ² and J.

**Repair:** Add `IsOrder E Λ` to both theorems, and the full-lattice hypotheses on I and J to the second; retain the README's ambient hypotheses explicitly. The witness has dimℚ span(Λ)=1<2 and is excluded. With Λ=J, I=ℤ² and J itself, both sides of the corrected criterion are false at 2. The regenerated elaborated signatures confirm these hypotheses are absent; this is not just a scanner warning.

## R05 (P1) — The Gorenstein ideal criterion needs a reduced ambient algebra

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:245–248`. **Claim:** invertibility of the regular-trace dual characterizes invertibility of every proper fractional ideal for any finite commutative ℚ-algebra.

**Witness:** In E=ℚ[ε]/ε², Λ=ℤ[ε], the trace dual is ½ℤ+ℚε and its inverse colon is 2ℤε. Their product is ℤε≠Λ, although every proper full ideal is principal.

**Repair:** Carry `[IsReduced E]` from README §8.1 into this theorem and the trace-dual lattice claims. To verify the second half of the witness, scale a full ideal to ℤ+dℤε; its multiplier ring is ℤ+dℤε, so multiplier Λ forces dℤ=ℤ. The corrected hypothesis excludes this square-zero algebra; for ℚ(i), ℤ[i] has invertible trace dual ½ℤ[i] and the criterion holds.

## R06 (P1) — Type one fails for the zero étale algebra

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:261–263,342–345`; README §§8.2, 8.5. **Claim:** Gorenstein/Bass is equivalent to supremal type one for every finite étale algebra.

**Witness:** E=0 is a finite reduced ℚ-algebra. Its unique order and trace dual are invertible, and it is Bass; there are no maximal ideals, so both type suprema are 0, not 1.

**Repair:** Require nontrivial E for the type-one equivalences and state the zero-algebra case separately. Also qualify §8.2's conductor≠0 conclusion. On E=0 the correct types are 0 and the conductor is 0; on E=ℚ, Λ=ℤ, the types are 1. Include reducedness in the Lean equivalences as required by §8.1. This preserves the empty-factor case rather than silently discarding it.

## R07 (P1) — The polarization trace formula has the wrong sign

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1293–1299`, also 1187–1189. **Claim:** b(x,y)=Tr(λxȳ), Φ-positive λ, and b(ιx,x)>0 describe the same positivity convention.

**Witness:** In ℚ(i), take I=ℤ[i], λ=i/2, ι=i, x=1, and Φ the usual complex embedding. λ is Φ-positive and λI=Īᵗ, but b(i,1)=Tr(−½)=−1.

**Repair:** Use b(x,y)=Tr(λx̄y) with this positive-λ convention, or change all signs and the dual map consistently. The swapped formula gives b(i,1)=+1. Also align Φ with the source: Howe selects positive p-adic valuation, not p-adic units (`howe1995` lines 408–445; `marseglia2021` lines 375–400). Supply this two-term sign Check at the CM-type and polarization interfaces.

## R08 (P1) — Twists need not have the same endomorphism field

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:718–722`. **Claim:** twist-equivalent isogeny classes have equal geometric extension degree.

**Witness:** Over 𝔽₂, P₀=T²+2 has root ratio −1, hence degree 2; P₂=T²−2T+2 has ratio i, hence degree 4. Both eighth powers are (T−16)².

**Repair:** Delete geometric extension degree from the invariant list. Keep dimension, slopes, p-rank and angle rank. Record the pair as a negative control: twist degree 8, endomorphism-field degrees 2 and 4. The invariant claims about slopes and angle rank still give {½,½} and 0 on both sides.

## R09 (P1) — The elliptic worked example is geometrically simple

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1522–1523`. **Claim:** the elliptic class 1.2.ac is not geometrically simple.

**Witness:** Its dimension remains 1 over every extension. At degree 4, P=(T+4)² has Honda exponent e=2 and simple-factor multiplicity 2/e=1, not 2.

**Repair:** Change the geometric-simplicity flag to true. Keep geometric extension degree 4 and the quaternion endomorphism algebra. Explicitly distinguish repetition coming from the division-algebra index from repetition of a simple factor, as §5.1 already does.

## R10 (P1) — One rational point does not bound q in dimension zero

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:853,911`. **Claim:** #A(K)=1 implies q≤4, also for a Jacobian of class number one.

**Witness:** A=0 over 𝔽₅ has P=1 and #A(𝔽₅)=1. Equivalently Jac(ℙ¹)=0 and h(𝔽₅(t))=1. The claimed inequality is 5≤4.

**Repair:** State the implication with g>0, or conclude g=0 ∨ q≤4. On the witness the first disjunct holds. Keep the general point bound: its lower bound in dimension zero is 1, not strictly greater than 1. The pinned carrier permits dimension zero (`TauCeti/AlgebraicGeometry/AbelianVariety/Trivial.lean:169`).

## R11 (P1) — The quaternion order has twice the required lattice rank

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1274–1277`. **Claim:** all three elliptic cases have point group O/(π−1)O.

**Witness:** Over 𝔽₉ take a supersingular elliptic curve with π=−3. Its group is (ℤ/4)², order 16. A maximal quaternion order has rank 4, so O/4O has order 256.

**Repair:** Limit the quadratic-order quotient formula to the commutative cases and give the quaternion case using the rank-two Tate realization. For scalar π=s, state E(K)≅(ℤ/(s−1))². At s=−3 this recovers 16 points. The elliptic curve y²=x³−x over 𝔽₃, extended to 𝔽₉, supplies this witness.

## R12 (P1) — The overorder graph includes rings that cannot occur

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1107–1108`. **Claim:** every overorder of the Frobenius order is an endomorphism ring in the class, for arbitrary squarefree P_A.

**Witness:** For q=4, P=T²+4 is an elliptic supersingular class with R=ℤ[2i]. R is an overorder of itself but is nonmaximal at 2, so cannot be End(E).

**Repair:** Apply the equality with the full overorder lattice only under §9.4's ordinary-or-prime-field hypotheses. In general define the graph using the subset of realizable orders and own its characterization. Here the full lattice has ℤ[2i] and ℤ[i], while only ℤ[i] occurs. This follows directly from the roadmap's §9.6 and Waterhouse Theorem 4.2(3), printed pp. 538–539 (`waterhouse1969` lines 716–726).

## R13 (P1) — The resultant obstruction admits the unit factor

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1387–1389`. **Claim:** monic coprime factors with resultant ±1 rule out Jacobians.

**Witness:** For an elliptic curve with q=5 and trace 2, h=x−2=1·(x−2). The factors meet all stated hypotheses and have resultant 1, but the elliptic curve is its own Jacobian.

**Repair:** Require both factors to have positive degree. The product decomposition with a zero factor is harmless, but it does not imply decomposability of a principal polarization. The witness is excluded; h=(x−2)(x−1) over 𝔽₂ has two positive-degree factors and resultant 1, and the stated obstruction applies.

## R14 (P1) — Six named supplier sections do not exist at the supplied head

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:163–173,480–486,768–780`. **Claim:** Part II F0.6–F0.7, F1.9–F1.10, F3.3 and F3.9 supply Tate, the isogeny criterion and lattice classification.

**Witness:** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md` jumps F0.5→F0.8, F1.6→F1.11 and F3.2→F3.4; its classification section is F3.10. None of the six cited headings exists.

**Repair:** Resolve the actual owners, not just renumber by proximity. `ArithmeticStatisticsPartI`, Supporting constructions, “Tate's theorem over a finite field” supplies integral Tate, commutants and the isogeny criterion; its integral class-set target supplies general finiteness. For the p-characteristic polynomial use Part II F1.3 and F1.5; retain F3.10 only with its prime-field hypotheses. State any remaining missing classification contract precisely with a declared gap or own the target. After repair every edge must resolve to an actual statement with the required hypotheses; no gaps are declared in this package.

## R15 (P1) — The Curves supplier edge is cyclic

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:217–227,427`. **Claim:** CurvesOverFiniteFields supplies Layers 1, 5 and 6 in a single-direction build.

**Witness:** This roadmap consumes CurvesOverFiniteFields §4.10; `TauCetiRoadmap/CurvesOverFiniteFields/README.md:760–769` consumes this roadmap's §4.6 Waterhouse list. The two folder-level supply edges form a cycle of length 2.

**Repair:** Move the shared input to an earlier owner, or split the polynomial supplier from its elliptic consumer so the folder order is acyclic. Merely changing merge-order positions cannot solve both inequalities. Recheck the two edges explicitly: the mechanical output below did not include this open-head cycle.

## R16 (P1) — The general HNR theorem is treated as an external axiom

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1376–1381,1492–1493`. **Claim:** the nonsimple/nonordinary portion of the headline classification is consumed from the paper, while only selected obstructions are proved here.

**Witness:** HNR Theorem 1.2 and Tables 1–2 contain the general exceptional list (`hnr2009` lines 33–77). No supplier owns the omitted portion; §10.4(B) neither states that list nor plans its proof.

**Repair:** Own the full classification, with the complete hypotheses and exceptional families, proof inputs and targets for both necessity and sufficiency; alternatively import an actual earlier owner's exact target. Preserve the split and nonordinary cases. The existing (T²−2)² example gives no Jacobian by a negative count, but that one obstruction is not a proof of the full table.

## R17 (P1) — Curve-count finiteness has no supplied bounded presentation

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1403–1407,1415–1416`. **Claim:** finiteness of curve isomorphism classes follows from an A2.8-type moduli presentation or finitely many plane models.

**Witness:** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1297` is A2.8, projective presentations of abelian schemes over normal bases. It supplies neither curve moduli nor a uniform bound on curve models.

**Repair:** Name an exact curve supplier, or add a bounded-presentation target with its descent argument: for g≥2 use the uniform tricanonical embedding (degree 6g−6, projective dimension 5g−6) and its Hilbert scheme, with genus 0 and 1 handled separately. Merely counting rational points of an atlas does not count all rational objects without a lifting/descent argument. At g=2 the proposed bound is degree 6 in ℙ⁴; at g=0 there is one finite-field form of ℙ¹.

## R18 (P1) — The recorded gate fails

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:1`. **Claim:** the acceptance file passes the targeted build gate.

**Witness:** The worker reports `build=1 FAIL`, with the warning that importing Mathlib requires the module system and suggests adding `module`. All other gate counters are zero.

**Repair:** Add the required module header and rerun the targeted gate until only `sorry` warnings remain. Direct `lake env lean` elaboration on this head did pass; this finding concerns the recorded build gate, not a fabricated type error. The fixed header still needs that targeted-build verification; this read-only review did not modify the PR to perform it.

## R19 (P1) — The nonordinary prime-field polarization comparison is unowned

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1309–1311,1328–1330`. **Claim:** the ordinary ideal positivity dictionary applies unchanged to q=p by transporting its convention through Centeleghe–Stix §7.

**Witness:** At q=p=2, P=T²+2 has two slopes ½ and no unit root. Thus §9.2's proposed Φ is empty; its positivity test accepts both λ and −λ, although they cannot both be ample.

**Repair:** Supply a separately owned polarization comparison with an actual CM type and its transport/correction data for the nonordinary prime-field category. State the exact hypotheses and source result. Centeleghe–Stix's unpolarized anti-equivalence does not alone provide it; Marseglia Theorem 5.4 explicitly assumes ordinary (`marseglia2021` lines 392–400). The repaired criterion must distinguish λ from −λ on this supersingular witness. Keep the promised general prime-field work rather than silently narrowing it to ordinary objects.

## R20 (P2) — Waterhouse's headline is statable but missing

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:14–32`; README §4.6. **Claim:** missing abelian-variety Frobenius APIs explain omitting the characteristic-polynomial headlines.

**Witness:** `WeierstrassCurve`, `W.IsElliptic` and `W.frobeniusTrace` exist at the pin. A scratch theorem expressing existence of an elliptic W with trace a iff Waterhouse's five cases elaborated with only its `sorry` warning.

**Repair:** State the native existence classification, with finite K, prime p, characteristic p, q=pʳ and r>0, the Hasse inequality and all five alternatives. It needs no new abelian-variety Frobenius carrier or stand-in. Tests: q=2 permits traces −2,…,2; q=49 rejects trace 7 because 7≡1 mod 3. Name genuinely unavailable geometric headlines and their missing carriers individually in the module docstring.

## R21 (P2) — Two proposed morphism formulas have the wrong domains

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:373,1202–1204`. **Claim:** general naturality can use `End.ofHom f`, and F on Hom(A,A_w) is composition on the sides displayed there.

**Witness:** `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:95` accepts only f:A⟶A. For f:A⟶A_w, f∘π_(A_w) and π_A∘f are not composable when A≠A_w.

**Repair:** Write π_A≫f=f≫π_B in the Hom space for naturality. On Hom(A,A_w), write F(f)=π_(A_w)∘f=f∘π_A, or the corresponding `≫` expressions. With A=E², A_w=E and f a projection, both repaired expressions are the row (π_E,0); the originals have incompatible domains.

## R22 (P3) — Delete acceptance-file padding

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:69–82,99–121,171–173`. **Claim:** these API/bridge declarations belong in the headline acceptance test.

**Witness:** `IsIsogenous.baseChange` closes with one `exact` using `IsIsogeny.baseChange`; both bridge examples are already single library applications. The order comparison is an API identification, not a headline.

**Repair:** Delete these declarations from `Suggested.lean`; keep the mathematical API and checks in the README. Remove the auxiliary quotient/reflexivity/transitivity machinery if it serves no retained headline. Do not replace the admissions with proofs in place. The exact base-change probe passed; the generic simp/rfl/infer_instance probes did not close any of the 21 admissions. No stronger claim about a successful order-comparison tactic is being made.

## R23 (P3) — Replace the incorrect source locators

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1040–1053,1076–1095,1285,1640–1649`. **Claim:** Marseglia §§2–4 contain the stated weak-equivalence, Bass and polarization results; Centeleghe–Stix §4 contains the Gorenstein theorem.

**Witness:** In the versions read, Marseglia's category equivalences are Theorem 3.2, ideal dictionary Theorem 4.3 and ordinary polarization dictionary Theorem 5.4; Centeleghe–Stix's Gorenstein result is §2, Theorem 11.

**Repair:** Give theorem and page locators for the version actually read, check published/preprint numbering, and supply the primary ideal-class-monoid source for the weak-equivalence/Bass assertions. `marseglia2021` lines 199–206, 259 onward, 392–418; `centeleghestix2015` lines 435–448 locate the relevant results. Do not turn the ordinary theorem into a prime-field general theorem by changing only its locator.

## R24 (P3) — Restore the required roadmap shape and definition Checks

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1–40,265–357,935–958,1055–1068`. **Claim:** the document supplies the required per-definition APIs, discriminating Checks and layer dependencies.

**Witness:** §8.1 introduces orders, maximal order, index and overorders without a Checks list; §8.5 introduces both type suprema without one. None of the eleven layers ends with Examples and Dependencies.

**Repair:** Add the Summary, Conventions, Exact supplier contracts and How to read the build sections in the required form; give each definition its prose API bullets and at least three discriminating Checks, and each layer its Examples/Dependencies. Replace Rests on with precise per-target Needs lines. Use the counterexamples above as negative controls. Remove time-dependent “post-pin”, “on disk”, and process/implementation descriptions. Do not add Lean checks as padding.

## R25 (P3) — Several library-availability statements are stale

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:131–150,301,1125,1157`. **Claim:** Gorenstein material is post-pin, `LinearMap.IsSemisimple` is pinned, and the named dimension-zero module is supplied.

**Witness:** The pin contains `Orders/Gorenstein.lean:124,394,454`; semisimplicity here is `Module.End.IsSemisimple`; `AbelianVariety/DimensionZero.lean` is absent, while `Trivial.lean:169` supplies dim_trivial.

**Repair:** Cite the actual pinned modules/declarations and distinguish an available theorem from an intended supplier contract. Use the real Gorenstein field-case theorem in the comparison, retaining the product-algebra extension only where it adds mathematics. The Lean file already uses the correct semisimplicity name.

## Verified sound

Both files were read in full. Finite witnesses and source inspections below are not proofs of every planned theorem. The defects are repairable. No PR file was edited. The diff outside this folder is empty; there are no sorry-valued data definitions, set_options, admitted examples, forbidden imports or extra source files.

The worker gate has all counters zero except `build=1 FAIL` (R18). Independent `lake env lean` elaboration succeeded with 21 `sorry` warnings. A fresh scratch copy checked all **59 real named declarations** with `#check @name`; the worker's count of 60 includes the word “gives” in a comment as a false declaration match. Correcting that probe produced exit 0. The 25 binder-warning leads were examined against the expanded types: removing unused parameters from a definition is not itself a defect; R04–R06 identify actual missing mathematical hypotheses. No declaration changed in the PR. All 21 admissions were tried with individual `simp`, `rfl`, and `infer_instance` probes, with no closures; the separate single-exact base-change probe succeeded. The native Waterhouse headline probe also elaborated.

The required dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1561 edges, 0 problem(s)
```

This output does not certify the open-head graph: R15 exhibits the missing two-edge cycle. Missing placement of a new roadmap was not treated as a finding. The dependency lines here are spelled Rests on; they and the supplier prose were inspected, including the six unresolved Part II section references in R14.

**Source sample: all 15 requested targets inspected.** There was no additional explicitly unverified locator marker in the README. References were fetched through the sources service; no manifest was edited. “Supported” below refers to the stated part at the cited locator, not to every surrounding roadmap claim.

| Sample target | Text and exact location inspected | Outcome |
|---|---|---|
| 1.2 Extension-field points | `milneAV` II Theorem 1.1, pp. 75–76, lines 3105–3110, 3134–3143 | Frobenius fixed points and degree/product count supported for positive extension degree; the model-independent adapter needs the stated base-change identification. |
| 1.3 Reverse polynomial and functional equation | `milneAV` II Theorem 1.1, pp. 75–76; Part II F0.2 | Root pairing and positive determinant give the README identity; Lean's opposite identity fails (R02). |
| 1.4 Frobenius powers | `milneAV` II §1, pp. 75–76, lines 3092–3110, 3134–3143; Curves §4.10 | Raising the roots and extension-degree multiplication agree. |
| 1.6 Elliptic comparison | `milneAV` II Theorem 1.1; pinned `PointCount.lean:101–117`; DWP §1.8 | P=T²−aT+q and #E=q+1−a agree. This does not repair the separate dual-Frobenius claim. |
| 1.7 Isogeny relation | `milneAV` I Proposition 7.1, p. 32, lines 1378–1383; I §9, p. 41, lines 1744–1760 | Finite/surjective isogeny convention and quasi-inverse route agree; positive-degree multiplication has the dimension-zero caveat recorded under Source issues. |
| 3.4 Endomorphism display | `milneAV` II Theorem 2.9, p. 81, lines 3333–3342; `waterhousemilne1971` Theorems 2, 8, pp. 54, 58, lines 75 onward, 233 onward | Simple factors, matrix multiplicities, index and local-invariant dimensions agree. Part II commutant locators drift (R14). |
| 4.6 Elliptic traces | `waterhouse1969` Theorem 4.1, p. 536, lines 619–629 | All five families, small primes and the q=49 rejection agree. Distinguish trace a from exponent a₀ in the sentence. |
| 5.1 Multiplicities | `waterhousemilne1971` Theorem 2, p. 54; `milneAV` II Theorem 2.9; ASAM A6.5 | nᵢ=vᵢ(P)/eᵢ, not vᵢ(P), agrees including real simple factors. |
| 6.1 p-rank | `milneAV` I Remark 7.4, p. 34, lines 1468–1477; ASAM A4.5 | Point-group bound 0≤r≤g supported. The source's following group-scheme splitting is false and must not be imported. |
| 6.2 Slopes | `waterhousemilne1971` Part II Theorems 1–2, pp. 60–61, lines 299–310; Part II F1.3/F1.5; FiniteFlat R07.2.15–16 | q-normalized eigenvalue valuations give slopes. The cited F1.10 is absent; F1.3/F1.5 are the relevant actual targets. |
| 7.5 Class number | FunctionFieldArithmetic §§5.3–5.4, README lines 1807, 1838; `lmfdb-av.fq.class_number_1` line 90 | L_F(1)=h_F and the Jacobian count resolve. The positive-genus restriction is missing from the claimed q bound (R10); the knowl has the related source issue below. |
| 8.1 Orders | ClassicalArithmeticCompletion §§7.4, 7.21, 7.49; pinned lattice/order definitions | Full lattice, integrality, nondegenerate trace bound and finite overorders resolve. `lmfdb-av.fq.order` returned a browser challenge, so its wording is not certified. |
| 9.6 Elliptic endomorphism rings | `waterhouse1969` Theorem 4.2, pp. 538–539, lines 716–726; Theorem 4.5, p. 541, lines 806–814 and proof 828–852 | Three endomorphism-ring cases supported. The added quaternion point-group formula is not (R11). |
| 10.2 Principal polarizability | `howe1995` §4, Definition 4.8 and Proposition 4.9, pp. 2369–2370, lines 408–445; `marseglia2021` Theorem 5.4, preprint p. 9, lines 392–418 | Ordinary polarization dictionary supported with corrected sign/type; no certification for the asserted nonordinary prime-field extension (R19). |
| 11.1 Label prefix | `lmfdbLabel` lines 90–102, knowl av.fq.lmfdb_label; README §1.3 | Dimension, q and initial coefficients determine the reciprocal polynomial. The roadmap explicitly excludes the database's letter encoding. |

Additional source inspections: Deligne Theorem 7, printed pp. 240–241 (`deligne1969` lines 113–135); Centeleghe–Stix Theorem 1 and §2 Theorem 11 (`centeleghestix2015` lines 86–92, 435–448); Marseglia Theorems 3.2, 4.3, 5.4; HNR Theorem 1.2, Tables 1–2 and Theorem 1.3 (`hnr2009` lines 33–94). Centeleghe–Stix, Marseglia and HNR were read in their arXiv versions; preprint pagination is distinguished from the journal pages rather than silently equated. The roadmap's broad section citations need the version-specific repairs in R23.

**Pins and duplication by object.** The following **16 pin locations** were opened, rather than inferred from theorem names. Paths are relative to the respective library root at the project's pins.

| Pinned file and line | What it supplies and what it does not supply |
|---|---|
| `Mathlib/Algebra/Module/Lattice.lean:67` | `Submodule.IsLattice` has finite generation and full scalar span; it does not assert reducedness or nontriviality of an algebra. |
| `Mathlib/LinearAlgebra/Semisimple.lean:55` | `Module.End.IsSemisimple`; no even-rank or positive-reciprocity condition. |
| `Mathlib/GroupTheory/FiniteAbelian/Basic.lean:134` | `AddCommGroup.equiv_directSum_zmod_of_finite`, with a finite additive commutative group. This is a prime-power decomposition, not yet the ordered invariant-factor list. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:138` | `pow_eq_one_of_norm_eq_one` requires an algebraic integer and norm one at every embedding; these are essential in the supersingular route. |
| `Mathlib/RingTheory/DedekindDomain/Different.lean:47,57` | `Submodule.traceDual` has a field as ambient L. The product-algebra trace dual is a real generalization, not a duplicate of this signature. |
| `Mathlib/RingTheory/ClassGroup/Basic.lean:84–89` | `ClassGroup` requires a domain. A Picard construction for a product algebra needs the claimed extension/comparison. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,118` | Native proper geometrically integral group-scheme carrier and dimension; no positive-dimension hypothesis. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61,102,122,140` | Isogeny is finite and surjective; identity, composition and base change already supplied. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:95,153` | `ofHom` takes endomorphisms only; ring multiplication corresponds to reversed categorical composition. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Trivial.lean:169` | A native zero-dimensional abelian variety exists. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73,101,115` | Point count and Frobenius trace on native Weierstrass curves; ellipticity must be added for Waterhouse, and the definition of trace alone does not add it. |
| `TauCeti/NumberTheory/NumberField/Global/Orders/Basic.lean:59,84,89` | `NumberFieldOrder` is finite and spans, its elements are integral and it embeds in the maximal order. |
| `TauCeti/NumberTheory/NumberField/Global/Orders/Gorenstein.lean:124` | Field-order trace dual. |
| `TauCeti/NumberTheory/NumberField/Global/Orders/Gorenstein.lean:394` | Field-order Gorenstein criterion using invertible proper ideals. |
| `TauCeti/NumberTheory/NumberField/Global/Orders/Gorenstein.lean:454` | Quadratic number-field orders are Gorenstein. |
| `TauCeti/NumberTheory/NumberField/Global/Orders/IdealClassMonoid.lean:21,224` | The field-order ideal class monoid already includes noninvertible classes; the extension must retain them, not replace ICM by Pic. |

The main-roadmap shape was compared with JacobianChallenge, ClassicalArithmeticCompletion and QuadraticFormInvariants. Ownership searches used `roadmaps grep`/`show`, the pinned trees and board packages, searching objects including full lattices, trace duals, weak equivalence of ideals, Cohen–Macaulay type, Deligne modules and Frobenius. No fully qualified name collision with the retained target namespace was found. Generic orders remain ClassicalArithmeticCompletion's; the finite-product extension of the number-field ideal theory and the finite-field categorical comparisons are legitimate new work. Existing field-case theorems must be cited, not re-planned. The search also returned open ArithmeticStatisticsPartII's full-lattice comparison, but no checkout for that head is supplied in the brief and it is absent on main; that additional open-work ownership comparison is not certified here.

**Resolved cross-roadmap contracts.** Besides the six missing locators in R14, these **18 supplier groups** were resolved by section at main or the supplied open head. This list records the object actually supplied, so a similarly named heading is not being counted as evidence of a stronger theorem.

| Supplier | Resolved sections / objects |
|---|---|
| AbelianSchemesAndArithmeticModuli | A4.1 Tate realization; A4.5 p-divisible groups; A4.9–10 canonical lifts; A5.1 uniformization; A6.2 faithfulness, A6.4 simplicity, A6.5 reducibility, A6.7 finite Hom, A6.10–11 characteristic polynomials, A6.14 Rosati, A6.21 Frobenius, A6.30–34 restriction and twists. A2.8 is about abelian schemes, not curve models. |
| AbelianSchemesAndArithmeticModuliPartII | F0.2 reciprocity; F1.3/F1.5 p-realization; F1.11 local invariant; F3.1a–d existence and descent; F3.2 Honda–Tate; F3.8 orders and F3.10 prime-field lattices. |
| ArithmeticStatisticsPartI | Supporting constructions: finite Weil polynomials, finite polarized classes, Tate over finite fields, integral class-set finiteness. These resolve ownership leads omitted from the target's stale Part II list. |
| DeligneWeightsAndPurity | §1.1 Frobenius adapter, including product and base change (README line 911); §§1.2, 1.4–1.6, 1.8–1.9 Rosati, root bounds, counts, Jacobian/elliptic comparisons and powers. Already-supplied clauses belong in the contract, with only the extra arbitrary-extension adapter owned here. |
| SchemeAndStackFoundations | §0.29 scheme Frobenius (README line 1825). |
| ClassicalArithmeticCompletion | §§7.4, 7.21, 7.49 orders, maximality and trace-dual bound (README lines 14393, 14867, 15568). |
| GlobalNumberFields | Layer 11 field-order/Picard theory; implemented portions were checked against Tau Ceti rather than treated as missing. |
| ClassFieldTheory | Layers 5 and 10 local invariants and the global Brauer sequence, with the arithmetic-Frobenius normalization. |
| QuadraticFormInvariants | §7B crossed-product/Brauer-cohomology comparison (README line 2413). |
| JacobianChallenge | Layer E duals, polarizations and canonical Jacobian polarization; dual-Frobenius Check at line 385 contradicts R03's original formula. |
| FunctionFieldArithmetic | §§0.2, 5.3–5.4 degree-zero classes, class number and Jacobian zeta comparison (README lines 520, 1807, 1838). |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.2.15–16 Dieudonné/Manin and slopes; R07.2.19 characteristic-polynomial descent. |
| PELModuli | M0.1–M0.2 positive involutions and Albert types (README lines 430, 493). |
| ComplexMultiplicationAndExplicitReciprocity | §5.2 ordinary order levels and supersingular level pairs (README line 778). |
| FaltingsFinitenessAndIsogenyTheorems | R28.5.1 finite Weil-polynomial families; not a supplier of the missing finite-field categorical construction. |
| CurvesOverFiniteFields | §§2.5–2.7, 3.10–3.11, 4.1–4.11 polynomial, Newton, power and counting theory; reverse Waterhouse dependency found in §5.1 (R15). |
| QuaternionArithmetic | §§2.2, 2.5 quaternion order notions, class-set/class-number layers; its reference to the commutative instance is an ownership boundary, not a second construction of the étale case. |
| HyperellipticCurves | Hyperelliptic predicate and characteristic-2 model conventions; this does not supply the missing uniform finiteness argument of §10.6. |

EllipticCurves' geometric ordinary/supersingular interface was also compared with the pinned elliptic APIs. Scope-only neighbours such as SatoTateGroups and Chebotarev were not turned into supplier edges. No declared supplier gap was found or silently treated as fulfilled.

**Headline inventory.** The README's owned end results are Waterhouse's elliptic trace classification; finite-extension/Frobenius and Jacobian comparisons; endomorphism-field and geometric-decomposition criteria; p-rank/slope and supersingular structure comparisons; general étale-order, weak-equivalence, ICM and finiteness theory; Deligne and Centeleghe–Stix equivalences; the squarefree isomorphism-class/point-group dictionaries; the polarization dictionary and principal-polarizability criterion; the full HNR Jacobian classification and resultant obstruction; curve-count finiteness and injectivity of the intrinsic label prefix. Tate, Honda–Tate and basic abelian-variety characteristic-polynomial theory are imported headlines, not new work here. Waterhouse is demonstrably statable (R20). The categorical/geometric headlines need the missing Frobenius/characteristic-polynomial, canonical-lift/comparison, polarization or curve carriers and must be identified individually in the docstring. Merely listing a collection of API predicates is not a substitute for those headlines.

**Computed adversarial pass — README.** In this table E₂ has q=2, P=T²−2T+2; E₅ has q=5, P=T²−2T+5; S₂ has q=2, P=(T²−2)². The q=5 lattice calculations use π=1+2i. Equalities are values computed on the tested instances; a passing instance is not a proof of the general statement. Degree-zero, characteristic-2, inseparable and square-zero controls are retained explicitly. Semisimple-algebra invariants are computed over their stated centres, never by confusing the centre degree with the division-algebra index.

| Statement / convention | Instances | Computed sides / discriminating values | Result; repair |
|---|---|---|---|
| Finite-field conventions | 𝔽₂, 𝔽₃; q=1 | cardinalities 2,3; a field of cardinality 1 does not exist | Positive prime-power hypotheses meaningful. |
| Abelian-variety carrier, g=0 | Spec 𝔽₅; dual-number thickening | dim 0, point count 1; thickening has nonzero ε²=0 and fails geometric integrality | Zero dimension admitted; thickening excluded. |
| 1.1 Hom naturality | projection E₅²→E₅ | repaired composites both (1+2i,0); End.ofHom cannot take this rectangular map | R21. |
| 1.1 Dual Frobenius | E₅ | π_(E∨)=1+2i; π∨=1−2i; πV=5 | False; R03. |
| 1.1 Product / base Frobenius | E₅²; extension degree 2 | determinant 5²=25; π²=−3+4i | Product/power convention agrees with supplier. |
| 1.2 Points over extensions | E₂, r=1,2,3,4 | #points=P_r(1)=(1,5,13,25); r=0 would give P₀(1)=0, not #E₂(K)=1 | r≥1 needed and present. |
| 1.2 Finite étale kernel | E₅, 1−π | degree 4, four geometric kernel points; π itself has degree 5 and one geometric kernel point | Separability of 1−π matters. |
| 1.3 Reversal | E₅ | P coefficients ascending (5,−2,1); L=(1,−2,5); L(1)=P(1)=4 | Pass; distinguishes P from L. |
| 1.3 Reciprocity | E₅, j=0,1,2 | P: qʲaⱼ=qᵍa₂₋ⱼ gives (5,−10,25) on both sides; L uses the reversed identity | README passes; Lean R02. |
| 1.4 Weil powers | E₅, r=2 | π²=−3+4i; P₂=T²+6T+25; P₂(1)=32; degree remains 2 | Pass. |
| 1.4 Iteration | E₂, r=2 then 2 | P₄=(T+4)² in both routes; roots (−4,−4) | Pass; multiplicities retained. |
| 1.5 Jacobian comparison | E₂ as genus-1 curve | curve counts (1,5,13,25)=Jacobian counts; L(1)=1=h | Pass instance. |
| 1.6 Elliptic comparison | E₅; E₂ | q+1−a=4 and 1; P(1)=4 and 1 respectively | Pass, including p=2. |
| 1.7 Isogeny equivalence | E, [2], identity | deg id=1, deg[2]=4; quasi-inverse [2] gives [4]; equal dimensions 1=1 | Pass over any field; [2] can be inseparable. |
| 1.8 Class invariants | the two E₅ members | equal P and point order 4; groups ℤ/4 and (ℤ/2)² differ | Polynomial/count invariance does not assert group invariance. |
| 2.1 Arithmetic Tate action | E₅ | determinant π=5; determinant π⁻¹=1/5 | Arithmetic convention discriminates inverse. |
| 2.8 Hom after extension | E₂, r=1,4 | End⁰ ranks 2 and 4; coincident root-pair counts 2 and 4 | Pass numerical comparison; supplier drift R14. |
| 3.3 Real square-q class | q=4, π=2 | F=ℚ, e=2, [D:F]=4; 2g=2·1=2; P=(T−2)² | Pass. |
| 3.3 Real nonsquare-q class | S₂ | [F:ℚ]=2, inv₂=½·2=0 mod 1, two real invariants ½; e=2, g=2 | Pass; T²−2 alone is unrealizable. |
| 3.4 Matrix algebra display | E₅² | End⁰=M₂(ℚ(i)); dimℚ=4·2=8; repeated-root coincidence count 2²+2²=8 | Pass; division index remains 1. |
| Layer 4 Realizability | P=1; T²−2; (T²−2)² | zero-dimensional class exists; exponents 1/2 is not integral, 2/2=1 is | Empty product and Honda exponents distinguished. |
| 4.6 Waterhouse cases | q=2,3,4; q=49,a=7 | trace sets −2…2, −3…3, −4…4; 7²≤196 but p≡1 mod3 excludes a=7 | Pass source and numeric controls; R20 omission. |
| 5.1 Factor multiplicities | E₅²; S₂ | (v,e,n)=(2,1,2) and (2,2,1) | Simple-factor squarefreeness differs from polynomial squarefreeness. |
| 5.2 Base-change decomposition | S₂ over 𝔽₄ | P₂=(T−2)⁴; new e=2, n=4/2=2, dimensions 2=2·1 | Pass. |
| 5.3 Geometric simplicity | E₂; S₂ | geometric dimensions of simple factor 1,1; multiplicities 1,2 | E₂ simple, S₂ not; R09. |
| 5.3 Geometric squarefreeness | E₂; S₂ | simple-factor multiplicities 1 and 2, despite both having repeated powered roots | Pass only with n, not polynomial exponents. |
| 5.4 Endomorphism field degree | q=2 traces 0,2 | root ratios −1 and i have orders 2 and 4 | Matches d=2,4; contradicts twist invariant in R08. |
| 5.5 Primitive model | q=4, P=(T−2)² | a²−4=4 requires a²=8, impossible in ℤ; weilPower₂(T²−2)=(T−2)² nonetheless | Primitive realizable class; polynomial root need not be realizable. |
| 5.6 Twist equivalence / degree | q=2 traces 0,2 | both eighth-power polynomials (T−16)²; smaller r do not pair the roots; d_End=2≠4 | Twist degree 8; R08. |
| 5.6 Quadratic twists | E₅ traces ±2 | P and P(−T); both square-power polynomial T²+6T+25 | Twist degree 2; pass. |
| 5.7 Centre / splitting field | E₅; q=2 quartic in worked examples | degrees 2,4; Galois groups C₂, C₂×C₂; real-subfield degrees 1,2 | Matches quadratic and biquadratic examples. |
| 6.1 Geometric p-rank | E₅; E₂; zero variety | #A[p](K̄)=5,1,1; ranks 1,0,0 | Bound 0≤r≤g passes. |
| 6.2 Slopes / middle coefficient | E₅; E₂ | slopes (0,1),(½,½); 5∤−2 true, 2∤−2 false | Ordinary criterion passes. |
| 6.2 q-normalization | E₂ over 𝔽₁₆ | root −4 has v₂=2; v₂(16)=4; slope 2/4=½ | Normalized slope unchanged. |
| 6.3 Supersingular structure | S₂ over 𝔽₄ | P₂=(T−2)⁴=(P_E)², e_E=2; E² has four slopes ½ | Pass. |
| 6.3 Ordinary / almost ordinary boundaries | zero variety; E₂ | g=r=0: ordinary and supersingular true, almost ordinary false; E₂: r+1=g=1 | Definitions have sensible empty cases. |
| 6.3 Elevation | g=0,1,2 supersingular | values 0,1,2; formulas g(g+2)/4 or (g+1)²/4 give 0,1,2 | Pass. |
| 6.4 Invariance / products | E₂² and its finite-field extensions | p-ranks 0+0=0 and four slopes ½ before and after extension | Pass same-characteristic test. |
| 6.5 Angle rank | E₂; E₅; E₅² | ranks 0,1,1; 1≤1+1; supersingular iff rank0 on these examples | Repetition must not increase angle rank. |
| 7.1 Point bounds | q=5,g=0; q=4,π=2,g=1 | lower bounds 1 and 1; point counts 1 and 1; q bound would say 5≤4 | R10. |
| 7.1 Extension divisibility | E₅, r=1,2,4 | 4 divides 32 divides 640; 32/4=8,640/32=20 | Pass. |
| 7.2 Integral Tate quotient | ℤ[2i], ℤ[i], π=1+2i | F−1 matrices [[0,−4],[1,0]], [[0,−2],[2,0]]; Smith factors (1,4),(2,2) | Same determinant 4, distinct groups. |
| 7.3 Cyclicity criterion | those two lattices at ℓ=2 | dimensions mod (F−1,2) are 1 and 2; first cyclic, second noncyclic | Noncyclic primes={2}, with 2² dividing P(1)=4. |
| 7.4 Virtual curve obstruction | S₂ | N₁=3,N₂=−3,N₃=9,N₄=1 | Negative N₂ rules out Jacobian. |
| 7.5 Class number identity | E₂; ℙ¹/𝔽₅ | h=1=#Jac in both; genera 1,0 | Identity passes; q≤4 fails in second case (R10). |
| 8.1 Full orders / index | E=ℚ², parity order J; diagonal ℤ | rank J=2,index=2; diagonal rank1, quotient cardinal convention 0 | Only J is an order; full-span hypothesis matters. |
| 8.1 Maximal order / overorders | ℤ[2i]⊂ℤ[i] | index2, exactly two overorders; top index1 | Pass. |
| 8.2 Colon / multiplier / conductor | R=ℤ[2i], I=ℤ[i] | (R:I)=2ℤ[i], (I:I)=ℤ[i], I(R:I)=2ℤ[i]≠R | I is fractional, not invertible over R. |
| 8.2 Picard formula | R=ℤ[2i] | #Pic=1·2/(1·2)=1; conductor quotient sizes 4 and 2 | Pass; denominators nonzero. |
| 8.3 Frobenius order / relative discriminant | E₅; quartic q=2 example | R=ℤ[2i], index2, norm(π−V)=16=16/1; quartic 9=225/25 | Pass. |
| 8.3 V need not lie in ℤ[π] | quartic q=2 example | [ℤ[π,V]:ℤ[π]]=2, whereas elliptic index is 1 because V=a−π | Discriminates higher-dimensional order. |
| 8.4 Trace dual / Gorenstein | R=ℤ[2i] | Rᵗ=½ℤ+(i/4)ℤ=(i/4)R, invertible; all two overorders quadratic | Gorenstein and Bass true. |
| 8.4 Nonreduced control | ℤ[ε]⊂ℚ[ε]/ε² | trace dual=½ℤ+ℚε, product with inverse colon=ℤε≠R | R05. |
| 8.5 Type / Bass | ℤ[i]; E=0 | type/max-type=1/1 versus 0/0; Bass=true in both | Type-one iff needs nonzero case; R06. |
| 8.6 Weak equivalence | diagonal Λ, I=ℤ², J parity | local isomorphism true; colon product 2ℤ² lacks (1,1) | R04. |
| 8.6 ICM fibres and count | R=ℤ[2i] | two weak classes, each Pic size1; #ICM=1·1+1·1=2 | Pass; ICM differs from Pic size1. |
| 8.6 Singular dimensions | R=ℤ[2i], prime above2; I=R or ℤ[i] | R/𝔪R has dimension1; ℤ[i]/𝔪ℤ[i] dimension2 over 𝔽₂ | Distinguishes local principality over R. |
| 8.7 Conductor-sum predicate | R=ℤ[2i], S=R or ℤ[i] | ℤ+2ℤ[i]=R; R+𝔣_S=S for both choices | True instances; R12 concerns realization, not equality of lattices. |
| 8.7 Realizability of overorders | q=4,P=T²+4 | overorders {ℤ[2i],ℤ[i]}; occurring rings {ℤ[i]} | False unrestricted graph equality; R12. |
| 9.1 Carrier / parity | q=4,(ℤ,2); q=2,(ℤ[√2],√2) | ranks1,2; constant terms−2,−2; first not even, second not positive reciprocal | R01. |
| 9.1 Verschiebung and dual | q=5,F=1+2i,V=1−2i | FV=VF=5; V transpose has trace2,det5, hence same P | Pass on ordinary category. |
| 9.1 Hom-rank formula | M=E₅ lattice; N=M or M² | eigenvalue coincidence counts2,4; integral intertwiner ranks2,4 | Pass; multiplicity matters. |
| 9.2 Deligne equivalence ordinary condition | q=5 ordinary lattice; q=4 rank-one example | unit-root counts1 of2 versus0 of1 | Source's ordinary condition excludes rank-one example. |
| 9.2 CM type convention | ordinary conjugate roots | valuations (0,1): README selects index0, source selects index1 | Opposite CM types; R07 requires consistent sign. |
| 9.3 Prime-field exclusion | q=2, ±√2 versus ±i√2 | real minimal polynomial T²−2 excluded; T²+2 accepted with slopes½,½ | Supports unpolarized theorem; positivity still missing (R19). |
| 9.3 Hom action direction | f:E²→E a projection | repaired F(f)=(π,0) on both sides | R21. |
| 9.4 Class-size dictionary | E₅; E₂ | #ICM=2 and1; class-size2 and1 | Pass in ordinary/prime-field hypotheses. |
| 9.5 Point groups | E₅ lattices; q=3 quartic | groups ℤ/4,(ℤ/2)² and ℤ/12,ℤ/2×ℤ/6; orders4,4,12,12=P(1) | Kernel/point-group formula passes controls. |
| 9.5 Whole-torsion negative control | ordinary elliptic, p=5 | geometric p-torsion size5 versus size25 in T⊗ℚ/ℤ | Only the F−1 kernels are identified; whole-torsion identification would be false. |
| 9.6 Quaternion case | q=9,π=−3 | E(K) order16, quaternion O/(π−1)O order256 | R11. |
| 10.1 Positivity / principal degree | ℚ(i), I=ℤ[i],λ=i/2 | λI=Īᵗ, index1; original b(i,1)=−1, repaired b(i,1)=+1 | R07. |
| 10.1 Prime-field positivity | q=2,P=T²+2 | Φ from units has cardinal0 rather than1; λ and−λ both pass vacuous test | R19. |
| 10.2 Principal polarizability | elliptic E₂; simple ordinary q2,a=−1,b=−1 | elliptic canonical degree1; a²−b=2=q, exceptional (i) true | Principal polarizable true / false respectively. |
| 10.3 Surface trichotomy | Res over 𝔽₄ of trace3 elliptic curve | P=T⁴−3T²+4, principal degree1; splits over degree2, not over base | Restriction case differs from split product. |
| 10.4 Ordinary HNR exceptions | (q,a,b)=(2,−1,−1),(2,0,−3),(3,0,−4) | (i),(ii),(iii) respectively true; Jacobian flags false,false,false; principal flags false,true,true | Matches sampled source table. General proof missing R16. |
| 10.5 Resultant obstruction | h₁=1,h₂=x−2; x−2,x−1 | resultant1 in both; dimensions (0,1) versus(1,1) | First has Jacobian; add positive degrees (R13). |
| 10.6 Curve-count finiteness | genus0 over 𝔽₅; genus2 presentation | #genus0 curves=1; tricanonical degree6 in ℙ⁴ | Boundary passes; missing bounded-model input R17. |
| 11.1 Prefix / reconstruction | E₅; q2 quartic | (1,5,[−2]) gives L=1−2T+5T²; (2,2,[−3,5]) gives tail−6T³+4T⁴ | Injectivity adapter passes controls. |
| 11.2 Distinct meanings of count | E₅ class | size of isomorphism-class set2; order of each point group4 | These are different columns; not interchangeable. |

**Recomputed worked point-count rows.** Newton sums and the elementary symmetric identities were evaluated with exact integer arithmetic, including the polynomial of each root power. All **24 abelian counts and 24 virtual curve counts** in these six four-term rows agree with the README. This calculation does not certify the asserted exhaustive enumeration of curves or the Sage calculations of all ideal classes.

| Polynomial and q | Pᵣ(1), r=1…4 | qʳ+1−Σαʳ, r=1…4 | Additional powered-polynomial check |
|---|---|---|---|
| T²−2T+2, q=2 | 1,5,13,25 | 1,5,13,25 | P₄=(T+4)² |
| T²−2T+5, q=5 | 4,32,148,640 | 4,32,148,640 | P₂=T²+6T+25 |
| T⁴−3T³+5T²−6T+4, q=2 | 1,19,76,171 | 0,6,9,10 | P₆=T⁴+22T³+249T²+1408T+4096=(T²+11T+64)² |
| T⁴+T³−2T²+3T+9, q=3 | 12,48,1296,7104 | 5,5,44,89 | P₃=T⁴+16T³+118T²+432T+729=(T²+8T+27)² |
| (T²−2)², q=2 | 1,1,49,81 | 3,−3,9,1 | P₂=(T−2)⁴ |
| (T−2)², q=4 | 1,9,49,225 | 1,9,49,225 | P₂=(T−4)² |

**Computed adversarial pass — all 59 named Lean declarations.** Below R=ℤ[2i], O=ℤ[i], E=ℚ(i), and M is the q=5 module (R, multiplication by 1+2i), unless stated otherwise. This separates ordinary definitions from admitted facts: a correct definition can feed a false theorem. It also tests the total-function conventions at rank zero and infinite-index inputs.

| Declaration | Instance / computed values | Result; change |
|---|---|---|
| IsIsogenous | [2]:E₅→E₅, finite kernel rank4 and surjective; identity degree1 | Relation true; native isogeny convention. |
| isIsogenous_refl | identity on zero variety: degree1, relation true | Boundary/API; R22. |
| IsIsogenous.symm | [2] with quasi-inverse [2], composite[4], degrees4·4=16 | Both directions true. |
| IsIsogenous.trans | [2] then[3], composite[6], degrees4·9=36 | True API; R22. |
| isogenyClassSetoid | E₅ and its second lattice model: relation true; q5 trace−2 class: relation false | Equivalence classes separate different P. |
| IsogenyClass | two E₅ lattice models give one quotient point; two trace±2 classes give two | Quotient is by isogeny, not isomorphism. |
| IsIsogenous.dim_eq | two E₅ members:1=1; zero variety:0=0 | Pass instances. |
| IsIsogenous.baseChange | [2] after finite extension: degree4=4 | Single-exact probe passed; delete padding R22. |
| IsOrder | R full rank2 true; ℤ⊂E rank1 false | Full span discriminates. |
| maximalOrder | E=ℚ(i):O; E=ℚ²:ℤ² | Componentwise integral closure. |
| isOrder_maximalOrder | O rank2 and ℤ² rank2; zero algebra rank0 | All span their respective E; reduced hypothesis retained. |
| IsOrder.le_maximalOrder | R⊂O, index2; maximal case index1 | Both containments true. |
| index | index(R)=2,index(O)=1; diagonal ℤ⊂ℚ² gives infinite quotient, Nat.card=0 | Junk value exists outside IsOrder. |
| index_pos | R:0<2; O:0<1; zero algebra:0<1 | Pass with order/reduced hypotheses. |
| index_eq_one_iff | R:2≠1 and R≠O; O:1=1 and O=O | Both directions tested. |
| finite_overorders | R has exactly2; O exactly1; zero algebra exactly1 | Pass instances. |
| numberFieldOrder_isOrder | order R has ℤ-rank2 and ℚ-span dimension2 | API comparison; R22. |
| IsFractionalIdeal | O as R-module true (rank2); zero submodule false (rank0<2) | Nonzero/full rank is not automatic for arbitrary submodules. |
| colon | (R:O)=2O; (O:R)=O; (R:0)=E | Correct total definition; last is not a fractional lattice. |
| multiplierRing | (R:R)=R; (O:O)=O; (0:0)=E | Correct definition; full-lattice assumptions needed in theorems. |
| conductor | (R:O)=2O, O/2O has4 elements; conductor(O)=O | Pass. |
| IsInvertible | R(R:R)=R true; O(R:O)=2O≠R false | Distinguishes proper and nonproper ideal. |
| WeakEquiv | R and2R globally iso, hence locally iso; R andO not iso at2 | True/false controls. |
| weakEquiv_iff_one_mem | diagonal Λ⊂ℚ² example: true versus 1∉2ℤ² | False without IsOrder; R04. |
| WeakEquiv.multiplierRing_eq | same example: ℤ²≠parity order despite abstract Λ-isomorphism | False; R04. |
| traceDual | Rᵗ=½ℤ+(i/4)ℤ; Oᵗ=½O; dual numbers give ½ℤ+ℚε | Definition evaluates; reducedness needed for lattice claim. |
| IsGorenstein | R true via (i/4)R; dual-number order false since product=ℤε | Trace-based definition discriminates; R05 theorem. |
| IsBass | R has2 overorders, both Gorenstein; zero algebra has1, Gorenstein | True in both; zero-type caveat R06. |
| isGorenstein_iff_forall_invertible | dual-number example: left false, right true | R05. |
| cmType | O at(1+i):dim𝔽₂(Oᵗ/𝔪Oᵗ)=1 | Native tensor quotient has required value. |
| cmTypeSup | O:1; zero algebra:empty supremum0 | Empty-index convention matters. |
| isGorenstein_iff_cmTypeSup_eq_one | zero algebra:true ↔ (0=1), false equivalence | R06. |
| InvertibleIdeal | R accepted, O over R rejected because O·2O≠R | Real fields, not free Prop stand-ins. |
| picSetoid | R and2R equivalent via unit2∈E×; inverse unit½ | Symmetry witnessed by inverse, not an integral unit restriction. |
| Pic | R has class number1; R and2R represent same point | Quotient cardinal1. |
| finite_pic | R:card1; E=ℚ²,Λ=ℤ²:card1 | Finite reduced test cases pass. |
| verschiebungOf | q5,π=1+2i gives1−2i; q0 gives0 | Real body, no division by a nonunit; π is a unit. |
| frobeniusOrder | q5 givesR; q2,π=1+i givesO | Different indices2,1. |
| isOrder_frobeniusOrder | E₅:π,V integral, generated ℚ-algebra dimension2; q2:dimension2 | Conclusion full rank2. |
| zfvIndex | E₅:2; E₂:1 | Definition agrees with index. |
| zfvIsMaximal | E₅:false; E₂:true | Distinguishes the two orders. |
| zfvIsBass | E₅:true (2 quadratic overorders); E₂:true (1) | Correct sample values. |
| maxCohenMacaulayType | E₅:max{1,1}=1; zero algebra:max{0}=0 | Total definition includes zero. |
| zfvRelDiscNorm | E₅:norm(4i)=16; E₂:norm(2i)=4 | Absolute norm convention passes. |
| zfvIsBass_iff_maxCohenMacaulayType_eq_one | zero algebra, unique π-unit:true ↔ (0=1) | R06. |
| IsZfvConductorSum | E₅,S=R:R+2O=R; S=O:R+O=O | Both true; conjunction with overorder hypothesis is a separate API condition. |
| DeligneModule | (ℤ,2),q4:semisimple, norm2=√4,4ℤ⊂2ℤ; q2 norm2≠√2 | Definition admits rank1 at q4; R01. |
| charpoly | M:T²−2T+5; rank-one q4:T−2; zero module:1 | Degrees2,1,0. |
| even_finrank | rank-one q4:Even1=false; M:Even2=true | False general theorem; R01. |
| dim | ranks0,1,2 give natural quotients0,0,1 | Floor division hides rank-one defect. |
| charpoly_symmetric | M,j0:1 versus25; corrected formula5=5 | False; R02. |
| IsOrdinary | M,p5:5∤−2 true; q2,π=1+i:2∤−2 false | Matches ordinary criterion on valid even-rank instances. |
| Hom | id commutes with F; conjugation C satisfies CF=VC and V≠F | id accepted; conjugation rejected as F-intertwiner. |
| Hom.IsIsogeny | multiplication2 on M:injective,cokernel size4; zero map:kernel rank2 | True/false discrimination. |
| homSubmodule | M→M integral commutant rank2; M→M² rank4 | Additive closure and expected ranks. |
| finrank_hom_eq | M→M:2=1²+1²; scalar rank-one q4:1=1; zero source:0=0 | Pass degenerate and repeated-eigenvalue controls. |
| pointsGroup | M:cokernel Smith(1,4), groupℤ/4; zero module:trivial | Definition gives orders4,1. |
| finite_pointsGroup | q5:M gives4 elements; q1,F=id onℤ givesℤ, infinite | hq excludes necessary failure. |
| card_pointsGroup | M:4=abs(P(1))=4; rank-one q4:1=abs(−1); zero module:1=abs1 | Absolute value is necessary on the broader carrier. |

## Not verifiable

- **Unobtained books/paper:** `mumford1974`, Abelian Varieties, §16; `weil1957`, Zum Beweis des Torellischen Satzes, pp. 33–53; `reiner1975`, Maximal Orders, §26. The sources service's bibliographic lookups returned no readable legal text. Their original arguments for §10.3 and Jordan–Zassenhaus were not certified. The failed requests are retained in `needs-references.toml`; the review is not parked.
- **Uncertified/paywalled:** `tate1966`, Theorems 1–2, and `neukirch1999`, I §12. The service resolved these to paywalled material. Their locators are retained without pretending to have read the text; no new request is made for these settled uncertified sources. Available Milne/Waterhouse text and supplier contracts were checked where applicable.
- **Browser challenges:** 34 named LMFDB knowls returned a verification page, not their mathematical text. Under `av.fq`, these were conductor, conjugate_stable, curve_point_counts, cyclic_group_points, endomorphism_ring_notation, frobenius_angles, frobenius_angles_correctness, galois_group, group_structure, honda_tate, index_of_order, is_zconductor_sum, is_zfvconductor_sum, jacobian, max_cohen_macaulay_type, newton_elevation, noncyclic_primes, number_field, one_rational_point, order, ordinary, p_rank, picard_group, singular_dimensions, singular_primes, supersingular, weak_equivalence_class, weil_polynomial, zfv_real_index and zfv_rel_disc_norm; additionally av.geometrically_squarefree, av.princ_polarizable, av.squarefree and av.twist. Each was attempted at its named LMFDB knowledge URL through the service and is listed under its existing `lmfdb-<knowl>` key. No challenge was bypassed.
- **Readable web data have narrower evidentiary scope:** eight other knowls, including the label knowl, were readable. The four named LMFDB source files were fetched legally; inspected column definitions include those visible, for example, at `lmfdb-code-main` lines 695–721. Neither these files nor the polynomial checks certify database completeness, all stored arithmetic invariants, or the claimed exhaustive genus-2 curve totals 20/50/115. No such exhaustive computation was rerun.
- **Version/ownership limits:** printed versus arXiv pagination for Centeleghe–Stix, HNR and Marseglia is not silently identified; exact published locators still need R23. Ownership against supplied sibling files was checked; additional open heads without a supplied checkout, including the ArithmeticStatisticsPartII search lead, were not certified. The source sample showed no copied passages in the statements checked; unavailable sources cannot be compared for copying.

## Source issues

- **Error** in milneAV at I, Remark 7.4, printed p. 34: the source says p-torsion splits as étale, multiplicative and a power of α_p; it should be a possibly nonsplit local-local group scheme, with supersingular elliptic p-torsion not α_p²; affects a stated result.
- **Error** in milneAV at I, Theorem 7.2, printed p. 33: the source says multiplication by n is étale exactly when p does not divide n; it should be qualified by positive dimension, since every multiplication map on the zero abelian variety is identity; affects a stated result.
- **Error** in lmfdb-av.fq.class_number_1 at the classification paragraph, unpaginated, line 90: the source says there are exactly eight finite-field curve classes with trivial class group; it should be restricted to positive genus, since ℙ¹ over every finite field has class number one; affects a stated result.
- **Misprint** in lmfdb-av.fq.class_number_1 at the classification paragraph, unpaginated, line 90: the source says the Leitzel–Madan–Queen DOI begins 0.1016; it should be 10.1016/0022-314X(75)90004-9; affects nothing.
