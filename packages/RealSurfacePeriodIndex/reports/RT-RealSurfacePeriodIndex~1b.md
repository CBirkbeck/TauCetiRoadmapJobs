<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6914786337 -->
Red team round 1 pass b (claude) of 2f325ff

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Layers 2–9 follow the section list of B19

   Location: `packages/RealSurfacePeriodIndex/README.md:774, 1011, 1172, 1391, 1574, 1891, 2158, 2391`
   (the layer headings), for example "## Layer 3: ramified double covers" and "## Layer 8: the
   obstruction to period equals index".

   Claim: the organisation is the roadmap's own.

   Witness: B19 has 132 of the README's 234 citations of readable sources (counted by source id). Its section headings (B19 lines 230,
   329, 532, 667, 904, 1096, 1339, 1686) pair with the layers by number as follows, each pair with
   the same scope:

   | Layer | B19 | Sections inside |
   |---|---|---|
   | Layer 2 | §1 | 2.1, 2.3–2.8 ↔ Lemmas 1.3, 1.4, Theorem 1.5, Proposition 1.2, Theorem 1.1 |
   | Layer 3 | §3 | 3.1–3.4 ↔ §§3.1–3.2; 3.5–3.6 ↔ §3.3 |
   | Layer 5 | §4 | 5.2 ↔ §4.1; 5.3–5.5 ↔ §4.2; 5.6–5.8 ↔ §4.3 |
   | Layer 4 | §5 | 4.1–4.3 ↔ §5.1; 4.4–4.8 ↔ §5.2; 4.9 ↔ §5.3 |
   | Layer 6 | §§6.1–6.2 | 6.1–6.8 ↔ §6.1; 6.9–6.13 ↔ §6.2 |
   | Layer 7 | §§6.3–6.4 | 7.1–7.7 ↔ §6.3; 7.8–7.11 ↔ §6.4 |
   | Layer 8 | §7 | 8.1 ↔ §7.1; 8.2 ↔ §7.2; 8.3–8.4 ↔ §7.3; 8.5–8.8 ↔ §7.4; 8.9–8.10 ↔ §7.5 |
   | Layer 9 | §8 | 9.1–9.10 ↔ §8.1; 9.11–9.15 ↔ §8.2 |

   Layers 6, 7, 8, 9 are §§6, 7, 8 in order; Layers 3, 4, 5 are §§3, 5, 4. The headings of Layers 3,
   4 and 8 are B19's headings of §§3, 5 and 7 (Layer 3 word for word). Only Layers 0 and 1 are the
   roadmap's own.

   What the dependency lines force: Layer 3 before Layers 4 and 5; Layers 4 and 5 before Layer 6;
   Layer 6 before Layer 7; Layers 7 and 8 before Layer 9. They do not force the scope of any layer,
   and they do not place Layer 8, whose Dependencies line names only Layers 0, 1 and 2.

   A symptom inside the text: §5.6 (Layer 5) uses the trace-quotient lift `b = p*η − ψ(ζ)` for n = 2
   straight from AlgebraicTopologyPartII §§15.3–15.4, while the same lift for every even n is the
   target of §§8.3–8.4 three layers later; the split is B19's (§4.3 versus §7.3), not the
   mathematics'.

   Repair (reorganise by technique, worked back from the end theorems; no statement changes):

   1. **Cohomology of generically finite covers** (one layer): §§3.4–3.6, §§8.1–8.4 stated once for
      a generically finite cover of even degree n, with §5.6 as its case n = 2, then §§5.1–5.5, 5.7,
      5.8. *Forced by:* §§5.5 and 5.8 need §3.6; §5.6 needs the trace lift.
   2. **Geometry of branched double covers and their families** (one layer): §§3.1–3.3, 4.1–4.3,
      6.11.
   3. **Infinitesimal variation and density of Noether–Lefschetz loci, over ℂ and over ℝ** (one
      layer): §§2.2, 2.5, 2.6, 4.4–4.9, 6.9, 6.10. Voisin's cone (§2.5), the lattice-coset lemma
      (§2.6) and Green's criterion over ℝ (§6.9) are one technique now spread over Layers 2, 4, 6.
   4. **Real-locus control** (one layer): §§6.1–6.8.
   5. **Splitting theorems**: §§2.1, 2.3, 2.4, 2.7–2.10, then §§6.12, 6.13 and Layer 7.
   6. **The obstruction**: §§8.5–8.10. **Real Enriques surfaces**: §§9.1–9.10. **The Puiseux
      counterexample**: §§9.11–9.15 (two layers, not one "examples" layer).

   Rename every layer by its mathematics, and give the old → new numbering in a table whose header
   names the former numbering (QuadraticFormInvariantsPartII cites this roadmap's Layer 0, which
   does not move). Add second sources for the main results, with locators: for §2.9, CT05 Théorème
   3.14 as the primary statement and A. J. de Jong, *The period-index problem for the Brauer group of
   an algebraic surface*, Duke Math. J. 123 (2004), main theorem; for §§0.15 and 7.8, A. Pfister, *On
   quadratic forms and abelian varieties over function fields*, Contemp. Math. 8 (1982), Proposition
   9 (the reference B19 line 1309 gives); for §7.13, BW20II Proposition 8.3 (BW20II line 1018).

