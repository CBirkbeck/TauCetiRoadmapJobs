<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13471#issuecomment-6852223974 -->
Review (codex) of 5ea3fc5

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) The quotient manifold has no supplied construction

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:515`, §4.4: “X = G/B is a compact ℚ_p-analytic manifold and G → X has locally analytic sections over a finite disjoint open cover of X (LocallyAnalyticDistributions §0.3)”.

   **Claim:** The cited supplier constructs this analytic quotient and its sections, which are needed to define the nowhere-vanishing function and prove density.

   **Witness:** Pull request #854, `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1346`, assumes that X is a compact analytic manifold; §0.3 constructs function spaces on it. It supplies neither the quotient G/B nor sections of G → G/B.

   I read the whole supplier subsection, not just its heading. The package's own supplier contract at README:66 correctly describes function spaces, pullback, multiplication and atlas independence. FU24 line 812 asserts the required splitting in the proof, but a source assertion is not an owned prerequisite. The closed-normal-subgroup quotient in NoncommutativeAndEquivariantIwasawa §0.2 does not apply: B need not be normal.

   **Exact repair:** Make the quotient and section construction an explicit target of §4.4. For the stated split reductive group and compact open G, give X the coset topology, construct its analytic charts and local product trivializations using the opposite-unipotent/Borel multiplication chart, and prove that translating these charts and taking a finite disjoint clopen refinement produces a locally analytic section s. Normalize s(B) = 1 for the subsequent torus Check. State the two inverse maps between Ind(χ) and C^la(X): restriction along s and F ↦ (s(x)tn ↦ χ(t)F(x)). Keep LocallyAnalyticDistributions §0.3 as the supplier of the function-space operations only.

   The existing earlier owners for the ingredients are ReductiveGroups Layer 7, specifically 7C.4–7C.5 (root-product/flag charts and Borel-opposition transport; `TauCetiRoadmap/ReductiveGroups/README.md:3064`), and ReductiveGroupsPartII RG2.0, *smooth-group-analytic-charts* (`TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`). Add these exact inputs to the contracts and Needs line; retain here the analytic quotient/finite-section adapter they do not state.

   **Repair tested:** At p = 3 in G₁, the matrix with rows (4, 3) and (3, 5/2) has determinant 1 and decomposes as lower-unipotent(3/4) times the upper-triangular matrix with rows (4, 3) and (0, 1/4). Thus x = c/a = 3/4, s(x) is lower-unipotent(3/4), and f₀(g) = 4^c for χ(t) = t^c. At the identity coset the normalization gives f₀(diag(t,t⁻¹)) = t^c. Normality cannot replace this construction: lower(3) upper(3) lower(−3) has lower-left entry −27, not 0.

2. **F02** (P2) Radius and lattice quotients lack their construction hypotheses

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:460`, §4.1: “D^λ_r(G, K) := D_r(G, K)/D_r(G, K)·ker λ; U^λ_r(g) := U_r(g)/U_r(g)·ker λ; and Û(g)_λ := Û(g_K)/Û(g_K)·ker λ”. The compatibility bullet is at line 466.

   **Claim:** These three quotients are defined in the stated setting of an arbitrary compact open subgroup of a connected split reductive group. Only the last comparison in line 466 adds uniformity.

   **Witness:** At p = 3, G = SL₂(ℤ₃) satisfies §4.1 but contains −I of order 2. It is not uniform or p-valued. Section 2.2 constructs U_r only for odd p and uniform G.

   The declared radius-algebra contract also requires a finite-rank p-valuation and (HYP); it does not provide these coordinate algebras for that G. Moreover, Convention 5 and §2.1 define Û on an integral lattice, whereas g_K in line 460 is a rational Lie algebra. FU24 line 566 explicitly assumes uniform G before introducing the radius notation; the generic rewriting lost this condition.

   **Exact repair:** Keep D(G,K)_λ and C^la(G,K)[λ] at the full generality of §4.1. Split off the radius/lattice clause: for those constructions additionally assume p odd and G uniform, set g_R = R ⊗_{ℤ_p} ((1/p)L_G), take 1/p ≤ r < 1 and the D_r and U_r of §2.2, and define Û(g_R)_{K,λ} using §2.1. Qualify all three comparison maps in line 466 by these hypotheses and retain the lattice in their notation. This restores the existing construction's scope; it does not narrow the distribution-specialisation or principal-series statements. If arbitrary compact G needs other Banach presentations, their specialized stages must instead be explicitly defined from that presentation.

   **Repair tested:** For SL₂(ℤ₃), a p-valuation would give ω((−I)³) = ω(−I)+1, contradicting (−I)³ = −I; the repaired radius clause no longer applies. For G₁ and G₁³ the rational Lie algebra is the same but the rescaled lattices are sl₂(ℤ₃) and 3sl₂(ℤ₃). The series Σₙ3ⁿhⁿ belongs to the first completion and not the second, where its coefficients in (3h)ⁿ are all 1. Naming the lattice distinguishes these objects, exactly as the existing §2.1 Check requires.

