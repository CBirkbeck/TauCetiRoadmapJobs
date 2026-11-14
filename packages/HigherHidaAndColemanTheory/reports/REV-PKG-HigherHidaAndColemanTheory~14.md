<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6885310136 -->
Review (codex) of 2d468ca

Verdict: needs_changes

1. **F01** (P2) Restore the continuous ℂ_p-weight slope theorem

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1146, §6.6b(2): “Transposed bounds, for C=L a finite extension of F.”

   **Claim:** The second pair of analytic slope bounds is planned only over finite extensions, although the cited theorem treats every continuous ℂ_p-valued weight. The repair report explicitly acknowledges this narrowing and justifies it by the needs of the selected consumers. That is precisely the route-dependent restriction prohibited by the review contract. Keeping the finite-field duality theorem as an intermediate result is appropriate; deleting the remaining cases from the slope theorem is not.

   **Witness:** BP-Coleman line 7690–7694, Theorem 6.8.3, p.167, quantifies over continuous ℂ_p-valued characters for both pairs of bounds. A character with ν(4) transcendental over ℚ₃ cannot be valued in any finite extension.

   More explicitly, choose a transcendental a∈1+9O_ℂ₃ and define ν(ζ4^z)=a^z on ℤ₃×, trivial on μ₂; use this on one torus coordinate in the modular-curve datum. The binomial series gives a continuous character. At w=1 the two positive bounds evaluated on diag(3⁻¹,1) are −1 and 0. A putative slope −1/2 passes the first and fails the second. The existing theorem leaves the second implication unstated at this weight. This tests the omitted domain, not the existence of such a geometric eigenclass.

   **Exact repair:** Retain the finite-L pairing of §6.6a, but state and supply the corrected four-bound theorem at least for every continuous ℂ_p-valued weight, as in the cited source. Add an explicit finite-block specialization argument before the consumers: realize the weight on a weight affinoid, use §§6.3–6.4 to retain the perfect slope complex under completed field extension, and use the finite spectral algebra of a commuting torus operator on its cohomological support. A strict violation of a bound gives a nonempty admissible spectral locus; a finite-residue-field point there contradicts the finite-L bound. State the support/base-change step as a target with its inputs; retain derived specialization and total cohomological support rather than asserting that individual cohomology modules commute with every fiber. The finite spectral construction is supplied by PadicFamilies §§2a.15–2a.16. This route does not require unrestricted topological Serre duality over ℂ_p and does not use §6.9 or classicality circularly. An alternative proof is acceptable if it actually supplies the same domain.

   **Repair test:** For the character above, the repaired quantifier includes ν, and the second bound excludes −1/2 while allowing the endpoint 0. Keeping only finite-L weights does not pass this test. The missing +ρ in the source's second negative bound remains corrected as E17; restoring the coefficient domain does not restore that misprint.

2. **F02** (P2) Require a compact controlling operator for finite slope blocks

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1123, §6.6a(3): “between the parts of slope ≤h for a chosen t and for t⁻¹.”

   **Claim:** The finite-dimensional perfect-pairing assertion does not restrict this chosen t to a potent compact operator. The preceding quantified action is for t∈T^±, which includes the identity. Adjointness for this monoid is valid, but it does not make its bounded-slope pieces finite-dimensional. The route refers to §6.3, whose statement does impose this hypothesis; it must also appear in the new theorem's statement.

   **Witness:** BP-Coleman line 7648 selects t∈T⁺⁺ and a compact lift; line 7656 then takes finite slope blocks. For U(zⁿ)=pⁿzⁿ on L⟨z⟩, U≤2 has dimension 3; the identity's slope-zero part contains every zⁿ.

   The finite-slope union for U is ⊕ₙ≥0 Lzⁿ. The identity commutes with U, acts with eigenvalue 1 on the entire union, and its slope ≤0 part is infinite-dimensional. This is also the type of infinite union explicitly acknowledged by the new Check at line 1136. It distinguishes the finite-block assertion from nondegeneracy on the union.

   **Exact repair:** State: for t∈T⁺⁺ on the positive side, or t∈T⁻⁻ on the negative side, with the potent compact realization of §6.3, and a slope cutoff h, the matching t/t⁻¹ slope blocks are finite-dimensional and perfectly paired. Keep adjointness for every t∈T^± in item (2), and the separate nondegeneracy and character-block conclusions in item (3). Add the U versus identity computation as a negative-control Check.

   **Repair test:** With U as above and h=2, both paired blocks have basis indexed by n=0,1,2 and dimension 3. With t=1 and h=0, dimensions of polynomial truncations are 3,6,12,…; the revised assertion does not claim finiteness for their union.