2. **F02** (P2) §6.2 reproduces B19's Assumption 6.1 clause by clause

   Location: `packages/RealSurfacePeriodIndex/README.md:1608`, "… a C^∞ embedding ι : 𝒮 → Ξ meeting
   R(ℝ) transversally in its smooth locus with: (i) every component of Ξ meets ι(𝒮); … (iv) for each
   component Σ of Ξ, with Σ₀ = …".

   Claim: the statement is in the roadmap's own words.

   Witness: B19 lines 1111–1121. The four items come in the source's order with the source's
   notation; the longest shared run is 7 consecutive words (README "meeting R(ℝ) transversally in
   its smooth locus"), and items (iii) and (iv) follow the source's clauses one by one with words
   exchanged.

   Repair (replace the sentence that begins "Assumption 6.1 asks for"; the labels (i)–(iv) stay,
   since §§6.4, 6.8 and 6.13 use them):

   > Assumption 6.1 is the existence of a system of disjoint circles in Ξ adapted to R: a compact
   > one-manifold 𝒮 and a C^∞ embedding ι : 𝒮 → Ξ whose image crosses R(ℝ) only at smooth points of
   > R, transversally, subject to four conditions. (i) No connected component of Ξ is disjoint from
   > ι(𝒮). (ii) The mod-2 class of ι(𝒮) in H¹(Ξ, 𝔽₂) is cl_R(R). (iii) H¹(Ξ, 𝔽₂) is spanned by the
   > classes of the individual circles of ι(𝒮) together with cl_R(Γ) for the curves Γ ⊂ S with
   > Γ(ℝ) ⊂ Ξ. (iv) Two-colouring: for a component Σ of Ξ put Σ₀ = Σ ∩ (ι(𝒮) ∪ R(ℝ)); whenever
   > Σ ∖ Σ₀ is the disjoint union of two open sets Σ₊ and Σ₋, each of which has every point of Σ₀
   > in its closure, the set Σ₊ ∪ Σ₀ is connected.

   Tested on the Check Ξ = S², R(ℝ) = ∅, one circle: Σ₀ is the circle, Σ₊ and Σ₋ are the two open
   discs, each adherent to the whole circle, and Σ₊ ∪ Σ₀ is a closed disc, connected.

3. **F03** (P3) §0.15: BEC05 Theorem 3.1 and Remark 3.2 do not state the index-two criterion

   Location: `packages/RealSurfacePeriodIndex/README.md:523`, "(B19, §6.4, p. 95; BEC05, §3, Theorem
   3.1 and Remark 3.2, pp. 3–4)".

   Claim: these locators support "every nonzero class of Br(K)[2] vanishing at all real closures has
   index 2 ⟹ u(K) ≤ 4".

   Witness: BEC05 lines 105–107 (Theorem 3.1) is a universality criterion for the forms
   ⟨1, 1, −a, −ad⟩; BEC05 lines 135–139 (Remark 3.2) recalls a universality criterion for
   ⟨1, −t₁⟩ ⊥ a⟨1, −t₂⟩. Neither mentions an index. B19 lines 1308–1310 does state the criterion.

   Repair: "(B19, §6.4, p. 95, which states the criterion and attributes it to Pfister; BEC05, §3,
   p. 3, for the Albert form used in the proof; BEC05 Theorem 3.1 and Remark 3.2, pp. 3–4, are
   different criteria for u ≤ 4, by universality of four-dimensional forms, and are not used)".

