<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6785268983 -->
Review (codex) of 9d484c9

Verdict: needs_changes

1. **F01** (P1) A separably closed field need not be C₀

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:232`, §0.6(c): “in the separably closed and finite cases `K` is `C_{r+ε}` by Tsen–Lang”.

   **Claim:** The intermediate C-field assertion holds for arbitrary separably closed constants, including imperfect ones.

   **Witness:** Take k=𝔽₂(s)ˢᵉᵖ, K=k, r=ε=0. The form X²+sY² has two variables but only the zero solution: √s is not in a separable extension of 𝔽₂(s).

   **Exact repair:** Keep §0.6(c) in its full stated generality. In the separably closed branch first extend the constants to their algebraic closure, a purely inseparable extension, and pass to the compositum with K. Its transcendence degree remains r. Apply Tsen–Lang there, then §0.6(b) to descend isotropy for the chosen degree n_k. Cite Poonen's actual reduction, `poonen_uniform line 600`, Proposition A.3, p. 13, and include the imperfect-field counterexample as a negative-control Check. QuadraticFormInvariantsPartII §5.6 supplies ascent from a C_i base; it does not turn every separably closed field into a C₀ field.

   **Repair test:** The false conclusion for X²+sY² is no longer asserted. The headline uses degree three in characteristic two: X³+sY³ has a nonzero zero over k because X³+s is separable and k is separably closed. Purely inseparable descent therefore proves the required restricted-degree statement without the false unrestricted C₀ assertion.

2. **F02** (P2) The smooth-point route invokes an excluded coefficient field

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:232`, §0.6(e): “For (e) use the embedding of 0.5”. Section 0.5 at line 207 requires finite separable residue extension; §0.6(e), line 230, does not.

   **Claim:** The coefficient-compatible formal-coordinate embedding of §0.5 applies to every smooth closed point in §0.6(e).

   **Witness:** Over k=𝔽₂(s), take V=𝔸¹_k, x=(u²+s), π=u²+s. V is smooth and k_x=k(√s). A coefficient lift z²=s would give (z+u)²=π, hence 2v(z+u)=1, impossible.

   **Exact repair:** Retain arbitrary smooth closed points in §0.6(e). Replace the invocation of §0.5 by a regular-local-flag argument using §0.6(d). Extend the given parameters to a full regular system. Successive quotients by its initial segments are regular local domains (Stacks, Lemmas 10.106.2–10.106.3, tags 00NP–00NQ, `stacks line 11920`); localizing each at the next parameter gives a DVR. Starting with the anisotropic residue form, apply (d) successively up the flag. The desired partial tensor is a subform of the full tensor. State these intermediate rings and their fraction/residue fields, and include the inseparable point above as a Check. Do not repair this by restricting the theorem to separable closed points.

   **Repair test:** Take q=X³+sY³. In k_x=𝔽₂(r), r²=s, its reduction X³+r²Y³ is anisotropic, since ord_r(r²)=2 is not divisible by three. The local ring at x is itself a DVR with uniformizer π. Clause (d) gives anisotropy of q⊗⟨⟨π⟩⟩₃: the three blocks have valuations 0,1,2 modulo three. This proves precisely the formerly unsupported instance. Poonen's Lemma A.5 proof (`poonen_uniform line 621`, p. 14) has the same coefficient-compatibility gap; it is not a justification for dropping §0.5's hypothesis.

3. **F03** (P2) Cubic descent's conjugate-point argument omits inseparable quadratics

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:232`, §0.6(a): “a cubic form with a zero `P` over a quadratic extension and its conjugate `P̄` gives a `K`-rational point on the line `PP̄`”.

   **Claim:** This route proves the quadratic-extension cubic descent theorem without a separability assumption.

   **Witness:** K=𝔽₂(s), L=K(r), r²=s. For q=X³+sY²Z, P=[r:1:r] is an L-zero, not K-rational. Its only geometric conjugate is P itself; two distinct conjugate points do not determine the claimed line.

   **Exact repair:** Keep descent for every quadratic extension. Describe the line over K spanned by the two K-coordinate vectors of P in a basis of L/K. Unless P is already rational, the restricted homogeneous cubic vanishes at a degree-two closed point of that line. Its polynomial is therefore zero or divisible by the homogeneous quadratic minimal polynomial, leaving a linear factor over K. This handles the inseparable double point as well as the separable pair. Add the witness as a Check. Poonen's Proposition A.1 (`poonen_uniform line 584`, p. 13) has no separability assumption, and Corollary A.2 immediately needs the inseparable case.

   **Repair test:** On the K-line [A:B:A], q restricts to A(A²+sB²). The quadratic factor is inseparable; the residual linear factor A gives the K-zero [0:1:0]. The repair proves the required descent on this instance without assuming a distinct conjugate.

4. **F04** (P2) The arithmetic core needs an infinite domain

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1270`, §7.3: “Let `B` be a finitely generated integral domain”; “in characteristic `p` choose `t ∈ B` transcendental”.

   **Claim:** The construction produces a one-dimensional arithmetic core for every such B.

   **Witness:** B=𝔽₄ is a finitely generated integral domain, but every b satisfies b⁴−b=0. There is no transcendental t; every subring of B has Krull dimension zero. AKNS assumes infinitude at `akns line 1064`.

   **Exact repair:** Begin §7.3 with “Let B be an infinite finitely generated integral domain with fraction field K.” Keep the characteristic-zero and positive-characteristic constructions and conductor localization. Add 𝔽₄ as an excluded negative control, and cite the proof of Theorem 3.1, p. 23, alongside Lemma 3.6. The layer's introductory description of its goal does not supply this missing hypothesis in the independently quantified statement.

   **Repair test:** 𝔽₄ is excluded. For B=𝔽₂[s,t], choosing t still gives D=𝔽₂[t], dimension one; for B=ℤ[√5,t], D=ℤ[√5], also dimension one, with conductor localization at 2. All consumers in §§7.4–7.6 already use infinite domains.