3. **F03** (P2) Supply the duality step in the algebraic four-bound theorem

   **Location:** packages/HigherHidaAndColemanTheory/README.md:913 and :915, §5.5: “Estimate pullback and trace on the small smooth affinoids, retaining their separate normalization factors.” The Needs line omits §5.6(b).

   **Claim:** Four algebraic inequalities are promised, but the route and inputs supply the direct lattice estimates without the duality producing the second inequality for each sign. The needed algebraic pairing is owned here in §5.6(b), after its consumer. This is the same missing-transposition pattern repaired for the analytic theorem, found by checking the rest of the package.

   **Witness:** BP-Coleman line 5704–5711, §5.9.8, p.123, reduces the four inequalities to two using Theorem 5.7.2. For w=1, κ=(5,3;−8), t₂=(-1/2,-1/2;-1/2), the two positive lower bounds are 0 and 3.

   Here w0Mκ=(3,5;−8), 2ρ_nc=(−3,−3;0), and κ∨=(0,−2;8). The direct positive lattice estimate permits slope 2. On the dual negative coefficient, the direct estimate at t₂⁻¹ is 3. The perfect pairing identifies the corresponding eigenvalue at t₂⁻¹ with the original eigenvalue at t₂, so slope 2 is excluded only after transposition. No other item on the present Needs line supplies that identification.

   **Exact repair:** Put the algebraic finite-slope pairing before §5.5, preserving old identifiers by moving §5.6 as a whole or separating its pairing into a preceding target with an explicit old-to-new reference. Add the pairing target to §5.5's Needs. In the proof route, prove the two direct estimates, apply them to κ∨ and the opposite sign/boundary variant, and use adjointness to obtain the other two. The existing §5.6 route does not depend on §5.5, so this creates no cycle. Retain both boundary variants and the finite-block formulation.

   **Repair test:** The direct positive threshold stays 0; transposing the negative estimate for κ∨ gives 3. Slope 2 is thereby excluded, and slope 3 is not excluded by these non-strict necessary inequalities.

4. **F04** (P3) Specify the split-point and geometric-connectedness hypotheses in the new Checks

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1134 and :1137, §6.6a Checks: “the pairing is multiplication L×L→L”; “On a proper smooth curve X with a nonempty reduced divisor D, H¹(X,ω)=F”.

   **Claim:** A finite torus Shimura variety need not be one split point, and a smooth proper curve over F need not have constant field F. The stated scalar dimensions do not follow from the given hypotheses.

   **Witness:** For two split points, H⁰(O)=L² and the trace pairing is x₁y₁+x₂y₂. For X=ℙ¹_E viewed over F with [E:F]=2, H¹(ω_X/F)=E has F-dimension 2, not 1.

   The latter X is smooth, proper and integral over F, so assuming “curve” means integral does not repair the example. With D the E-rational point at infinity, dim_F H⁰(O_X(D))=4. If disconnected curves are allowed, X=ℙ¹_F⊔ℙ¹_F with D on only the first component also gives H⁰(O_X(−D))=F, contradicting the claimed vanishing.

   **Exact repair:** Make the first Check explicitly a single split point with trivialized coefficient line, or give the finite étale formula Tr_(B/L)(xy) for a finite étale L-algebra B. In the curve Check require X geometrically connected over F and D a nonempty reduced effective divisor. Add the two-point or quadratic-constant example as the negative control explaining the restriction.

   **Repair test:** For X=ℙ¹_F and D={∞}, H¹(ω)=F, H¹(ω(D))=0, H⁰(O(−D))=0 and H¹(ω(−D)) has dimension 2. The asserted boundary-variant distinction then holds. For B=L×L the corrected trace formula pairs (1,0) and (0,1) to 0, and (1,0) with itself to 1; both factors have dimension 2.

Four findings: three P2 and one P3. The package inputs were not edited. Elaboration succeeds, and the mechanical dependency check finds no upward edge or cycle. The remaining changes concern mathematical scope, an omitted compactness hypothesis, an internal proof dependency, and two newly added Checks.

## Verified sound

### Previous finding and changed passages

The preceding review had one finding, F01. Its repair was read first, then the new statements, changed consumers, source discussion and manifest locators were checked against the source text.

| Previous finding | Repaired passage in packages/HigherHidaAndColemanTheory/README.md | Independent result | Status |
|---|---|---|---|
| F01: missing quantified analytic bounds and preceding analytic pairing | §6.6b, line 1145: “Direct bounds, for every C (including ℂ_p).” §6.7, line 1171: “*Needs:* §6.6; §6.6a; §6.6b; §1.2.” | The analytic target now exists, has both signs and both boundary variants, and precedes BGG exclusion. At the previous GSp₄ witness the thresholds are 0 and 3, excluding slope 2. Its second pair was restricted to finite extensions; R01 restores the missing domain. The new pairing needs R02 and its Checks need R04. | Partly repaired |

The repair's reason for restricting the field is correct about the available topological-duality contract, but does not justify narrowing the roadmap's theorem to what the chosen consumers use. It is not recorded as a finding “not actionable in this package”; F01 was marked applied. The finite-family route in R01 addresses the stated obstacle without silently strengthening the supplied topological duality.