3. **F03** (P3) Three ordinal Check locators became stale

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:487`, “C₃ of the last check”; line 551, “(§4.1, last check)”; line 693, “for sl₃ they differ (§4.2, last check)”.

   **Claim:** These locators identify the SL₃ antipode example and the non-integral-parameter zero quotient.

   **Witness:** The last §4.2 Check is now GL₂ (line 500), not SL₃ (line 499). The last §4.1 Check is now generating sets (line 479), not the zero quotient (line 477).

   **Exact repair:** At lines 487 and 693 use “the SL₃ antipode Check of §4.2”; at line 551 use “the non-integral-parameter Check of §4.1”. No mathematics changes.

   **Repair tested:** The named SL₃ Check computes −6 and 6. The named §4.1 Check computes ‖Δ‖ ≤ p^(2/3) < p = |λ| and D^λ_r = 0. The remaining “last check” references in §3.4 and Source corrections 3 still identify their intended examples.

Three findings: one P1 finding, one P2 finding and one P3 finding. The four findings from round 6 are repaired. The unchanged Lean acceptance test elaborates, with its two expected `sorry` warnings only. No package source file was changed.

## Verified sound

### Previous findings, checked first

| Round 6 finding | Status and repaired passage | Verification |
|---|---|---|
| F01, reductive centre/Harish-Chandra ownership | Repaired. README:463: “Hence U(g) ≅ S(z) ⊗ U(g′), and Z(g) ≅ S(z) ⊗ Z(g′) is a finitely generated ℚ_p-algebra”. The named contract is gap:reductive-centre-split. | The same slug and supplier LieHighestWeight Layer 9 occur in the plan and README. The target uses finite algebra generators, not assumed polynomial generators. For a torus the centre is ℚ_p[x]; for GL₂ it is ℚ_p[I,Δ]. The Killing form on the central factor is zero, so the repaired split is necessary. |
| F02, unjustified integer-radius stages | Repaired. README:259 uses “r_j = `|π_E|^{−j}`” and identifies the stages with the deformed lattice completions. | For E = ℚ₃ the radii are 1,3,9,…; for ramification index 2 they are 3^(j/2). The old radius 2 is not in 3^ℚ. Noetherianity and flatness are now asserted only at the supported radii. |
| F03, wrong Schneider–Teitelbaum work | Repaired. README:20: “Schneider–Teitelbaum, Banach, Theorem 3.5, p. 15”. | ST02B line 547 is the Banach/Iwasawa duality theorem; ST02's Lemma 3.5 is a different statement. The manifest has the distinct ST02B entry. |
| F04, incomplete source target lists | Repaired. `sources.toml` includes the formerly omitted §1.2 and Layer 4 targets and the supplier contracts in the appropriate `cited_for` arrays. | All fifteen sampled targets now have manifest coverage. All fifteen cited works have one key apiece; the settled unavailable keys were not renamed or requested again. |

The repaired centre, generator, scalar-extension, antipode and radius passages were reviewed adversarially again, including their new Checks. The same patterns were searched elsewhere: §§2.1, 3.6 and 4.13 preserve ramification indices; §§4.2–4.5 preserve the antipode; §4.1 specializes over Z_K rather than Z(g). R03 records the remaining stale cross-references introduced by appended Checks. There were no maintainer notes and no settled “not actionable in this package” finding to reopen.

### Coverage and principles

Read all 710 README lines, all 113 Lean lines, metadata, the fifteen-entry source manifest, the plan's gap declarations, the previous review and repair report, the board package index and the supplied overlap/near-match/signature evidence. All 37 numbered sections and the conventions, examples, dependencies and source corrections were inspected. The recorded computations below include the fifteen seeded targets, both Lean headlines and every finding. Earlier computed round-6 rows were cross-checked where used; a prose-only assessment in an earlier review was not treated as evidence.

This is an extension of LocallyAnalyticDistributions, with its stopping point stated. No second copy of this roadmap exists on main in the inspected content checkout; the board index and open heads were searched before that conclusion. No forbidden supplier, upward edge, cycle, copied table, computational algorithm, sorry-valued data or `set_option` was found. The odd-prime restrictions are the hypotheses of the uniform first-congruence constructions; the general lattice and coefficient constructions are retained. The final injectivity theorem includes every integral parameter, including non-induced parameters, through the affinoid-Verma route. The unresolved separatedness in the alternative direct route is an explicit hypothesis, not silently assumed in the headline.

All six layers have Examples and Dependencies; the construction subsections have APIs and at least three discriminating Checks. No own backticked declaration is absent from Lean: the four names are firstCongruenceSL2, firstCongruenceProduct, isSemisimpleModule_of_finiteDimensional and exists_surjective_algHom_end_symPower. Source/library identifiers and formula notation were distinguished from promises of new declarations. The text has the required summary, scope, conventions, supplier contracts and reading guide. No job labels, machine paths, PR numbers, HTML anchors or process dates were found in the roadmap or Lean docstring. Main's LieHighestWeight, PadicMeasuresIwasawaAlgebras and ReductiveGroups were read for comparison of shape and ownership.

### Seeded source verification

Page numbers below are those of the cached versions identified in the manifest, not guessed journal pagination. The primary texts were opened at these locators. The source errors described below are already corrected or qualified by the package unless a finding says otherwise.

| Target | Text and locator actually read | Hypotheses/conclusion checked |
|---|---|---|
| 0.2 First congruence subgroups | FU24 line 123, introduction p. 3; line 931, §6 p. 19 | Odd p; SL₂ first congruence subgroup, products and dimension. The p=2 non-example prevents using this uniform model there. |
| 0.3 Lie lattice | FU24 line 598, §4 p. 12; line 941, §6 p. 19; AW14 line 728, §5.4 p. 16 | Matrix logarithms give p·sl₂ and rescaling gives sl₂; brackets and powers agree. |
| 1.2 Crossed products | ST02 line 514, proof of Lemma 3.1 p. 13; ST03 line 1145, proof of Theorem 5.1 pp. 29–30; AW13 line 3298, §10.6 pp. 71–72 | Finite-index freeness, left/right representatives, normality and a possibly nontrivial cocycle. MR01's separate definition is waived. |
| 1.3 Centrality | ST02 line 635, Proposition 3.7 p. 16; FU24 line 798, §5 p. 16 | Connected algebraic group, its enveloping centre, and conjugation invariance; disconnected O(2) is correctly excluded. |
| 3.3 Ore set | AW13 line 3228, §10.4 p. 70; FU24 line 686, (17) p. 14 | Unramified coefficient ring, initial forms powers of the symbol of p, no zero in S₀. The ramified version in Fu is not used. |
| 3.4 Microlocalisation | AW13 line 3235, §10.4 Theorem pp. 70–71, and line 3283 remarks; line 3314, §10.6 p. 72 | Integral comparison, inversion of p, flatness and the map on group generators. |
| 4.1 Central specialisations | FU24 line 773, definitions/Theorem 5.2 p. 16, line 818 p. 17; ST03 line 447, Proposition 3.7 pp. 11–12 | Finite central generators, closed ideal and quotient theorem. General reductive centre now comes from its declared gap. Radius hypotheses fail to transfer: R02. |
| 4.3 Strong duality | FU24 line 792, (25)–(26) pp. 16–17; ST02 line 635, Proposition 3.7 | The central action must be transposed with S. The package's λ∘S version, not Fu's unqualified general-reductive formula, passes the torus test. |
| 4.4 Principal series | FU24 line 788 p. 16 and line 811 p. 17 | Right B-equivariance, nowhere-zero χ-valued extension, and the left-action antipode. The asserted splitting has no matching roadmap supplier: R01. |
| 4.5 Density/injectivity | FU24 line 795 through line 817, proof of Theorem 5.2 pp. 16–17 | Invertible f₀ multiplies the dense locally constant functions; annihilation of a dense subspace forces a bounded measure to vanish. Inversion handles λ∘S. |
| 4.7 Domain quotients | FU24 line 975, Theorem 5.7/proof pp. 20–21; line 447, Lemma 3.3 pp. 9–10; ST03 line 872, Theorem 4.5 p. 22 | Integral parameters and the separated filtration are explicitly retained. Unconditional noetherianity is restricted to rational-power radii. The printed theorem is stronger than its proof. |
| 4.8 Small radii | FU24 line 447, Lemma 3.3 pp. 9–10; line 846, (27) p. 17; line 972 p. 20 | Logarithmic coordinates plus bounded PBW division supply the real-radius adapter. This is an additional argument stated by the roadmap, not falsely presented as a verbatim theorem of Fu. |
| 4.9 Ext/grade | AB07 line 612, §5.4 Lemma and Corollary pp. 16–17 | Finite crossed product; Ext comparison and injective dimension, not equality of global dimensions in bad characteristic. The coefficient-of-identity inverse repairs the printed cocycle omission. |
| 4.12 Integral highest weights | FU24 line 163, Theorem 1.5 discussion p. 4; AW14 line 447, §4.5 pp. 10–11 | Roots of X²+2X−2λ are integral; adjoining them is finite, including repeated-root and empty-product cases. |
| 5.2 Algebraic Peter–Weyl | FU24 line 1044, §6 pp. 21–22, especially (32); AW13 §11, line 3704 onward, pp. 79–80 and following | Algebraic coefficient spaces, finite-dimensional semisimplicity, and the full matrix-algebra quotient on the specified representation; upper/lower conventions checked by multiplication. |

Also reopened the repaired §2.5 citations: SCHM13 lines 198–230, Propositions 3.2.1–3.2.3 pp. 5–6 and line 625, Theorem 4.3.3 p. 16; BCGP25 lines 1112–1152, §§2.2.29–2.2.35 pp. 23–24. Their radius and left-module qualifications agree with the repaired target. The unavailable primary Frommer text remains waived; KOH07 lines 661–705, §1.4 Theorem and Corollary pp. 15–16, supplies the readable statement used in §2.3.

### Computed adversarial record

Here “passes” means that the displayed test agrees with the stated formula under its hypotheses, not that examples prove the theorem. Source and proof-route checks above are separate evidence. Tests outside a hypothesis are negative controls, not requested scope restrictions.

| Statement | Instances and values computed on the two sides | Result/change |
|---|---|---|
| 0.1 Lazard rescaling | p=3: [3e,3f]=9h lies in 3L, not 9L; L=3sl₂ and (1/3)L=sl₂ both have rank 3. Trivial group gives rank 0 and zero bracket. | Passes. |
| 0.2 congruence kernel and product | Direct finite counts for SL₂(𝔽₂), SL₂(𝔽₃), SL₂(𝔽₅) are 6,24,120, equal to p(p²−1). Product m=0 has index 1. At p=2, −I reduces to I and has order 2; at p=3 it does not reduce to I. | Passes; oddness essential to the claimed uniform first kernel. |
| 0.3 lattice and powers | log(G₁)=3sl₂; its rescaling has basis e,f,h. Each successive power quotient has 3³=27 elements, matching the three lattice coordinates. sl₁=0 gives dimension 0. | Passes. |
| 1.1 sign/convolution | For f(z)=z²+3z, x̃(f)=3, whereas the inverse convention gives −3. Upper(p)lower(p) has top-left 1+p²; lower(p)upper(p) has top-left 1. | Passes; the two Dirac products are unequal. |
| 1.2 left/right and cocycle | In S₃ with H=⟨(12)⟩ the listed representatives meet 3 left cosets but only 2 right cosets: wrong left span has dimension 4, required dimension 6. Their inverses meet 3 right cosets and give dimension 6. | Passes. |
| 1.3 centre | Torus: Ad(g)x=x and x commutes with every Dirac element. In O(2), reflection sends x to −x, so the difference is −2x≠0 in characteristic zero. Finite group has g=0, U(g)=K. | Passes. |
| 2.1 lattice completion | Rank 0 gives K. Rank 1 gives K⟨u⟩: coefficients πⁿ tend to 0, coefficients 1 do not. Σπⁿuⁿ belongs to Û(Ru) but not Û(πRu). At p=3, the sl₂ Casimir has norm 1. | Passes; also witnesses R02. |
| 2.2 logarithmic closure | At r=3^(−1/3), log-term base-3 exponents at powers 1,3,9,27 are −1/3,0,−1,−6, so norm is 1, not r. G=1 gives U_r=D_r=K. Below 3^(−1/2), linear term dominates and U_r=D_r. | Passes. |
| 2.3 Frommer | At r₁ the maximal index is ℓ=p; rank for d=1 is p, not 1. At the tie radius p^(−1/(p−1)), indices 1 and p tie, and the specified largest index is p. H=1 gives rank 1 over U_r, not merely the scalar distributions. | Passes. |
| 2.4 special radii | p=3,n=2: log exponents at powers 1,3,9,27,81 are −1/9,2/3,1,0,−5. Thus norm=3=3^(n−1), and rank for dimension d is 3^(2d). | Passes. |
| 2.5 Arens–Michael stages | E=ℚ₃: r_j=3^j and a unit-ball coefficient of degree n at j=1 satisfies |a_n|≤3^(−n), matching the lattice basis (3x)^n. Ramification index 2 gives 3^(j/2). At the exponential boundary, n=p^j terms have constant absolute value p^(−1/(p−1)), so do not tend to 0. | F02 repaired; strict exponential bound passes. |
| 3.1 filtered localisation | Discretely filtered M₂(ℚ₃), T={1}: localisation and completion both return M₂(ℚ₃). With the x-adic filtration, inverting x gives degree(x)=1 and degree(x⁻¹)=−1, so strictness of the old inclusion is not automatic. A p-torsion module becomes 0 after p is inverted. | Passes the stated filtered hypotheses. |
| 3.2 infinite residue coefficients | For G=ℤ₃ the graded rings are 𝔽₃[P,X] and 𝔽̄₃[P,X] over ℤ₃ and W(𝔽̄₃), respectively; degree n has dimension n+1 over its residue field. A coefficient sequence spanning an infinite-dimensional 𝔽₃-space cannot be a finite scalar tensor. | Passes the separate coefficient-extension construction. |
| 3.3 Ore set | In ℤ₃[[b]], 1 and 3 belong to S₀, 2 does not; 3+b² belongs and b+3² does not, by initial forms P and X. If p=π², then 0=p−p lies in p+m². | Passes unramified statement; refutes the printed ramified version. |
| 3.4 microlocal comparison | b maps to exp(3u)−1 with leading term 3u, so the graded map sends b to s·u. For G=1, inverting p gives K on both sides. | Passes. |
| 3.5 radius 1/p | Coefficients d_n=3ⁿ in u-coordinates tend to 0 and define an element. Coefficients 3^(−n) in b-coordinates at r=1/3 have weighted norm 1 for every n and do not define a completion element. | Passes the null-sequence condition. |
| 3.6 ramification | For π²=3 the lattice 3h equals π²h, so old index 1 becomes new index 2, not 1. Σ(3h)^j has coefficients 1 at index 2 and π^j at index 1; only the latter tend to 0. The coefficient extension has basis 1,π and dimension 2. | Passes. |
| 3.7 microlocal modules | K[G/G^p] has dimension p for G=ℤ_p; after the small-disc microlocalisation only the trivial character remains, dimension 1. The other p−1 dimensions are killed. Zero module maps to zero. | Passes; no false faithful-flatness claim. |
| 3.8 semisimplicity headline | For m=0 the algebra is ℚ_p and every finite-dimensional module is a sum of one-dimensional modules; M=0 gives length 0. Outside semisimple Lie type, K[b]/(b²) has a non-split length-2 filtration. In PGL₃ at p=3, diag(1,1,−2)/3 has determinant −2/27; multiplying by 3 restores integrality. | Passes scope and deeper-lattice qualifications. |
| 3.9 Lie modules | On the standard SL₂ module, exp(pe)=I+pe since e²=0; on the trivial module it is I. A nontrivial order-p character of ℤ_p differentiates to 0, unlike its nontrivial group action. | Passes the distinction between Lie modules and arbitrary finite-image representations. |
| 3.10 isotypic comparison | For standard W, dim End(W)=4; the regular module's maximal W-quotient and its microlocal counterpart both have dimension 4. For M=0 both sides are 0. | Passes. |
| 4.1 centre, scalars and generators | Casimir scalars at k=0,1,2,3 are 0,3/2,4,15/2. For K=ℚ₃(√3), K⊗_K K has K-dimension 1, but K⊗_{ℚ₃}K has dimension 2. At λ(Δ)=1, (Δ−1,Δ²−1)=(Δ−1); using Δ² alone gives a quotient of dimension 2 rather than 1. SL₂(ℤ₃) contains order-2 −I. | Repaired centre/generators pass; R02 for the undefined radius/lattice objects. |
| 4.2 induced character | HC(Δ)=h²/2+h and its shifted polynomial is t²/2−1/2. For SL₃, dχ=(1,1,−2) gives (2)(1)(−3)=−6, antipode gives 6. For GL₂ at (c₁,c₂)=(1,0), λ(I)=−1 and λ(Δ)=3/2. At p=3, λ=1 gives nonsquare 3; λ=3 gives square 7; at p=7, 7 is nonsquare. | Passes; R03 only for the stale locator. |
| 4.3 duality sign | Torus f(g)=g satisfies x·f=−f. Pairing x̃+δ₁ with f gives 2≠0; pairing x̃−δ₁ gives 0. Thus the annihilator uses ν∘S. G=1 gives K dual to K. | Passes. |
| 4.4 principal series | The determinant-1 matrix in R01 has quotient coordinate 3/4 and diagonal coordinate 4; f₀=4^c has absolute value 1. χ=1 gives f₀=1. For χ(t)≠1 the constant function gives 1 rather than χ(t), so fails equivariance. | Mathematics passes; R01 supplies the missing owned construction. |
| 4.5 density/injectivity | On the torus inversion takes g to g⁻¹ and eigenvalue −1 to +1. Since |f₀|=1, multiplication preserves the supremum norm exactly. A continuous measure zero on the dense subspace has value 0 on every limit, hence is 0. | Passes, conditional on the repaired §4.4 input. |
| 4.6 projective limit | For m=0, each central quotient is ℚ_p and the map is the identity ℚ_p→lim ℚ_p. For p=3, r₁=3^(−1/3)<r₂=3^(−1/9)<1 and r_n→1, the required cofinal direction. | Passes; uses the declared Fréchet–Stein quotient theorem. |
| 4.7 domain range | At p=3,r=3^(−2/3), quadratic, linear and integral-constant term norms are respectively 3^(−4/3), 3^(−5/3), ≤3^(−2). Quadratic symbol wins. For λ=1/3, ‖Δ‖≤3^(2/3)<3 and the quotient is 0. At r_n the symbol is a p^n-th power, giving nilpotents rather than a graded domain. | Passes integral/small-radius statement and explicit separatedness proviso; R03 locator. |
| 4.8 normal forms | At r=1/3 logarithmic generator weight ρ=1; at r=3^(−2/3), ρ=3^(1/3). In h²=2λ+2h−4ef, term weights are ≤1,ρ,ρ², all ≤ρ² for integral λ. The quadratic form has rank 3 for odd p and cannot be a product of two linear forms; m=0 gives ℚ_p. | Passes, including real radii via bounded division. |
| 4.9 crossed-product Ext | In ℚ[u]/(u²−2), α(f)=u/2 for f(u)=1,f(1)=0. Correct β gives pr₁((u/2)u)=1; the printed coefficient rule gives 1/2. For 𝔽₂[C₂], injective dimension is 0 like the base field, while global dimension is infinite. M=0 has all Ext groups 0, grade ∞. | Passes corrected formula and precise dimension claim. |
| 4.10 larger weighted U quotients | At weights ρ=3 or 9, [h,e]=2e has norm ρ<ρ², and replacing h² by 2λ+2h−4ef does not increase weight. Sending a normal-form series to weight 1 keeps exactly the same coefficients; zero image means every coefficient is 0. | Passes. |
| 4.11 grade route | The contradiction is positive grade of the torsion module versus grade 0 of a nonzero ideal in the domain. The ideal generated by 1 has Hom(I,U)=U≠0 and grade 0; the zero module has grade ∞, so the nonzero proviso is necessary. | Passes with the stated separatedness input. |
| 4.12 highest weights | λ=1 gives roots −1±√3 and a(a+2)/2=1. λ=−1/2 gives repeated root a=−1 and the same scalar −1/2. For m=0 the extension is ℚ_p; for m factors the constructed extension degree is at most 2^m. | Passes. |
| 4.13 ramified Verma module | p=3,π²=3,n=1: p^nh=π²h, hence index en=2. At the erroneous index 1, evaluation h=1/3 makes the unit 1−3h act by 0; that would kill the highest-weight vector. At index 2 the required integral evaluation is defined. | Passes corrected en parameter. |
| 4.14 final injectivity | The non-induced p=3,λ=1 is reached by the integral root −1+√3 over a degree-2 extension. The scalar extension is faithfully flat, so a kernel tensoring to 0 was already 0. For m=0 the map is the identity of ℚ_p. | Passes the full integral-parameter route, not only induced parameters. |
| 5.1 algebraic functions | Degree n associated-graded dimensions for SL₂, n=0,…,4, are 1,4,9,16,25, equal to (n+1)². Restriction to the nonopen subgroup {±I} kills x−w, whereas restriction to the open congruence group is injective. | Passes openness hypothesis. |
| 5.2 Peter–Weyl headline | k=0,1,2 gives dim W=1,2,3 and dim End(W)=1,4,9. Multiweight (1,2) gives dim W=6, dim End=36. m=0 gives End(K)=K. Right upper-unipotent multiplication preserves g₁₁; right lower-unipotent multiplication gives g₁₁+a·g₁₂. | Passes tensor, dimension and Borel conventions. |

### Pinned library and Lean checks

Ran `lake env lean` on the actual `packages/LocallyAnalyticDistributionsPartII/Suggested.lean`, from the pinned content checkout. Exit status 0; only the `sorry` warnings at declarations on lines 79 and 99. The two imported Tau Ceti module object files were present; no build, update or cache operation was required.

On a scratch copy, each of the two sorried theorems was probed with `simp`, `rfl` and `infer_instance`, using `fail_if_success solve` before the retained `sorry`. Neither closed. The successful probe run also elaborated `#check @name` for all four declarations. The kernels retain p and its prime witness; the semisimplicity theorem retains oddness, the scalar tower and finite dimensionality; Peter–Weyl retains both scalar towers, finite coefficient extension and the prescribed action on every group element. No signature changed. The supplied near-match candidates were opened: congruence subgroups of SL₂(ℤ) are a different carrier; the semisimple-module API requires existing semisimplicity; Maschke applies to ordinary finite group algebras, not this completed algebra. No single pinned lemma supplies either headline, and neither theorem is a boundary case or a restated definition. Padding findings: zero.