5. **F05** (P3) The fraction-interpretation locator is one page early

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1294`, §7.5: “AKNS, Examples 2.9(4), p. 12”.

   **Claim:** The localization/fraction interpretation occurs on that page.

   **Witness:** `akns line 565` starts printed page 13; lines 567–574 contain Example 2.9(4) and its fraction-field consequence. The Dittmann–Pop comparison proof continues onto page 18 at `dittmann_pop line 779`.

   **Exact repair:** Change the AKNS locator to “Examples 2.9(4), p. 13” and give “pp. 17–18” for Dittmann–Pop's two-comparison proof.

   **Repair test:** The corrected locators contain the pair quotient, the equivalence relation, and both comparison maps. For ℤ⊆ℚ, (1,2) and (2,4) have equal cross-products 4 and map to 1/2.

6. **F06** (P3) A Check calls ℚ(s) a global field

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:411`, §0.15: “the global field `ℚ(s)` is not a member (Kronecker dimension two)”.

   **Claim:** ℚ(s) is global while having Kronecker dimension two.

   **Witness:** s is transcendental over ℚ, so δ(ℚ(s))=1+1=2. A global field has δ=1. The same sentence's dimension calculation disproves its adjective.

   **Exact repair:** Replace “the global field ℚ(s)” by “the field ℚ(s)” (or “the nonglobal field ℚ(s)”). Keep the exclusion from the family.

   **Repair test:** In ℚ(s,t), ℚ is the sole relatively closed global subfield; ℚ(s) has dimension two and remains excluded. This changes no target or dependency.

Six findings, four blocking. Both findings from round 3 are repaired. The acceptance file elaborates, its eight theorem statements survive the padding probes, and dependency checking reports no problems. The new blocking findings concern proof routes over imperfect fields and the arithmetic core's domain of definition; they do not require narrowing the roadmap's intended scope.

## Verified sound

### Previous findings and adversarial checks of the repairs

The previous report had F01 and F02. The repair report marked both applied, not “not actionable”; neither is re-raised. Each changed passage was read and the patterns were searched throughout the package.

| Previous finding | Repaired passage | Status and computed test |
|---|---|---|
| F01, extension-valued elliptic test and simple pole | README:358: “both are subsets of `K_u`, not of `K`”; README:362: “`ord_O(z) = −1` and `η` is étale” | **Repaired.** For E/𝔽₅: y²=x³+x+1, #E=9, trace=−3; σ(2y_u/u)=−2y_u/u≠2y_u/u. The test now lives over K_u. At (s,P)=(1,(2,1)), b=2z(P)=1, s²−b=0, its derivative is 2, and ord(a⁻¹)=1. The corrected form rejects s²; t=u passes by the global-field bound. |
| F02, excellence | README:484: “an excellent henselian discrete valuation ring with finite residue field of characteristic different from two” | **Repaired.** 𝔽₃[[t]] qualifies. For the stated henselization of 𝔽₃(t,b³)∩𝔽₃[[t]], the completion contains b and the fraction field does not; the generic formal fibre becomes nonreduced after adjoining b. Thus excellence=false and the base is excluded. |

The elliptic repair also specifies anti-invariant points, excludes poles and zero before inversion, interprets the degree-two field via §0.4, retains the degree-three characteristic-two test, and adds the maximal-fibre filter. In 𝔽₄(s,t), 𝔽₂(s)⊊𝔽₄(s), so the filter excludes the former and does not shrink the constant field to 𝔽₂. The ramification argument keeps the constants of L_u equal to κ; K_u/L_u is regular. The source of the test is not treated as infallible. R01–R03 concern the general diagonal-form routes it consumes, rather than a reappearance of F01.

Excellence is present in the ownership sentence, §1.3, its source locator, the layer description and the normalized-base application in §3.1. The finite normalization of the excellent henselian base again has excellent henselian DVR local rings. No other occurrence was found that silently uses the discarded generality.

### Principles, organization and shape

Read all 74 numbered target subsections in nine layers, 74 Check blocks, 75 Needs lines, conventions, supplier contracts and examples. For unchanged material, only previous adversarial rows containing actual values were used as prior evidence; narrative-only coverage was reconsidered. The fifteen seeded targets below were all rechecked. The table below records the sample, headlines, changed mathematics and finding witnesses, rather than reproducing a per-target ledger.

The package extends the base logic roadmap's interpretation and quotient interfaces. Its direction remains uniform arithmetic predicates → cohomological detection → test forms → compactness and coarsening → stabilizers → divisor formulas → normalizations → bi-interpretation → sentences. These dependencies force the layer order; there is no declaration that source chapter order dictates it. Main's AlgebraicCurves, EllipticCurves and ClassFieldTheory were read for house shape. Every layer has Examples and Dependencies; definitions have mathematical APIs and at least three Checks. R01–R04 identify missing discriminating cases or proof hypotheses, rather than an absent layer.

No route-specific good-prime restriction, replanning of the base roadmap, forbidden supplier, computational algorithm, copied source exposition, process residue, machine path or HTML anchor was found in the roadmap text. Split quadratic étale algebras, characteristic two, inseparable normalization and all prolongations remain in scope. `metadata.toml` contains the appropriate `math.NT` topic. The manifest has eighteen work keys: fourteen certified and four settled uncertified, with no duplicate work identity. No new missing-source request is needed.

