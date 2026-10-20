<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/39#issuecomment-6304240131 -->
Review (codex) of e76d3ea

Verdict: needs_changes

1. **F01** (P1) Six indispensable supplier interfaces remain unowned by actual targets

   **Location:** `packages/QWittVectors/design/README.md:70`: “Source citations identify the mathematics; they do not identify a supplier target.” See lines 72–82 and the `gaps` array in `packages/QWittVectors/design/plan.json:3132`.

   **Claim:** The build can consume the six interfaces described in these paragraphs. They are necessary premises for the advertised endpoints, even though the prose now honestly calls them requirements.

   **Witness:** Three supplier entries have empty section lists. No supplied text exists for those roadmaps or the two proposed Part II roadmaps. DerivedModuleAlgebra §§1.5/1.8 and DGAInfinity Layer 1 do not contain the residual interfaces.

   The witness can be checked by inspecting the supplier array in `packages/QWittVectors/design/plan.json:3057`, searching roadmap filenames on main and in `packages`, and reading these short supplier sections:

   | Requirement | Consumer targets | Actual ownership evidence |
   | --- | --- | --- |
   | `gap:cyclotomic-contract` | 3.3, 3.4, 3.6, 6.2, 7.5, 9.3, 9.7, 10.1 | HabiroCyclotomicCompletions is in the order, but has no inspectable roadmap section in the supplied main repository or packages. The two imported Mathlib product identities do not supply the whole integral ideal/intersection package. |
   | `gap:ordinary-derham` | 7.1, 7.7, 8.4, 9.6, 9.7 | DerivedDeRhamCohomology has no supplied section text. Kähler basis transport does not construct the exterior DGA, its étale extension or relative Cartier comparison. |
   | `gap:cohomology-completion` | 9.5 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1808` treats quotient towers and a Noetherian finite-cohomology comparison; line 2006 treats complete Tor amplitude. Neither supplies Wagner 4.25 under its unbounded, degreewise hypotheses. No DerivedModuleAlgebra Part II is supplied. |
   | `gap:prismatic-frobenius` | 9.6, 9.7 | PrismaticCohomology has no supplied section text. The new PD-presentation/Poincaré requirement is also substantial; wagner lines 3492–3517 describe its mathematical use but cannot supply roadmap ownership. |
   | `gap:dga-bockstein` | 9.4 | `TauCetiRoadmap/DGAInfinity/README.md:293` supplies associative DG carriers and cohomology, not the regular-parameter multiplicative Bockstein/change-of-parameter theorem. No DGAInfinity Part II is supplied. |
   | `gap:dga-quotient` | 7.2 | The same Layer 1 has no differential-ideal quotient or generated differential-ideal target. The DG-category quotient in Layer 7 is a different construction. |

   **Exact repair:** Obtain actual earlier supplier sections/targets for all six residual interfaces, retaining the hypotheses and generality now written. Put the generic extensions of DerivedModuleAlgebra and DGAInfinity in actual Part II roadmaps with explicit base-roadmap boundaries. Then replace each `gap:` dependency with its exact supplier citation in both artifacts. Import pinned primitives directly and reserve only the residual theory for the supplier. Do not delete the general smooth comparison, assume these interfaces without ownership, or re-plan the generic suppliers inside QWittVectors. Closing this finding requires coordination outside the design fix worker's allowed files.

2. **F02** (P2) The dependency order still cannot certify this roadmap

   **Location:** `packages/QWittVectors/design/plan.json:2`: “QWittVectors”; the required registration is absent from `merge-order/ORDER.txt`.

   **Claim:** This design has a certifiable supply position and is ready to advance with the advertised supplier graph.

   **Witness:** The design diagnostic returns `NOT IN ORDER: QWittVectors (insert it after its last supplier)`, exit 1. The prescribed package invocation also exits 1 because `packages/QWittVectors/README.md` does not exist.

   **Exact repair:** Have the merge-order owner register QWittVectors after all actual suppliers, including the Part II suppliers needed for R01, and before its consumers. Neither this reviewer nor the design fix worker may edit the protected order. Rerun the design diagnostic, then the prescribed package gate when the package README is materialized. Record successful output rather than interpreting the absence of UPWARD/CYCLE lines in a failed check as success.

3. **F03** (P3) Several construction Checks still do not distinguish implementations

   **Location:** `packages/QWittVectors/design/README.md:498`: “Replacing A[q]-linearity by ψ-semi-linearity would give the wrong relative category”; also the Check lists at lines 794–798 and 974–976, with identical texts in the plan.

   **Claim:** Every construction/definition has three discriminating tests, rather than three bullets.

   **Witness:** Section 4.2 gives no scalar with different values. Section 7.5's Bézout bullet repeats a uniqueness argument and F₁=id repeats the definition. Section 9.4 tests β₁(T)=dT twice.

   **Exact repair:** Keep the repaired Checks from the previous round and strengthen these remaining lists in both artifacts. Concrete replacements that can be verified directly are:

   - In 4.2 take A=R=ℤ[T] with toric Λ-structure, m=2,d=1: F₂(T)=T in the right scalar copy, whereas a ψ₂-semilinear substitute gives T².
   - In 7.5 add θ₂(V₂(T))=dT and θ₂(τ₂(T)²)=2T³dT over R=ℤ[T]. The second uses F₂(τ₂T)=T² and distinguishes an ordinary derivation from the specified semilinear one. Retain m=1 as an additional boundary check.
   - In 9.4 replace the repeated β₁ test by m=2: d_H(T²)=(q²−1)T dT, hence β₂([T²])=[T dT], which is nonzero (specialization q=1 detects it). This tests a nontrivial parameter rather than repeating the h case.

   Audit the other lists by the same criterion. At the Lean stage, group statable checks into at most two proved examples per kept definition, as the brief requires; no Lean verification is claimed here.

Reviewed on 2026-10-20 by `independent-review-REV-DESIGN-QWittVectors~2`. Three findings remain, two blocking. The mathematical scope is repairable; rejection is not warranted. The design README, plan and sources manifest were not changed.

## Previous findings checked first

The following assessment compares the previous review and repair report with the actual revised artifacts. Quotations are from the revised design, not from the repair report. “Repaired” here concerns the previous finding; it does not certify unavailable Lean examples.

| Previous finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| R01: reversed tensor balancing | Repaired in the design | `packages/QWittVectors/design/README.md:532`: “gh_1(s_m(a))=a⊗1=1⊗ψ_m(a)”. For A=R=ℤ[T], m=2, the identification r⊗b↦ψ₂(r)b sends both sides to T². The rejected formula would equate T⁴ and T. The plan contains the same correction. |
| R02: five missing supplier contracts | Not repaired | `packages/QWittVectors/design/README.md:70`: “Source citations identify the mathematics; they do not identify a supplier target.” Lines 72–80 still contain all five requirements. The three absent roadmaps and two absent Part II contracts remain unavailable; the new quotient requirement makes six. See current R01. |
| R03: route-specific narrowing | Repaired mathematically | `packages/QWittVectors/design/README.md:1012`: “every smooth A-algebra R, every prime p and every positive integer m=p^αn”. Section 9.7 now gives the full derived, multiplicative, functorial comparison, with ψ_(p^αd) and Φ_d(q^(p^α)). Line 76 says “arbitrary, possibly unbounded” for the cochain completion input. Both agree with wagner lines 2692–2702 and 3198–3209. Ownership remains current R01. |
| R04: uncertified merge position | Not repaired operationally | `packages/QWittVectors/design/README.md:1083`: “Their constructions supply no prerequisites to QWittVectors.” The inaccurate position assertion is gone, but QWittVectors is still absent from `merge-order/ORDER.txt`; both gate invocations fail. See current R02. |
| R05: overclaimed DGA supplier | Partly repaired | `packages/QWittVectors/design/README.md:48`: “associative nonunital, unital and augmented DG algebras”. Section 7.1 now explicitly imposes graded commutativity and odd-square vanishing. The quotient is still an unsupplied extension at line 82, rather than an actual DGAInfinity Part II target. See current R01. |
| R06: three particular deficient Checks | Repaired at the cited locations | `packages/QWittVectors/design/README.md:516`: “sends them to ε and 0”; line 763: “nonzero form T²dT and zero”; line 404: “with a≥1”. The detecting map is multiplicative: odd-exponent coefficients are even, and cross terms contributing to TX are divisible by four. The F₃ calculation and prime-power boundary are correct. Other residual Check defects are current R03. |
| R07: pagination and manifest omission | Repaired | `packages/QWittVectors/design/README.md:144`: “printed hesselholt v3 pp. 8–9”. Every target now has versioned printed pagination. `packages/QWittVectors/sources.toml:65` records Remark 2.27, and line 74 includes §2.3 in `cited_for`. Its perfection analogy is distinguished from the multi-prime construction. |
| R08: process commentary | Partly repaired | `packages/QWittVectors/design/README.md:23`: “the values are computed in the Checks below”. The checkout instructions, unavailable Lean-witness claim and consumer audit labels are gone. Ordinary subsection titles replace the mechanical split titles. The old request to replace supplier gaps by actual contracts remains unresolved under current R01. |

## Verified sound

I read all **52 targets**, their **162 public API claims**, all **156 Check bullets**, the conventions and all six required-interface paragraphs. The plan and README agree literally on every target statement, proof sketch, API statement and Check text. All internal target/gap references resolve. All 52 `*Needs:*` lines were read; the target dependency graph has no forward or self edge. There are ten layers, ten Examples subsections and ten Dependencies subsections. All 28 definition/construction targets have named APIs and three Check bullets; R03 qualifies the discriminating quality of those bullets.

The all-prime, arbitrary relative-base, nonunital absolute and arbitrary-universe scope is retained. Section 9.7 fixes the previous proof-route narrowing. No new false headline was found in the substitutions below. No replacement of an existing roadmap, computational-algorithm deliverable, good-primes restriction, copied source passage or reverse consumer dependency was found. No fetched instruction was followed. There is no Suggested.lean in this package, so there is no sorry'd data or `set_option` to inspect, and no claim of successful elaboration.

The house shape was compared with `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, `TauCetiRoadmap/DGAInfinity/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` on main at `0e8b058a97cc4f9401d2679313e0e937761c1024`. The design has the requested title, Summary, scope, conventions, supplier contracts, reading guide, layers, consumers and references. No LaTeX delimiters, target-number tables, Hypotheses/API/Tests field lists or forbidden workflow narrative were found. Missing external contracts remain substantive defects, not a style repair.

