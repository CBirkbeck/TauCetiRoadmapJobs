<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6394880876 -->
Review (claude) of 4617e2b

Verdict: needs changes

1. **F01** (P2) Scope and §7.7 name roadmaps that exist nowhere as owners

   **Location.** README line 9: "belongs to the continuation GeometricSatakeAndFusionPartIIRationalGelfandProof". Line 11: "R-smooth full-fixer embeddings require the integral-representation continuation named ReductiveGroupsIntegralRepresentationsPartII". Line 1022 (§7.7 route): "Use the R-smooth integral full-fixer embedding from the reductive-group integral representation continuation."

   **Claim.** These roadmaps own those topics, and §7.7's input comes from the second one.

   **Witness.** Neither name is on main (4aeb1cc), in an open roadmap PR, on the board, or in ORDER.txt. Both appear only as split proposals in this package's `plan.json` `restructure`. Line 71 sends the same input to ReductiveGroupsPartII.

   **Repair.**
   - Line 9: "The independent rational Gelfand commutativity proof, metaplectic Satake and rational Witt equivalence over larger algebraically closed residue fields are outside these layers." Name no owner that does not exist.
   - Line 11: delete the sentence that names the two continuations. Keep the requests: "R-smooth full-fixer embeddings are requested from ReductiveGroupsPartII (gap:r-smooth-full-fixer-embeddings); the modular minuscule tests from RootSystemsPartII, 'Independent continuation briefs' (gap:minuscule-dominance-tests, gap:minuscule-root-coefficients, gap:minuscule-cartan-coefficients)." The proposed name RootSystemsPartIIMinusculeBounds can go too, since that section exists.
   - Line 1022: "Use the R-smooth full-fixer embedding contract gap:r-smooth-full-fixer-embeddings."

   **Test.** After the edit, every roadmap the README names resolves, and §7.7's input has one owner, the one `plan.json` names. F02 and F07 remain settled (see below). This finding concerns only the names the repair added.

2. **F02** (P2) Three gaps ask GeometricSatakeAndFusion to rebuild objects this roadmap defines

   **Location.**
   - README line 99: gap:polynomial-bd-projectivity, "Give ind-projectivity and the generic and companion fibres of polynomial BD modification functors".
   - Line 113: gap:polynomial-closed-immersion-criterion.
   - Line 111: gap:standard-chain-flatness, "flatness of standard minuscule GL and GSp lattice-chain incidence models".
   - These objects are defined here: §1.1, line 315, "Define Fl^P_(𝓗,0)(R) as the isomorphism classes of a 𝓗-torsor on R[u]"; and §2.6, line 468.

   **Claim.** The earlier roadmap GeometricSatakeAndFusion can supply these properties as contracts.

   **Witness.** GeometricSatakeAndFusion (head 0652974) has no O[u] Beilinson–Drinfeld Grassmannian and no lattice-chain incidence model; "polynomial", "[u]", "Görtz" and "Levin" do not occur. To supply these properties it must define §1.1's functor and §2.6's model: two owners, or a cycle.

   **Repair.** Give each object one owner.
   - (a) Polynomial BD functor. The accepted design's `restructure` assigns "polynomial BD criteria" to GS0's algebraic prefix. If that stands, restate gap:polynomial-bd-projectivity as "Define the polynomial BD modification functor Fl^P for smooth affine O_K₀[u]-groups and prove …". Then delete §1.1's definition here and list it under Scope as owned by GS0. Otherwise keep §1.1 and make ind-projectivity and fibres (LEV Theorem 4.2.10) and the closed-immersion criterion (KPZ §3.3.5, via PZ Proposition 8.1) targets of §1.1, and drop both gaps.
   - (b) Chain models. Keep §2.6 here and make GL/GSp chain flatness its theorem, with the algebraic Schubert contracts as inputs. Drop gap:standard-chain-flatness from README and `plan.json`.

   **Test.** No gap's `needs` names an object whose definition is in this README.

