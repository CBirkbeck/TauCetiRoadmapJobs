# Review of ClusterAlgebras (pull request #1858 at dbaa5d0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ClusterAlgebras/README.md` (2368 lines) and `TauCetiRoadmap/ClusterAlgebras/Suggested.lean` (194 lines, 21 declarations), checked against Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. The worker's gate passes on this head (every counter 0, build OK). There are four findings. R01 (P2) is the only blocking one: two roadmaps own the same object. R02–R04 are P3. The mathematics of the 15 sampled targets and of the 8 stated headlines checks out against the texts and by computation (see the tables under *Verified sound*).

**Repair status of the previous review (at 12cdb38).**
- R01 (P2, upper-bound invariance absent): **repaired.** `Suggested.lean` lines 95–114 add `laurentSubalgebra`, `upperBound` and `upperBound_seedMutationWord`, as the witness proposed but generalized to a coefficient ring `C`. README §2.1 lines 969–974 names the signature at BFZ III Corollary 1.9. The docstring no longer calls the theorem unstatable.
- R02 (P3, README form): **repaired.** The headings are now `# Roadmap: cluster algebras`, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (with `### From Mathlib`, `### From Tau Ceti` and `### From TauCetiRoadmap.X`), `## How to read the build` and `## Downstream consumers`. There are 33 `### k.n` subsections, each of the 7 layers has `### Examples` and `### Dependencies`, and `grep -c '^```math'` = 0. Residual Checks-form defects are in R04.
- R03 (P3, no `*Needs:*` lines): **repaired.** There are 33 `*Needs:*` lines, one per subsection, and they name supplier sections (for example §5.1 at lines 2051–2054).
- R04 (P3, interface catalogue): **repaired.** The 13 definitions left are exactly those the 8 headlines use, and the docstring reads "Cluster algebras: target signatures".
- R05 (P3, README names no Lean declarations): **repaired.** Each of the 21 Lean names occurs in the README in backticks (1–2 times each), and the "illustrative names" sentence is gone.

## R01 (P2) — the based quantum torus has two owners, and the README hands it back to its own supplier

**Location.**
- `README.md` §0.4, lines 316–322: "let `T(R,u,Λ)` be the existing twisted monoid algebra … Prove inverse monomials, coefficient extraction, finite support, lattice reindexing, coefficient change along ring maps preserving the unit … and the identification with the lattice group algebra when `u=1` or `Λ=0`".
- Lines 167–169: "Use this same instance for ScatteringDiagrams §4.3's `QuantumMonoidAlgebra`, with its monomial basis, coefficient maps and lattice maps".
- Line 2322: "ScatteringDiagrams §4.3 and §4.4 share the seed-free twisted algebra of §0.4".
- Lines 124–125 and line 185 (the shared-material row, which lists "scattering coefficients" as a consumer).

**Claim.** ScatteringDiagrams supplies this roadmap; it is cited for §§0.8, 1.4, 3.3–3.4, 4.2–4.4, 5.1–5.6 and 7.1–7.7. It plans the same algebra with the same API as its own target. Meanwhile this README plans that algebra again in §0.4, tells the supplier which carrier to use, and lists the supplier as a downstream consumer of §0.4. So the object has two owners, and the hand-off runs upward, which creates a cycle in the prose. The dependency check does not see it because it does not parse "Downstream consumers".

**Witness.** In ScatteringDiagrams README at the head of its open pull request (6406dab):
- Lines 1395–1397 define *QuantumMonoidAlgebra* `R q β` on `AddMonoidAlgebra R L` with `z^p z^{p'}=q^{β(p,p')}z^{p+p'}`, which is §0.4's `X^aX^b=u^{Λ(a,b)}X^{a+b}` with `q=u`, `β=Λ`.
- Its targets (lines 1411–1417) include basis theorems, lattice maps, coefficient maps along `φ(q)=q'`, and `β=0` giving `AddMonoidAlgebra`.
- It never mentions `TauCeti.twistedMonoidAlgebra` or this roadmap, and its Downstream consumers (line 2463) reads "None".