### Seeded source sample

These are locators in the cached texts, with the version conventions disclosed by the README. “Supports” concerns the statement at the locator, subject to the explicitly identified proof defects. Settled unavailable primary texts are not represented as read.

| Sampled target | Source and locator read | Result |
|---|---|---|
| 0.1 Kronecker dimension, constants, H_d | `dittmann_pop line 34`, §1 pp.1–2 and lines 44–77; `poonen_uniform line 102`, Definition 2.1 p.3; `jannsen_hasse line 1889`, Definition 4.18 pp.39–40 | δ is trdeg plus the characteristic-zero correction; both RS clauses retained, and the conditional trigger is char 2 with δ>3. |
| 0.5 Formal coordinates | `stacks line 20659`, Algebra tag 0C0S, Lemma 10.160.10; `stacks line 20606`, tag 032A, Theorem 10.160.8; `pop_eei line 247`, Fact 1.3 proof pp.7–8; `poonen_uniform line 621`, A.5 proof p.14 | The separable-residue equicharacteristic statement is sound: Hensel lifting chooses a coefficient field containing k. Mixed characteristic needs the unramified coefficient extension O′, retained here. The use of this target by §0.6(e) fails R02. |
| 0.7 Rumely uniform arithmetic | `rumely line 22`, Introduction I–III pp.195–196; line 687, p.211; `poonen_uniform line 113`, Theorem 2.2 p.3; `akns line 1055`, Lemma 3.8 p.23 | Valuations, characteristic distinction, integer/polynomial predicates and restricted-digit coding supported. Coding starts at index one. Rumely states the coding map and leaves its definability as an exercise. |
| 0.8 Fixed dimension | `poonen_uniform line 128`, Theorem 2.3 p.3; `pop_eei line 361`, Theorem 1.4 pp.10–11 | Fixed n precedes the field; Pop's form criteria and Poonen's ring sentence agree with the disclosed preprint numbering. |
| 0.14 Algebraic dependence | `poonen_uniform line 511`, Lemma 5.2 and proof of Theorem 1.4 pp.11–12 | Relative algebraic closedness of the global subfield is present; constant-field and positive-characteristic reduction agree. Empty tuple is independent, so dependence is false. |
| 1.2 Jannsen relative to a global subfield | `jannsen_hasse line 51`, Theorem 0.1 pp.1–2; line 109, Corollary 0.4 p.3; `dittmann_pop line 145`, Fact 2.1 p.4 | Degree d+1 for trdeg d−1 over the global subfield, primary/separably closed base and all places retained. No removal of real places. |
| 1.5 Kato two-dimensional principle | `pop_eei2 line 258`, Theorem 2.1 p.2097 | The prime is invertible, the surface/global-field hypotheses and local groups agree. The Kato primary text remains uncertified. |
| 1.6 Symbols, cyclic algebras, reduced norms | `pop_eei2 line 269`, §2C pp.2097–2098 | Prime-degree cyclic norm, division reduced-norm/triple-symbol test and local-global use supported. Merkurjev–Suslin primary remains uncertified. |
| 4.3 Finite V_a | `dittmann_pop line 597`, Notations/Remarks 4.1, especially lines 614–618, pp.13–14 | Unit restrictions on lower slots and positive odd outer order agree; finiteness comes from support on the proper one-variable curve, not all valuations. |
| 5.5 Shifted rings | `pop_eei2 line 474`, Notation 3.5 p.2102; line 511, root fields; line 607, §4C pp.2105–2106 | Shifted operations and root quantifiers supported. The roadmap corrects the char-2 threshold from v(2n) to v(n); zero root-parameter branch is redundant, not false. |
| 6.8 Composite-valuation intersection | `dittmann_pop line 715`, Proposition 5.1 Case 2 p.16; line 737, Lemma 5.3 p.17 | Full flags, arithmetic terminal place and all prolongations are used. The source's rank-one-index and residue-torus slips are corrected. |
| 6.9 Uniform normalization | `dittmann_pop line 694`, Proposition 5.1 pp.16–17; line 763, Remark 5.4 p.17 | Fixed dimension and basis length before formula; integral closure over prime subring adjoined T agrees with arithmetic constants by integrality/transitivity. |
| 7.2 Dimension-one coding | `akns line 1031`, Lemmas 3.7–3.8 pp.22–23 | Infinite dimension-one domain, finite free Noether-normalization module, least denominators and positive digit indices agree. Normality is not required. |
| 7.3 Arithmetic core | `akns line 1014`, Lemma 3.6 p.22; lines 1063–1082, Theorem 3.1 proof p.23 | Finite generation supported once the missing infinite hypothesis is restored (R04). The roadmap correctly repairs the source's separate premature Dedekind conclusion by conductor localization. |
| 7.5 Fraction-domain transfer | `akns line 567`, Example 2.9(4) p.13; `dittmann_pop line 770`, bi-interpretability proof pp.17–18 | Both comparison maps supported; page correction R05. |

Additionally read the full appendix proof at `poonen_uniform line 584` through line 627 for R01–R03, the changed elliptic construction at lines 415–495 for F01, and the excellent-base convention and Theorem 8.1 at `kerz_saito line 288` and line 1852 for F02. The Stacks algebra chapter was obtained through the prescribed service under its existing work key; the author's manifest entry was left unchanged.

### Computed adversarial table

