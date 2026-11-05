# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at 0b84954)

**Verdict:** needs changes

One P2 finding (a statement that is false on the empty scheme) and the failing gate (a pull-request number in the README) block acceptance. Everything else found is P3. The three headline theorems in `Suggested.lean` (Hilbert–Serre over Artinian coefficients, faithful flatness of commutative Hopf inclusions, Artin approximation in its pointed-étale and henselian forms) are correctly stated at the pins, match the README's generality, and are not padding.

## R01 (P2) — `coherentDevissage` is false on the empty scheme

Location: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` line 1040, §2.3: "Let X be Noetherian and P a property … (1) … if two terms have P so does the third, and (2) for every integral closed Z ⊂ X … Then P holds for every coherent sheaf on X."

Claim: the two hypotheses force P for every coherent sheaf.

Witness: take X = ∅ and P ≡ false. The only coherent sheaf is 0, the only short exact sequence is 0 → 0 → 0 → 0, no two of its terms have P, so (1) holds; there is no integral closed subscheme, so (2) holds; the conclusion P(0) fails. On a nonempty X, (2) gives some G with P and the sequence 0 → G → G → 0 → 0 gives P(0), so only the empty scheme is affected. The module docstring of `Suggested.lean` (lines 23–25) already records exactly this gap ("needs a zero-sheaf hypothesis on the empty scheme"), but the README statement does not carry it, and the source has the same gap (stacks-coherent line 1501, Lemma 30.12.6 (01YI); see Source issues).

Repair: add the hypothesis "P holds for the zero sheaf" (or "X is nonempty") to `coherentDevissage` and to `devissageViaChow`, which inherits (1) from it, and add the instance X = ∅, P ≡ false as a negative-control Check. Tested: with P(0) assumed the empty case is immediate and the Noetherian induction of 01YI goes through unchanged.

## R02 (P3) — pull-request number and coordination narrative in the README (gate failure)

Location: README lines 252–254: "Coordinate the finite-free chart construction and its quotient convention with [Mathlib PR #14686](…). Follow Mathlib's adopted API; the scheme construction remains assigned to …"

Claim: the push gate fails (`prnum=1`, rule: no pull-request numbers in the README), and the sentence is process narrative ("Coordinate … Follow …"), which the house style excludes.

Witness: the gate record for this head lists `prnum (1): line 253`.

Repair: delete the link and the two coordination sentences; the convention is already fixed by the Conventions paragraph and by `Module.Grassmannian` at the pin (`Mathlib/RingTheory/Grassmannian.lean` line 66: submodules whose quotient is locally free of rank k, so quotients, as the README says).

## R03 (P3) — `incidenceLocus` uses natural-number subtraction where the junk value matters

Location: README lines 923–937, §1.7: "the locus dim(U∩W) ≥ k … as rank(U → E/W) ≤ a−k … for k > min(a,b) it is empty"; Check `IncidenceTests.impossible`.

Claim: for k > min(a,b) the locus is empty.

Witness: (n,a,b,k) = (2,0,1,1). Then a − k = 0 − 1 = 0 in ℕ, the condition "rank(U → E/W) ≤ 0" holds for the zero map U = 0 everywhere, so the locus is the whole relative product, whereas dim(U ∩ W) ≥ 1 is impossible. The Check fails for every k > a (the case k > b with k ≤ a is genuinely empty: the kernel of U → E/W lies in W, so the rank is at least a − b > a − k).

Repair: define the locus to be empty when k > a (case split, or write the bound in ℤ with "rank ≤ negative" meaning empty) and keep the Check with the instance above as its negative control. The README's "impossible-bound convention specified separately" is not specified anywhere in §1.7.

## R04 (P3) — Hilbert–Serre series form cited to a source that proves only the polynomial form

Location: README lines 697–700, §1.5: "The Laurent series Σ_d length_A(M_d)T^d equals h(T)/(1−T)^e for a Laurent polynomial h … ([Stacks] §58, Proposition 58.7 and proof, pp.136–137)".

Claim: Stacks Proposition 10.58.7 supports the rational-function statement.

Witness: stacks-algebra line 6432: Proposition 58.7 (00K1) states that n ↦ [M_n] ∈ K′₀(S₀) is a numerical polynomial when S₊ is generated in degree 1; neither the statement nor its proof (induction on generators, lines 6437–6441) mentions the Hilbert series or its numerator. The series identity is what `Suggested.lean` states (line 61: the power series times (1 − X)^e is a polynomial).

Repair: keep 58.7 for the polynomial clause and add a locator that states the series form (Atiyah–Macdonald, Theorem 11.1, or Bruns–Herzog, Theorem 4.1.3; both paywalled, so recorded as uncertified), or say that the series form is proved here by the displayed induction. The statement itself is correct (checked on three instances in the table below).

## R05 (P3) — Plücker and Grassmannian-tangent claims cited to a source that skips the proof

Location: README lines 623–631, §1.3: "the image is defined scheme-theoretically by Plücker relations … This is the quotient form of Görtz §5, Theorem 5.10 and its coordinate proof, p.59"; lines 597–608: "its relative tangent sheaf is Hom(K, Q) … (Görtz §5, Lemma 5.8 and Theorem 5.9, pp.58–59)".

Claim: Görtz proves these.

Witness: goertz-ag3 line 2356: "Remarks on the proof. We mostly skip the proof here"; Theorem 5.10 (line 2348) asserts only that the Plücker map is a closed immersion, over ℤ, in the subspace convention, and says nothing about the scheme-theoretic image being cut out by the Plücker relations. Theorem 5.9 (line 2338) gives the affine cover and smoothness over ℤ; the tangent-sheaf identification Hom(K, Q) and arbitrary base change do not appear in §5.

Repair: cite Görtz–Wedhorn, Algebraic Geometry I, §8.10 (which Görtz himself cites) for the closed immersion and the relations, and Stacks or EGA for the tangent sheaf, or mark the relations and the tangent identification as proved here from the chart computation (the README already gives that computation; it is fine as the route).

## R06 (P3) — Milne IV §2 Theorem 2.5 does not contain the gerbe statements cited to it

Location: README lines 7339 and 7345, §4.20: "This is the split-monomorphism route in Milne, Étale Cohomology, Chapter IV §2, Theorem 2.5(i″), pp. 8–9" and "Sources: Milne IV §2, Theorem 2.5(i), pp. 8–9".

Claim: Milne's Theorem 2.5 has parts (i), (i″) giving neutrality of injectively banded gerbes and the H² classification.

Witness: milne-ec-iv line 304: Theorem 2.5 is "There is a canonical injective homomorphism Br(X) → H²(X_ét, G_m)", proved in Steps 1–4 (lines 310–361: Azumaya algebras, locally free modules, the PGL_n sequence); it has no parts (i)/(i″), no gerbes, and sits on printed pages 6–7 of the chapter file, not 8–9.

Repair: drop the Milne locator for these two claims. Breen, Proposition 2.14 (breen-1994 line 1629: the 2-stack of abelian A-gerbes is equivalent to the 2-stack of Tors(A)-torsors) already cited on the same line carries the classification; the injective-gerbe neutrality argument is the README's own proof and should be labelled so.

## R07 (P3) — a source linked from a third-party copy

Location: README line 10359 (References): Bierstone–Milman 1997, linked from a seminar page on a private site ("mahalex.net/seminars/gabber/…"); line 10358: Bierstone–Milman 1989 from ResearchGate.

Claim: sources are read from legal places (open repositories, publisher archives, author or institutional pages).

Witness: the 1997 Inventiones article is on arXiv as alg-geom/9508005 (v2, 53 pages; its §3–§4 items Lemma 3.3, Lemma 3.5, Remarks 3.6–3.7, Lemma 3.10, Example 3.12 are present), which is the legal copy; the private seminar page is neither an author page nor an institutional repository. ResearchGate uploads are not a publisher archive.

Repair: replace the two links by the arXiv identifier (with a note that the printed pagination used in §§9.1–9.2 is the Inventiones one, recorded as uncertified) and by the JAMS DOI respectively.

## R08 (P3) — `*Needs:*` lines in §6.1 cite their own section

Location: README lines 8921 and 8925, §6.1: "Prove `henselizationAlgebraicElements` … *Needs:* §6.1, Mathlib `AdicCompletion`." and "Prove `artinApproximationClassical` … *Needs:* §6.1, SchemeAndStackFoundations Layer 0 …".

Claim: each target's Needs line lists what its statement and route need, item by item.

Witness: both targets sit in §6.1 and depend on `polynomial_approximation`, stated later in the same section (line 8936); "§6.1" names the section that contains them.

Repair: replace "§6.1" by `polynomial_approximation` (and, for `artinApproximationClassical`, by `artinApproximation` and SchemeAndStackFoundations §0.21 for the G-ring property of the henselization), and move the two targets after `polynomial_approximation`.

## R09 (P3) — Layer 4 is a per-lemma catalogue, not prose

Location: README lines 1743–8600 (Layer 4, 6,857 of the README's 10,442 lines; 439 of its 654 `Define`/`Prove` entries); for example §4.13 lines 5694–6056.

Claim: the README is prose for mathematicians, with each definition's API as bullets, hypotheses stated once, and no catalogue of names.

Witness: the paragraph "Here C is a fixed small category with topology J; …" is repeated verbatim 72 times, the Olsson locator "Definition 31.1, Remarks31.2/31.5 and Lemma 31.3, printed122–123; exact API specializations.." 17 times (with its typos), and separate `Prove` entries exist for statements whose whole proof is "read the Groupoid `inv_comp` field for the supplied structure" (line 5880) or "project `asIso.hom`" (§4.13, `componentIso_hom`). §§4.6–4.8 and 4.18 have the same shape.

Repair: for each definition keep one API bullet list (the trivial field-projection and `Iso.ext` lemmas belong there, not as targets), state the standing hypotheses once at the head of each subsection, and give one locator per subsection. The mathematics is not in question (see the table); the shape is.

## R10 (P3) — a later roadmap listed as "Owner/export" under the supplier contracts

Location: README lines 276–280, "### Ownership and consumer contracts" inside `## Exact supplier contracts`: "| Complex-scheme analytification | ComplexComparisonPartII §C−1.1 / `ComplexAnalyticSpace`, `complexSchemeAnalytification` … |".