4. **F04** (P3) §0.14: the general statement rests on a recollection in a preprint

   Location: `packages/RealSurfacePeriodIndex/README.md:510`, "If u(F(√−1)) = 4, Elman–Lam's
   analysis of torsion forms over F … gives torsion-freeness of I³F and u(F) ∈ {0, 1, 2, 4, 6}
   (BEC05 §3, p. 3)".

   Claim: BEC05 §3 supplies this step.

   Witness: BEC05 lines 102–104 says only that this is known, with no proof and no locator; the
   locator for {0, 1, 2, 4, 6} elsewhere in §0.14 is EL73 "as cited in BEC05, §1", for transcendence
   degree 2 only. Half of the step has a readable primary proof: EKM Proposition 35.9 (p. 150, EKM
   line 8317) and Theorem 35.12 (p. 152, EKM line 8404).

   Repair (step 2, first sentence): "If u(F(√−1)) = 4, every 3-fold Pfister form over F(√−1) has
   dimension 8 > 4, so it is isotropic, hence hyperbolic, and F(√−1) has no anisotropic torsion
   3-fold Pfister form; this property descends along the quadratic extension (EKM, Theorem 35.12,
   p. 152), and it is equivalent to torsion-freeness of I³F (EKM, Proposition 35.9, p. 150). The
   values u(F) ∈ {0, 1, 2, 4, 6} are Elman–Lam's (EL73, cited by locator; recalled without proof in
   BEC05, §3, p. 3)." Tested on F = ℝ(x, y): F(√−1) = ℂ(x, y) is C₂ with u = 4, so every form of dimension 8 over it
   is isotropic; I³F is torsion-free and u(F) = 4 ∈ {0, 1, 2, 4, 6} (§7.10).

5. **F05** (P3) §0.9, step 5: the inference to "no half-branches" does not follow as written

   Location: `packages/RealSurfacePeriodIndex/README.md:395`, "If C(ℝ) = ∅, the smooth completion has
   no real points outside a finite set, so there are no half-branches and no orderings".

   Claim: finitely many real points on the completion give no half-branches.

   Witness: a real point of a smooth curve has two half-branches (ℙ¹_ℝ at 0: t > 0 and t < 0), so a
   nonempty finite set of real points would carry orderings. What is true is that the set is empty.

   Repair: "(c) If C(ℝ) = ∅, the real locus of the smooth completion C̄ lies in the finite set
   C̄ ∖ C. It is a compact one-dimensional manifold, because C̄ is smooth at its real points, so
   being finite it is empty. Hence there are no centres, no half-branches and no orderings: F is
   nonreal, and (a) holds vacuously for every β." Tested on the conic x² + y² = −1 (C̄ = C,
   C̄(ℝ) = ∅, Br(ℝ(C)) = 0) and on C = ℙ¹_ℝ ∖ {0, ∞}, where C(ℝ) ≠ ∅ and the hypothesis fails.

6. **F06** (P3) §0.2: the second Check is a pointer to the source, not a check

   Location: `packages/RealSurfacePeriodIndex/README.md:198`, "the limit statement is exactly the
   Tychonoff step of Benoist p. 96".

   Claim: it is a discriminating Check.

   Witness: it computes nothing and holds for any statement that page uses; §0.2 is left with one
   computed Check.

   Repair: replace it by "For F the union of F_n = ℚ(√p₁, …, √p_n) over the first n primes, X of F_n
   has 2ⁿ points (the signs of the √p_i), each restriction map is two-to-one and onto, and X_F is the
   inverse limit {±1}^ℕ, a Cantor set: compact, Hausdorff, totally disconnected and uncountable. With
   Z_n the orderings of F_n in which −1 is positive, every Z_n is empty and so is the limit; with
   Z_n the orderings in which √p₁ < 0, every Z_n is nonempty (2ⁿ⁻¹ points) and so is the limit."