### Seeded source verification

All **15 seeded targets** were checked against the legally cached text, including theorem/section number, printed page and mathematical hypotheses. No locator is explicitly flagged unverified or uncertified in the revised README or plan. All eight manifest records are readable; no new source or manifest mutation was necessary. Printed pages below are distinct from the extraction's page markers. Source references are locators, not reproduced passages.

| Seeded target | Locator checked | Result |
| --- | --- | --- |
| 1.7 Koszul complexes of commuting endomorphisms | wagner lines 603–619, Remark 2.16, pp. 13–14; lines 2847–2857, §4.7, p. 57 | The source supplies both applications of commuting-endomorphism Koszul complexes. The general functorial bridge and its flat cohomology base change are elementary targets here, not a verbatim numbered theorem in Wagner. The scalar supplier is a chain complex; the stated cochain dual convention gives the displayed sign. |
| 2.4 Perfectly covered Λ-rings | wagner lines 1621–1643, Remark 2.47 and footnote, p. 32; wagner-habiro lines 493–498, §1.22(e), p. 12; bhatt-scholze lines 778–803, Lemma 2.28, p. 20 | The three coverage conditions, free/toric examples and torsion conclusion agree. For the δ torsion argument one can localize at p; no claim about an arbitrary Frobenius lift on a torsion ring is substituted for a Λ-coaction. |
| 3.1 Absolute q-FV systems | wagner lines 475–481 and 546–549, Definition 2.8 and Remark 2.12, pp. 11–12 | Nonunital coefficients, structural compatibility and the two distinct FV/VF identities agree. |
| 3.2 Absolute q-Witt rings | wagner lines 483–549, Lemma 2.9, Definition 2.10 and Remark 2.12, pp. 11–12 | Both ideal-generator families, initiality and divisor-closed truncations agree; q=1 is not falsely identified with ordinary Witt restriction. |
| 3.3 Absolute ghosts | wagner lines 552–580, §2.13, pp. 12–13 | First ghost means d=m; proper V-images are killed and τ_m(r) maps to r^(m/d). The m=1 exception is handled directly. |
| 3.6 Absolute completion | wagner lines 1083–1190, Corollaries 2.24/2.26 and Lemma 2.27, pp. 21–23 | Discrete derived p-completion and bounded p-primary torsion remain separate hypotheses. Every positive m,n and nonunital R are included. |
| 3.7 Witt injectivity and exactness | wagner lines 1194–1311, Proposition 2.28, Corollary 2.29 and Lemma 2.30, pp. 23–26 | Injection and additive exactness have arbitrary commutative inputs. The kernel is nonunital; the p-local product uses q↦q^d and separates the prime-to-p part. |
| 4.1 Λ-ring comparisons | wagner lines 1348–1468, Lemmas 2.33–2.34, Corollary 2.35, Proposition 2.36 and Corollary 2.37, pp. 27–29 | c_ms_m=ψ_m; the image description assumes injective Adams operations; perfectness gives isomorphisms. No unrestricted equivalence is asserted. |
| 5.2 Étale ghost pushouts | wagner lines 1715–1730, Corollary 2.51, p. 34 | The general Λ-base, étale changed factor, right twist and derived pushout agree. No flatness of the first ghost itself is assumed. |
| 5.4 Finite type | wagner lines 1485–1495, Corollary 2.39, p. 29; lines 1588–1620, Lemma 2.46 proof, pp. 31–32 | Finite type over ℤ is retained for Noetherianity; finitely many polynomial variables give finiteness over the comparison image. Colimit/presentation assertions have no extraneous finite-type hypothesis. |
| 6.3 Completed ghost Frobenius | wagner-habiro lines 647–658, §2.7, pp. 15–16; lines 679–723, Theorem 2.9 proof, pp. 16–17 | The standing étale and perfectly covered hypotheses are retained. The map is r⊗a↦r^p⊗a modulo p and fixes q; pd divides m, with no restriction p∤d. |
| 7.5 Positive-degree Frobenius | wagner lines 2053–2097, Proposition 3.17 and §3.20, pp. 42–43; lines 2159–2207 and 2524–2549, §§3.23–3.30, pp. 44–50; langer-zink lines 453–525, Proposition 1.3, pp. 14–16 | The semilinear derivation, θ_pV_p=d and coprime equations agree. Langer–Zink supplies the PD calculation used by the adaptation, not a theorem already about q-Witt rings. The V-only input is available before positive-degree F. |
| 9.2 Framed Frobenius decomposition | wagner lines 2892–2972, §§4.10–4.12, pp. 58–60 | Perfect coverage and a finite étale frame are retained. Rank p^(αr), the v_j=0 one-form convention and reduction before the scalar two-term description agree. |
| 9.7 Functorial smooth de Rham comparison | wagner lines 2692–2702, Proposition 4.2, p. 54; lines 3492–3583, §§4.34–4.35 and comparison proof, pp. 71–73; lines 3644–3697, Lemma 4.36 and proof of Proposition 4.2, pp. 74–75 | Full smooth functorial E∞ comparison agrees, including ψ_(p^αd), Φ_d(q^(p^α)), derived A-tensor and p-completion. The intermediate ordinary tensor can be rewritten over C_α; flatness is asserted over C_α, avoiding spurious Tor over A[q]. R01 concerns availability of its inputs, not this formula. |
| 10.2 Bounded difference torsion and completion | wagner lines 2810–2822, Lemma 4.6, p. 56 | Smoothness and perfect coverage are retained. Bounds are degreewise at fixed m; no Noetherian base or globally uniform bound is imposed. Finite presentation and a finite local cover justify a common bound for fixed R. |