Claim: the supplier-contracts section lists what this roadmap consumes.

Witness: ComplexComparisonPartII is at position 43 of the merge order, this roadmap at 36, and the Scope paragraph (lines 141–147) already records the deferral; the dependency check does not count the row as an edge (0 problems), but a reader of the supplier section reads it as a supply.

Repair: delete the table; the deferral sentence in Scope and ownership is the only place that should say it.

## Verified sound

**Gate and build.** The worker's gate at 0b84954 fails only on `prnum` (R02); set_option, sorry-data, sorry-examples, imports, layer and target ids, metadata and build all pass. `lake env lean` on `Suggested.lean` elaborates in 4 s with exactly four "declaration uses `sorry`" warnings (lines 49, 70, 102, 114) and nothing else. Elaborating a scratch file with `#check @` on all five declarations reproduces the README's generality: `hilbertSerre` keeps `[IsArtinianRing A]`, `[Fintype σ]`, `[Module.Finite (MvPolynomial σ A) M]`, `[IsScalarTower …]`, `[DirectSum.Decomposition ℳ]` and the homogeneous-compatibility hypothesis; `hopfInclusion_faithfullyFlat` keeps `[Field k]`, both `HopfAlgebra` instances and injectivity; `polynomial_approximation` keeps `[IsNoetherianRing A]` and the formal-fibre hypothesis; `artinApproximation` keeps `[IsNoetherianRing A] [HenselianLocalRing A]`; the two `def`s have `[CommRing A] [IsLocalRing A]` only, as their bodies need. Nothing changed.