The summary's three headline results are accounted for: semisimplicity (§3.8) and Peter–Weyl (§5.2) are stated on the actual pinned carriers; Fu injectivity (§4.14) is named in the module docstring with the missing noncommutative completion and microlocalisation map. The further deep results—microlocalisation, the radius-1/p comparison, affinoid Verma faithfulness, Frommer/crossed products, central-quotient normal forms, isotypic comparison, strong duality and the Arens–Michael Fréchet–Stein theorem—are also individually named there with their absent carriers. No weaker stand-in was substituted.

Representative exact pinned locations opened in the object audit, including every library ingredient newly involved in the repairs:

| Pinned file and line | What it provides, and the boundary checked |
|---|---|
| `Mathlib/Algebra/Algebra/Subalgebra/Centralizer.lean:157` and `:170` | Tensor centralizers under freeness; over a field the relevant factor is free. These are not themselves a reductive-centre theorem. |
| `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`, `:80`, `:92` | The algebraic quotient, inclusion and universal property of U(g); no p-adic completion. |
| `Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`; `Mathlib/Algebra/Lie/Classical.lean:92`; `Mathlib/Algebra/Lie/Sl2.lean:38` | Reductivity is radical=center; sl is the trace kernel; an sl₂ triple has its nonzero/commutator conditions. |
| `Mathlib/NumberTheory/Padics/RingHoms.lean:301`; `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225`; `Mathlib/Algebra/Group/Subgroup/Basic.lean:172` | Reduction, the matrix-group map and subgroup product used by the two real definitions. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369` | The actual special-linear to general-linear map used in the Peter–Weyl action. |
| `Mathlib/GroupTheory/OreLocalization/OreSet.lean:52`; `Mathlib/GroupTheory/OreLocalization/Basic.lean:92`; `Mathlib/RingTheory/FilteredAlgebra/Basic.lean:75` | Algebraic Ore sets/localisation and filtrations; none constructs completed microlocalisation. |
| `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:64` | Commutative scalar-ring faithful flatness, used only for coefficient descent. |
| `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`; `Mathlib/Topology/Algebra/Algebra.lean:263` | Bounded measures are continuous linear maps on continuous functions; topological closure is closure of a subalgebra, not a theorem about its distribution coordinates. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, `:252` | Inverse-limit completed group algebra and its group map. |
| `TauCeti/Topology/Algebra/Module/Compact.lean:294`; `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:251`, `:322` | Compact-module structure and completed action. The class does not independently add every separation hypothesis; the ambient topological assumptions remain relevant. |
| `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57` | Symmetric-power representation of GL_n on the native symmetric power over a commutative ring. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:96`, `:175`; `PBW/Injective.lean:213` in the same directory | PBW basis/product formula and associated-graded comparison for a free Lie algebra over a commutative ring; not duplicated. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean:125`, `:175` | Killing-form Casimir and centrality. For sl₂ the roadmap's Δ is four times this element. |
| `TauCeti/Algebra/Lie/Reductive/Basic.lean:449`, `:458`, `:476`; `TauCeti/Algebra/AlgebraicGroup/Reductive/Lie.lean:52` | Reductive splitting and semisimplicity of the derived ideal in finite dimension/characteristic zero; the algebraic-group theorem requires algebraically closed coefficients. The README supplies the descent argument. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Prod.lean:164`; `TauCeti/Algebra/Lie/UniversalEnveloping/Abelian.lean:178` | Enveloping algebra of a product and of an abelian Lie algebra, over a commutative ring. |
| `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:93`, `:437`; `Linear.lean:134`, `:223`, `:251` in that directory | Split semisimple Harish-Chandra map and its −ρ translate. The triangularizability/Killing hypotheses are retained; applying it directly to gl₂ would be invalid. |
| `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:84`; `Basic.lean:174` in that directory | Algebraically closed centre isomorphism and the Verma central character; the README descends the sl₂ generator rather than claiming the stronger theorem at ℚ_p without descent. |
| `TauCeti/RepresentationTheory/SymmetricAlgebra/FiniteType.lean:52` | Finite-generation ingredient for finite-group invariants; does not supply the whole missing reductive-centre/Harish-Chandra contract. |
| `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55`, `Associator.lean:117`, `Extension.lean:118`, `:251`, `:291` | Balanced relations, associativity and extension/map/identity for noncommutative scalars. The roadmap defines flatness by these extensions, not commutative `Module.Flat`. |