Additional checks read the repaired first-ghost construction at wagner lines 1565–1582, the V-only differential/PD calculation at wagner lines 1849–1874 and langer-zink lines 601–645, the differential-Frobenius relation at wagner lines 1893–1929, the completion hypotheses at wagner lines 3198–3227, and the canonical-presentation argument at wagner lines 3492–3539. In particular, the design does not repeat the ill-typed differential-Frobenius display in the source.

### Adversarial mathematics pass

Each row includes the target's definition/headline, public identities, exact hypotheses, proof dependencies and Checks. “Pass” means no defect in the indicated boundary calculations and interface checks; it is not a formal proof. R01 applies wherever an unsupplied prerequisite is consumed. Rank, characteristic, zero-ring and empty-index tests are relevant here; compact/noncompact groups, induction normalizations and real periods are not objects of these statements. Arbitrary bases were not replaced by ℤ_p or unramified DVRs.

| Statement | Instances tried | Result | Change required |
| --- | --- | --- | --- |
| Conventions | [0]_q; q=1; d=m=2; two cochain coordinates; p=2 | Polynomial sums avoid 0/0; balancing gives T²; d¹(a,b)=D₁b−D₂a and β_h(T)=dT fix signs | None |
| 1.1 TruncationSet and API | ∅, {1}, {2}, Div(6) | {2} fails divisor closure; w₆=x₁⁶+2x₂³+3x₃²+6x₆; empty product is singleton | None |
| 1.2 ghost image and API | ℤ, ℚ, 𝔽₂; S=∅ | Congruence is b₂≡b₁ mod 2 over ℤ; (0,1) has zero ghosts over 𝔽₂; unit triangular inversion works | None |
| 1.3 BigWitt and API | R=0; empty S; square-zero nonunital ring; τ(1)+τ(1) | Coordinates are (2,−1), with correct zero and unitization behavior | None |
| 1.4 F,V,τ and API | n=1,2; a=2,b=3; a=b=2; τ(−1) | F₂V₂=2; gcd factor is necessary; shifted domains agree; τ(−1)=−τ(1)+V₂τ(1) | None |
| 1.5 p-typical comparison | a=0,1,2; p=2,3 | Length is a+1; final ghosts x₀⁴+2x₁²+4x₂ and x₀⁹+3x₁³+9x₂ agree | None |
| 1.6 étale Witt base change | S=∅,{1}; identity; coprime 2,3; finite/infinite S | Finite-presentation assertion keeps finite S; coprime product has four coordinates | None |
| 1.7 commuting Koszul and API | r=0,1,2; M=0; E₁₂,E₂₁ on ℤ² | Noncommuting pair gives d²(u₁)=u₁⊗(e₁∧e₂), hence nonzero; commuting pair cancels; flatness only for cohomology base change | None |
| 1.8 arithmetic fracture | N=1,2; M=0,ℤ,ℤ[1/2]; unbounded M | N=1 gives identity; ℤ→ℤ₂ lies over ℤ[1/2]→ℚ₂; completion alone loses ℤ[1/2] | None |
| 2.1 arithmetic Λ-ring and API | ℤ; toric ℤ[T]; attempted identity Adams on 𝔽₂ | ψ₂(2)=2; ψ₂(T)=T²; Adams congruences alone lose the δ₂(2)=−1 obstruction | None |
| 2.2 prime sets and API | P=∅,{2}; no free generators | Identity comonad, infinite 2-typical carrier, and free ring ℤ have the stated boundaries | None |
| 2.3 perfection and API | ℤ; toric ℤ[T]; already perfect A | Rational nonnegative monomial exponents allow inverse Adams; T has no inverse image before perfection | None |
| 2.4 perfect coverage and API | A=0,ℤ,ℤ[T],ℤ[ε]/ε² with ψ_nε=nε | Toric ψ₂ has basis 1,T; dual-number ψ₂ is not flat modulo 2; torsion-freeness alone is insufficient | None |
| 2.5 relative perfection and API | R=A nonperfect; ℤ[T]/ℤ; n=1,2 | Base linearization is invertible; polynomial algebra over ℤ is not relatively perfect; tensor direction agrees | None |
| 3.1 AbsoluteFVSystem and API | R=ℤ,0; m=1,2 | Polynomial system satisfies both composites; V₂=2 fails VF=1+q | None |
| 3.2 absolute q-Witt and API | R=0,ℤ; m=1,2; q=1 | Q₁=R; V₂(1)=1+q, F₂V₂(1)=2; q=1 does not give ordinary Witt restriction | None |
| 3.3 absolute ghosts and API | m=1,2,6; n=2,3 Verschiebung | q=−1 kills V₂; surviving ghosts have coefficient n; proper V-images vanish in first ghost | None |
| 3.4 V-resolution and API | m=1,2,6; a=0,1 | Q₁→Q₃⊕Q₂→Q₆ gives −V₂V₃+V₃V₂=0; a=0 is now separated | None |
| 3.5 localization/torsion and API | ℤ versus 𝔽₂, m=2; m=1 | V₂(1) is nonzero with zero ghosts in characteristic 2; joint injectivity needs the stated torsion condition | None |
| 3.6 completion and API | m=1; m=2 over ℤ; zero/unit acting ideals | Completion for a zero parameter is identity; unit ideal gives zero; discreteness is not bounded torsion | None |
| 3.7 Witt injection/exactness and API | R=0,𝔽₂; square-zero kernel; m=1,2,6 | Nonunital kernel is essential; V₂ survives in characteristic 2; p-local decomposition has the correct twists | None |
| 4.1 Λ comparisons and API | ℤ; ℤ[T]; m=1,2 | c₂ misses T in the toric case; c_ms_m=ψ_m, not generally identity | None |
| 4.2 RelativeFVSystem and API | R=A,0; toric T; m=1,2 | Right scalar T is fixed by F₂, not squared | R03: make this a computed Check |
| 4.3 relative construction and API | R=A,0; ℤ[T,X]/ℤ[T]; m=2 | Half-TX coefficient gives ε versus zero before quotient; cross product terms are multiples of four | None |
| 4.4 relative ghosts and API | d=m=2 over toric ℤ[T]; m=1; A=ℤ | Repaired tensor equality evaluates to T²; reversed equality gives T⁴=T | None |
| 4.5 base change and API | A′=A,0; toric polynomial m=2 | Ordinary base change needs a Λ-map, not flatness; right scalar action is preserved | None |
| 4.6 perfect-cover comparison and API | R=A; ℤ[T]/ℤ; torsion R/ℤ | Existence, perfect coverage and relative perfection are separated correctly | None |
| 5.1 étale preservation and API | Identity; m=1; quotient by a nonregular element | Étale factor supplies flatness; arbitrary quotient does not | None |
| 5.2 ghost pushout and API | d=m=1; R=A; nonflat quotient | Derived pushout uses the changed étale factor; ghost itself need not be flat | None |
| 5.3 relative completion and API | A=ℤ; R=A; p invertible; torsion R | Completed scalar extension is used; no ordinary tensor/limit interchange is assumed | None |
| 5.4 finite type and API | r=0,1; m=2; infinitely many variables | Rank m at r=0; 1,T span the toric extension; infinite variables give no Noetherian claim | None |
| 6.1 completed étale Frobenius and API | R=A,0,ℤ×ℤ; p invertible; ℤ[T]/ℤ | Zero completions allowed; polynomial T has no Frobenius preimage modulo p, excluding smooth-for-étale replacement | None |
| 6.2 cyclotomic overlap and API | p=2,d=1,2; p=3,d=1 | Φ₄ mod 2=(q−1)²; Φ₃ mod 3=(q−1)²; equal radicals do not mean equal ideals | None |
| 6.3 completed ghost Frobenius and API | m=p,d=1; p divides d; A=R=ℤ | Teichmüller paths give r^(m/d); q remains fixed, including p=2 | None |
| 7.1 DifferentialVSystem and API | Exterior Ω; 𝔽₂[u], degree(u)=1; even generator; ideal (T) | Strict odd alternation excludes u²≠0; even squares are unrestricted; (T) is not d-stable | None |
| 7.2 initial differential system and API | R=A,0,A[T]; m=1,2; p=2 | Positive-degree relations preserve degree zero; d(T²)=2T dT, dT²=0 | None beyond R01 |
| 7.3 DifferentialFVSystem and API | p=2,3; τ_pT; reduction modulo 3 | F₃dτ₃T=T²dT whereas dF₃τ₃T=3T²dT; the chain-map substitute fails | None |
| 7.4 V-only prime identity and API | p=2; x=0; Teichmüller generators | γ₂(V₂x)=V₂(x²); 2γ₂(v)=v² without dividing by two or assuming positive-degree F | None |
| 7.5 positive-degree F and API | p=2,3; V_pT; τ₂(T)²; coprime primes | θ₂V₂T=dT and θ₂(τ₂(T)²)=2T³dT; Bézout controls coprime terms | R03: replace qualitative/repeated Checks |
| 7.6 differential ghosts and API | i=0,1; m=1,2; V₂dT | Smaller degree-one ghost is 4dT; F relation carries n^i | None |
| 7.7 differential base change and API | Identity; m=1; étale localization A[T,T⁻¹] | Extending differential sends d(T⁻¹)=−T⁻²dT; it cannot simply ignore new coefficients | None |
| 8.2 framed γ and API | r=0,1; arbitrary base with zero divisors; polynomial q | γ(T²)=q²T²; hT remains regular by étale flatness; polynomial q need not be a unit | None |
| 8.3 Jackson derivative and API | n=0,1,2,3; q=1; characteristic 2 | D(1)=0, D(T)=1, D(T²)=(1+q)T; no negative exponent or division by 2 | None |
| 8.4 framed complexes and API | r=0,1,2; f=T²; q=1 | dT·T=qT dT; H has h-scaled differential; skew product satisfies the twisted Leibniz rule | None |
| 8.5 framed Frobenius and API | p=2,3; r=0; T,h,dT | φ(h)=q^p−1; H sends dT to T^(p−1)dT; C needs [p]_q; coefficient injectivity uses reduced R/p | None |
| 9.2 framed decomposition and API | r=0,1; α=0,1; p=2 | Bases 1,T and T dT,dT; no inverse monomial at v=0; scalar description only after reduction | None |
| 9.3 two-term cohomology and API | α=e=0; e=α; p=2,α=1,e=0; two factors | H⁰=(h+2)S₁ and H¹=S₁/(h), both ℤ₂; triangular basis change splits the tensor over S_α | None |
| 9.4 Bockstein and API | m=1,2; r=0,1; invalid parameter f=0 | β₁T=dT; β₂[T²]=[T dT]; regularity makes division of dx unique | R03: use the m=2 Check |
| 9.5 framed cohomology system and API | m=1; zero variables; polynomial versus étale frame | β, not the quotient's zero differential, recovers de Rham; cohomology removes skewness | None beyond R01 |
| 9.6 simultaneous induction and API | α=0,1; p=2; TdT mod 2; quotient by V alone | F₂dτ₂T=TdT; dV must also be killed; (a)–(d) is a single induction, not four cyclic premises | None beyond R01 |
| 9.7 general smooth comparison and API | m=1,2,6; p=2,3; R=0,A; toric A=ℤ[U] | m=6,p=2 needs ψ₂ and ψ₆; U⊗1 becomes U⁶ in the second factor; derived tensor over A[q] instead of C_α creates extra Tor₁ | None beyond R01 |
| 10.1 smooth torsion-freeness and API | m=1; R=A; R=ℤ[x]/x² | x dx is nonzero 2-torsion in the nonsmooth example; FV=n gives V-injectivity once torsion-free | None |
| 10.2 bounded difference torsion and API | m=1,2; R=A; finite polynomial base change | h(q+1)=0 at m=2 is compatible with integer torsion-freeness; bounds are degree/index dependent | None |
| Cyclotomic requirement | m=1; equal indices; p dividing d | Prime-generator formula needs m>1; intersection needs distinct factors; topology uses radicals | R01 |
| Ordinary de Rham requirement | Characteristic 2; nonperfect characteristic-p base; rank zero | Exterior alternation and relative Cartier twist are necessary; the degree-one basis alone is insufficient | R01 |
| Cochain completion requirement | M^i=ℤ[q], d=0 for all i∈ℤ; p-torsion module; unbounded h-torsion sum | First is an allowed unbounded test; the latter examples violate stated conditions | R01 |
| Prismatic/PD requirement | α=0,1; p=2; toric perfectly covered base | Empty décalage product at α=0; compatible PD presentation is needed before coherent descent | R01 |
| Generic Bockstein requirement | f=g=h; f=h²,g=h; f=0 | dx=gy implies d((f/g)x)=fy, proving Fβ_fV=β_g; f=0 fails regularity on a nonzero term | R01 |
| Generic quotient requirement | J=0,P,(T),(T,dT) in Ω*_{ℤ[T]/ℤ} | Quotients by 0 and P work; (T) fails d-stability; (T,dT) gives a quotient DGA | R01 |