3. **F03** (P2) Five gap contracts are compound or vague

   **Location.** README line 157 (gap:parahoric-bernstein), 59 (canonical-module-connectedness), 61 (normality-descent-and-algebraization), 135 (general-tube-cohomology) and 127 (wild-admissible-closedness), with the same `needs` in `plan.json`.

   **Claim.** Each gap is one precise contract.

   **Witness.** Line 157 bundles seven results (Satake parameters, z_Φ, constant terms, inner forms, level change, unramified isomorphism, companion comparison); the repair grew it from three. Lines 59, 61 and 135 bundle two each. Line 127 presupposes polynomial models that non-quasi-tame G lacks.

   **Repair.** Split each gap into one slug per result, with the same slug, supplier and section in README and `plan.json` `gaps`, and name the slug in its consuming `*Needs:*` line.
   - parahoric-bernstein → `parahoric-satake-central-functions`, `centre-constant-term-injectivity` (Haines §11.11), `inner-form-central-support` (Haines Proposition 11.12.6, AGLR line 3006), `parahoric-level-change`, `unramified-bernstein-spherical`, `companion-hecke-comparison`.
   - canonical-module-connectedness → S₂-ification connectedness criterion; depth deformation.
   - normality-descent-and-algebraization → fpqc descent of normality; algebraization of equivariant formal isomorphisms.
   - general-tube-cohomology → GL Theorem 4.7 comparisons; tube-transfer criterion.
   - wild-admissible-closedness → "the special-fibre map of canonical deperfected admissible loci induced by 𝒢→Res_(O_K/O_F)𝒢₀ is a closed immersion". This suffices with Nakayama on a proper finite map.

   **Test.** §8.4's route, line 1103, then names one slug per input.

4. **F04** (P2) Three gaps ask in part for what earlier roadmaps already provide

   **Location.**
   - Line 151: gap:semisimple-trace-and-comparison, "the scheme/analytic nearby-cycle comparison for proper local-model schemes".
   - Line 123: gap:rational-central-nearby-cycles, "constant-term comparisons on bounded integral v-local models".
   - Line 107: gap:algebraic-demazure-fibres, "the algebraic Demazure resolutions".

   **Claim.** These pieces are missing from earlier roadmaps.

   **Witness.**
   - (a) ClassicalAdicEtaleCohomology §4.5a (head dfcb6b7, line 2151; order 64) identifies scheme RΨ with adic nearby cycles, inertia-compatibly.
   - (b) GS0 (head 0652974, line 949) builds their "constant-term compatibility" (AGLR Proposition 6.13).
   - (c) GS0 line 785 builds "reduced-word Demazure resolutions".

   **Repair.**
   - (a) Add a supplier contract "From TauCetiRoadmap.ClassicalAdicEtaleCohomology: §4.5a". Narrow the gap to the proper-pushforward identity for semisimple traces, plus the adic-to-v-sheaf step only if no earlier roadmap states it.
   - (b) Narrow to the central convolution isomorphism (AGLR Proposition 6.17, line 2239) and cite GS0 for the constant terms.
   - (c) Narrow to the connectedness of parahoric-projection fibres and cite GS0 for the resolutions.
   - Make the same edits in `plan.json`.

   **Test.** On (a): the node xy=π Check of §4.5a gives R¹Ψ=Λ(−1). That is the comparison §8.1 uses, so nothing it states remains in the gap.

5. **F05** (P3) Needs and Dependencies lines still over-list inputs

   **Location.**
   - Line 570, §3.4 Needs: "GeometricSatakeAndFusion GS0, 'Bounded admissible affine flag loci'; gap:central-nearby-cycles-algebraicity".
   - Lines 784 and 857: the Dependencies of Layers 4 and 5.
   - Lines 833 and 79: §5.4 is stated for "a connected parahoric", while its gap supplies jets only "at the stated very special companion level".

   **Claim.** Each line lists what its statement and route use.

   **Witness.**
   - §3.4 (line 564) uses no nearby cycles, yet §5.1 needs §3.4 (line 796), so Layer 5 waits on GS2 central sheaves.
   - No Layer 4 Needs line cites SchemeAndStackFoundations; no Layer 5 line cites it or ModularCurves §0G.

   **Repair.**
   - Delete gap:central-nearby-cycles-algebraicity from §3.4.
   - Rebuild each layer's Dependencies as the union of its Needs lines.
   - Either restrict §5.4 to the very special companion level that §5.5 uses, or widen gap:translation-stabilizer-jets to connected parahorics, in both files.

   **Test.** Layer 5's Dependencies then carry neither SchemeAndStackFoundations nor ModularCurves.