Values below are mathematical computations, not claims that `sorry` proves truth. Each “pass” is survival of the named tests. Zero rings, finite fields, inseparability, empty families and total-function junk values were tested where their carriers allow them.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| 0.1 dimension and H_d | 𝔽₉, ℚ, ℚ(s,t), 𝔽₂(s,t,u,v) | δ=0,1,3,4; resolution trigger=false,false,false,true | Pass. |
| 0.2 geometric divisor definition | t-adic ℚ(s,t); 2-adic ℚ; trivial valuation | Residue dimensions 2,0,unchanged; characteristic equality true,false,true; trivial ring has DVR=false | Only first is geometric. |
| 0.3 guarded family | Empty raw intersection; failed parameter | Raw intersection=K, properness=false; guarded fibre=∅ | Pass; K is not a spurious divisor. |
| 0.4 bounded field codes | g=1, N=0, X²−X, X²+1 over ℚ | Degree0 rejected; no admissible positive degree at N0; whole split quotient ℚ×ℚ rejected, factor X gives ℚ; X²+1 gives degree2 field | Pass; no sorry'd field data. |
| 0.5 formal coordinates | ℚ(t) at0; smooth mixed example ℤ₃[t] at(3,t) | 1/(1−t)=1+t+t²+…; completion ℤ₃[[t]], residue𝔽₃, orders of3,t independent | Pass with chosen coefficient base. |
| 0.5 versus 0.6(e) | k=𝔽₂(s), u²=s | v(π)=1 versus v((z+u)²)=2v(z+u); residue degree2 inseparable | §0.5 excludes; §0.6 route fails R02. |
| 0.6(c) separably closed | k=𝔽₂(s)ˢᵉᵖ, q=X²+sY² | Variables2>2⁰=1; nonzero zeros0; degree-three polynomial X³+s instead has a root | False C₀ assertion, R01. |
| 0.6(a) cubic descent | q=X³+sY²Z, P=[r:1:r], r²=s | q(P)=r³+sr=0; P̄=P; P∉ℙ²(K); line restriction A(A²+sB²) has K-zero A=0 | Preserve theorem, repair route R03. |
| 0.6(e) repaired valuation route | q=X³+sY³ at u²=s | Residue coefficient r² has ord_r=2≢0 mod3; tensor blocks have orders0,1,2 mod3 | Anisotropic as required; R02 repair tested. |
| 0.6 conventions | Plus slots(1,1), minus slots(−1,−1) over ℝ | Both give four squares, zero locus{0}; minus slot+1 instead has zero(1,1) | Convention conversion sound. |
| 0.7 arithmetic and coding | ℚ; 𝔽₂(t); restricted codes1,2,3,6 | Integersℤ; polynomial ring𝔽₂[t]; codes map to0,1,t,1+t respectively; v_t(1/t)=−1 | Pass; digit map is not asserted on unrestricted exponents. |
| 0.8 dimension headline | n=0,1,3; K=𝔽₄,ℚ,ℚ(s,t) | δ=0,1,3; each matching equality true, other two false | Uniform quantifier order retained. |
| 0.8a Albanese | ℙⁿ; pointed E; L′=L(α),α²=s | Alb=0; Alb(E)=E and id comparison; α⊗1−1⊗α=ε≠0 with ε²=0 | Full descent data exclude mere invariant isomorphism class. |
| 0.10 characteristic headline | ℚ, characteristic2, odd characteristic p | [ℤ:2ℤ]=2; 2=0; in odd p, 2((p+1)/2)s=s, hence Z=2Z | Characteristic branches separate, even without FG in positive characteristic. |
| 0.11 affine count | E:y²+xy=x³+1 over𝔽₂ | #E=4, trace−1; #𝔸¹×E=8 versus #ℙ¹×E=12 | Correct affine supplier. |
| 0.12 corrected coefficient field | E/𝔽₅ from F01 | #E=9, trace−3; σ(2y_u/u)=−2y_u/u≠2y_u/u; coefficients in K_u, not K | F01 repaired. |
| 0.12 outsider and poles | t=s²; P=(2,1),s=1 | Old cut U₂∩K={0}, (2s)²+s²=0; new b=1, derivative2, ord(a⁻¹)=1; 2 is nonsquare | New criterion rejects outsider. ord(x)=−2 versus ord(z)=−1. |
| 0.12 maximal filter | 𝔽₂(s)⊂𝔽₄(s)⊂𝔽₄(s,t) | Both subfields δ1; relative closures are𝔽₄(s); constant fields𝔽₂ versus𝔽₄ | Maximality removes the smaller fibre. |
| 0.13 constants headline | 𝔽₉; 𝔽₉(t); ℚ(t) | Constant sets𝔽₉,𝔽₉,ℚ; 0 algebraic=true, t algebraic=false; finite empty-family intersection=K | Pass. |
| 0.14 dependence headline | (), (0), (t), (s,s²), (s,t) | Dependent=false,true,false,true,false; X₂−X₁² annihilates fourth tuple | Both directions and n0 agree. |
| 0.15 global family | ℚ(s,t) | δ(ℚ)=1, δ(ℚ(s))=2; membership true,false | Exclusion correct; adjective repaired in R06. |
| 1.2 Jannsen degree/real places | K=ℚ(t), d2 | trdeg overℚ=1, degree d+1=3; (−1)³ survives at an ordering, while finite-place constant H³ vanishes | All places are necessary and retained. |
| 1.3 excellent base | 𝔽₃[[t]]; stated pathological henselization | Excellent=true,false; second completion acquires purely inseparable b of degree3 | F02 repaired. |
| 1.5 Kato coefficients | n3 in char2; n2 in char2 | 3=1 is invertible; 2=0 is not | First admitted, second excluded. |
| 1.6 split versus nonsplit norm | a=1 split algebra; unramified ℚ₃(i)/ℚ₃ | Split norm N(u,v)=uv represents every c via(1,c); nonsplit norm valuation even, v₃(3)=1 | Division and split branches kept separate. |
| 2.7 smoothness on torus | y²=t₂−1 in odd characteristic | At(t₂,y)=(1,0), derivative2y=0; off t₂=1, derivative≠0 | Correct branch divisor, unlike y²=t₂ on torus. |
| 3.4 principal-unit sign | u2,ε1,a=u²−u−ε=1 | a/u²=1/4; 1−1/u−ε/u²=1/4 versus erroneous plus=3/4 | Correct minus sign retained. |
| 4.3 V_a | Nonzero constant outer slot; isolated divisor with odd order | All w(a_d)=0 gives V_a=∅; selected order1 with other required unit orders0 gives singleton | Finite support and empty case retained. |
| 4.4–4.7 strict balls/stabilizers | w(a_d)=1 or3; β=0 | Integer bounds w(β)>1/2 or3/2 mean ≥1 or≥2; zero admitted via∞, not native ord(0)=0 | Maximal-ideal powers; stabilizer valuation ring. |
| 5.5 shifted operations | t=1; arbitrary x, characteristic2 included | x*t=x+t−t=x; x∘(t+1)=(x−t)·1+t=x; in char2, t+1=0 is shifted unit | Shifted ring, not ambient ring operations. |
| 5.5 threshold | char2,n3 | Old 2n=0 gives v(2n)=∞; corrected n=1 gives threshold0 | No degenerate infinite threshold. |
| 5.7 divisor headline | 𝔽₄; ℚ; 𝔽₂(t); ℚ(s,t) | Geometric divisor sets empty,empty,curve places,δ-drop-one valuations | Uniform empty-fibre/exhaustion statement covers boundary cases. |
| 6.3 normal intersection | k[t²,t³] versus k[t] | t integral but t∉first ring; deleting cusp localization leaves k[t,t⁻¹]; normal k[t] intersection=k[t] | Normality and all height-one primes matter. |
| 6.5 full flags | ℚ(s,t), s=1 then t=1; ℚ empty flag | Residuesℚ(t),ℚ have δ2,1; empty flag residueℚ | Arithmetic terminal place occurs after full flag. |
| 6.7 coefficient detection | (s+2)/3, s↦−1, prime3 | v₃(1/3)=−1; residue g(−1)=1≠0 | Terminal arithmetic place detects negative coefficient. |
| 6.8 all prolongations | ℚ(i),x=1/(2−i) | ord_(2+i)x=0; ord_(2−i)x=−1 | One selected prolongation would falsely admit x. |
| 6.9 normalization headline | ℚ,T=();𝔽₂(t),T=t²;𝔽₄,T=() | Closuresℤ,𝔽₂[t],𝔽₄; t satisfies X²−t²; 1/t not integral | Empty basis and inseparable extension retained. |
| 7.2 denominator code | D=ℤ[1/6],a=1/12 | 6a=1/2∉ℤ,36a=3∈ℤ, least ν=2, code(3,2) | Injective least-denominator representation. |
| 7.2 finite free coding | D=𝔽₂[t,t⁻¹],s=t+t⁻¹ | t²+st+1=0; basis1,t gives rank2 over𝔽₂[s], but not finite over𝔽₂[t] | Correct Noether-normalization parameter. |
| 7.3 arithmetic core | B=𝔽₄;ℤ[√5,t];𝔽₂[s,t] | First has trdeg0,dim0,no t; other cores dimensions1; (1+√5)/2 integral but absent before inversion of2 | R04; conductor repair otherwise sound. |
| 7.4 domain bi-interpretation | Finite𝔽₄ versusℤ[t] | Every finite power/quotient of𝔽₄ finite, cannot interpret infiniteℤ; ℤ[t] infinite FG domain | Infinite hypothesis retained here. |
| 7.5–7.6 fraction transfer | ℤ⊆ℚ,(1,2),(2,4) | Cross-products4=4; both map to1/2; b=0 excluded; r maps to(r,1) | Both comparisons, not merely mutual interpretations. |
| 8.1–8.2 total inverse | ℚ, expanded ring language | Empty tuple generates using inverse; inv0=0; finitely many ring generators invert only finitely many primes | Correct distinction of languages. |
| 8.3 finite sentences | θ₄ on𝔽₄,𝔽₂,ℤ/4; one-element ring | Cardinality=true,false,true; field=true,true,false; singleton fails0≠1 | Combined true,false,false; no q1 field. |
| 8.4 domain sentence headline | B=ℤ;S=ℤ,𝔽₂,zero ring | Nonempty(S≃+*B)=true,false,false | Conclusion and comparison class agree. |
| 8.5 field sentence headline | K=𝔽₄;L=𝔽₄,𝔽₂,𝔽₄(t) | Isomorphism=true,false,false; cardinality4,2,infinite | Restriction only on K, not L. |