The noncommuting-matrix row uses module basis u₁,u₂ and exterior basis e₁,e₂.

### Duplication audit by object

Searches covered main's active and completed roadmap text and Lean files, package filenames and scopes, GitHub object searches, and the complete, untruncated trees at both library pins. Candidate declarations were read at the pins rather than treating default-branch search results as pinned evidence. The search objects included Witt coordinates, ghosts, F/V/Teichmüller operations, Λ/δ structures, Koszul actions and signs, cyclotomic factorization, Kähler bases, completion and Bocksteins.

| Object | Existing supplier checked | Consequence for this design |
| --- | --- | --- |
| p-typical Witt coordinates, maps and ghosts | Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `Mathlib/RingTheory/WittVector/Defs.lean` (`WittVector`, `WittVector.ext`); `Basic.lean` (`map`, `map_coeff`, `ghostMap`, `ghostComponent`, `ghostComponent_apply`) | The existing sequence carrier is p-typical. Big divisibility indexing is a distinct object; §1.5 is a comparison, not a second p-typical implementation. |
| Truncation and F/V/τ | Same pin: `Mathlib/RingTheory/WittVector/Truncated.lean` (`TruncatedWittVector`, `instCommRing`, both truncations, `coeff_truncate`); `Frobenius.lean`, `Verschiebung.lean`, `Teichmuller.lean` | Fin n length, prime hypothesis, characteristic-p Frobenius identity and extra perfectness for `frobeniusEquiv` agree with the contracts. |
| Witt adic topology | Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti/RingTheory/WittVector/Complete.lean:197`, `WittVector.isAdicComplete_span_p_teichmuller`; `Frobenius.lean:65` and `:79`, the two continuity theorems | Imported with characteristic p, perfectness and the stated adic assumptions. These are not the relative coefficient Frobenius constructed in Layer 6. |
| Cyclotomic products and reductions | Mathlib `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`, `prod_cyclotomic_eq_X_pow_sub_one`, `prod_cyclotomic_eq_geom_sum`; `Expand.lean:38`, `:87`, `:131`, `:145`, the expansion and characteristic-p power identities | The product primitives are already imported. The supplier should also reuse the expansion identities when closing R01. They do not by themselves supply the full integral intersection/CRT contract. `Factorization.lean` concerns finite-field irreducible degrees. |
| Cyclotomic coefficient carrier | Tau Ceti `TauCeti/RingTheory/Cyclotomic/Basic.lean:345`, `TauCeti.Cyclotomic.equivAdjoinRoot`; polynomial `Cyclotomic/Basic.lean:32`, `Polynomial.cyclotomic_five` | Existing exact integer cyclotomic model and the fifth-polynomial identity are not replanned here. A[ζ_d] is quotient notation over an arbitrary base, not a proposed competing integer implementation. |
| Étale Kähler basis | Tau Ceti `TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`, `kaehlerBasisOfFormallyEtale`, and its apply theorem | The commutative scalar tower and formal étaleness are explicit. This supplies basis transport, not the missing exterior DGA/Cartier theory. |
| Scalar Koszul and cochain signs | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516`, §0.K.1; `TauCetiRoadmap/DGAInfinity/README.md:70`, cohomological signs and Layer 0 | The scalar complex is chain-indexed with alternating deletion. Section 1.7 adds a commuting-module-action bridge with the cochain dual convention. No second scalar Koszul API is planned. |
| Completion and enhancement | DerivedModuleAlgebra §§0.2, 1.1–1.9; EnhancedDerivedSheaves §0.3 and E5:abstract | Existing derived tensor, limits, radical invariance, completion and algebra-object frameworks are consumed. Their actual hypotheses do not close the six residual gaps. |
| Bocksteins | Tau Ceti `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean:92`, `TauCeti.explicitBockstein1`; `Integral.lean:136`, `TauCeti.integralBockstein` | These have group-cohomology coefficient-sequence carriers and different codomains. They do not supply the general regular-parameter DGA theorem. The default-branch `Bockstein/Leibniz.lean` is absent at the pin (404, also absent from its tree). |
| q-Witt, arithmetic Λ, Jackson calculus and general smooth q-Witt comparison | Main/package object searches and pinned candidate-tree inspection | No competing owner was found. Characteristic-p scheme perfection and unrelated quadratic Witt groups were excluded from matches by object, not by name alone. |