7. **F07** (P3) "The targets cite these entries" is false for nine source corrections

   Location: `packages/RealSurfacePeriodIndex/README.md:2719`, "The targets cite these entries as
   source corrections."

   Claim: every entry E1–E26 is cited by a target.

   Witness: counting occurrences above line 2718: E2, E7, E8, E11, E14, E15, E20, E21 and E23 occur
   0 times. E2, E20 and E21 are gaps whose repairs are the content of §§2.4, 5.2 and 6.12.

   Repair: add "(source correction E2)" to the context line of §2.4, "(source correction E20)" to
   step 3 of §5.2, "(source correction E21)" to the context line of §6.12, "(source correction E7)"
   to step 2 of §8.4, "(source correction E8)" to the context line of §7.3, "(source correction
   E15)" to step 2 of §9.5, "(source correction E23)" to step 2 of §5.8 and "(source correction
   E14)" to step 1 of §9.14; and change the preamble to "The targets cite the entries they depend on;
   E11 records a misprint met while checking a locator and affects no target."

Two P2 findings (R01, R02) concern source independence; five P3 findings concern locators, a proof
step, a Check and the source-corrections preamble. No statement of `Suggested.lean` and no bold
README target was found false: every one was recomputed on the instances in the table below.

Dependency check (run as the brief gives it, on `packages/RealSurfacePeriodIndex/README.md`):

    depcheck: 260 roadmaps, 2498 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

Counts: 9 declarations of `Suggested.lean` read (1 definition, 8 theorems); 108 README sections
read in full (all 2773 lines); 63 pinned declarations checked with file and line (32 Mathlib, 31
Tau Ceti; all found at the stated line); 41 source locators verified at the text (B19 22, EKM 15,
MVH98 3, BEC05 1) plus 3 located only (BW20II Proposition 8.3, VA13 p. 9 formula and Remark 1.11,
CT05 Proposition 2.6 and Lemme 3.15); all 314 Checks read, and every one with computable content
recomputed while reading (the table lists the main values), none found false; every cross-roadmap
citation resolved at the supplier's main or open head (about 75 section ids and 31 declaration
names).

Signatures: the elaborated types in the job's `signatures.md` were compared with the README
statements, declaration by declaration; no binder is lost and the generality agrees (finite
generation present in §§2.9, 2.10, 7.4, 7.6, 7.10 and absent in §§7.8, 7.11, 7.13, as the README
says). No Lean was run in this pass.

Adversarial table (instances and the values computed):