6. **F06** (P3) A reversed map, an undefined symbol and three locators

   **Location.**
   - Line 863: "periodicity isomorphisms θ_b from M_(bΛ) to the b-conjugate O_B-action on M_Λ".
   - Line 940: "Then M^loc≅M_(Dr,F₀,n=2)⊗O_E".
   - Line 648: §4.4 cites KPZ "Proposition 4.2.13, pp. 36–37".
   - Line 887: §6.2 cites SW 21.6.4–21.6.6.
   - Line 1101: "Theorem 8.3, p. 52, AGLR line 2953".

   **Claim.** The conventions and locators are exact.

   **Witness.**
   - SW lines 7624, 7634: θ_b runs M^b_Λ→M_(bΛ), so line 863's composite is ill-typed.
   - M^loc is defined nowhere (line 21); KRZ's model needs p≠2 (KRZ line 516).
   - Correct locators: KPZ lines 1612–1695; SW line 7668; AGLR line 2963.

   **Repair.**
   - Line 863: "θ_b: M_Λ^b≅M_(bΛ); the composite M_Λ^b→M_(bΛ)→M_Λ is multiplication by b".
   - Line 940: write "the canonical local model Mᶜᵃⁿ", as §6.5 does.
   - Correct the three locators: proof of KPZ Theorem 4.2.3, §4.2.15, pp. 37–39; add SW Remark 21.6.7, p. 200; AGLR line 2963.

   **Test.** At p=2 with F/F₀ unramified, M_Dr⊗O_E is regular and has diamond Mᵛ by the adjoint comparison, so it is Mᶜᵃⁿ.

7. **F07** (P3) Repair residue: 179 doubled full stops, missing spaces, a garbled sentence

   **Location.**
   - Lines 173–837, for example line 173: "Return E as the fixed field of the stabilizer of {μ}..".
   - Missing spaces: "taking0" and "Cases1–3" (800), "parameter1" (813), "characteristic2" (817), "codimension1" (970–992), "multiplicity1" (992), "footnote5" (362), "AGLR7.13" (586), "type𝓛" (863), "SW§21" (887, 940), "degree−d" (960, 1002).
   - Line 717: "This avoids the false unrestricted Weyl-dual argument in the unrestricted Weyl-module duality argument."

   **Claim.** The README is clean house style.

   **Witness.** Before the repair, `grep -c '\.\.$'` returns 0 lines; after it, 179. The F10 deletion of each " (KPZ line …)." left that bullet's own full stop in place.

   **Repair.**
   - Replace the final ".." by "." on those 179 lines.
   - Insert the missing spaces.
   - Line 717's last sentence: "Weyl-module duals are never replaced by Weyl modules of the dual highest weight."

   **Test.** `grep -c '\.\.$'` returns 0.

Scope: `packages/GeometricSatakeAndFusionPartII/README.md` (1152 lines), `Suggested.lean`, `metadata.toml` and `sources.toml` at the board head 4617e2b, with `design/plan.json` read for the gaps and the restructure list. The round-1 review is checked finding by finding under Verified sound. The repairs changed 644 README lines (board diff 7896af2..4617e2b). Every changed passage was re-read and given an adversarial pass. The table below also covers the 15 seeded targets and the gap contracts. There are 7 findings: 4 blocking (P2) and 3 non-blocking (P3).

## Verified sound

### Round-1 findings, one by one