Both specified open roadmap heads were checked through GitHub: ArithmeticDynamics at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, README blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`; ErdosProgressionPowers at `e101259371172a32b3dd13e926676ae33b6af5cd`, README blob `4c16df24893ccac630ed2aeb61b0a4dc617520a0`. Their actual scope text and whole-text object searches show no competing q-Witt/Λ/Jackson/Bockstein target. The differing ArithmeticDynamics package text was not substituted for its head.

### Supplier direction and gate output

The actual main contracts checked are DerivedModuleAlgebra §§0.K.1, 0.2, 1.1, 1.2, 1.3, 1.5, 1.7, 1.8, 1.9; DGAInfinity Layers 0–1; EnhancedDerivedSheaves §0.3 and E5:abstract; SchemeAndStackFoundations §§0.23a, 0.29 and 4.1. The last supplies the right-factor affine Frobenius twist, étale relative Frobenius, polynomial ranks and infinitesimal lifting with the expected directions. The cited sections exist. DGAInfinity is an allowed main supplier even though it is not listed in this merge-order file.

The named order entries are SchemeAndStackFoundations at line 2, DerivedModuleAlgebra at 6, EnhancedDerivedSheaves at 14, DerivedDeRhamCohomology at 17, PrismaticCohomology at 51 and HabiroCyclotomicCompletions at 63. Three of these names currently have no supplied section text; listing them in the order is not a contract. No later consumer is cited by a `*Needs:*` line or supplier contract. No ownership was moved to or from a later roadmap in this review.

The prescribed invocation against `packages/QWittVectors/README.md` exited **1** with `FileNotFoundError`: that relative file does not exist. The traceback's machine paths are omitted as required. This failure occurred before dependency analysis.

The diagnostic invocation against `packages/QWittVectors/design/README.md`, with the same name and order arguments, exited **1** and printed exactly:

```text
NOT IN ORDER: QWittVectors (insert it after its last supplier)
depcheck: 3 roadmaps, 12 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line, and no false positive is alleged. This is not a clean gate. The target-level plan graph is acyclic, and §9.6 packages its internal induction correctly; neither observation resolves missing supplier contracts or missing merge registration. No tooling or order file was edited.