**Dependency check** (run on this head):

```
depcheck: 156 roadmaps, 1074 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order lists this roadmap at position 36 after every supplier it names (SchemeAndStackFoundations 2, ResolutionOfSingularitiesCharacteristicZero 7, DerivedModuleAlgebra 8, AdicSpacesPartII 9, AdicSpacesPartIII 10, EnhancedDerivedSheaves 18, CrystallineCohomology 22, ReductiveGroupsPartII 24) and before its consumers (ComplexComparisonPartII 43, AbelianSchemesAndArithmeticModuli 46, ModularCurvesPartII 82, ShimuraVarieties 103, PELModuli 117).

**Padding probe.** Each of the four sorried theorems was tried on a scratch copy with `simp`, `rfl`, `infer_instance`, a `constructor <;> simp` split and `exact?`; none closes (all report unsolved goals). The field instance of `HasGeometricallyRegularFormalFibres` also does not close in one tactic. No declaration restates a definition or a Check. Nothing to delete.

**Headline theorems.** From the README summary: Layer 1 universal property and cohomology of P(E), Grassmannian and flag representability, uniform regularity and boundedness; Layer 2 Hom/Isom/Aut schemes and dévissage; Layer 3 fpqc descent on spaces, relative Hom and Weil restriction; Layer 4 the derived H² classification of A-gerbes; Layer 5 rigidification; Layer 6 Artin approximation; Layer 7 Artin's criteria, Picard sheafification, GAGA; Layer 8 effectivity, versality, algebraization; Layer 9 resolution comparisons, Kawamata–Viehweg, Kollár–Matsusaka. Statable at the pins and stated: Artin approximation (both forms), Hilbert–Serre, Hopf faithful flatness. Each of the others needs a carrier absent at the pins (relative projective bundles, algebraic spaces, banded gerbes, algebraic stacks and inertia, henselizations, Picard sheaves, formal-object groupoids, SNC and logarithmic carriers), and the module docstring names each with what it lacks. No headline is forced through a stand-in.

**Library declarations opened at the pins** (Mathlib 6b7abb3, Tau Ceti a91d3aa). All 98 declaration names in the supplier contracts resolve by a declaration grep; the ones the Lean file and the sampled sections rest on were opened: `Polynomial.hilbertPoly` (`Mathlib/RingTheory/Polynomial/HilbertPoly.lean` 116), `coeff_mul_invOneSubPow_eq_hilbertPoly_eval` (172), `eq_hilbertPoly_of_forall_coeff_eq_eval` (220); `Module.length_eq_add_of_exact` (`RingTheory/Length.lean` 168); `IsRegularRing` (`RingTheory/RegularLocalRing/Defs.lean` 92, extends `IsNoetherianRing`, so the fibre rings in the formal-fibre definition are required Noetherian, which they are); `Module.Grassmannian` (`RingTheory/Grassmannian.lean` 66, quotient convention; `functor` 185); `Pseudofunctor.IsStack` (`CategoryTheory/Sites/Descent/IsStack.lean` 49); `comonadicExtendScalars` (`Algebra/Category/ModuleCat/Descent.lean` 59); `Sheaf.H` (`CategoryTheory/Sites/SheafCohomology/Basic.lean` 56); `HenselianLocalRing` (`RingTheory/Henselian.lean` 108); `AdicCompletion.evalOneₐ` (`RingTheory/AdicCompletion/Algebra.lean` 177); `Scheme.Hom.normalization` (`AlgebraicGeometry/Normalization.lean` 122); `IdealSheafData` (`AlgebraicGeometry/IdealSheaf/Basic.lean` 64); `AlgebraicCycle` (`AlgebraicGeometry/AlgebraicCycle/Basic.lean` 44); `pseudofunctor_associativity` (`AlgebraicGeometry/Modules/Sheaf.lean` 265); `tildeEquiv` (`AlgebraicGeometry/Modules/Tilde.lean` 889); `IsQuasicoherent` (`Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean` 253). Tau Ceti: `CommHopfAlgCat.faithfullyFlat_of_dominant` (`TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/Flat.lean` 136) has exactly the `[IsAlgClosed k] [Algebra.FiniteType k H] [IsReduced H]` hypotheses the README says it has; `IsRegularRing.of_smooth` (`TauCeti/RingTheory/Smooth/Regular.lean` 107). Neither library has Hilbert–Serre, an approximation property, G-rings, gerbes, Weil restriction, a relative Grassmannian scheme or a projective bundle of a module (grep by object over both trees: no hits), so the Lean definitions duplicate nothing.

**Cross-roadmap citations resolved** (on main at 4d14cbd, or at the open head named): SchemeAndStackFoundations §0.3 (`relativeProj`, `relativeProj_eq_stableReduction`, README lines 551–579), §§0.9, 0.12–0.15, 0.20–0.21 (848–1394), §1.1 (`Descent.qcohPseudofunctor` 2073, `qcoh_fpqc_descent` 2074), §§1.2–1.23 (`Spaces.QCoh` 2392), §2.3 (`NonabelianH1.equivSheafH` 2535, `mk_eq_one_iff` 3338), §2.6 (`projectiveSpace_cohomology` 3443, `ample_serre_vanishing` 3445), §§2.9–2.11, 2.18–2.21, 3.4–3.7, §4.14 (`hilbert_quot_schemes` 5709: projective Quot for coherent E and fixed polynomial over Noetherian S, exactly what §1.5 consumes), §4.17, §5.4 (`projectiveBundle` 6723, `projectiveBundle_dual_convention` 6565); StableReduction Layers 2 (354) and 4 (468); AlgebraicVectorBundles L0A–L2B (215–340); JacobianChallenge Layers A–D (105 ff.); ModularCurves §§0C, 0E, 0F, 0G (427: the relative Grassmannian of locally free quotients), 4C, 7B, 7D, 9D, 9E; GroebnerGeometry G2 (103) and G4 (252, on main, so the pull-request text's dependency note is stale); AdicSpacesPartII R1.3 (8968); AdicSpacesPartIII F0.5–F0.7 (2450, 2729, 3272), R3.7 (11218) with the names *proper-gaga* and *proper-gaga-coherent-equivalence* (609); DerivedModuleAlgebra §1.E.1 (2200, `perfectInverseSystemEffectivity` 2202) and §1.M.2 (2290); EnhancedDerivedSheaves §E1.9 (925, `perfect_proper_pushforward` 1057). At open heads: ResolutionOfSingularitiesCharacteristicZero (#1199) §§1.1–1.10, 5.6, 6.2, 6.3, 7.8 and all 34 export names of the §9.1 table and §§9.4–9.7 (`resolution_field`, `relativeEmbeddedResolution`, `sncCompactification`, `cartierSeparation`, `localIsomorphismResolution`); ReductiveGroupsPartII (#785) RG2.0a.1 (964); CrystallineCohomology (#857) CR.5:log-algebra.4, CR.5.1 and `LogCrystalline.divisorialLog`, `logDifferentials`, `logDeRham`. The worker's citation resolver reports no cross-roadmap citation found nowhere.

**Ownership.** Searched by object across main and the 378 open roadmap pull requests (`roadmaps grep`): Artin approximation is consumed from this roadmap's Layer 6 by LefschetzPencilsAndVanishingCycles, ShimuraCompactifications and others and built nowhere else; Hilbert–Serre, the gerbe classification, rigidification along inertia and the arbitrary-affine Hopf faithful flatness have no second owner; the relative Picard sheaf of §7.6.1 is consumed by JacobianChallengePartII and AbelianSchemesAndArithmeticModuli, not rebuilt; Weil restriction along finite locally free sources is ModularCurves §0F on main, which this roadmap cites, and its algebraic-space extension is here. Open pull requests whose files the brief does not provide were checked only through that grep.

**Sampled locators, verified at the text** (`<source id> line N` in the sources cache): §1.3 Alper Theorem 1.4.5 in §1.4.3 (alper-moduli line 2979, printed p.62) and Theorem 1.3.8 (line 2715, printed p.57); Görtz Lemma 5.8, Theorem 5.9 (goertz-ag3 lines 2321, 2338, p.58), Theorem 5.10 (2348, p.59), Propositions 5.16–5.17 (2442, 2471, pp.61–62; the flag dimension formula i₁(n−i₁)+(i₂−i₁)(n−i₂)+⋯ at line 2475 equals the README's). §1.5 Stacks Lemmas 10.58.5–6 and Proposition 10.58.7 (stacks-algebra 6413, 6424, 6432, pp.136–137); Nitsure Theorem 2.3 (nitsure-2005 460, p.11), its proof's bound H¹(F(m)) = 0 for m ≥ m₀ + h¹(F(m₀)) (line 509) and h¹(F(m₀)) = h⁰ − χ (522), Lemma 2.1 (403, p.10), Theorem 3.7 (697, p.17), Lemma 4.1 and Theorem 4.2 (724, 766, pp.18–19), Theorems 5.1–5.3 (948–968, p.24), Theorems 6.5–6.6 (1182, 1211, p.30); Stacks Lemma 30.14.1 (stacks-coherent 1667, p.34), Lemmas 30.16.1–2 (2015, 2058, pp.42–43), Lemmas 30.8.1–8.4 (801–1024, pp.16–20); Grothendieck FGA 221 (grothendieck-fga-221, Théorème 2.2 at line 234, so Theorem 2.1 sits on exposé pp.6–7 rather than p.5; harmless). §1.7 Görtz as above. §3.2 Stacks Definition 35.3.1 (stacks-tag-023F 177, p.4), Lemma 35.3.2 with the displayed δ₁₁, σ₀₀, δ₂₁, δ₂₂ (227–238, p.5), Lemma 35.3.3 "Proof. Omitted" (267–270), Proposition 35.3.9 (341, p.8). §3.3a Mathlib names as above. §4.13, 4.18, 4.18a Olsson Math 274 notes Remark 31.2, Lemma 31.3 (olsson-274 5370, 5384, p.122), Lemma 31.4, Remark 31.5 (5407, 5417, p.123); Stacks Definition 8.11.1 (stacks-tag-06NY 977, p.22), Lemma 8.11.8 (1124, p.25). §4.19 Borne–Vistoli 2019 Proposition 3.9 (borne-vistoli-2019 383, p.8). §4.22 Milne ALA Theorem 6.43 (milne-ala 2837, p.69), Proposition 7.73 (3753, p.92), Corollary 8.25 (4404, p.105), Theorems 8.70, 8.75, 8.77 (4969, 5010, 5025, pp.119–121). §6.0–6.1 Stacks Theorem 16.13.1 (07QY, henselian form; stacks-tag-07QY 1487, p.32), Theorem 16.13.2 (07QZ, étale form with κ(𝔪) = κ(𝔪′); 1526, p.33), Example 16.13.3 (0A1W, conclusion at line 1586: for a Noetherian local G-ring domain, R^h ⊂ R^∧ is the set of elements algebraic over K; 1567, pp.33–34); the Lean docstrings assign 07QZ to the étale and 07QY to the henselian statement, correctly; Stacks Proposition 15.51.10 (stacks-tag-07PV 6039, pp.129–130); Artin 1969 Theorem (1.10) (artin-1969 146: field or excellent DVR, henselization at a prime, proper ideal, approximation mod 𝔪^c), Theorem (1.12) (154), Corollaries (2.5)–(2.6) (233, 242). §7.4 Conrad–Temkin Theorem 1.2.1 (conrad-temkin 39), Lemma 2.2.1, Theorem 2.2.3, Corollary 2.2.4 (300, 334, 385, pp.7–8), Theorem 2.3.1, Example 2.3.2 (523, 535, p.11), Example 3.1.1 (642, p.14), Example 3.3.1 (817, p.17), Theorems 4.2.1–4.2.2 (973, 983, p.20; 4.2.1 assumes |k×| ≠ {1}, as the README does). §7.6a Stacks Section 99.11, Situation 99.11.1 (stacks-tag-0D24 1218, 1231, p.27). §8.2–8.3 Stacks Artin's Axioms Lemmas 98.3.1–3 (stacks-tag-07X8 174–210, pp.4–5), Definition 98.9.1 (485, p.11), Definition 98.9.4 and Lemma 98.9.5 (545, 550, p.12), Lemma 98.9.6 (618, p.14), Lemma 98.10.1 (639, p.14), Definitions 98.12.1–2 and Lemma 98.12.3 (783, 833, 839, p.18), Lemmas 98.12.4–6 (859–879, p.19), Lemma 98.12.7 (918, p.20; hypotheses versal, effective, O_{S,s} a G-ring, limit preserving on objects, exactly as `versalApproximation` states), Proposition 98.16.1, Lemma 98.17.1 (1178, 1221, pp.26–27), Definition 98.18.1, Lemma 98.18.2 (1281, 1308, pp.28–29); Formal Deformation Theory Definitions 90.7.1, 90.7.3 (stacks-formal-defos 671, 711, pp.15–16), Definition 90.8.1, Lemma 90.8.2, Remark 90.8.3 (887–931, pp.20–21), Example 90.11.11 (1652, p.34), (90.15.0.1) (2173, p.44), Lemma 90.18.1 (2674, p.54), Definitions 90.19.1–2, Remark 90.19.3 (2721–2731, p.55), Lemmas 90.19.6–13 (2774–2849, pp.56–58), Lemmas 90.26.1–2 (3198, 3219, p.66), Situation 90.29.1, Lemma 90.29.5 (3463, 3544, pp.71–73); Formal Algebraic Spaces Lemmas 87.33.2–3 (stacks-tag-0AQG 3380, 3390, p.74). §9.1 ResolutionOfSingularitiesCharacteristicZero §§1.1–1.10 at #1199 (all nine table rows and the §1.10 marked-sum convention "ideal I^b + J^a, mark ab"); Bierstone–Milman: see Not verifiable. Also checked: Stacks Lemma 21.4.3 (03AJ), Lemma 30.12.6/8/3 (01YI, 01YM, 01YF), Lemma 10.16.4 (05G8), Lemmas 10.97.4–6, Morphisms Definition 29.39.1, Lemmas 39.7–8, 40.3–5 (pp.86–92), Constructions Lemma 10.3 (p.18), Lemma 13.6 (Segre, p.29), Lemmas 16.10–11 (p.40), Definition 21.1 (p.45), Milne EC IV Theorem 2.5 (R06), Breen Proposition 2.14 (breen-1994 1629), Borne–Vistoli 2012 Remarks 3.4, 3.6 and Propositions 3.7–3.8 (borne-vistoli-2012 208–277, pp.5–6).

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `hilbertSerre` (Lean) | σ = ∅, M = A Artinian in degree 0; M = 0 | lengths: len(A) < ∞, 0; series: len(A)·1 = h, 0 = h; (1−X)^0 = 1; P = 0 with degree ⊥ < 0; N arbitrary | holds | none |
| `hilbertSerre` | A = k, σ = Fin e, M = k[σ] | len ℳ_d = C(d+e−1, e−1) for d ≥ 0, 0 for d < 0; Σ·(1−T)^e = 1 = h, d₀ = 0; P(d) = C(d+e−1,e−1), degree e−1 < e | holds | none |
| `hilbertSerre` | e = 1, M = k[x]/(x²) with generator in degree −3 | ℳ_{−3} = ℳ_{−2} = k; d₀ = −3; (1 + T)(1 − T) = 1 − T² = h; P = 0 (degree ⊥ < 1), N = −1 | holds | none |
| `hilbertSerre` generality | README: Artinian A, standard graded B on e degree-one generators; Lean: A[σ], card σ = e | restriction of scalars along A[σ] → B turns a finite graded B-module into a finite graded A[σ]-module with the same pieces | equal generality | none |
| `hopfInclusion_faithfullyFlat` | A = k ⊂ B; A = k[t²,t⁻²] ⊂ B = k[t,t⁻¹] (G_m → G_m squaring), k of characteristic 2 included | B ≠ 0 since ε∘η = id_k; k[t^{±1}] is free of rank 2 over k[t^{±2}] with basis 1, t | holds | none |
| `hopfInclusion_faithfullyFlat` wrong models | non-injective f; noncommutative B | excluded by `hf`; `[CommRing B]`; `→ₐc` is `BialgHom`, and antipodes are preserved automatically | excluded | none |
| `HasGeometricallyRegularFormalFibres` | A = k; A = ℤ_(p) | k: p = 0, Â = k, L ⊗_k (k ⊗_k k) = L regular. ℤ_(p): p = (p): 𝔽_p ⊗ ℤ_p = 𝔽_p; p = 0: ℚ ⊗ ℤ_p = ℚ_p and L ⊗_ℚ ℚ_p a product of fields; all regular; fibre rings Noetherian as `IsRegularRing` requires | holds; equals "A → Â regular" for Noetherian local A | none |
| `HasArtinApproximation` | A = ℚ[t]_(t), B = A[z]/(z² − 1 − t), φ(z) = Σ C(1/2,j) t^j; A complete | ψ : B →ₐ[A] A forces ψ(z)² = 1 + t in A, impossible (v_{t+1} odd): predicate false; A complete: ψ = φ, exact at every n | agrees with Check `nonhenselian` and `complete` | none |
| `polynomial_approximation` vs 07QZ | ι : S →ₐ[A] Â | composite S → A/𝔪 is surjective (its image contains that of A), so 𝔪′ = ker is maximal with κ(𝔪′) = A/𝔪; 𝔪′Â = 𝔪Â; conclusion φ b − ι ψ b ∈ (𝔪Â)^n is a_i − b_i ∈ (𝔪′)^N R^∧ | matches | none |
| `polynomial_approximation` vacuity | S = 0; S = A | S = 0 is étale but has no A-algebra map to Â ≠ 0; S = A reduces to the henselian statement, false for ℚ[t]_(t) by the row above, so the existential is not forced by a trivial choice | not vacuous | none |
| `artinApproximation` vs 07QY | hypotheses | 07QY: henselian + G-ring; Lean: `HenselianLocalRing` + `IsNoetherianRing` + formal fibres | matches | none |
| §1.1 integer twists | P(L), m = −1 | O(−1) = L^∨, O(1) ⊗ O(−1) ≅ O | holds | none |
| §1.2 `projectiveSpaceCechComparison` | (n,q,m) = (0,0,−7), (1,1,−2), (1,1,−1), (1,0,2) | exponent vectors: {(−7)}; {(−1,−1)}; none with both entries negative summing to −1; {(2,0),(1,1),(0,2)} | ranks 1, 1, 0, 3 as the Checks say | none |
| §1.2 `relativeBundleCohomology` | rank 2, m = −2; E = O(1) ⊕ O on P¹ | R¹π_*O(−2) = (Sym⁰E ⊗ det E)^∨ = det E^∨ = O(−1) | matches Examples | none |
| §1.3 `grassmannSmoothness` | Gr_2(O⁴); Gr_1(O²); Gr_3(O²) | 2·2 = 4; K = O(−1), Q = O(1), Hom(K,Q) = O(2); empty over a nonempty base | holds | locator only (R05) |
| §1.3 `plucker` | rows (1,0,a,b), (0,1,c,d) | (p12,…,p34) = (1, c, d, −a, −b, ad−bc); p12p34 − p13p24 + p14p23 = ad − bc + bc − ad = 0 | holds in every characteristic | locator only (R05) |
| §1.3 `flagBundle` | types [], [a], (1,2,…,n−1) with n = 3 | S; Gr_{n−a}(E); 1·2 + 1·1 = 3 = n(n−1)/2 | holds | none |
| §1.5 `hilbertPolynomial` | O_{P¹}(a); zero sheaf | χ(O(a+t)) = a + t + 1; 0 | holds | none |
| §1.5 `cmRegularity` | P¹, O(a), m; O(−2), m = 1; P⁰ | m-regular ⇔ H¹(O(a+m−1)) = 0 ⇔ a + m ≥ 0; a + m = −1 fails; no H^i, i > 0 | holds | none |
| §1.5 `uniformQuotientRegularity` | E = O on P¹, Z of length d; polynomials {0, d} | kernel O(−d) is m-regular iff m ≥ d; zero quotient has kernel O, 0-regular; common bound d | holds; source bound m₀ + h¹(F(m₀)) at nitsure-2005 509 | locator R04 only for the series |
| §1.7 `rankLocus` | [t], r = 0; r = min(a,b); ε² = 0 | ideal (t); no minors, ideal 0; ideal (ε) ≠ 0 with all geometric ranks 0 | holds | none |
| §1.7 `incidenceLocus` | (n,a,b,k) = (2,0,1,1) | a − k = 0 in ℕ; "rank(0 → E/W) ≤ 0" holds everywhere; dim(U∩W) ≥ 1 impossible | Check `impossible` fails | R03 |
| §1.7 `frobeniusStableLocus` | line (1,t), Φ = [[a,b],[c,d]]; identity | Φ(1,t^p) = (a + b t^p, c + d t^p); quotient coordinate y − t x gives c + d t^p − t(a + b t^p); identity: t^p − t | holds | none |
| §1.7a `coefficientFrobeniusCutoff` | p = 3, N = 3, j = 2, coefficient 5; p = 0, (a,b) | exponent 6 ≤ pN = 9, coefficient 5; both to exponent 0, sum a + b | holds | none |
| §2.1 `hilbertDegreeOneAndNonFlatBase` | S = Spec k[ε], X = Spec k; Hilb²_{P¹} | (ε) ⊗_{k[ε]} k → k[ε] ⊗ k is the zero map on a nonzero module, so k is not flat; universal family = X over itself, flat; P² | holds | none |
| §2.3 `coherentDevissage` | X = ∅, P ≡ false | (1) vacuous (only 0 → 0 → 0 → 0), (2) vacuous, P(0) false | false | R01 |
| §3.2 overlap ↔ coalgebra | G = (extendRestrictScalarsAdj f).toComonad; ℤ → ℤ/2 | functor N ↦ S ⊗_R N, ε(s ⊗ n) = s n, Δ(s ⊗ n) = s ⊗ (1 ⊗ n); p = ε∘θ(− ⊗ 1) is an isomorphism (base change of θ), p² = p ⇒ p = id, no flatness; for ℤ → ℤ/2 the construction exists and ModuleCat ℤ → data is not an equivalence | holds | none |
| §3.3a `weilRestrictionHomEquiv`, `relativeHomHomEquiv` | v : V → B | sections b : V ×_B Z → X with b ≫ z = snd (Weil restriction), with b ≫ x = fst ≫ v (relative Hom) | the intended signatures are the standard functors | none |
| §4.13 `modificationIso`, `selfTransportActionIso_independent` | m : η ⇒ θ into a gerbe; e, f : x ≅ x′ with f = b_x(a)·e | components m(U,x) lie in the groupoid G(U), hence invertible; X_U(b_x(a)) = b_{X_U(x)}(a) and p·b_{X_U(x)}(a) = b_x(a)·p, so the two transports agree | holds | shape only (R09) |
| §4.18 `selfHomOrbitSetoid` | pairs (x,p), transport by e | class of (x,p) equals class of (y, transport_e p) by the witness e; restriction along id uses F.mapId | holds | shape only (R09) |
| §4.19 `affineFactorExistence` | BC₄ → BC₂; id_{BC₂}; terminal gerbes | kernel C₂ and middle gerbe B(C₄/C₂) = BC₂; trivial kernel; terminal | holds | none |
| §4.20 classification conventions | lifts b₀₁ = 2, b₁₂ = 3, b₀₂ = 1; C₂ with 0 → ℤ →×2 ℤ → ℤ/2 → 0 | 2 + 3 − 1 = 4, invariant under b_ij + a_j − a_i; Hom(C₂, ℤ) = 0, H²(C₂, ℤ) = ℤ/2 ∋ boundary of the regular torsor | holds | locator R06 |
| §4.22 `affineNormalQuotient` Checks | G_m → G_m squaring in characteristic 2; GL₂/B | free of rank 2; P¹, not affine | holds | none |
| §6.1 `henselizationAlgebraicElements` | x² = 2 in ℤ_7, ℤ_(7), ℤ_2 | 3² = 9 ≡ 2 (mod 7), 2·3 ≢ 0, Hensel lifts; √2 ∉ ℚ; v_2(x²) even ≠ 1 | holds; 0A1W states the G-ring-domain conclusion | R08 (Needs) |
| §7.6a `relativePicardPresheaf` | ∅; Spec k; identity family | Pic(∅) = 0 (one class); Pic(Spec k) = 0; value Pic(T) | holds | none |
| §8.1 `DefGroupoidTests.noRS` | k[ε₁,ε₂]/(ε₁,ε₂)² = k[ε] ×_k k[ε] | (ε₁ + ε₂) and (ε₁, ε₂) both project to ((ε),(ε)) | fibre-product map not injective | none |
| §8.2–8.3 versality Checks | A¹_k → Spec k at 0; μ_p over k[ε]; Σ x^{j!} over ℚ | tangent 1 vs 0, not a hull; (a + bε)^p = a^p so z^p = 1 + ε is nontrivial; lacunary series is not eventually linearly recurrent, so not in ℚ[x]_(x) | holds | none |
| §9.1a marked sums | marks a, b | ideal I^b + J^a, mark ab; ord/mark = min(b·ord I, a·ord J)/ab = min(ord I/a, ord J/b) | matches supplier §1.10 | none |

## Not verifiable

- Bierstone–Milman 1997, Inventiones pagination (pp.231–247) used in §§9.1–9.2: only the arXiv version alg-geom/9508005v2 could be read legally (bierstone-milman-1997); its items Lemma 3.3, Lemma 3.5, Remarks 3.6–3.7, Lemma 3.10 and Example 3.12 exist, but the printed pages cannot be checked there, and the copy the README links was not used (R07).
- Grothendieck FGA 221, the 1962 erratum "p.302": not part of the Numdam item for the exposé (grothendieck-fga-221 has pp.249–276 only).
- Groechenig–Wyss–Ziegler §2.2.1, Charles, Bresciani (Springer and Annals links) and the Bierstone–Milman 1989 ResearchGate copy: outside the sample, not fetched.

## Source issues

- **Gap** in stacks-coherent at Lemma 30.12.6 (01YI), printed page 31: the lemma concludes P for every coherent sheaf from the two-out-of-three condition and the integral-support condition; it should also assume P for the zero sheaf or X nonempty, since on the empty scheme both hypotheses are vacuous; affects a stated result (the empty scheme only).
- none further.