**Repair.** Make ScatteringDiagrams §4.3 the single owner, because it comes earlier in the merge order.
- In §0.4, write "let `T(R,u,Λ)` be ScatteringDiagrams §4.3's `QuantumMonoidAlgebra R u Λ`". Consume its basis, coefficient and lattice maps and its `β=0` comparison, and delete these from §0.4's target list.
- Keep in §0.4 only what §4.3 does not state: `UniqueSums` and the domain property, the Ore conditions and skew field, quantum polynomial and mixed subalgebras with their universal property, and quantum charts.
- Add §4.3 to `### From TauCetiRoadmap.ScatteringDiagrams` and to §0.4's `*Needs:*`.
- Delete the instruction at lines 167–169, the bullet at line 2322 and "scattering coefficients" in line 185.
- If §4.3 should be an instance of `TauCeti.twistedMonoidAlgebra`, make that change in ScatteringDiagrams' own README. Cite the generic facts that already exist at the pin: `TauCeti.TwistedMonoidAlgebra.isUnit_of`, `.basis`, `.lift`, `.monoidAlgebraEquiv` (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:345, 356, 397, 456`).
- Rerun the dependency check.

## R02 (P3) — `finite_clusterVariables_iff` is stated more narrowly than README §4.1 and the other headlines

**Location.** `Suggested.lean` lines 152–157 (`B : ExchangeMatrix (Function.Embedding.refl K)`). `README.md` lines 1845–1853 state the equivalence "For every coefficient semifield `P` … and for each admitted domain realization" and then call the Lean "the coefficient-free signature".

**Claim.** FZ II, Theorem 1.4 (FZ2 line 239, p. 5) shows that finite type depends only on `B`, whatever the coefficients. The file's other classical headlines are stated in geometric type, and the geometric-type form of this theorem is statable with the file's own definitions. As written, the acceptance test is weaker than both the README and the source.

**Witness.** I appended the following to a scratch copy of the file:

```lean
theorem finite_clusterVariables_iff' {I K F : Type*} [Fintype I] [DecidableEq I] [DecidableEq K]
    [Field F] {row : K ↪ I} (B : ExchangeMatrix row) (c : LaurentChart ℤ I F) :
    (clusterVariables row B.matrix c).Finite ↔
      ∃ w, TauCeti.IsFiniteType
        (cartanCompanion fun i j ↦ matrixMutationWord row B.matrix w (row i) j) := by
  sorry
```

`lake env lean` gives only `sorry` warnings. Test instance: with `B̃=(0,1)ᵀ` the principal block `(0)` gives companion `(2)` (finite type), and the reached set is `{x,(1+z)/x}`.

**Repair.** Replace the coefficient-free statement with this geometric-type one. Keep `exists_isFiniteType_iff_forall_le_three` as it is (it is a pure matrix statement), and say "geometric-type signature" at README line 1853.

## R03 (P3) — sampled targets without a locator at the claim, one stray locator and one supplier without a section

**Location and claims.**
- §2.7 Starfish (lines 1496–1513, the headline `upperBound_le_of_starfish`) has no locator in the section. FWZ appears only in References (lines 2341–2342). Witness: FWZ6 line 431 (Proposition 6.4.1: normal Noetherian ℂ-algebra, conclusion `A⊂R`, printed p. 10) and line 495 (Remark 6.4.4: `R` contains the upper cluster algebra, p. 12).
- §2.4 Somos-4 (lines 1285–1310) has no locator, and the source is missing from References. Witness: FZ, *The Laurent phenomenon* (arXiv math/0104241), Theorem 1.8 with `α=β=1, p=1, q=2, n=4` (FLP lines 85–88, p. 3) and Example 3.3 (line 538, p. 10).
- §§0.5, 0.6 and 0.7 (sampled) state theorems with no locator. Their sources are:
  - BZ Lemmas 5.5–5.6 (BZ lines 669–703, pp. 15–16) and BFZ III Lemma 4.2 (BFZ3 line 1210, p. 25) for the coefficient criterion and the normal forms;
  - BZ Proposition 11.2 (line 1749, p. 40) for the center and `Tz₁∩Tz₂=Tz₁z₂`;
  - BZ Lemma 5.8 (line 733, p. 17) and BFZ III Lemma 4.6 (line 1295) for the replacement route.