The new E17 correction passes two checks: transposition gives −a_an, and twisting the algebraic negative bound gives b_an+w⁻¹2ρ_nc. At w=1 in C₂ these equal (−3,−3); the printed formula gives (−2,−1). §§6.7–6.8 now cite the analytic theorem and pairing explicitly; §6.9 uses finite-field pairings to test family amplitude and does not assert unrestricted family perfect duality. The same dependency pattern was searched in §§1.2,5.5–5.8,7.6,8.5; R03 is the additional omission. Earlier spherical-Hecke ownership and level-comparison repairs remain intact. No maintainer notes were supplied.

### Coverage, principles and shape

Read all four package inputs, the 68 numbered subsections and 68 Needs lines, the previous review/repair, the ten plan gap records, the board-package index, and the supplied overlap data. All 24 construction API blocks have at least three Checks (minimum 3, maximum 8); there are 39 Checks blocks. All nine layers end in Examples and Dependencies. The new Check defect is R04. Main-branch SmoothRepresentationsOfLocalGroups and LieHighestWeight were read for the repository's shape and their ownership boundaries.

The scope retains p=2, singular weights, rootless Coleman data, general quasi-split abelian-type Coleman geometry and the nonfinite Klingen tower. The integral genus-at-least-three amplitude conjecture is separated from the proved all-genus rational theorem. The hyperspecial restriction defining a spherical Hecke algebra is not used to discard the other geometry. R01 is the new route-dependent narrowing. No computational algorithm, sorry-valued data, set_option, admitted example, source-chapter heading, process narrative or machine path occurs in the package's roadmap text. No second copy on main was found.

For untouched, nonsampled statements, the preceding review's numerical rows were reused only where they display actual values. Newly added or changed passages and this round's samples were read and recomputed. Further controls include Ω² of rank 1 versus Ω¹ of rank 2 on a surface; the cusp inclusion (q)→O becoming zero on the boundary fiber; nonflat quotient A²→A²/{±1} having generic degree 2 and origin fiber length 3; and over ℤ₂ the augmentation of C₂-invariants having image 2ℤ₂, versus all of ℚ₂ after inversion. None permits an omitted flatness or averaging hypothesis.

### Seeded source sample

All 15 seeded targets were checked against the four readable cached editions in sources.toml. Printed page markers, numbering, hypotheses and normalization were compared. There is no author-flagged unverified locator requiring an additional text. References to source misprints were checked as mathematical claims, not accepted as instructions.

| Target | Source and locator read | Result |
|---|---|---|
| §1.1 cohomological weight dictionary | BP-Coleman line 90–162, 2376–2447 and 7385–7414, §§1.1,4.1 and Theorem 6.5.5, pp.2–4,50–51,160–161; BP-Hida line 1734–1795, §3.1, pp.33–34 | Opposite-parabolic roots, left Weyl action, inverse dictionary and central parity agree. Serre dual coefficient retains −2ρ_nc. |
| §2.4 strict dynamics | BP-Hida line 954–999, Theorem 2.5.1 and Proposition 2.5.4, pp.19–20 | Artinian base, strict dynamical hypotheses, finiteness and support-order comparison retained. |
| §2.6 Artinian/equivariant perfectness | BP-Hida line 1102–1131, Theorems 2.6.8,2.6.10 and Lemma 2.6.11, p.22 | A-flat and A[Γ]-flat coefficients are not replaced by arbitrary finite modules; the torsor instance permits p-torsion in Γ. |
| §3.5 fixed-weight perfectness | BP-Hida line 2647–2661, Proposition 4.4.5, p.51 | Perfect integral object and independence of contracting operator agree; no cohomological flatness is inferred. |
| §3.8 spherical action | BP-Hida line 184–197, 2234–2258 and 2954–2955, §§1.4,4.2,5.4, pp.4,43–44,57 | Source specifies the Hecke actions. Supported ring-action relations are explicitly constructed here using imported algebra and correspondence composition. |
| §4.7 finite ordinary Hecke images | BP-Hida line 2954–2955, §5.4, p.57 | The Λ-algebra generated by the action is finite; scalar closure and commutativity are supplied separately. |
| §5.5 proved local bounds | BP-Coleman line 5694–5711, Theorem 5.9.6 and §5.9.8, pp.122–123 | Four formulas agree; missing transposition input is R03. |
| §5.7 Cousin/interior | BP-Coleman line 5296–5328 and 5550–5620, Theorem 5.5.1, Theorem 5.7.3, Corollaries 5.7.5,5.7.7,5.8.1, pp.113–114,119–121 | Bruhat filtration, complementary ranges and interior image agree; interior is not equated with either full theory. |
| §6.1 normalized analytic action | BP-Coleman line 7170–7217 and 7385–7414, Lemmas 6.3.10–6.3.11 and §6.5.4, pp.155–156,160–161 | Unit factors, trace normalization and opposite analytic/distribution twists retained. |
| §6.6a analytic duality | BP-Coleman line 7555–7657, Theorems 6.7.1–6.7.2 and proof, pp.164–167; line 1487–1502, Proposition 2.7.3, p.32 | Complementary supports and BGG pairing agree; field restriction is explicit. Compact t chosen in source is missing from the bounded-slope statement (R02). E7 correction is justified. |
| §7.2 classical eigenpackets | BP-Coleman line 7744–7822, Theorem 6.9.3, pp.169–170 | Full Weyl choice, Levi lift and sufficient converse retained. No converse without the prescribed slope conditions is asserted. |
| §7.4 torsion freeness/specialization | BP-Coleman line 7826–7869, Proposition 6.9.5, pp.170–171 | Bottom torsion freeness and the directed specialization maps agree; fiber of image is not falsely identified with image of fiber. |
| §8.2 ordinary comparison | BP-Hida line 3064–3075, 3114–3128 and 3177–3205, Propositions 6.1.7,6.1.11 and Theorem 6.2.9, pp.59–62 | Integral ordinary localization and rational finite-slope comparison are distinguished; lattice and compactness hypotheses retained. |
| §9.1 four Siegel weights | BP-Hida line 1734–1795, §3.1, pp.33–34; BP-Coleman line 6548–6586, §5.14.3, pp.141–142 | Anti-diagonal form, left representatives, parity and four weight expressions agree. |
| §9.2 modular curve | BP-Coleman line 6536–6547, §5.14.2, p.141; BP-GL2 line 75–175, Theorems 1.2–1.4 and §2.1, pp.2–4 | Operator rescaling, strict endpoints and degree-one dual weight agree. The source's extra minus sign is not propagated. |