### Acceptance file, headline completeness and padding

The ten headline results are fixed Kronecker dimension (§0.8), characteristic (§0.10), uniform constants (§0.13), uniform dependence (§0.14), uniform geometric divisors (§5.7), uniform arithmetic normalization (§6.9), domain and field bi-interpretability (§§7.4,7.6), and domain and field characterizing sentences (§§8.4,8.5).

All eight formula/sentence headlines have actual statements on pinned carriers. The two bi-interpretation results are named in the module docstring with the missing interpretation/homotopy carriers. The conditional characteristic-two, dimension-above-three extensions are separately named with the missing resolution carrier. The file gives no substitute for those statements. The two definitions with real bodies are exactly the dimension and geometric-divisor predicates needed by the headlines.

Ran `lake env lean` on `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean` from the pinned content checkout: exit 0, exactly eight “declaration uses sorry” warnings, at lines 54,62,73,81,93,113,128,139; no other warning. Single import `Mathlib`; no Tau Ceti build required. No sorry'd data, set_option, admitted example, stand-in predicate or dropped section hypothesis.

A scratch copy with `#check @name` for all ten declarations elaborated. All ten types were compared with the README; no binder loss. Formula arities and dimension/basis parameters precede K, and hK restricts only the distinguished field in the last statement. All ten declared names occur in the README. Every other purported supplied identifier was checked at its actual owner rather than required to exist in the pins.