### Ownership, suppliers and gaps

The roadmap tools were used to search by objects as well as names and to read the open supplier heads. The provided closest-roadmap lists were read in full scope: LieHighestWeight on main and its revisions #1220 and #1797; LocallyAnalyticDistributions #854; CompletedCohomologyPartII #1035; NoncommutativeAndEquivariantIwasawa #1307. CompletedCohomologyPartII consumes the locally analytic/Iwasawa infrastructure for its own cohomology targets; it does not construct the completions or microlocalisation here. Compact-group Peter–Weyl occurrences elsewhere concern complex/unitary theory, not the algebraic matrix-coefficient quotient here. The SL₂ congruence lattice is a variant of, not a second ownership claim over, the generic GL_d congruence groups in NoncommutativeAndEquivariantIwasawa §0.1. Its Iwasawa finite-index Ext results do not duplicate the arbitrary-ring finite-crossed-product theorem in §4.9.

Every supplier citation was resolved to the named section at main or the supplied current open head. Besides R01's overclaim, the contracts agree with those sections:

- PadicLocalLanglandsForGL2Qp §0.1: locally analytic functions/distributions, duality, Fréchet–Stein stages and Iwasawa comparison; its missing generalizations are the two declared gaps, not presumed existing targets.
- NoncommutativeAndEquivariantIwasawa §§0.1–0.8, §0.13a and §F.1: uniform groups, coordinates, p-valuations, finite-coefficient Iwasawa algebras, Lazard's Lie algebra and compact module topology. The separate infinite-residue argument in §3.2 is not attributed to the finite-coefficient supplier.
- LocallyAnalyticDistributions §§0.0–0.3: locally convex calculus, Amice, compact-type duality and functions on already given compact manifolds; the last boundary causes R01.
- PadicMeasuresIwasawaAlgebras Layer 0, §§1.2 and 1.7 on main: bounded measures, convolution, locally constant density and completed-group-algebra comparison.
- LieHighestWeight Layer 5, Layer 9 and Worked examples on main: algebraic representation inputs, semisimple centre/Harish-Chandra theory and the sl₂ polynomial centre. The reductive extension is a declared gap. Revision #1220's new centre material is not silently consumed as if already on main; its former-numbering mapping was inspected. Revision #1797 creates no conflicting ownership in this package.
- DeformationAndDerivedPatchingAlgebra §1.10: strict Cohen rings and compatible coefficient lifts, used to construct the unramified coefficient subfield.