Additional source passages compared for wording and proof inputs were §§4.3,4.5,5.6,6.6b,9.8: BP-Hida line 2842–2856 and 2919–2953; BP-Coleman line 5456–5468 and 7690–7705; Pilloni-Singular line 3283–3307. The four works have one manifest key each and legal cache provenance; the author-edition/version notes explain pagination. No fetch or manifest change was needed.

### Computed adversarial table

The table covers every seeded target, all ten headlines, the altered arguments and every finding. Entries marked retained use the earlier review's computed control on an unchanged statement; the sample and repair rows were recomputed this round. Numerical tests distinguish hypotheses and conventions; they are not proofs of the geometric theorems.

| Statement | Instance | Values computed on both sides or against the wrong model | Result/change |
|---|---|---|---|
| §1.1 dictionary and §9.1 | C₂, ν=(0,−2); ρ=(−1,−2) | κ=(5,3),(5,1),(2,−2),(0,−2); applying the inverse dictionary returns (0,−2). Duality reverses the four weights. | Correct; no change. |
| §1.1 singular chambers | κ=(k+2,2) | κ+ρ=(k+1,0), two compatible chambers; applying a second −ρ would instead yield (k+2,2). | Shift used once; no change. |
| §2.4 finiteness | Point over F₂, zero operator, identity on affine line | Ordinary identity gives F₂; zero gives 0. F₂[t] is infinite; at infinity identity would require a≥b while strictness requires a/b<1. | Infinite countermodel fails strictness. |
| §2.6 perfectness | A=ℤ/4; M=F₂ | Tor_i^A(M,F₂)=F₂ for every i≥0; A-flat complex excludes M. | Finiteness alone insufficient; hypothesis retained. |
| §2.6 equivariance | Γ=C₂ over F₂ | Regular F₂[Γ] is free rank 1; trivial F₂ has infinite periodic Tor; augmentation of regular module has dimension 1. | Torsor flatness survives p=2. |
| §3.5 integral object | [O --p→ O] | H⁰=0,H¹=O/p; complex is perfect, H¹ is not flat. | Correct distinction. |
| §§3.8,6.10 Hecke relations | GL₂, ℓ=2,3 | (ℓ+1)²=(ℓ²+ℓ)+(ℓ+1): 9=6+3 and 16=12+4. E₁₂E₂₁=diag(1,0) differs from reverse product diag(0,1). | Hecke algebra supplies commutativity; End alone does not. |
| §3.8 spherical hypothesis | Iwahori, ℓ=2,3 | ωs=diag(1,ℓ), sω=diag(ℓ,1), distinct I-double cosets; spherical double cosets coincide. | Negative control retained. |
| §4.7 finite image | Λ=ℤ₃[[X]], scalar image; N²=0 | Λ-span of integer scalars is Λ, whereas integer image is ℤ; Λ[N]/N² has Λ-rank 2. | Central Λ closure and nilpotents retained. |
| §4.6 derived control | [ℤ/9 --3→ ℤ/9], fiber F₃ | Integral H⁰=3ℤ/9,H¹=F₃; derived fiber has differential 0 and H⁰=H¹=F₃. | Retained: ordinary tensor of cohomology is insufficient. |
| §4.8 duality | g=2, length 1; g=1 | d=3, dual length 2, ranges [1,3] and [0,2] pair into degree 3; modular dual weight is 2−k. | Retained: target shift [−3] agrees. |
| §§4.9,8.4 amplitude | g=1,2,3 | d=1,3,6; integral theorem only first two; rational ranges [ℓ,6] and [0,ℓ] intersect in {ℓ}. | Retained: no general integral amplitude claim. |
| §5.5, R03 | w=1, κ=(5,3;−8), t₂ | Direct bound ⟨(3,5;−8),t₂⟩=0; second ⟨(0,2;−8),t₂⟩=3. Dual κ∨=(0,−2;8) gives 3 at t₂⁻¹. | Add pairing dependency; slope 2 fails only second test. |
| §5.7 Cousin and interior | Two cells; map F→F | Two columns give the two-term Cousin complex; interior image is 0 for zero map and F for identity. For length ℓ, [0,ℓ]∩[ℓ,d]={ℓ}. | Correct image and degree conventions. |
| §5.8 classicality | GL₂ k=2,1; C₂ κ=(2,2) | k=2 standard threshold 1 excludes equality. κ+ρ=(1,0) gives lengths 0,1; k=1 has two compatible chambers. | Retained: singular range is not one degree. |
| §6.1 normalization | p=3, unit u=2; twist exponent 3 | ν(u)=2 versus inverse 1/2; evaluation product 1. Eigenvalue p² twisted by p⁻³ has slope 2−3=−1. | Unit and slope signs agree. |
| §6.3/§6.4 family specialization | A=F⟨t⟩, [A --t→ A] | H⁰=0,H¹=A/t; fiber t=0 has F in both degrees, Tor₁^A(A/t,F)=F. | No flat-cohomology shortcut. |
| §6.6a adjointness | One split point, unit with ν(u)=2 | Left side 2; action by u⁻¹ on distribution line also 2; using u gives 1/2. For η(t)=p², η⁻¹(t⁻¹)=p², but v(η⁻¹)(v(t))=−2. | Correct inversion. |
| §6.6a finite blocks, R02 | U(zⁿ)=pⁿzⁿ; identity | U slopes 0,1,2,…, dim U≤2=3. Identity slope 0 on every n, truncation dimensions 3,6,12,… . | Require potent compact t. |
| §6.6a boundary Check, R04 | ℙ¹_E/F, [E:F]=2, D=∞ | dim_F H¹(ω)=2≠1; dim_F H⁰(O(D))=4. On ℙ¹_F the corresponding dimensions are 1 and 2, and H⁰(O(−D))=H¹(ω(D))=0. | Add geometric connectedness. |
| §6.6a torus Check, R04 | B=L×L | dim_L B=2; trace pairing e₁,e₂=0 and e₁,e₁=1, versus a claimed one-dimensional multiplication pairing. | Use split point or finite étale trace formula. |
| §6.6b corrected identities | C₂,w=1 | a=(3,3), b=0, 2ρ_nc=(−3,−3); a+2ρ_nc=0=−b; b+2ρ_nc=(−3,−3)=−a. Printed second negative expression gives (−2,−1). | E17 correction sound. |
| §6.6b rootless case | ρ=ρ_nc=0 | All bounds give 0; rescaling a group element by p gives slope 1 and inverse slope −1. | Wrong rescaling excluded. |
| §6.6b field scope, R01 | p=3, ν(4)=a transcendental, GL₂ w=1 | Bounds at diag(3⁻¹,1): −1 and 0; −1/2≥−1 but −1/2<0. No finite L contains a. | Restore second bound at this ℂ_p weight. |
| §§6.6b–6.8 BGG witness | κ=(5,3;−8), v=s0 | ν_v=(−3,1;8); κ_1(ν_v)=(2,6;−8), 2<6. Pairings a_an=−3, ν_v=−3, 2ρ_nc=3; twisted thresholds 0,3. | New analytic theorem excludes slope 2; slope 3 remains. |
| §§6.7–6.8 negative comparison | λ−=−2; same v | −λ−=2 fails threshold 3; at λ−=−3 the value 3 meets both thresholds. | Pairing produces correct reversed exclusion. |
| §6.9 family range | Domain A, finite perfect complex in nonnegative degrees | Bottom H⁰=ker(P⁰→P¹)⊆P⁰ is torsion-free; A/t has t-torsion and cannot be such a bottom kernel in a projective module. | Fiber-amplitude route has content, not flatness. |
| §7.1 eigenvariety | Identity differential F→F; single H¹ line | Total cohomology 0 gives empty support; H¹=F gives one spectral point despite H⁰=0. | Retained: all degrees are used. |
| §7.2 sufficient converse | W_M=1; maximal nonzero degree q | Only identity Levi term; ν_w(κ_w(ν))=ν. In Tor spectral sequence p≤0, a source for a differential into (0,q) has higher q and is zero by maximality. | Edge survival justified. |
| §7.4 image specialization | Multiplication t:A→A at t=0 | (t)⊗_A F≅F but image(0:F→F)=0; the natural surjection is F→0. | Surjectivity is not isomorphism. |
| §7.5 dimension | Finite faithful A[N]/N²; vertical A/t | First has dimension dim A and is torsion-free over A; second has dimension dim A−1 and t-torsion. | Retained: hypothesis excludes vertical component. |
| §7.6 sharp interior slopes | κ=(5,3); torus | Naive thresholds 3,4,4,8 become 0,1,1,5 after stated rescaling; torus d=0 only degree 0. | Retained normalization. |
| §8.2 ordinary versus finite slope | p on ℤ/p² and on ℚ_p | Square zero integrally gives ordinary part 0; rationally invertible eigenvalue has slope 1. Identity has slope 0 and ordinary part all coefficients. | Two comparisons are not conflated. |
| §8.5 sharp Siegel bound | Middle chamber, κ=(5,3;−8) | Proved §5.5 threshold 3, sharp threshold 4; slope 3 fails strict <3 but satisfies <4. | Retained: nontrivial strengthened window. |
| §9.2 curve degree-one normalization | k=2,0,1 | Standard thresholds k−1=1 at k=2 and 1−k=1 at k=0; at k=1 both thresholds 0, so no positive strict window. | Degree-one duality and endpoints agree. |
| §9.8 Klingen control | p=3,k=1; p=2 | Satake values 1,1,9,9 give operator values 2,10,10,18 of valuations 0,0,0,2. Rational k=0 is included; torsion requires k>3 at p=2. | Retained: rational and torsion ranges distinct. |