- §6.3's Sources line (line 2293) cites BFZ III Corollary 2.17. That result (BFZ3 line 803) is the identification with the *lower* cluster algebra for acyclic `B(i)`, and §6.3 states no such target.
- `### From TauCetiRoadmap.SchubertGeometry` (lines 150–153) and §6.1's `*Needs:*` (line 2247) cite SchubertGeometry with no section, and no Layer 6 target expresses minors as sections.

**Repair.**
- §2.7: add "(FWZ, Proposition 6.4.1 and Remark 6.4.4; the `S₂` form uses `R=⋂_{ht p=1}R_p` for Noetherian `S₂` domains)".
- §2.4: add "(FZ, *The Laurent phenomenon*, Theorem 1.8 and Example 3.3)" and add the paper to References.
- §§0.5–0.7: add the BZ and BFZ III locators above at the claims.
- §6.3: delete "Corollary 2.17".
- SchubertGeometry: either cite its section S3.2 (the regular-function realization `∇λ`) at the target that uses it, or delete the supplier entry and the `*Needs:*` clause.

## R04 (P3) — Checks that break the one-list form, and Checks that dictate a proof route

**Location.**
- Two Checks blocks in one subsection: §1.4 (lines 699 and 703), §2.5 (lines 1355 and 1362), and §2.3 (`**Acceptance checks.**` at line 1259 plus `**Checks.**` at line 1274).
- §2.1 (line 1024) and §2.6 (line 1438) give their Checks as one paragraph. §2.1's paragraph contains a target ("prove that the same matrix with this symmetrizer has no integral positive compatible form", lines 1028–1029). §2.6's paragraph contains route mandates ("must use the public theorems. A fixed nonreciprocal polynomial rule must fail the corresponding negative control", lines 1450–1452).
- §2.4, lines 1309–1310: "Verify that the transitive proof dependencies of the integrality theorem include L8, L5 and, through L5, Q3's upper-bound invariance."

**Claim.** The house form is one `**Checks.**` bullet list per subsection, one test per bullet. A Check computes a value; it does not prove a target or audit how a proof was built. The §2.4 sentence makes the cluster route mandatory: a proof of Somos-4 integrality through FZ's caterpillar lemma (FLP Example 3.3) would fail it, even though the statement `somos4_exists_pos_nat` is the same.

**Repair.**
- Merge each pair into a single bullet list, one test per bullet.
- Move §2.1's "prove … no integral positive compatible form" into the Q3 prose as a target. The computation: for `B=((0,3),(−3,0))` and `Λ=((0,λ),(−λ,0))`, `BᵀΛ=3λ·Id`, so `w=d=(1,1)` forces `λ=1/3`, which is not integral.
- Delete the §2.4 sentence and the two §2.6 "must" sentences.

## Verified sound

**Gate, build and dependency check.**
- Worker's gate at dbaa5d0: every counter 0, `build=0`, OK. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClusterAlgebras'` is empty, and `metadata.toml` has `topic = "math.RA"`.
- `lake env lean TauCetiRoadmap/ClusterAlgebras/Suggested.lean`: 8 `sorry` warnings (lines 107, 118, 127, 134, 152, 160, 171, 186) and nothing else.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 245 roadmaps, 2470 edges, 0 problem(s)`, with no UPWARD or CYCLE line. ClusterAlgebras is at position 398 of the merge order. Its suppliers are on main (RootSystems, ReductiveGroups, SchemeAndStackFoundations, SchubertGeometry, InductionRestriction, Completed/AnalyticToricGeometry), plus ScatteringDiagrams, which is the new-folder pull request #1134 named in the description's depends-on and not yet in the order (not a defect). `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped ids, and no ids defined only by a revision.