| Sorried theorem (namespace omitted) | simp | rfl | infer_instance | Direct-library comparison |
|---|---|---|---|---|
| exists_sentence_kroneckerDimension_eq | not closed | not closed | not closed | Krull dimension zero is a different invariant. |
| exists_sentence_charZero | not closed | not closed | not closed | Field axioms and characteristic axiom schemes do not give this distinguishing sentence. |
| exists_formula_isAlgebraic_primeField | not closed | not closed | not closed | Fixed polynomial zero loci do not give a uniform constant-field formula. |
| exists_formula_not_algebraicIndependent | not closed | not closed | not closed | Finite polynomial definability does not bound the annihilating relation degree. |
| exists_formula_isGeometricPrimeDivisor | not closed | not closed | not closed | Native valuation rings carry no uniform first-order parametrization. |
| exists_formula_arithmeticNormalization | not closed | not closed | not closed | IsIntegral.of_finite assumes module finiteness and supplies no formula. |
| exists_sentence_realize_iff_nonempty_ringEquiv_of_isDomain | not closed | not closed | not closed | Finite-type quotient presentations do not supply characterizing sentences. |
| exists_sentence_realize_iff_nonempty_ringEquiv | not closed | not closed | not closed | FiniteField.ringEquivOfCardEq only handles finite fields. |

All eight fallback markers occurred in the elaborated probe copy. The supplied library near-match leads were compared by hypotheses/conclusions; no one-lemma proof, definition restatement, mirrored Check or boundary-case padding was found.

### Pinned declarations and duplication audit

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths in this table are repository-relative library paths. The listed definitions were opened, not inferred from their names.

| Pinned file and line | Meaning checked |
|---|---|
| Mathlib/ModelTheory/Algebra/Ring/Basic.lean:59, :156, :223 | Language.ring has +,·,−,0,1 and no inverse; CompatibleRing identifies semantics with operations; compatibleRingOfRing supplies it. |
| Mathlib/ModelTheory/Semantics.lean:526, :627; Mathlib/ModelTheory/Definability.lean:54 | Formula.Realize, Sentence.Realize and Set.Definable; fixed-structure definability does not itself provide uniform arithmetic formulas. |
| Mathlib/Algebra/Field/Subfield/Basic.lean:458 | Field.FG means finite generation by subfield closure, not finite generation as a ring. |
| Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45; Defs.lean:54, :173 | Cardinal-valued trdeg, injectivity of polynomial evaluation and maximal independent transcendence basis. |
| Mathlib/FieldTheory/AlgebraicClosure.lean:39; Mathlib/RingTheory/Algebraic/Defs.lean:45 | Relative algebraic closure as integral closure inside an extension; IsAlgebraic uses a nonzero polynomial. |
| Mathlib/Algebra/CharP/Defs.lean:154; Mathlib/FieldTheory/Finite/GaloisField.lean:260 | ringChar; FiniteField.ringEquivOfCardEq with Fintype data. |
| Mathlib/RingTheory/Valuation/ValuationSubring.lean:37, :298 | ValuationSubring allows the whole field; ofPrime is localization/coarsening. |
| Mathlib/RingTheory/Valuation/LocalSubring.lean:117 | exists_le_valuationSubring, the domination/extension input. |
| Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56; LocalRing/ResidueField/Defs.lean:28 | DVR includes the nonfield condition; residue field is the maximal-ideal quotient. |
| Mathlib/RingTheory/Henselian.lean:95 | HenselianLocalRing has local root-lifting data; it does not assert excellence or completeness. |
| Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054 | QuadraticMap.Anisotropic means the zero fibre has only zero; no Pfister theorem is hidden in the predicate. |
| Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:53; Algebra/Basic.lean:223 | IsIntegral is a monic-polynomial witness; integralClosure has that carrier. |
| Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:74; Localization/FractionRing.lean:52; FiniteType.lean:39 | Integral-closure predicate (does not itself assert a domain), fraction localization at non-zero-divisors, finitely generated algebra. |
| Mathlib/RingTheory/KrullDimension/Field.lean:24 | ringKrullDim(field)=0, whereas δ(ℚ)=1; not a duplicate headline. |
| Mathlib/ModelTheory/Algebra/Ring/Definability.lean:29 | mvPolynomial_zeroLocus_definable treats a fixed finite polynomial system, not unbounded integral dependence. |
| Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:561 | HeightOneSpectrum.iInf_localization_eq_bot assumes Dedekind; §6.3's arbitrary-dimensional normal Noetherian theorem is strictly broader. |
| TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96, :196, :209 | Full valuation spectrum patch topology, compactness and clopen basic sets; these are imported, not replanned. |
| TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103, :132, :145, :167 | Place is normalized and trivial on constants; integers and integer ord; ord(0)=0 is the actual junk convention. |
| TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:145 | Nonzero element with prescribed orders at finitely many places. |
| TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean:247; StrongApproximation.lean:88 | Single pole of prescribed sufficiently large order; strong approximation with an omitted place. Constants and function-field hypotheses were retained. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84 | IsAlbanese is a pointed factorization property, not arbitrary-field existence. |
| TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43 | Nonempty smooth scheme over any field has a point over a finite separable extension. |