The three plan/README slugs match: frechet-stein-general, radius-algebras and reductive-centre-split. Each names an earlier or main supplier and states the missing hypotheses and conclusions. The related APIs in each contract concern one supplied construction and its required consequences; none asks for a second copy of an existing complete carrier. AutomorphicFormsOnReductiveGroups also requests a reductive-centre extension from LieHighestWeight; it does not claim ownership of it. These are contracts, not findings or reasons to wait for implementation.

The dependency command requested in the brief completed with this output:

```text
depcheck: 212 roadmaps, 1919 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs line was read in addition to this mechanical check. Local sections are the missing input identified in R01, which the name-based checker cannot detect. The current resolver found no unresolved roadmap/own-declaration names; its external-library-name limitation was addressed by reading the pins. The supplied overlap report records no second copy, conflicting head, dropped cited ID or revision-only cited ID. A fresh name-only overlap request cannot resolve this not-yet-ported package; it was not misreported as a fresh successful overlap computation.

Overlap check: read LieHighestWeight (main, #1220, #1797), LocallyAnalyticDistributions (#854), CompletedCohomologyPartII (#1035), NoncommutativeAndEquivariantIwasawa (#1307); algebraic Lie/highest-weight and centre theory belongs to LieHighestWeight, locally convex/abelian distribution calculus to LocallyAnalyticDistributions, uniform-group and Iwasawa foundations to NoncommutativeAndEquivariantIwasawa, completed-cohomology constructions to CompletedCohomologyPartII; this roadmap owns the noncommutative completion/microlocalisation and specialization adapters. The third closest-results list is empty. No double owner found; R01 concerns an overstated supplied interface.

### Source independence and arrangement

Compared 24 passages with the ten readable sources: the fifteen sampled sections, plus the lattice definition (§0.1), Lie-action definition (§1.1), completion definition (§2.1), Frommer proof route (§2.3), Arens–Michael construction (§2.5), affinoid-Verma route (§4.13), and the two headline docstrings and semisimplicity discussion. Comparisons included the new reductive/generator/radius wording. No copied prose, translated passage, reproduced table or borrowed exercise list was found. Shared formulas, theorem names and forced short mathematical phrases were not treated as copying.

A reproducible citation-block count in the README before References gives FU24 56; AW13 38; ST03 15; ST02 12; AW14 12; SCHM13 7; BCGP25 7; KOH07 3; DDMS99 3; SCH11 2; AB07 2; ST02B 1; MR01 1; DG70 1: 160 named-source citation occurrences. Multiple locators introduced by one source label count as one block, and repeated citations count again. FROM03 is discussed through KOH07 and the References entry, not independently invoked in a body locator. FU24 has the largest share, 56/160.

Opened FU24's contents at lines 18–26. Its sections are introduction, algebraic preliminaries, quotient-growth estimates, comparison, infinitesimal specialization, local applications and global applications. The roadmap does not map layer-for-section onto them: Layers 0–3 split and extend material from Fu §4 with AW13/ST02/ST03/KOH07/SCHM13; Fu §3's growth estimates and §7's global applications are excluded. Layer 4 needs the central maps, completions and Verma machinery; Layer 5 needs the semisimplicity and isotypic comparison of Layer 3. The order of those construction dependencies, not the order of an article, explains the build. The source's contents and the roadmap's scope are different even where later specialization naturally follows completion.

Source independence: 24 passages compared with 10 sources, no copied expression or reused material found; largest citation-block share FU24, 56 of 160; contents compared with FU24: independent. Five settled unavailable texts could not be compared directly.

## Not verifiable

- SCH11 is settled as uncertified; DDMS99, FROM03, MR01 and DG70 are settled as waived. Their exact locators remain cited, but I did not certify their text or wording. No new request or duplicate key was created. FROM03's statement was checked through the accessible KOH07 summary, not against the waived primary text.
- No claim is made that the computed examples or a `sorry` elaboration prove the roadmap. In particular, the separatedness required in §4.7(iii) remains a hypothesis; this review did not supply it.
- The live overlap command does not recognize a package before it is ported to an open roadmap PR. The provided overlap snapshot and readable main/open heads were used as described above; future head changes are outside this review.

## Source issues

- **Error** in FU24 at §4, equation (16), printed p. 14: the source says bounded weighted coefficients describe the Banach completion; it should be weighted coefficients tending to zero; affects a stated result.
- **Gap** in FU24 at Theorem 4.2, printed p. 14: the source says all real-radius algebras are noetherian by ST03; it should be restricted to supported rational-power radii unless an additional proof is supplied; affects a stated result.
- **Error** in FU24 at §4, equation (17), printed p. 14: the source says the displayed set is an Ore set over arbitrary coefficient integers; it should be formed unramified, then extended by coefficient base change; affects a stated result.
- **Error** in FU24 at Theorem 5.7, printed p. 20: the source says all central parameters give domain quotients; it should exclude the non-integral parameters for which the quotient is zero; affects a stated result.
- **Gap** in FU24 at the proof of Theorem 5.7, printed p. 20: the source says the weaker-norm graded calculation proves the domain property; it should first establish separatedness of the induced quotient filtration; affects the proof.
- **Error** in FU24 at Remark 5.8, printed pp. 20–21: the source says integrality characterizes induced parameters; it should require 2λ+1 to be a square in ℤ_p; affects a stated result.
- **Error** in FU24 at §5 before Theorem 5.2 and its first assertion, printed p. 16: the source says the character and strong-dual identification need no antipode; it should insert S for general reductive groups with the specified left action; affects a stated result.
- **Misprint** in FU24 at §6, matrix-coefficient paragraph, printed p. 22: the source says the right stabilizing unipotent is lower-upper triangular; it should be upper triangular; affects nothing.
- **Error** in AW14 at §5.2, proof of the Lemma, printed p. 14: the source says bounded weighted coefficients describe D_(1/p); it should require null weighted coefficients; affects the proof.
- **Misprint** in AW14 at §5.2, proof of the Lemma, printed p. 15: the source says the distribution quotient maps from locally L-analytic to locally ℚ_p-analytic distributions; it should map in the reverse direction; affects the proof.
- **Error** in AW14 at §5.4 Theorem, printed p. 16: the source says deformation index n matches the group lattice p^(n+1)𝔤 over ramified coefficients; it should use deformation index en when p is a unit times π^e; affects a stated result.
- **Misprint** in AB07 at §5.4, proof of the Lemma, printed p. 17: the source says the inverse extracts the inverse-label coefficient alone; it should extract the identity coefficient after multiplication, including the cocycle; affects the proof.
- **Misprint** in AB07 at §5.4 Corollary, printed p. 17: the source says R is the crossed product of R with G using T in the displayed equality; it should state T=R*G consistently; affects nothing.
- **Error** in BCGP25 at Definition 2.2.31, printed p. 24: the source says the transition tensors a left module before its coefficient algebra; it should put the target algebra on the left; affects a stated result.
- **Error** in SCHM13 at Proposition 3.2.1 proof, printed p. 6: the source says every chosen-basis norm with r>1 is submultiplicative; it should require integral bracket constants or a sufficiently large radius; affects the proof.
- **Gap** in SCHM13 at the remark following Proposition 3.2.3, printed p. 6: the source says single-radius completions are noetherian and flat without a rational-power restriction; it should justify irrational radii or use a cofinal rational-power sequence; affects a stated result.

## For the human reviewers

- BCGP25 is cited as arXiv:2502.20645v1 in README:709 and the manifest, without a publication venue. This review checked that open-repository version; publication/licensing status is for the human reviewers.
- Direct wording checks were unavailable for settled SCH11, DDMS99, FROM03, MR01 and DG70. FU24, the most cited source, and its table of contents were readable and compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5ea3fc592ad2f33377ff27b95384855991b50307", "job": "REV-PKG-LocallyAnalyticDistributionsPartII~7", "model": "gpt-6-astra", "worker": "chris-10"} -->