**Signatures and padding.**
- `#check @name` for all 8 theorems on a scratch copy; the elaborated types match the worker's `signatures.md` and the README statements. No declaration has section variables, so none can lose a binder.
- One-tactic probe (`first | rfl | simp | infer_instance | decide | aesop`) on all 8 theorems: none closes, so there is no padding.
- All 13 definitions are used by a headline.
- Headline theorems of the README:
  - stated: classical Laurent phenomenon (`exists_laurentExpansion`), upper-bound invariance (`upperBound_seedMutationWord`), Somos-4 (`somos4_exists_pos_nat`), Starfish (`upperBound_le_of_starfish`), finite type 1⇔2 and 2⇔3, Laurent positivity, `c`-vector sign-coherence;
  - named in the docstring as not statable: quantum Laurent phenomenon (mutated toric frames), §5.1 (completed wall groups), §6.3 (`G^{u,v}`, generalized minors). The previous review accepted these and I do too.

**Pinned declarations opened.**
- Tau Ceti 2fd255d9:
  - `Module.SatisfiesSerreS` (`TauCeti/RingTheory/SerreCondition/Basic.lean:85`: `depth M_p ≥ min(n, dim Supp M_p)` at every prime);
  - `height_eq_one_of_isAssociatedPrime_quotient_span_singleton` (`…/SerreCondition/Normal.lean:76`), the input for `R=⋂_{ht 1}R_p` in the Starfish proof;
  - `TauCeti.IsFiniteType` (`LinearAlgebra/RootSystem/FiniteType/Basic.lean:129`: finite index type, diagonal 2, off-diagonal ≤ 0, symmetric zero pattern, and `∃ d>0` with `(d_iA_ij)` positive definite);
  - `DynkinType`, `.rank`, `.Valid`, `.cartanMatrix` (`DynkinType.lean:105, 132, 153, 219`);
  - `twistedMonoidAlgebra`, `of_mul_of`, `isUnit_of`, `basis`, `lift`, `monoidAlgebraEquiv` (`Algebra/MonoidAlgebra/Twisted/Basic.lean:288, 336, 345, 356, 397, 456`);
  - `MonoidAlgebra.isLocalization_away_mapDomainRingHom` (`Algebra/MonoidAlgebra/Localization.lean:53`);
  - `laurentEval`, `laurentEvalEquiv` (`Algebra/Polynomial/Laurent/Basic.lean:124, 152`).
- Mathlib 1b1ccf4b:
  - `MonoidAlgebra.scalarTensorEquiv` (`RingTheory/TensorProduct/MonoidAlgebra.lean:108`);
  - `IsMulTorsionFree` (`Algebra/Group/Monoid.lean:552`);
  - `RootPairing.Base.cartanMatrix` (`LinearAlgebra/RootSystem/CartanMatrix.lean:107`);
  - `OreLocalization.oreDiv_eq_iff` (`GroupTheory/OreLocalization/Basic.lean:131`), `universalHom` and `numeratorHom_inj` (`RingTheory/OreLocalization/Ring.lean:133, 194`);
  - `SimpleGraph.IsTree` (`Combinatorics/SimpleGraph/Acyclic.lean`).
- Duplication: `grep -ril 'cluster algebra|exchange matrix|skew-symmetrizable|somos|laurent phenomenon|double bruhat|generalized minor'` over both pins finds nothing.