| Finding | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 | line 258: "a specified closed immersion M^♦↪Gr_(𝒢,Spd O_E) inducing an isomorphism M^♦≅M^v_(𝒢,μ)"; blow-up negative control at line 272 | repaired |
| F02 | line 9: "Metaplectic Satake and rational Witt equivalence … are outside these integral local-model layers" | settled (not actionable). The reason holds: the parent GeometricSatakeAndFusion (head 0652974, lines 66–69) delegates these topics, and only a human can reallocate them. The named owner is new (R01). |
| F03 | line 414: "excluding every adjoint simple factor Res_(L/K)PGL_m(D), with L/K tame, m≥1 … index is divisible by p"; propagated to §§2.4 and 3.3 | repaired (KPZ line 475) |
| F04 | line 1087: "For every connected reductive G/F, every parahoric 𝒢, every dominant μ and every residue characteristic, τ_q belongs to Z(H(G(F_r),P_r))" | repaired (AGLR lines 129–161, 2940–3043); the enlarged gap is R03 |
| F05 | line 574: "By GeometricSatakeAndFusion GS0, 'Bounded admissible affine flag loci', its reduction is … A_(𝒢,μ)" | repaired |
| F06 | line 149 cites `VanishingCycles.semisimpleTrace`, `_refinement` and `_additive` (LPV head 8f3e9b1, lines 1405–1414); the gap is narrowed | repaired; a further overlap with another roadmap is R04 |
| F07 | 35 gaps, each consumed by at least one `*Needs:*` line | settled. The splits were made. The supplier-scope part is a declared contract, so the reason holds. Residue is in R01 and R03. |
| F08 | line 11 no longer lists polynomial lifts; gap:polynomial-parahoric-lifts appears in 7 Needs lines and translation-stabilizer-jets in §5.4 | repaired |
| F09 | line 1149: "Lemma 5.27, p. 34; finite universal homeomorphism onto the image"; `sources.toml` locator and cited_for set | repaired |
| F10 | RZ17 line 1115, PRLSV, KP line 3722 (4.7.7) and GL Theorem 1.3 on p. 2 all corrected | repaired; the deletions left residue (R07) |
| F11 | line 15 and the Lean docstring no longer narrate removed declarations | repaired |
| F12 | the 19 Needs lines are now specific | partly repaired; the layer Dependencies keep the pattern (R05) |
| F13 | line 1024: "the finite map to the Grassmannian is a closed immersion exactly when its schematic image is normal" | repaired |
| F14 | computed Checks at lines 250, 297, 536 and 879; quotient definition at line 930 | repaired |

### Sample locators: 15 of 15 read

| Target | Text read | Outcome |
| --- | --- | --- |
| 1.3 | KPZ Thm 3.2.9 and footnote 5, p. 19 (line 859); LEV Thm 4.2.7, p. 25 (line 1024); KP Thm 2.1.2 and Cor 2.1.3, p. 151 (line 1279) | match |
| 2.5 | KP Lemma 2.3.3, §2.3.4, Prop 2.3.7, pp. 156–158 (lines 1474–1540) | match; p∤\|π₁(G^der)\| is an extra hypothesis that KP §2.3.1 does not impose (P3 note) |
| 4.1 | KPZ Def 4.1.4, p. 31 (line 1347) | match |
| 4.4 | KPZ Def 4.1.2 (line 1338); Prop 4.2.13 (line 1552); type cases (lines 1612–1695) | statements match; locator in R06 |
| 4.6 | KPZ Def 4.2.6, (4.2.7) and Remark 4.2.8, p. 34 (lines 1481–1497) | match |
| 4.8 | KPZ §4.3.1 and (4.3.6), pp. 40–41 (lines 1737–1781) | match; the README's sign caveat is correct |
| 5.1 | KZ §5.2.1 and proof of Prop 5.2.3, pp. 48–50 (lines 2120–2207) | match |
| 6.1 | SW Defs 21.6.1–21.6.2, p. 199 (lines 7622–7640) | conditions match; θ_b direction in R06 |
| 6.2 | SW Thm 21.6.4, Rem 21.6.5, Cor 21.6.6 (lines 7644–7667) | match; locator in R06 |
| 6.3 | SW Def 21.6.8, pp. 200–201 (lines 7685–7707) | match |
| 6.4 | SW Prop 21.6.9 and Cor 21.6.10, pp. 201–203 (lines 7710–7769) | match |
| 6.6 | SW §21.8 and Thm 21.8.1 (lines 7839–7918); KRZ Def 2.1.1 (line 535) | match; notation in R06 |
| 7.3 | GL Lemma 3.3, Prop 3.4, Cor 3.5, pp. 6–7 (lines 255–297) | match |
| 7.8 | KZ Prop 3.1.14, p. 21 (line 948) | match |
| 8.4 | AGLR Thm 1.3 (line 141), (8.6)–(8.8), Thm 8.3, Lemma 8.4 (lines 2940–3043) | match; line number in R06 |