Additional retained numerical rows for the untouched sections: §§5.2/6.2 use z=3 and z=9 to distinguish relative from absolute support inclusions; compact-radius functions at n=4,8,12 have norm 1 on the smaller disc and norms 3,9,27 on the larger one. In §9.6, D(f(pz))=p(Df)(pz), giving 3 rather than 1/3 at p=3; F[y]/y² has primary dimension 2, residue dimension 1 and Tor₁ dimension 1. In §9.7, r=2,k=0 gives geometric threshold 1, combined minimum −2, degree-zero minimum 1. In §9.9, n=2,ν=(4,2,0) gives (−3,−5,2),(0,−5,−1),(0,−2,−4), with d=2. These unchanged controls produce no further repair.

### Pinned declarations, headlines and padding

The following declarations were opened at the supplied library pins, including the assumptions of their native carriers:

| Declaration | File and line at pin | What it supplies and does not supply |
|---|---|---|
| Module.End | Mathlib/Algebra/Module/LinearMap/End.lean:33 | Linear endomorphisms; their ring need not be commutative. |
| zpow_sub₀ | Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402 | Integer-power subtraction with nonzero base. |
| HasDerivedCategory; DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,87 | Localization for an abelian category; no Shimura coefficient complex. |
| CondensedMod | Mathlib/Condensed/Module.lean:41,43 | Module sheaves and the abelian instance. |
| CondensedMod.IsSolid | Mathlib/Condensed/Solid.lean:83, with documentation at :74 | Direct solid predicate, with finite-type coefficient caveat; no relative analytic-localization theorem. |
| IsHeckeTriple; HeckeCoset; HeckeRing | Mathlib/NumberTheory/HeckeRing/Defs.lean:75,157,189 | Double-coset module; no product at this pin. |
| HeckeCosetModule.instRingHeckeRing | TauCeti/NumberTheory/HeckeRing/Associativity.lean:484 | Ring on a Hecke triple with coefficient ring. |
| HeckeCosetModule.mul_comm_of_antiInvolution | TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459 | Commutativity conditional on an anti-involution fixing double cosets. |