| Statement | Instances | Values | Result |
|---|---|---|---|
| `HasZeroTotalSignature` | ⟨1,−1⟩, ⟨1,1⟩, ⟨1,0⟩ over ℝ; odd dimension over a real field; any form over ℂ(x,y); R in the universe of K | isotropic line x = y, dim 1 = 2/2; ⟨1,1⟩ anisotropic over every real closed R; radical of ⟨1,0⟩ has dim 1; 2·dim W odd impossible; no K-algebra R exists; real closures of K live in the universe of K | determines signature 0 for nondegenerate forms; degenerate case harmless |
| `index_eq_orderOf_of_isAlgClosed` | A = M_n(K); (x,y) over ℚ̄(x,y); prime-power reduction l^r | 1 = 1; norm form anisotropic over ℚ̄((x))((y)), 2 = 2; ind(α) divides l^(r−1)·l | holds |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | Albert class (x,x)+(y,xy) over ℝ(x,y); √−1 ∈ K | Albert form ⟨x,x,−1,−y,−xy,x⟩ anisotropic over ℝ((x))((y)) by two residue steps, so ind 4 = 2·2; K over R(√−1) gives ind = per | holds, sharp |
| `index_eq_orderOf_of_not_isSemireal` | K ∋ √−1; ℝ(x,y) | de Jong case; Albert class shows nonreality needed | holds |
| `index_eq_orderOf_of_forall_isRealClosed` | nonreal K; Hamilton class over ℝ(x,y) | hypothesis vacuous, gives Theorem 0.3; Hamilton class survives at every ordering and is excluded (its ind = per = 2 anyway) | holds |
| `not_anisotropic_of_hasZeroTotalSignature` | degenerate q; odd dimension; non-finitely-generated K; nonreal K | radical vector; predicate false over real K; descent to a finitely generated subfield through closed survival loci with empty limit; reduces to dimension ≥ 5 | holds |
| `exists_anisotropic_hasZeroTotalSignature` | w′ = (w²−1)/(2w) | w′ ≡ i; w′²+1 = (w²+1)²/(4w²) ∈ m²; y_j ≡ 2(1+i)z_j mod m²; signature 1+1−1−1 = 0 | holds |
| `not_anisotropic_of_not_isSemireal` | ℝ(x,y) with ⟨1,1,1,1,1⟩; ℂ(x,y,z) with ⟨⟨x,y,z⟩⟩ | anisotropic (positive); anisotropic of dimension 8 | both hypotheses needed |
| `exists_common_zero_of_not_isSemireal` | K(t) nonreal of transcendence degree 2; ℂ(t) | Amer–Brumer reduces to Theorem 0.10; C₁ with 5 > 2+2 | holds |
| §0.5 trace form | M_d(R); M_(d/2)(ℍ) | d(d+1)/2 − d(d−1)/2 = d; (d/2)·(−2) = −d | holds |
| §0.13 normal form | e = −x₁x₂x₃ | ex₃ ≡ −ab, ex₆ ≡ cd using −x₁⋯x₆ a square | holds |
| §1.2 at Spec ℝ | H²(G, ℤ(1)), H³(G, ℤ(1)) | 0 and ℤ/2 | holds |
| §§1.3, 5.4 Bockstein components | degree 1 with ℤ(1); degree 2 with trivial twist | b_i = β(a_(i−1)) + (k−i)a_i plus ω-cup gives (0, a₁, βa₁); (0, a₁ + a₀e₁, βa₁ + a₁e₁) | agrees with AlgebraicTopologyPartII §7.4 |
| §2.1 | ℙ², quintic | H²·K_X = 2(−3−1) = −8; A² = A·K = 5 | holds |
| §§4.4–4.9 | ℙ², R a line | O(−4), O(−1) have no sections; N⊗K = μ*(A₀K)(3F−E) | holds |
| §5.5 Enriques counterexample | B with rows (1,j,j²) | det 2, all minors nonzero; X(ℝ) = 4 spheres; S(ℝ) = 4 ℝℙ²; c_Ψ = h₁, coefficient sum 1, not in J | holds |
| §7.12 | d = 4, d = 3 | 5, 13 against 15; 10 against 10 | holds |
| §8 Examples | n = 4 | ψ(1,0,0,0) = (−3,1,1,1); (3,−1,−1,−1) ≡ (3,3,3,3) mod 4 | holds |
| §9.8 and E25 | any real Enriques surface | deg(w₁²) = K·K mod 2 = 0, so χ(S(ℝ)) is even | holds; B19's clause is empty |
| §9.12 | branch sextic over the Puiseux field | A₅ at [0:1:0] and [1:0:0]; smooth at [1:±i:0]; t is not a critical value in the affine chart | ADE only |

Suppliers: every cited section exists where cited. MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b,
7.8, 7.10 (the Enriques statements are in §7.10, lines 1504 and 1514 of its README at the open
head); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3,
15.1–15.6, 16.1–16.4; HeightsRationalPointsAndObstructions §§2.16b, 2.19a with the four named
declarations and `pullback_comp`; PurityForFlatCohomology §8.4; LefschetzPencilsAndVanishingCycles
§0.10; ShimuraData §3.1 `Variation`; EnriquesSurfaces §§1.1, 1.3, 1.4 (an open pull request that
adds a new folder); on main: SchemeAndStackFoundations (17 sections, 15 names),
ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8 `exists_resolution`,
AlgebraicModuliForArithmeticGeometry §§1.1, 1.4, ComplexComparisonPartII §§C5.2, C5.3, C6.2, C6.3
(8 names), AffineMorseLefschetz (A3), (A5), StableReduction Layer 4, PurityOfBranchLocus §2.3,
FormalLaurentPuiseux L4, L5, QuadraticFormInvariants Layers 0, 1, 2, 4, 5, SemisimpleAlgebras
Layer 6, AlgebraicTopology Stage 6, and RealAlgebraicGeometry Layer 1 (completed).

Gaps: the three declared gaps are precise and still needed. AlgebraicTopologyPartII §16.1c now
proves existence of control data compatible with f, but not invariant under the involutions, and
§16.2 still takes invariant control data as a hypothesis; `gap:at2-stratified-pair-transport`
asks exactly for the invariant form. MotivesAndAlgebraicCycles §7.8 still uses the torsion-free
cokernel inside a proof without naming it.