No locator was flagged as unverified by the author. Also read, outside the sample: KPZ Prop 2.2.2, §§3.3.1–3.3.7, Thm 3.3.25 and Rem 3.3.26 (lines 475, 900–954, 1125–1137); HLR Cor 9.2 and Ex 9.4 (lines 1816, 1860); KZ Prop 3.1.9 and Lemmas 3.1.10, 5.2.5 (lines 874, 909, 2317); FHLR Lemma 5.27 (line 1540); PZ (9.9) and Thm 9.16 (lines 3118–3134); GL Def 1.1, Lemma 1.2, Thm 1.3, Cor 1.4 and §3 (lines 30–83, 226).

### Adversarial table

| Statement | Instances tried | Values computed (statement / instance) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: integral order | PGL₂, X_*=ℤ | α∨↦2; 2−0∈2ℕ; 1−0∉2ℕ | 0≤2, 0 and 1 incomparable | none |
| Conv.: apartment sign | GL₂, diag(t,t⁻¹) | cocharacter (1,−1); acts by −ν (GL line 226): (−1,1) | holds | none |
| 0.4 central-lift Check | SL₂→PGL₂; GL₁→1, μ=0 | α∨↦2ω∨; 2n=1 has no integer solution; both closures Spd O_F | holds | none |
| 0.5 specification | P¹_(O_F); blow-up at a special point | P¹: diamond is an isomorphism onto Mᵛ, one component; blow-up: div(π)=P̃+E (multiplicities 1,1), E^♦→one point, so not a monomorphism | holds | F01 repaired |
| 0.5 uniqueness | cuspidal cubic over O_E | generic fibre not smooth, so excluded by the generic-flag clause; smooth generic fibre with reduced special fibre gives normal by trait normality | holds | none |
| 0.6 cusp Check | k[t²,t³]⊂k[t] | finite, birational, one point over the cusp; t∉k[t²,t³] | holds | none |
| 1.3 normality | GL₂ Iwahori | special fibre k[b,c]/(bc): two smooth components, not normal as a whole; KPZ needs quasi-tame and p∤\|π₁\| | holds | none |
| 2.1 index Checks | PGL₂(D), ind 3 and ind 2, p=3 | 3\|3 excluded (KPZ line 476, "prime to p"); 3∤2 allowed; relative rank 1 | holds | F03 repaired |
| 2.4 G′=G clause | Rem 3.3.26 against Prop 2.2.2 | README uses "index prime to p", which is Prop 2.2.2's condition and at least as strict as Rem 3.3.26 | holds | none |
| 2.5 hypotheses | KP §2.3.1 | KP: tame, minuscule, symplectic Hodge; README adds p∤\|π₁(G^der)\|, which neither route nor consumer uses | P3 note (item 7) | none |
| 2.8 trace form | K=F, r=1; F_p(t^(1/p)) | Ψ(e₁,e₂)=1; inseparable trace 0 makes the form degenerate | holds | none |
| 3.1 PU₃ Check | ramified F′/F, p=3, μ=(1,0,0), O_(F′)³ | \|π₁(PU₃)\|=3; HLR Cor 9.2(2): M not normal, special fibre non-reduced; quasi-minuscule Schubert dim 2 = dim P² | holds | none |
| 3.5 imported reduction | GL₂, μ=(2,0) | dim A = ⟨2ρ,μ⟩ = 2 | holds | F05 repaired |
| 4.1 / 4.2 curve span | x²+xyz | f(f+gh)=0 ⇒ f′(0)=0; tangent dimension 3, span dimension 2 | holds | none |
| 4.4 tests | B₃ μ=re₁; C_n μ=(r/2)^n; D^R μ=re₁ | ⟨μ−ν,ω₃⟩=(r−Σν)/2; ν₁≤r/2; r−Σ_(j≤n−1)ν_j±ν_n ≥0 ⇒ all partial sums ≥0 | holds | locator R06 |
| 4.6 FM bound | λ=μ; μ=0 | t^μ∈S^FM (KPZ line 1486); μ=0 forces lattice O^n | holds | none |
| 4.8 Cartan | SL₂, x₋α(1) | Ad(x₋α(1))E = E−H−F (matrix product); KPZ prints X_α+H_α+X₋α | holds with README caveat | source issue |
| 5.1 orbit step | D₄ triality, λ=2ρ, μ=λ+θ | orbit sum of α₁+α₂ has coefficients (1,3,1,1) against θ (1,2,1,1) | existential step needed | none |
| 5.3 kernel | G_α→G^der | G_α→G^sc is injective, so the kernel lies in ker(G^sc→G^der), of order \|π₁\| | holds | none |
| 5.4 scope | connected parahoric against gap | statement general, gap very special only | mismatch | R05 |
| 6.1 θ_b | SW condition 4, b∈B×∩O_B | SW composite M^b_Λ→M_(bΛ)→M_Λ = ·b; README direction leaves the composite ill-typed | defect | R06 |
| 6.1 quaternion Check | F=Q_p, R⊇F_(p²); R=F_p | F_(p²)⊗R=R×R, ranks (1,1) against (2,0); over F_p a field, no idempotent | holds | none |
| 6.3 / 6.4 | h=3, d=1 | quotient rank 1, kernel rank 2; kernel ξe₁⊕e₂⊕e₃, determinant ξ | holds | none |
| 6.5 Drinfeld quotient | n=2 | O_D⊗K̄=M₂(K̄), quotient of R-rank 2, flag P¹; rank 4 excluded | holds | none |
| 6.6 signature | r_φ0=r_φ̄0=1; r∈{0,2} | weights (1,0),(1,0) give P¹; (0,0) or (1,1) give a point | holds | notation R06 |
| 7.2 two translations | line through a sphere | at most 2 intersection points | holds | none |
| 7.3 S₂ | GL₂ Iwahori node | dimension 1, depth 1 = min(2,1) | holds | none |
| 7.7 immersion iff image normal | cusp; identity A¹ | cusp: image not normal, not an immersion; A¹: normal, immersion | holds | F13 repaired |
| 7.8 lattice test | GL₃, diag(π⁻¹,1,1) and diag(π⁻²,1,1) | first: πgΛ/πΛ = k·e₁; second: π⁻¹e₁∈πgΛ, not ⊂Λ | holds | none |
| 8.2 F_r | E/F ramified quadratic, r=1; E=F, r=2 | F₁=F, q=\|k_F\|; F₂ unramified quadratic, q=\|k_F\|² | holds | none |
| 8.2 IC dictionary | d=0,1; q=9 | τ=φ=1; τ=(−1)·9^(−1/2)·1 = −1/3 | holds | none |
| 8.3 sign | AGLR (1.4), line 131 | κ=(−1)^d·Σ(−1)^i Tr = (−1)(−1/3) = 1/3 = κ^ss | holds | none |
| 8.4 normalisation | hyperspecial GL₂ (1,0), q=9 | z^ss=κ^ss gives image 1/3·1_(KμK); φ=q^(1/2)z gives 1_(KμK); PZ (9.9): τ^ss=−1/3 | holds | none |
| 8.4 μ=0 | any parahoric | V₀ trivial, trace 1, z=1_(P_r)=κ=τ=φ | holds | none |
| 8.4 lift against average | quadratic inertia character | single lifts give ±1; average 0 = invariant trace (LPV `semisimpleTrace_quadratic`) | holds | none |
| 8.1 unipotence | N(e₂)=e₁ | N≠0, N²=0 | holds | none |
| gaps: ownership | the three GS gaps | no polynomial BD or chain model at GS head | two owners | R02 |
| gaps: precision | the 35 gaps | 5 are compound or vague; 3 partly provided elsewhere | defects | R03, R04 |