Object searches in both pinned libraries for Igusa towers, Shimura geometry, supported automorphic complexes and analytic solid localization found no actual carriers for the headlines below. Existing generic derived categories, Hecke modules and algebraic Lie representations are not those geometric objects. No assertion that an arbitrary local GSp anti-involution already exists at the pin is made by the package.

| Headline listed by the README | Treatment in Suggested.lean |
|---|---|
| §4.6 derived arithmetic Hida control | Named in docstring; missing geometric supported universal complex and tower. |
| §4.8 integral Iwasawa Serre duality | Named; same complexes and their geometric pairing absent. |
| §4.9 integral amplitude in genera 1 and 2 | Named; universal Iwasawa complex absent. |
| §8.4 rational amplitude in every genus | Named; also needs the analytic/integral family comparison. |
| §5.8 regular and singular geometric classicality | Named; Shimura varieties, period domains and supported Cousin complexes absent. |
| §7.1 cohomological eigenvariety | Named; actual weight space, coefficient sheaves and family cohomology absent. |
| §7.5 interior equidimension and deformation | Named; actual interior family cohomology absent. |
| §7.6 sharp interior slopes | Named; supported finite-slope geometric cohomology absent. |
| §8.5 sharp Siegel slopes | Named; also the integral supported overconvergent model absent. |
| §9.8 two-term Klingen control | Named; height-one tower and partial-ordinary complex absent. |

