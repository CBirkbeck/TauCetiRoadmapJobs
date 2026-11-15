# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at 3a5156d)

**Verdict:** needs changes

Incremental re-review of 133 changed lines since c154465. Two findings, both P3.

## R01 (P3) — §2.9: the page of the convention cited from Groechenig–Wyss–Ziegler

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md` line 551: “Theorem 1.4, p.3; §2.1, p.5, where X(O_F) is regarded as a subset of X(F).)”

**Claim:** The added clause places the convention “X(O_F) as a subset of X(F)” on p.5.

**Witness:** `geometric_stabilisation_via_p_adic_integration` line 268 (arXiv v2): the convention is stated after the page break of line 264, on p.6; p.5 (lines 248–263) holds only the definition of the measure of a form and the opening of the construction.

**Repair:** Replace the clause by “Theorem 1.4, p.3; §2.1, pp.5–6, where (p.6) X(O_F) is regarded as a subset of X(F).)”

## R02 (P3) — gap:definable-remmert-stein is stated for two different ambient spaces

**Location:** `README.md` line 109: “in an o-minimal expansion of R_an, for an open subset M of a complex projective space, a closed complex analytic subset E⊆M and a closed complex analytic subset A⊆M∖E definable in that expansion” (also lines 24 and 1657).

**Claim:** This is the contract registered under the slug `definable-remmert-stein`.

**Witness:** `packages/LogicAndDefinabilityInNumberTheory/design/plan.json`, same slug: “For a smooth complex algebraic variety S, a closed complex analytic E⊆S^an …”. A disc in ℙ¹ is an M and no S; a smooth proper non-projective threefold is an S and no M.

**Repair:** State one form in both places; the registered one suffices for §6.8. Line 109: “… the closure theorem they give: in an o-minimal expansion of R_an, for a smooth complex algebraic variety S, a closed complex analytic subset E⊆S^an and a closed complex analytic subset A⊆S^an∖E definable in that expansion, the closure of A in S^an is complex analytic (Peterzil–Starchenko, Theorem 4.4, p.12).” Line 24: “the definable Remmert–Stein closure in smooth complex algebraic varieties”. Line 1657: “The closure theorem in a smooth variety used in the proof …”; line 1659: “Write Y as a closed subvariety of a Zariski-open subset W of projective space, a smooth quasi-projective variety, …” (tested: W=ℙᴺ∖Z is an S, E and A as there).

## Previous findings

- The previous report (of c154465) raised no finding; its D01 (the Néron-pairing gap registered in `plan.json`) stands: the slug is in the plan and at README line 77.

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| §2.9 Weil volume, with “separated” added | 𝔸¹; 𝔾_m; two copies of 𝔸¹_O glued off the closed point x=0 | vol of image in X(F): 1; 1−q⁻¹; 1 (image O_F, sections x=a, a∈πO_F, lift twice) | #X(k)/q: q/q=1; (q−1)/q; (q+1)/q | Equal in the two separated cases, 1<(q+1)/q in the third: hypothesis needed, Check correct; none |
| §2.10(a), identity components | split Tate curve over ℚ₃, φ=[2], deg 4 | ker on 𝒜°: 4 geometric points on the generic fibre, μ₂ (order 2) on 𝔾_m | finite flat would need constant order | Quasi-finite étale, not finite; special fibre [2] on 𝔾_m étale isogeny, 2=2 points over 𝔽₃; none |
| §2.12 Fubini, base-first convention | projection, ω_Y=πdx; r=2; a=xy | θ=π⁻¹dy: q⁻¹·q=1; θ=π⁻²(dy)^⊗2: density q, base q⁻¹; da∧(−dx/x)=x dy∧(−dx/x)=dx∧dy | vol(O_F²)=1; wrong direction θ=πdy gives q⁻²; (dx/x)∧da=dx∧dy for the opposite order | All four Checks recomputed and agree with the sign stated in the section; none |
| §2.2, large residue characteristic via §1.5(b) | hypothesis of (b): truth in κ((t)), char κ=0 | cell partition holds in every henselian (0,0) Denef–Pas field, so in each κ((t)) | (b) then gives all allowed fields above N(θ) | Route closes; *Needs* and Layer 2 Dependencies list §1.5; none |
| §2.4 / §3.9, integrability locus moved | φ(a,b,c;x)=ab−c on F | integrable iff c=ab; h=ab−c constructible | graph of multiplication not Presburger-definable | §2.4 keeps the definable-domain form, §3.9 the zero-locus form; no Layer 2 section consumes h or G; none |
| §3.9 route, descent of residue parameters | finite fibre of size ≤q^s, summands h² | Σh²=0 | every h=0 | As in the proof of Theorem 4.3.2 (source line 1743–1747); *Needs* now lists §3.4; none |
| §3.11 Checks | 𝔾_m, ℙ¹, 𝔾_m²; Euler characteristic of ℂ-points | [ℚ(1)]−1; 1+[ℚ(1)]; [ℚ(2)]−2[ℚ(1)]+1; 𝕃↦1, 1−𝕃⁻¹↦0 | 1−𝕃⁻¹↦1−[ℚ(−1)], inverted in M_loc | Consistent with 𝕃↦[ℚ(1)] of the section; none |
| §4.12 sequence coding | P(11,4); P(5,2); y=3 and y=6 for (1,1,2) | 91+4=95, 11 mod 5=1, 11 mod 9=2; 15+2=17, 5 mod 5 ↦ 5; moduli 4,7,10 (gcd(4,10)=2) and 7,13,19 | list (1,2); remainder in 1..m; x odd and even at once | Checks correct; pairing and remainder as Davis lines 172–209; none |
| §4.24 and `Suggested.lean`: `rationalDiophantine`, `rational_nonintegers_diophantine` removed | negation of `universal_integers` | t∉ℤ ↔ ∃y, p(t,y)=0 | the removed statement | One `not_forall` step from the kept headline: padding, rightly removed; README names neither; none |
| §4.29(c), fibrewise models | v↦wv; du∈k×p; curve z^p=QR | (wv)^p=w^p·du, so K_u≅K_(uw^p); K_u=k^p (ζ∈k); N(z)=z^p=P(x) | U_u≅U_(uw^p); field iff du∉k×p; curve lies in every U_u | Conditions depend on the class only; compactification is RoS §6.2 (main, line 893) over k; none |
| §4.29(b), fibre at a zero M of P | K⊗k(M) field (Q has no zero in K, deg Q=p) or split | one Galois orbit of p hyperplanes, closure K⊗k(M); or p components, closure k(M) | abelian extension of k(M) | Cyclic of degree p or trivial; reduced since the p linear forms are distinct; none |
| Model-completeness Checks | ℚ⊂ℚ(√2); ACF | ∃x x²=2: false, true; 1+1=0: true in char 2, false in ℂ | not model complete; model complete, not complete | Correct; none |
| gap:ran-exp-analytic-cells (§§6.3, 6.10) | supplier ShimuraVarieties §3.5a at its open head | §3.5a states o-minimality and continuous cells only | van den Dries–Miller §4.2, p.12 (line 502–510): analytic decomposition for R_an,exp | Not provided, precise, one statement; slug in plan; none |
| gap:block-family-covering (§§6.13–6.16) | supplier B2.6 at its open head (line 1515) | B2.6 states the arc corollary and “construct the decomposition” without a statement | Pila 2009 Definition 3.2 (line 221, p.5), Theorem 3.5(1)–(2) (line 265, p.6) | Not provided; README statement equals the source's; none |
| §6.8 route | Y closed in Zariski-open W⊆ℙᴺ | E closed analytic in W; A closed in W∖E since Y∖E is | Peterzil–Starchenko Theorem 4.4 (line 596, p.12): M a complex manifold, E analytic, A locally definable | Closure analytic in W, inside Y, definable; see R02 for the wording of the contract |
| §6.16 route, branch by branch | n=1, k=2, X=(0,∞), ξ=(−1,0,1) | larger-root branch: 1∈X; smaller-root branch: −1∉X | block images must lie in X_t | Family {ξ∈U_i : φ_i(ξ)∈X_t} per branch gives this; exponent ε/k against height 2^kT^k gives T^ε; none |
| §7.1(d), §7.3 induction | V′=A₁ | infinitely many special (CM) points, 0 isolated ones | finitely many isolated special points | Agrees with the source's proof (lines 813–819, p.677): finite-to-one, maximal orbits ↔ isolated special points; none |
| §7.7, U the weight −2 part | universal elliptic curve: W=V, dim 2 | U trivial | centre of W is W | U≠centre; Gao Definition 2.1(3) (line 243, p.6), Notation 2.8 (line 313, p.8); none |

Rows for the untouched statements stand as in the previous review, of c154465.

- Source locators checked against the text: 14 (Cluckers–Gordon–Halupczok Theorems 3.1.1–3.1.5 pp.11–12, §3.4 pp.17–19, Theorems 4.3.1–4.3.3 p.32, §4.5 pp.38–42, Proposition 4.5.12 p.38; Cluckers–Loeser 7.5.3–7.5.4 pp.43–45; Pila Definition 3.2, Theorem 3.5; Peterzil–Starchenko 4.4; van den Dries–Miller §4.2; Pila–Tsimerman Lemmas 7.2–7.3, 7.5–7.6 and the proof of Theorem 7.1, pp.674–677; Gao 2.1(3), 2.8; Colliot-Thélène–Van Geel §4, p.14; Davis Theorems 1.1–1.3, pp.236–238); one wrong page (R01).
- Seeded sample in changed passages: §§4.12, 7.1, 7.3 (above); §§3.4, 2.3, 2.8, 3.5, 3.8, 0.4, 4.15, 4.18, 4.21, 4.23, 4.26, 6.14's locators are unchanged (6.14's route is in the table).
- Cross-roadmap citations resolved: ShimuraVarieties §§3.5a, 3.5d and AbelianSchemesAndArithmeticModuliPartII B2.6 at their open heads; ResolutionOfSingularitiesCharacteristicZero §6.2 on main. README line 24's list of consuming sections agrees with the *Needs* lines (§3.4d no longer in §6.8; §3.5a in §§6.2, 6.3, 6.6, 6.10).
- Declared gaps: four slugs, the same in `plan.json` and in the README, suppliers earlier in the merge order; a search of the open roadmaps and main finds no other statement of analytic cells for R_an,exp, of the definable closure theorem or of basic block families.
- Gate: every check passes at 3a5156d (worker's run, targeted build included). Dependency check, my run: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else; 14 declarations (3 definitions with bodies, 11 theorems), none with a lost binder in the worker's signatures; the diff adds no declaration, so no one-tactic probe was due.
- Pull request text against this head: no sentence contradicted; the change adds or drops no supplier, section or heading, and the description names no declaration that was removed. Remark, as before: the sentence ending “and builds:” has no list after it.

Overlap check: read ShimuraVarieties, StratifiedSpacesAndTameTopology, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, RandomGraphs, ComputabilityTheory, ClassicalArithmeticCompletion; nothing shared. The change hands three objects to their owners as declared gaps (analytic cells and the definable closure theorem to ShimuraVarieties §§3.5a, 3.5d; the block-family covering to AbelianSchemesAndArithmeticModuliPartII B2.6) and no other pull request changes this roadmap.

Source independence: changed passages only; 9 passages compared with 7 sources, none shared beyond the wording a definition forces (the basic-block clause, Pila Definition 3.2); no layer added, removed or reordered, so the arrangement was not compared again; the result of the review of a546807 (largest share Cluckers–Loeser, contents independent) stands.

## Not verifiable

- Bosch–Lütkebohmert–Raynaud §7.3, Proposition 6, p.180 (`blr`, uncertified): cited by locator for the étaleness in §2.10(a); the text was not read.
- As before: `review_source_27`, `schneider`, `hodges` (uncertified) and the waived `vd_dr_tame`, `vd_dr_macintyre_marker`, `pila_wilkie`, `cl_addenda` are cited by locator only.

## Source issues

- **Misprint** in integrability_of_oscillatory_functions_on_local_fields_transfer_p at proof of Theorem 4.3.2, p.39: the source says a sum of squares of reals is nonzero exactly when each term is nonzero; it should be zero exactly when each term is zero; affects nothing.

## For the human reviewers

- The primary texts of Denef, Schneider, Bosch–Lütkebohmert–Raynaud and Hodges are cited by locator without the text (uncertified); four further citations are waived (vd_dr_tame, vd_dr_macintyre_marker, pila_wilkie, cl_addenda).
- An acceptance would be conditional on the four declared supplier gaps (README lines 77, 107, 109, 119), none of which its supplier states yet: three are new at this head, on ShimuraVarieties §§3.5a, 3.5d and AbelianSchemesAndArithmeticModuliPartII B2.6.