**Cross-roadmap citations resolved.**
- ScatteringDiagrams at 6406dab: §0.8 (line 502, "finite component expansion", "finite recursion"), §1.4 (732, sweep), §3.3 (1137), §3.4 (1222), §4.2 (1322), §4.3 (1392), §4.4 (1451, slab algebra), §5.1–5.6 (1504–1865), §7.1–7.7 (2103–2427). The names `SkewLatticeDatum` (1324), `AdaptedBasis` (1329), `κ` (1327), `D_n` (1336), `principalGradingDictionary` (1350), `principalProjectionComparison` (1362), `QuantumMonoidAlgebra` (1395), `exists_outgoingCompletion` (1168), `outgoingCompletion_unique` (1230), `cylinderBrokenLineLift` (1887), `principalTheta_eq_projectedMonomialSum` (1897), `theta_presentationInvariant` (1901) and `theta_coefficients_nonnegative` (2439) are all present. Its scope (lines 23–29) excludes seeds, mutation, `c`/`g`-vectors and the theta/cluster comparison, consistent with this roadmap owning them; the one overlap is R01.
- On main: RootSystems `## Layer 1–3` (lines 248, 432, 504); ReductiveGroups Layer 7 (627), 7C (652), 8 (1023), 10 (1731); SchemeAndStackFoundations Layer 0 (463), §0.6 (678) with `coherent_hartogs` (707); Completed/AnalyticToricGeometry Layer 0 (186); InductionRestriction Layer 7 (721); QuantumGroups σ-derivation Ore extension (609).
- Ownership: `roadmaps grep` over main and the 478 open heads for cluster variables, the Laurent phenomenon, double Bruhat cells, Somos, exchange matrices, sign-coherence, quantum tori and `twistedMonoidAlgebra`. The only cluster-theoretic hits are this roadmap and ScatteringDiagrams. The other "quantum torus" hits (TemperleyLiebOperatorAlgebras, OperatorKTheory, CompactQuantumMetricSpaces) are finite-group or C*-algebraic and consume the Tau Ceti carrier.