Suggested.lean has zero declarations, zero sorried theorems and zero definitions. The exhaustive one-tactic probe therefore has zero candidates, and the requested mechanical comparison of `#check @name` signatures has zero declarations to inspect. No unused implicit binders, padding, sorry-valued data or stand-in statement exists. No statable headline was found missing. The single import is `import Mathlib`; the namespace and explanatory module docstring satisfy the required form. Every backticked identifier attributed to the pins was resolved there; none falsely claims a declaration of this package.

Elaboration from the pinned content checkout with `lake env lean` on packages/HigherHidaAndColemanTheory/Suggested.lean completed with **exit 0 and empty output**, including no sorry warnings. No TauCeti object-file build was necessary, and no elaboration remains running.

### Ownership, supplier citations and gaps

The board-package index was read before checking absence on main. The roadmap service was used for object searches and to read the cited open heads; all 24 named supplier roadmaps and the 115 numbered headings in the exact contracts resolve. The citation resolver found no missing roadmap citation or local Lean name; its inability to inspect libraries on the service host was handled by the direct pin reads above. Layer-level citations were also read, including LieHighestWeight Layer 3 and the PadicFamilies spectral/ordinary layers.

The following object comparisons were resolved at their actual heads:

- Main TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1220 and :3191 (§§SR.1.2,SR.4.1) supplies the Hecke carrier/comparison and Satake. Its :1445 and :3597 supply the positive Iwahori/Klingen framework and spin parameters. HigherHidaAndColemanTheory constructs their supported actions and isolated-refinement application.
- Open #1823, TauCetiRoadmap/AutomorphicBundlesPartII/README.md:453, :736 and :1104 (§§3.0a,3.13,5.13), supplies solid correspondence operations, individual Hecke endomorphisms and unsupported hyperspecial relations. The present supported p-level and analytic-family ring actions are distinct; the partial-support extension remains explicitly declared.
- Open #1422, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1467 and :1499 (§§8.6–8.7), supplies analytic coefficient representations, their sheaves and maps. This package adds supported cohomology and analytic BGG exactness. The general abelian-type Banach descent of §6.1a is not inferred from the supplier's Hodge-type finite-flat trivialization alone.
- Open #1085, TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:2269, :2303 and :2323 (§§6.13a,6.14,6.15), owns finite-level period-map domains, torsor reductions and their correspondence action. The nonsplit image hypothesis and cyclotomic condition are retained. The present §5.1 imports these constructions.
- Open #2280, TauCetiRoadmap/PadicFamiliesPartII/README.md:7 and :11–13, imports this higher supported theory and owns Hilbert/singular extensions and the broader BGG-category functors. Its line 7 still describes an older negative exponent in this package's §9.6; the positive derivative factor is correct. That stale sentence is in the sibling, not a requested edit here.
- Open #1817, TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7–13, owns selected modularity-lifting applications and imports the higher cohomology; it does not duplicate the supported universal complex.
- Main TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:505 and :1177 supplies the native PBW/Verma inputs and Layer 3 comparisons, rather than the locally analytic supported resolution.

The remaining contract groups were read at the supplied main/open heads: AdicSpacesPartIII §§R3.1,R3.4,R3.6,R3.8; AdicSpacesPartIV §F1.10; AlgebraicModularFormsAndSerreWeightsPartII §§7.1–7.4; AutomorphicBundles §§1.4,1.5,1.9,3.3,5.2–5.4,5.10,6.1,9.1,11.10,11.16–11.17,12.1,12.11; AutomorphicFormsOnReductiveGroups §6.7; CompletedCohomologyPartII §§3.11–3.12; DeformationAndDerivedPatchingAlgebra §§7.1,7.3,7.5–7.6,7.8,7.10; IntegralHeckeAndGaloisDeterminants §§2.1,2.3; LocallyAnalyticDistributions §§3.3,4.16–4.17; PELModuli §§M2.8–M2.9,M5.1–M5.2,M5.5–M5.6; PadicFamilies §§0a.24–0a.25,2a.8,2a.15–2a.17 and Layers 0a,0,2a; PadicMeasuresIwasawaAlgebras §§1.1,1.7; PhiGammaModulesAndIwasawaCohomology §2.7; ResolutionOfSingularitiesCharacteristicZero §6.3; SchemeAndStackFoundations §2.20; ShimuraCompactifications §§0.14,4.10,6.16–6.17,7.19–7.21,7.29; ShimuraData §§3.8,3.10,3.13,5.5–5.6,5.10–5.11; SolidAnalyticRings §§7.2–7.4; and HodgeTateAndCanonicalSubgroups §5.1 as the specified gap owner.