### Library, citations and supply

- **Pinned Mathlib (6b7abb3).** Opened at the pin:
  - `Submodule.span`, Mathlib/LinearAlgebra/Span/Defs.lean:46
  - `Algebra.trace`, Mathlib/RingTheory/Trace/Defs.lean:70
  - `Module.Grassmannian`, Mathlib/RingTheory/Grassmannian.lean:66 (quotient rank)
  - `traceForm_nondegenerate`, Mathlib/RingTheory/Trace/Basic.lean:501 (FiniteDimensional and IsSeparable)
  - `AlgebraicGeometry.Scheme`, Mathlib/AlgebraicGeometry/Scheme.lean:40
  - `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono`, Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:392
- **Pinned Tau Ceti (a91d3aa).**
  - `TauCeti.AlgebraicGeometry.ZariskiTangentSpace`, TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65
  - `Derivation.adjointWeightSpace`, TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100
- **Headline carriers at the pins.** There are zero hits for affine Grassmannian, loop group, parahoric, Bruhat–Tits, nearby cycle, kimberlite, Schubert variety, Iwahori–Weyl and B_dR. The Tau Ceti hits for "Satake", "LocalModel" and "HeckeAlgebra" are modular-forms or function-field sections.
- **Cross-roadmap citations resolved.**
  - GeometricSatakeAndFusion (#1235, head 0652974): GS0 bounds (line 344), ind-properness (843), admissible loci (947), flag correspondences (971), equal-characteristic Schubert models (785); GS2 (1341); GS4 normalized equivalence (2026). No GS target is re-planned here. §1.6's integral GL case is not in GS0, which has only generic minuscule flags (line 507).
  - ReductiveGroupsPartII (#785, head 1383569): RG2.0a (944), RG2.1 (1446), RG2.2 (2832), RG2.3.3 (4152), RG2.3.7 (5202), RG2.4 (5510), RG2.5 (6705); the R-smooth exclusion is at lines 86–98.
  - SmoothRepresentationsOfLocalGroups (#785): SR.1 (974), SR.3.2 (2604), SR.4.1 (3084).
  - LefschetzPencilsAndVanishingCycles (#873, head 8f3e9b1): LPV.0 (319), §1.10 (1396), LPV.6 §§6.1–6.2 (3275, 3295).
  - PELModuli (#966, head e6a4fe8): M0 (420).
  - EtaleDualityAndPerverseSheaves (#1040, head 34e0692): §§2.1–2.10 (1344–2540).
  - ClassicalAdicEtaleCohomology (#875, head dfcb6b7): §4.5a (2150).
  - Board designs: RootSystemsPartII RS2.4 (410, 472, 501) and its continuation briefs MB.1–MB.3 (600); DiamondsAndVStacksPartII D10.8–D10.15 (1150–1297) and D11.1–D11.20 (1317–1790).
  - Main (4aeb1cc): ModularCurves §0G (427); SchemeAndStackFoundations §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1 and 4.6–4.14 (lines 798–5706).
- **Gaps.** All 35 slugs agree between the README and `plan.json` (same supplier and `needs`). None has supplier `none`, and each is consumed by at least one Needs line. The R-smooth gap goes to a supplier whose scope excludes it; that is a declared contract (F07), so it is not raised.
- **Supplier order.** Dependency check with `--movable`:

      depcheck: 49 roadmaps, 563 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. All named suppliers precede position 290.
- **Ownership against open work.** Searched by object (test-function conjecture, Scholze–Weinstein conjecture, local-model normality, tubes) on main, at open heads and in board packages. The only other hit is DiamondsAndVStacksPartII D10.14, which is consistent with this roadmap. Board packages that turned out not to overlap:
  - SmoothRepresentationsOfLocalGroupsPartII: unitary theory; it places parahoric centres outside its scope.
  - LefschetzPencilsAndVanishingCyclesPartII: the smooth-chart curve, not KZ Proposition 5.2.3.
  - SchemeAndStackFoundationsPartII (head accb0a0): flat cohomology.
  - ReductiveGroupsPartIII: no R-smooth target.
- **Shape.** The section order matches upstream, and every layer ends with Examples and Dependencies. Every definition has at least 3 Checks. There is no LaTeX, no `lemma`, no pull-request number and no algorithm. The `sources.toml` manifest has 16 certified keys and is unchanged.
- **Lean.** `lake env lean` on `Suggested.lean` with an absolute path, from the content checkout (Mathlib 6b7abb3, Tau Ceti a91d3aa), exited 0 with no messages in 3.3 s.
  - The file has one module docstring, `import Mathlib` only, a namespace, no `set_option` and zero declarations. So the `#check @name` binder audit has nothing to compare, and the one-tactic padding probe does not apply.
  - The docstring names every README headline with its missing carrier (§§1.3–1.5, Layer 2, §§3.1–3.3, 3.6, 4.7–4.11, 5.5, 6.2–6.6, 7.5–7.8, 8.1–8.4). None is statable at the pins, so an empty acceptance file is correct.

## Not verifiable

- **gap:wild-admissible-closedness.** It is not certain the requested closedness is a known theorem. KZ Lemma 3.1.10 (line 912) cites FHLR Lemma 5.27, which gives only a finite universal homeomorphism (FHLR line 1540), and no checked source proves more. If it is open, the gap exports this roadmap's own open step.
- **KZ.** Only the author version v2 was read; the published wording was not collated.
- **§4.9.** The type-D end-weight family that RootSystemsPartII's brief flags was not re-derived.
- **Sources.** No new source was fetched, and no sampled text was unreadable.

## Source issues

- **Misprint** in KPZ at proof of Theorem 4.2.3, type D, p. 38: the source gives the last simple root as e_(n−1) added to itself; it should be e_(n−1)+e_n; affects nothing.
- **Misprint** in KPZ at §4.3.1, p. 40: the source gives the conjugate of X_α by x_(−α)(1) with all coefficients +1; the H_α and X_(−α) coefficients are −1; affects nothing.
- **Gap** in KPZ at Remark 4.2.8(3), p. 34: the source derives the right FM inclusion by dualizing V(−w₀ν); that dual is the induced module, not the Weyl module V(ν), in characteristic p; affects nothing.
- **Misprint** in KPZ at proof of Theorem 4.2.3, type B, p. 37: the source gives ϖ_i as i copies of e_i; it should be e₁+⋯+e_i; affects nothing.
- **Error** in KPZ at Remark 4.1.5(2), p. 31: the source calls x²+xyz=0 a normal surface (and lists variables x, y, x); it is x(x+yz), reducible and not normal at 0, in variables x, y, z; affects nothing.
- **Misprint** in KPZ at Remark 3.3.26, p. 26: the source excludes only anisotropic factors of p-divisible degree; it should be every Res PGL_m(D) with p dividing the index, as in Proposition 2.2.2; affects a stated result.
- **Gap** in KZ at proof of Proposition 5.2.3, pp. 49–50: the source sums a whole Frobenius orbit of a valid root step; under D₄ triality the sum exceeds the bound; the step must be chosen existentially; affects the proof.
- **Misprint** in KZ at Lemma 5.2.5, p. 52: the source assumes the translation lift lies in G(F_q[[t]]); it should lie in G(F_q((t))), only the conjugator being integral; affects a stated result.
- **Gap** in KZ at Lemma 3.1.10, p. 20: the source says FHLR Lemma 5.27 gives a closed immersion; that lemma gives a finite universal homeomorphism onto the image; affects a stated result.
- **Misprint** in SW at §21.8, p. 206: the source lists GL₂ components (1,1), (0,0), (2,2); these are signature values, the weights being (1,0) at the distinguished embeddings; affects nothing.
- **Gap** in SW at §21.8 and Theorem 21.8.1, pp. 204–206: the source admits p=2 (unramified), but the cited KRZ model with reduced special fibre is built only for p≠2; affects a stated result.
- **Misprint** in PZ at §9.d.3(a), p. 76: the source gives the minuscule IC trace factor q^((ρ,μ)); by (9.9) and geometric Frobenius it should be q^(−(ρ,μ)); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4617e2b", "job": "REV-PKG-GeometricSatakeAndFusionPartII~2", "model": "opus", "worker": "fable-rev99"} -->