Ownership by object: searched all roadmaps on main and all open heads for the Harrison space, the
u-invariant, Amer–Brumer, Albert forms, the valuation form of Springer's theorem, period and
index, Saltman's local form, Azumaya models, Artin–Lang, Witt's theorem on real curves and
pairs of quadrics. No owner on main. The only second owner is QuadraticFormInvariantsPartII for
the C_i and Tsen–Lang block (below, for the human reviewers); its §2.5 "Springer's theorem" is the
odd-degree theorem, a different statement from §0.10. No declaration of `Suggested.lean` shares a
fully qualified name with another roadmap.

Padding: none of the eight theorems follows by one tactic or one library lemma (Theorem 0.3 from
the birational Theorem 0.4, and Theorem 0.10 from the upper bound, each need a transfer of
semireality along a field map as well). Headlines not statable (Theorems 0.4 scheme form, 0.5,
0.6, Proposition 0.7, Theorem 0.13 as stated) are named in the module docstring with the missing
carriers; the pins have no del Pezzo, Enriques or K3 carrier and no Brauer group of a scheme
(Mathlib's `Algebra/Azumaya` is for algebras over a ring).

Policy: the pull request changes only `packages/RealSurfacePeriodIndex/`; no `lemma`, `set_option`,
`#eval`, pull-request number or process word in the README or the Lean file.

Source independence: 14 passages compared with 4 sources (B19, BEC05, EKM, MVH98), 1 shared (§6.2, R02); largest share B19, 132 of 234 locators (counted by source id); contents compared with B19: the layers follow its sections (R01).

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SER06, SCH94, GG73, BRE97, DIM85: settled
  as uncertified; their locators were not read.
- VOI06 Propositions 8 and 9, BEN18 Propositions 1.1, 1.3, 2.1 and Remarks 1.4, 1.5, BW20
  Propositions 2.8, 2.9, CT05 Théorèmes 2.5 and 3.14: the texts are in the cache but were not
  opened in this pass; the first review sampled some of them.
- The "if and only if" of §5.5 and the equivalence of §5.8 were followed step by step and tested
  on the Enriques example and on constant evaluation; no independent second derivation was made.
- §9.14 (the sign argument on the special fibre) was read for consistency only.
- Elaboration was not rerun; the elaborated signatures supplied with the job were used.

## Source issues

- **Error** in B19 at Proposition 4.4, printed pp. 81–84: the source says the topological obstruction vanishes for every open and closed Ψ containing Θ; it should be restricted to Ψ on which the evaluation term is the restriction of a class of H²_G(S(ℂ), ℤ(1)); affects a stated result.
- **Error** in B19 at Theorem 0.6 (ii), printed p. 65: the source says an odd number of components of odd Euler characteristic can occur with one half empty; it should be that this never occurs, since deg(w₁²) = K² mod 2 = 0; affects the proof.
- **Misprint** in B19 at Lemma 7.3, printed p. 98: the source says the pulled-back lift is the reduction of p*η + ψ(ζ); it should be p*η − ψ(ζ), by the sign of the map in (7.2); affects nothing.
- **Misprint** in B19 at the proof of Lemma 7.3, printed p. 99: the source says the two maps agree because Q injects into its extension from the étale locus; it should be injectivity of the target sheaf; affects nothing.
- **Gap** in B19 at the proof of Theorem 0.12, printed p. 95: the source says K is the union of the finite extensions of a finitely generated subfield carrying the class; it should first enlarge that subfield by a transcendence basis; affects the proof.

## For the human reviewers

- **Ownership.** QuadraticFormInvariantsPartII at its open head (README lines 119, 1543–1640, 2030) states C_i fields, Lang–Nagata and Tsen–Lang as its own targets and says this roadmap imports them; this README (lines 24, 2716) says the reverse. Settled as not actionable here.
- **Scope.** The roadmap replaces B19's Propositions 4.4 and 4.5 by criteria of its own and declares Theorem 0.6 (ii) empty (README lines 24, 2723, 2743); no refereed source stating these corrections was found; none was searched for outside the cached texts.
- **Licence.** BEC05 is read from a preprint server copy (README line 2759, "preprint 154 (2005)"); the published version (Archiv der Mathematik, 2006) was not collated, and §§0.13–0.15 cite the preprint's page numbers.
- **Licence.** EKM is read from an author-hosted PDF with printed page numbers (README line 2758); whether that copy is the final published text was not checked.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2f325ff815572badacb1119829db648e9de3e342", "job": "RT-RealSurfacePeriodIndex~1b", "model": "fable", "worker": "chris-x52"} -->