**Sources at their locators** (line numbers of the cached extractions).
- BZ (arXiv v2): Definition 4.3 l.423 (p. 9, §1.5's toric frames); Theorem 5.1 l.593; Corollary 5.2 l.606; Lemmas 5.4–5.6 l.660–703; Proposition 5.7 l.705, whose Case 1 uses full rank via Proposition 3.3 (§2.1's attribution is right); Lemma 5.8 l.733; Proposition 11.2 l.1749.
- BFZ III (v3): Corollary 1.9 l.232 (rank `n`, skew-symmetrizable principal part, geometric type), which is exactly `upperBound_seedMutationWord`; Definition 2.3 l.479; Remark 2.4 l.490; Theorem 2.10 l.668 (p. 15); Example 2.11 l.672 (four mutable positions `{1,2,3,4}`, eight minors); Lemma 2.12 l.714; Lemma 2.13 l.759 (p. 17). The References' page ranges (upper-bound proof on pp. 24–28, Theorem 2.10 and its input on pp. 15–18) are right.
- FZ II: Theorem 1.4 l.239; Theorem 1.8 l.274; Theorem 1.9 l.298; (5.3)–(5.4) l.959–979; Lemma 5.2 l.983 ("coefficients in a domain S", as §4.2 says); Theorem 7.1 l.1208; Theorem 8.6 l.1411 (including "all orientations … mutation equivalent").
- FZ IV: Theorem 3.7 l.650 ((3.5)) and Proposition 3.9 l.666 support §2.3's "FZ IV, §3, §6".
- GHKK v2: (A.2) l.4434 (p. 111; choices differ by `N/N_uf → N_uf^⊥`, matching §3.3's torsor); Theorem 4.9 l.1873 (under the Injectivity Assumption, which §5.2 meets on the principal lift); Theorem 4.10 l.1893; Proposition B.11 l.4716; Corollary 5.5 l.2036.
- BCDX: Definition 2.3 l.174 (reciprocal fixed `h`, endpoints 1, `h'=h`, exchange (2.3) equal to P1's formula); Theorem 3.1 l.222; Lemma 4.1 l.781; Propositions 4.2 l.812, 4.6 l.938, 4.7 l.945; Theorem 4.9 l.1143.
- NR: §3 l.238 and Definition 3.1 l.247 (reversed exchange polynomial).
- Rupel: Theorem 5.1 l.1641, on journal p. 1266 with its proof continuing to p. 1267, in rank two.
- FWZ chapter 6: Proposition 6.4.1 l.431, whose coprimality notion ("not in a common height-one prime", l.427) is `hcover` exactly; Remark 6.4.4 l.495.

**Adversarial table** (values computed on both sides).

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `upperBound_seedMutationWord` | `B=0`, rank 2 (`hrank` fails) | `2/(xy)` ∈ `UB(s)` | in `L(2/x,2/y)` it is `½·(2/x)(2/y)` | not invariant without `hrank`, so the hypothesis is needed |
| same | `B̃=(0,1)ᵀ` | `UB(s)=L(x,z)∩L((1+z)/x,z)` | `UB(μs)` = the same two charts | equal |
| same | any chart | injective `ℤ[x^{±1}]→F` | forces `char F=0` | exchange numerators are never 0, so no junk inverse |
| `exists_laurentExpansion` | `B=0`, rank 1 / `B̃=(0,1)ᵀ` | `x'=2/x`, `(1+z)/x` | images of `2X⁻¹`, `X⁻¹+zX⁻¹` | frozen exponents ≥ 0 |
| `somos4_exists_pos_nat` / §2.4 | `clusterMutation` on the §2.4 matrix, 8 steps | `1,1,1,1,2,3,7,23,59,314,1529,8209` | recurrence values | agree; column `k_n=(0,1,−2,1)` and cyclic shift hold at all 8 steps |
| `upperBound_le_of_starfish` | `R=𝕜[x,y]`, `z=xy−1`, `x'=y` | no height-one prime contains `x,y` | `UB_{𝕜[z]}⊆R` | holds |
| same | `R=𝕜[x]`, `x'=x²` (`hcover` fails) | `(x)` contains both | `UB=𝕜[x^{±2}]∋x⁻²∉R` | hypothesis needed |
| same | `K` empty / `R` a field | `UB=⊥` / no height-one primes | `≤` range / range `=⊤` | holds |
| `finite_clusterVariables_iff` | `A₂,B₂,G₂,A₁×A₁` (orbits from `(2,7)`) | `5,6,8,4` variables | `n+|Φ_+|` | agree |
| same | `((0,2),(−2,0))` | `5, 26/3, 137/9, …` | companion `((2,−2),(−2,2))`, det 0 | both sides false |
| `exists_isFiniteType_iff_forall_le_three` | `((0,1),(−3,0))` / Kronecker | product 3 / 4 | `G₂` / infinite | agree |
| `exists_nonneg_laurentExpansion` | `A₂`, word `1,2` | `(1+x₁+x₂)/(x₁x₂)` | coefficients 1 | ≥ 0 |
| `cVector_signCoherent`, §5.3 | 2100 random words on 7 matrices (incl. `B₂, G₂`, Kronecker, 3-cycle, `0`, `((0,3),(−3,0))`, a rank-3 matrix with `D=(2,1,1)`) | columns of `C_t`; `G_tᵀDC_t`; `G_tB_t` | sign-coherent; `D`; `B₀C_t` | 0 failures |
| §5.3 Check | `B=((0,1),(−2,0))`, `μ₁` | `C'=((−1,1),(0,1))`, `G'=((−1,0),(2,1))` | `G'ᵀdiag(2,1)C'=diag(2,1)` | agree |
| §0.5 Checks | `y=2/x`; `xz=v²zx` | `c₋₁∈2ℤ`, `c₋₂∈4ℤ`; `x⁻¹zx=v⁻²z` | `2x⁻¹,4x⁻²` in, `x⁻¹,2x⁻²` out; `(1+z)(1+v⁻²z)` | agree |
| §0.6 | `ℤ/4`, `f=g=2`; `ℤ[√−5]` | `(2)∩(2)=(2)`; `6∈(2)∩(1+√−5)` | `(fg)=0`; `6/(2(1+√−5))=(1−√−5)/2∉D` | Checks right |
| §0.7 | 200 random rational `(x,z)` | `(1+x*)/z`, `(1+x*+x*²)/z` | `x*z*−1`, `x*²z*−x*−z−2` | identical; values 3 and 7 at `x=z=1` |
| §1.5 / §2.1 Q1 | `Λ=((0,−1),(1,0))`, `B̃=(0,1)ᵀ` | `w₁=1`, `ν₁=1`; `X₁X'₁`, `X'₁X₁`, `X'₁²` | `1+v⁻¹X₂`, `1+vX₂`, `(1+vX₂)(1+v³X₂)X₁⁻²` | agree |
| §2.1 | 3-cycle, `μ₁` | columns 2, 3 | `(−1,0,0)`, `(1,0,0)` | opposite, as claimed |
| §2.1 frozen check | 100 random points | `h=(1+x')/y=(1+y')/x`, `zh=x'y'−1` | equal; `z=0` gives `x⁻¹+y⁻¹` (degree −1) | agree |
| §2.3 | `P=Multiplicative ℚ`, `y=(w^{1/2},w^{−1/3})` | `y₁⊕1=1`, `y₂⊕1=w^{−1/3}` | `x'₁=(1+w^{1/2})/x₁`, `x'₂=(1+w^{1/3})/x₂` | agree |
| §2.5 | `𝔽₇`, `u=2` | `(1+2T)(1+T)(1+4T)` | `1+T³` | agree; `𝔽₇` has no automorphism `2↦4` |
| §2.6 | torus `M(a,b)M(c,d)=v^{ad−bc}M(a+c,b+d)`, `H=1+T+T²`, `B=((0,2),(−2,0))` | `y**` | `v⁻²x*²y*−x*(v⁻²+v⁻³y)−P(y)`, `P∈Z_v[y]` (checked at `v=2,3,7/5`) | `y**∈Z_v⟨x*,y*,y⟩` holds |
| §2.6 reversal / endpoint | 100 random points | `x''` with `H'=1+2T²+T³`; word `1,2,1` | `x`; `1/y+x(y+2)/(y(y+1))` | agree |
| §3.2 | `B=((0,1),(−2,0))`, `s=(2,1)` | `L=2`, `d=(1,2)`, `s_iε_ji=L{e_j,e_i}` | `ε=Bᵀ`, `−s_jε_ij` | agree |
| §3.3 | `e'_i=e_i+[ε_ik]_+e_k` | dual `f'_k=−f_k+Σ[−ε_ki]_+f_i` (uses `d_iε_ik/d_k=−ε_ki`) | displayed `A'_k` exchange | agree |
| §5 Examples | `B=((0,1),(−1,0))`, word `1,2,1,2` | dual basis `(−f₂, f₁−f₂)` | `f₁=f₂^t−f₁^t ↦ x₁x₂/(1+x₁)`, value `1/2` at 1 | agree |
| §6.3 | `SL₂`, `G^{s,s}` | dim `1+1+1=3`; complement `a=d=0, bc=−1` | dimension 1 | codim 2 |
| R01 object | ScatteringDiagrams §4.3 vs §0.4 | `z^pz^{p'}=q^{β(p,p')}z^{p+p'}` | `X^aX^b=u^{Λ(a,b)}X^{a+b}` | same algebra (`q=u`, `β=Λ`) |

## Not verifiable

- None in the sample: every sampled locator was read from arXiv, Numdam or the author's page. Fock–Goncharov, Berenstein–Zelevinsky's *Total positivity in Schubert varieties*, NZ and FZ's *Double Bruhat cells* back targets outside the sample and were not checked this round.

## Source issues

- none