Also opened `Mathlib/Algebra/Ring/Subring/Basic.lean:483`: closure is the infimum of subrings containing the set, so its empty-set value is the prime subring, not the prime subfield. Opened `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:71` for the finite-module integrality near-match. The implicit field hypotheses of the fraction-field normalization statements are explicit in Suggested.lean. Searches of both pinned algebraic-geometry trees found no normal-crossings boundary interface for the full RS hypothesis; a finite-free-resolution predicate for modules is a different object.

Object searches used the pinned libraries, main, the board index/packages and the authorized roadmap-head service. They covered interpretation and bi-interpretation, Albanese existence, normalization/intersections, Milnor and Kato inputs, valuation composition and arithmetic descent. Kronecker dimension's existing owner is explicitly cited; the native definition is retained only to state headlines. Generic patch compactness and place approximation are consumed rather than duplicated.

The full normal-Noetherian height-one intersection is broader than the pinned Dedekind theorem. AlgebraicModuliForArithmeticGeometryPartII #1754, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md:226`, uses it inside the route to Cartier-to-Weil injectivity (§0.7); its owned target is that scheme comparison, not a separate general intersection API. Main's SchemeAndStackFoundations §4.13 (`README.md:5945`) supplies Serre's criterion and its S₂ input, not the displayed intersection equality. Opened `TauCeti/RingTheory/SerreCondition/Normal.lean:128`: the integral-closedness proof uses height-one associated primes but does not state the general intersection theorem. Thus §6.3 remains the general algebraic interface here; no duplicate acceptance declaration was identified. The arbitrary-field rational Albanese construction similarly extends the pointed characteristic-zero supplier, with purely inseparable comparison only an isogeny.

### Supplier citations, overlaps and order

Read the board-package index before evaluating the two “missing roadmap” resolver leads. LogicAndDefinabilityInNumberTheory exists at board #164, head 8d875d1; its actual §§0.1–0.4 were read. LocalFieldsRamificationPartII is in the board checkout. The other five leads are roadmap declarations, not alleged pinned declarations, and resolve below.

| Supplier file, at main or supplied head | Sections and resolved objects |
|---|---|
| packages/LogicAndDefinabilityInNumberTheory/README.md:160, board #164 | §§0.1–0.4; interpretation quotient/semantics/fraction bridge. Homotopy remains an explicit declared gap. |
| packages/LocalFieldsRamificationPartII/README.md:384, :402, :423, :1086 | §§1.1–1.3, 5.1–5.3; prolongation, henselization, composition, coarsening and Abhyankar. |
| TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:676, #1834 | §§1.1, 1.2, 1.5; §§2.5, 3.1, 3.7–3.9; §§4.1–4.3, 5.6–5.7, 6.3, 6.5, 7.2. Compared norms, coefficient degrees, characteristic-two slot conversion, non-FG dimension theorem and arbitrary-rank isotropy loci. |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1832, :9281, #853 | §§3.5, 7.5; polarizedDescentComparison includes scheme and ample-bundle cocycles; finite normalization, valuation_prolongation_integrality and root_coefficient_descent cover all prolongations/multiplicities. |
| TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:1604, :1632, #1796 | §§PA.6.8, PA.6.10, prime-to-ℓ and odd-degree alterations; both require excellence, now retained by this package. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2074, :3505, #858 | §§R02.3.2, R02.4.4; global class formation and restricted-ramification cohomological dimension. Cyclic function-field Hasse norm remains the declared gap. |
| TauCetiRoadmap/FunctionFieldArithmetic/README.md:2406, #1474 | §5.8, constant-field-degree-compatible Chebotarev, including infinitely many split places. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:963, :1400, :2921, #849 | §§A1.8, A3.1, A6.5; Weil extension, isogenies and complete reducibility. |
| TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3109, #852 | §5.1; inertia criterion and isogeny invariance of good reduction. |
| TauCetiRoadmap/ColemanIntegrationPartII/README.md:637, #1360 | §4.0b, NaturalIntegration.properAlbanese_exists, pointed characteristic-zero existence. |
| TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3582, #1495 | §5.4, SieveLangWeil.lang_weil_uniform, affine estimates and arbitrary fibre upper bounds. |
| TauCetiRoadmap/WeilConjectures/README.md:1335, WC.5 §5.29 | Curve RH from the surface bound supplies the projective curve estimate; it is not used for arbitrary affine fibres. |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2410, :2458, #873 | §§3.4–3.5, Veronese pencils and finite-field descent. |
| TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2254, :2308, #929 | §§7.12, 7.15; weights with invertible coefficient prime. |
| TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:160, #1313 | §0.5b, Gersten support input; this is not ownership of the package's arithmetic Kato detection theorem. |
| TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:486, :512, #1281 | §§3.0–3.0a, Milnor/logarithmic symbols, residues and norm-residue comparison. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:5697, #875 | §11.2 includes field cohomological dimension under transcendence degree before its polydisc application; the heading alone would not resolve this citation. |
| TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:616 | §0.21, Mertens's second theorem. |
| TauCetiRoadmap/AlgebraicCurves/README.md:403, :478, :712, :1468 | Layers0,2,6,12; places, Dedekind bridge, extensions, function-field/curve dictionary. |
| Completed/Chebotarev/README.md:410; Completed/GlobalNumberFields/README.md:259, :439 | Chebotarev Layer10; number-field weak and strong approximation Layers1,6. |
| TauCetiRoadmap/GlobalQuadraticForms/README.md:769; Completed/RealAlgebraicGeometry/README.md:130 | §5.5 Hasse–Minkowski including real places; ordered real-closure existence. |
| TauCetiRoadmap/ClassFieldTheory/README.md:1638, :1924 | Layers10,13; Brauer invariant sequence and number-field cyclic norm theorem. |
| TauCetiRoadmap/EllipticCurves/README.md:423, :683, :793, :1154, :1200 | Layers1,3–6; isogenies, finite/local fields, twists, Mordell–Weil. |
| TauCetiRoadmap/JacobianChallenge/README.md:448 | LayerF, pointed curve Albanese universal property. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:1160, :1448, :4001 | §§0.12, 0.20, 2.15; henselizations, Nagata normalization, cohomological inputs. |