## Not verifiable

- **Lean elaboration: not available.** No `packages/QWittVectors/Suggested.lean` or design Lean file exists. The brief supplies no runnable Lean elaboration command, explicitly marking it unavailable. No Lean command was run, no elaborated binder types or mirror examples were checked, and no “sorry only” warning result is claimed. The heavy E∞ comparison appropriately remains a README target; the eventual compact Lean selection still requires its own review.
- **Six actual supplier contracts:** the absent sections/Part II roadmaps in R01 cannot be certified from a source paper or a requirement paragraph. All available independent checks were completed; this is an ownership blocker, not an unreadable-source case.
- **Global merge position:** QWittVectors has no entry, and the eventual Part II suppliers have no registered contracts to order. R02 records both failed invocations.
- **Absolute absence from all library code:** object searches, complete pinned path inventories and the relevant pinned files were checked; no exhaustive proof of absence from every declaration in both repositories is claimed. Default-branch search discoveries were used only to locate candidates, then checked at the pins. The unavailable pinned Leibniz file was not used as evidence of an existing supplier.
- **Missing legal texts:** none needed for this review. The seeded sample and all newly added comparison locators are readable in the eight cached sources. No `needs-references.toml` entry was needed, and the author's source manifest was left intact.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e76d3ea7e37fe93287f270506a04a54d698ee4f7", "job": "REV-DESIGN-QWittVectors~2", "model": "gpt-6-astra", "worker": "chris-1"} -->