All ten gap slugs match packages/HigherHidaAndColemanTheory/design/plan.json and the README contracts: solid-localization-kernel, discrete-adic-solid-comparison, siegel-ordinary-igusa, klingen-height-one-igusa, abelian-affinoid-basis, projective-banach-cohomology, banach-support-duality, coherent-correspondences, abelian-subcanonical-vanishing, klingen-lci-model. Each has a named earlier owner and concrete interface; the compatibilities belong to the stated construction rather than unrelated projects. The supplier sections distinguish what exists from these extensions. In particular, AdicSpacesPartIV's dagger duality retains its spherical-completeness hypothesis, and the present Banach gap explicitly concerns finite extensions of ℚ_p. No gap was treated as unowned merely because it is unfinished.

The exact requested dependency check completed with:

```text
depcheck: 244 roadmaps, 2217 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. R03 is an internal statement/route dependency, which this roadmap-level check does not detect. The overlap data have no conflicting head, dropped cited ID, open-revision-only ID or second copy; reading main and the listed heads revealed no contrary case. No forbidden supplier was introduced.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties and main SmoothRepresentationsOfLocalGroups; generic Hecke algebra/Satake belongs to SmoothRepresentationsOfLocalGroups, correspondences to AutomorphicBundlesPartII, analytic coefficient sheaves to OverconvergentAutomorphicForms, period/Bruhat/torsor geometry to PerfectoidShimuraVarieties, and higher supported family complexes to HigherHidaAndColemanTheory; the other two consume or extend these objects in their stated settings.

### Wording, arrangement and reuse

Compared the 15 sampled passages and five additional passages listed above with their source text, across all four sources. Standard names, unavoidable hypotheses and formulas coincide; no copied sentence or clause-by-clause prose substitution was found. The module docstring describes missing carriers in the package's own words. No source table, figure, exercise list, data set or external Lean formalization was found reused.

Named citation occurrences in the README, including the reference list and source-issue discussion, are BP-Coleman 73, BP-Hida 55, Pilloni-Singular 28 and BP-GL2 3, total 159. This counting convention is explicit: repeated numbered locators within one named citation are not counted separately. BP-Coleman's contents at line 18–76 were compared with the roadmap's layers and subsections. Layer 5 visits source §§4.5–4.6,5.4,5.9,5.6–5.7,5.5/5.8,5.12; Layer 6 combines §§6.3,4.4/6.6,6.4,6.1,6.5,6.2,6.7,6.8,6.6–6.7,6.9. This is not a consecutive one-to-one mapping of scope or order. The dependencies §6.2←§§5.2–5.3 and §7.1←§§6.3,6.9,6.10 force geometry before families before eigenvarieties. Layers 2–4 and 8 also use BP-Hida; Layer 9 uses Pilloni-Singular and BP-GL2. R03 repairs a local input order, not the roadmap's independent organization.

Source independence: 20 passages compared with 4 sources, no copied prose found; largest share BP-Coleman, 73 of 159 named citation occurrences; contents compared with BP-Coleman: independent.

## Not verifiable

- No required source text or contents page was inaccessible. There is no missing-text request.
- The ten geometric headline signatures cannot be elaborated on their actual carriers at these pins, for the reasons recorded in Suggested.lean and checked above. The empty file's successful elaboration does not prove them.
- Declared supplier contracts are future mathematical interfaces; their completed formal implementations could not be tested. They are not findings merely for being planned.
- The unresolved lemma reference in BP-Coleman's Theorem 6.4.3 proof cannot identify its intended original reference. The roadmap provides a separate compactness route; this does not certify the unidentified citation.

## Source issues

- **Misprint** in BP-Coleman at Theorem 6.8.3(2), printed p.167: the source says the second negative bound omits the final ρ; it should include +ρ, giving the transpose of the first positive bound; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, printed p.32: the source says the supported derived complex receives another shift by −d; it should omit that shift, or replace the derived factor with its degree-d cohomology; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3 and proof, printed p.32: the source says Ω¹ occurs in the top-degree Serre pairing; it should use Ωᵈ throughout those expressions; affects a stated result.
- **Misprint** in BP-Coleman at §5.14, display defining U_i before Remark 5.14.1, printed p.140: the source says the last diagonal block is p times the identity; it should be p⁻¹ times the identity, so all symplectic-pair products equal p⁻²; affects nothing.
- **Misprint** in BP-Coleman at §5.14.2, printed p.141: the source says the negative of the displayed pairing equals k; it should remove that leading minus, since the pairing itself equals k; affects nothing.
- **Gap** in BP-Coleman at Theorem 6.4.3 proof, printed p.157: the source says compactness follows using an unresolved lemma reference; it should identify the radius-contraction input and check its supported-model hypotheses; affects the proof.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pp.134,168: the source identifies the printed coefficient inequalities with BGG exclusion; it should derive the inequalities from the analytic bounds after each BGG character twist; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2d468caa3352c19d253f364fc7dedfff560eed3b", "job": "REV-PKG-HigherHidaAndColemanTheory~14", "model": "gpt-6-astra", "worker": "chris-10"} -->