The base's interpretation quotient uses equivalence classes, not definable representative choice. LocalFieldsRamificationPartII §§5.1–5.3 supply inverse-image composition, localization/coarsening and the Abhyankar bound with the direction used here. The finite normalization and coefficient-descent contracts explicitly include inseparability and all prolongations. The polarized comparison includes a cocycle on the ample bundle, not only on the scheme. The affine Lang–Weil supplier covers empty and reducible lower-dimensional fibres. These details were checked in the cited passages.

The supplied overlap report lists no competing change to this roadmap, dropped cited id or revision-only id. Read the scopes of its five closest heads: QuadraticFormInvariantsPartII #1834, AdicCoefficientsAndComparisonsPartII #1796, MotivesAndAlgebraicCycles #1313, HeightsRationalPointsAndObstructions #1017 and EtaleDualityAndPerverseSheavesPartII #1743. The quadratic and alteration objects are explicitly imported; the motives, heights and excellent-duality targets are distinct from uniform arithmetic definition. The additional normalization/intersection lead from #1754 was resolved above. No conflicting fully qualified Suggested.lean declaration was identified.

Read all Needs lines and supplier citations. The exact dependency command required by the brief completed with exit 0:

```text
depcheck: 236 roadmaps, 2154 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No ownership movement or new upward supplier is proposed. The two declared gaps have matching slugs in `design/plan.json` and the README's Exact supplier contracts: `biinterpretation-homotopy`, base logic §0.2; `function-field-cyclic-hasse-norm`, ArithmeticGaloisDuality §R02.3.2. Their hypotheses and missing interfaces are precise, with named earlier suppliers. The number-field Hasse norm theorem does not discharge the function-field gap, and interpretation composition alone does not provide definable homotopies. Neither gap is a finding.

## Not verifiable

- The primary works `kato_hasse` (Corollary p.145 and p.149), `merkurjev_suslin` (Theorem 12.2), `moret_bailly` (Lemma 11.1(i)) and `lenstra_cm` (Theorem 1(a)) remain settled uncertified. Available citing papers were used as corroboration, not certification of the primary proofs. No new request or renamed work key was made.
- Jannsen's arXiv-v2 statements were read. The README's crosswalk to published numbering was not independently certified against the publisher's typesetting.
- Stacks tags 031T, 032A, 0C0S and the supplied smooth-point material were checked. The broad reference to the entire Resolution of Surfaces chapter was not re-read chapter-wide; no new theorem-number claim is made for it. The dimension-three resolution reference remains the previously verified Cossart–Piltant introduction theorem.
- Ownership was checked against main, board packages and the supplied/indexed open heads exposed by the roadmap service. Unspecified pull-request files outside that accessible set were not checked.

These limitations are separate from the six actionable findings. Neither the source limitations nor successful elaboration is used to certify the false intermediate claims in R01–R03.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9: the source says K-valued sums of chosen z-coordinates detect L; it should use extension-valued coordinates and test the corrected form over K_u; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says x composed with the separable endomorphism supplies a simple pole; it should use z=y/x because x has a double pole; affects the proof.
- **Gap** in poonen_uniform at proof of Lemma A.5, p. 14: the source says the Laurent-series passage preserves the coefficient setup at any smooth closed point; it should justify inseparable residues using successive DVRs along a regular local flag; affects the proof.
- **Misprint** in pop_eei at proof of Fact 1.3, p. 8: the source says the multilocal field has coefficient field κ_p; it should allow the unramified extension with residue field κ_x, which need not equal κ_p's residue field; affects the proof.
- **Misprint** in dittmann_pop at Proposition 3.10, Claim 1, p. 12: the source says the divided slot has a positive epsilon term; it should have a negative epsilon term since a=u²−u−ε; affects the proof.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says arithmetic composites are indexed by rank-one W_T; it should use full geometric flags ending in a number field; affects a stated result.
- **Misprint** in dittmann_pop at Lemma 5.3, Claim, p. 17: the source says a tuple avoiding the polynomial zero set has root-of-unity coordinates; it should choose the tuple in the residue torus first; affects the proof.
- **Error** in pop_eei2 at Notation 3.5, p. 2102, and Recipe 5.1, p. 2109: the source says the strict threshold uses v(2n) also in characteristic two; it should use v(n) there because 2n=0; affects the proof.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says the finitely generated arithmetic core is necessarily Dedekind; it should invert a nonzero conductor element before invoking normality; affects the proof.
- **Misprint** in akns at §2.9, p. 19: the source says the characterizing sentence ranges over every structure; it should restrict to finitely generated structures as its definition requires; affects a stated result.
- **Misprint** in akns at Lemma 3.8, p. 23: the source says the coefficient sum starts at zero although its digits start at one; it should start at one; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9d484c9fb4942806c06b4943f9f60de0ed304818", "job": "REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
