# Review of GeometricTopology (pull request #903 at 50f3162)

**Verdict:** needs changes

This is a full review of `50f3162`. The folder changed by 1391 lines since `9f470e6`, the head the previous review (r73) read.

## Previous findings (r73)

All twelve findings are repaired. One class of repair, citing pinned results instead of re-planning them, is incomplete elsewhere (R03 below).

- **R01 (strip handedness): repaired.** `README.md:2416` now reads `−t sin(3s/2)`. The new Check at `:2432–2437` computes the crossing sign. My numerical writhe gives `+3` for the README's map and `−3` for the old one.
- **R02 (two-band matrix sign): repaired.** `:2979–2980` reads "`V=−B_(n−1)` … so V has diagonal −1 and superdiagonal 1", which matches `:2264`.
- **R03 (hypotheses equal to conclusions): repaired.**
  - 4.6.1's separations are now Checks (`:3735–3743`).
  - 4.6.2's signature and `ρ_K` are Checks (`:3783–3794`). Its only hypothesis, 4.6.2a, is the Knot Atlas identification.
  - Hypothesis 6.3 (`:6244–6246`) now gives the mutation, `Δ = 1` and the ribbon disc, and no longer gives the genera.
- **R04 (statable headlines absent): repaired.** `Suggested.lean` now states the following:
  - `property_P`, `property_R` and `cyclic_surgery_theorem`;
  - `gabai_meyerhoff_milley`;
  - `kneser_prime_decomposition` and `milnor_prime_decomposition`;
  - `li_rank_genus_theorem`.

  The docstring cites `TauCeti.CerfTheorem` and the grid-link unknotting number.
- **R05 (re-planned pinned carriers): repaired for the sections it named.** These are 1.4 (`:810–818`), 3.3–3.4, 5.1–5.3, 7.4, 8.2 and 9.1–9.2. Further instances remain in 1.6, 11.1 and 11.3 (R03 below).
- **R06 (TeX): repaired.** My gate run reports `tex=0`.
- **R07 (thin Checks): repaired.**
  - 123 of 127 layer subsections have at least three Check bullets.
  - Two of the rest are `####` sub-subsections.
  - 4.3.1 has three bullets across its two Check blocks.
- **R08 (named hypotheses): repaired.** There is a Conventions bullet (`:245–252`), and the two unconditional uses are now conditional (`:3671`, `:6306–6310`).
- **R09 (which Whitehead double): repaired.** `:6278–6289` names `W_(+,0)(T)` with `T` right-handed and records the `τ = 0` branches.
- **R10 (sections without a source): repaired.** 4.2.9 (`:2060–2065`) and 4.10.4 now say that they prove their claims from the stated constructions.
- **R11 (Reeb stability): repaired.** `:7100` reads "closed connected orientable".
- **R12 (heading typo): repaired.** `:3755` now reads "of 9₄₂".

## R01 (P2) — Layer 6.4 claims the proof of Levine's theorem, which needs knot Floer invariants this roadmap cannot use

**Location.**
- `README.md:6268–6271`: "Prove Levine's theorem: there is a pattern knot `P` in the solid torus … the satellite `P(K)` is not smoothly slice in any smooth homology `4`-ball".
- `*Needs:*` at `:6300–6302` lists only Layers 4.4, 6.1, 6.2 and singular homology.
- The Scope (`:76`) claims "Levine's theorem on knots in homology spheres" for this roadmap.

**Claim.** Layer 6.4 proves the theorem from Layers 4.4, 6.1 and 6.2.

**Witness.**
- `levine2016` (arXiv 1405.1125v2) lines 144–150: Levine proves his Theorem 1.2 with `τ` and Hom's `ε` from the knot Floer complex.
- No layer here builds `τ` or `ε`. Hypothesis 6.4 (`:6283`) treats `τ` as "a Floer-theoretic fact outside this roadmap".
- HeegaardFloer consumes this roadmap (`:137–138`), so it cannot be a supplier.

**Repair.**
- Make 6.4 *state* Levine's Theorem 1.2, and add its proof to GeometricTopology, Part II's list (`:160–181`), next to the Rasmussen and Conway-knot application.
- Change the Scope to "the statement of Levine's theorem".
- Keep as a target here only the reduction from Theorem 1.2 to the PL-disc consequence, with Theorem 1.2 as a premise. That reduction is Levine's Proposition 1.3, `levine2016` lines 110–126. It uses only 2-handle attachment and surgery on a sphere of trivial normal bundle, which Layers 1.3 and 6.1 already supply.

## R02 (P2) — 4.5.6 takes Jones's positivity theorem "as stated" although Subfactors, on main, proves it, and it names a later roadmap as co-owner

**Location.**
- `README.md:3521–3523`: "The positivity theorem below is stated by locator and consumed as stated; its proof belongs to the owners named in *Scope and ownership*".
- `:58–60` and `:7425–7428` name TemperleyLiebOperatorAlgebras and Subfactors as its owners.
- *Exact supplier contracts* (`:254–615`) has no Subfactors or TemperleyLieb subsection. Yet 4.5.1, 4.5.3 and 4.5.6 cite "TemperleyLieb Layers 4–5" (`:3198`, `:3226`, `:3353`, `:3520`, `:3584`).

**Claim.** The prerequisite is owned elsewhere and may be consumed without a supplier citation.

**Witness.**
- Subfactors §3.2 (main, `Subfactors/README.md:697–735`) proves Jones's positivity theorem, `markovTrace_nonneg_iff`. Its §3.3 (`:774`) builds the Jones quotients with a faithful positive trace.
- TemperleyLiebOperatorAlgebras is line 242 of the merge order and consumes Layer 4.5.3 (`:7425`). It cannot supply a result that 4.5.6 uses.

**Repair.**
- Add *From TauCetiRoadmap.TemperleyLieb* (Layer 4 Markov trace and `existsUnique_isMarkovTrace`; Layer 5 cellular blocks and semisimplicity).
- Add *From TauCetiRoadmap.Subfactors* (§3.2 positivity; §3.3 quotients).
- In 4.5.6, cite Subfactors §§3.2–3.3 in place of "consumed as stated" and in `*Needs:*`.
- Keep as a target here any clause Subfactors does not state, for example definiteness on all of `TL_n` for real `t > 0`.
- Name TemperleyLiebOperatorAlgebras only as a consumer of 4.5.3.

## R03 (P2) — Layers 1.6, 11.1 and 11.3 restate results that the pinned Tau Ceti proves

**Location.**
- `README.md:7182–7192` (11.1): "Prove … that `Realization K` is Hausdorff, that every compact subset lies in the realization of a finite subcomplex …, that simplicial maps realize to continuous maps functorially, that the realization of a stellar subdivision is canonically homeomorphic … Construct the CW structure".
- `:882–885` (1.6): "Prove the compact comparison: … `TauCeti.IsPLOn f K` implies `TauCeti.IsPiecewiseAffineOn f K`".
- `:7312–7314` (11.3): "Prove that the realization of a combinatorial `n`-manifold … is a PL `n`-manifold".
- The Scope (`:96–97`) calls these "beyond the pinned API (stars, links, subdivision, the CW structure)".

**Claim.** These are new targets.

**Witness.** The pin (`2fd255d9`) has each of them. File paths are under `AlgebraicTopology/SimplicialComplex/` unless stated otherwise:

| README target | Pinned declaration | File and line |
| --- | --- | --- |
| `Realization K` is Hausdorff | `instT2SpaceRealization` | `Realization/Basic.lean:204` |
| compact subsets lie in finite subcomplexes | `exists_finset_support_subset_of_isCompact` | `Realization/Compact.lean:87` |
| simplicial maps realize functorially | `realizationMap`, `realizationMap_id`, `realizationMap_comp` | `Realization/Map.lean:149, 197, 206` |
| stellar subdivision is homeomorphic | `exists_homeomorph_stellarSubdivision` | `Subdivision/Stellar/Homeomorph.lean:53` |
| the CW structure | `realizationCWComplex` | `Realization/CWComplex/Basic.lean:172` |
| the compact PL comparison, on `ι → ℝ` | `IsPLOn.isPiecewiseAffineOn_of_isCompact` | `Topology/PL/Compact.lean:38` |
| combinatorial manifolds are PL | `IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid` | `CombinatorialManifold/PL.lean:70`, with no local-finiteness hypothesis |

The README names none of these.

**Repair.** List them under *From Tau Ceti* and narrow the targets as follows:
- **11.1:** keep only the face join laws (`σ ∗ Lk σ`, `∂σ ∗ Lk σ`) and the transport of a CW structure along a homeomorphism.
- **1.6:** keep only the transfer of the pinned `ι → ℝ` statement to finite-dimensional normed spaces.
- **11.3:** keep the converse (every PL manifold has a combinatorial triangulation) and the boundary statement. Cite the pinned forward direction.
- **Scope, Layer 11:** delete "the CW structure".

## R04 (P3) — Four sampled sections state theorems with no locator and no "proved here" clause

**Location.**
- 4.4.7 (`README.md:2938–2993`): the torus-link groups, Fox rows, modules and Conway family.
- 4.7.2 (`:4149–4151`): "a tame knot K with a generating transposition labelling in S_N, N≥2, has `br(K)≥N−1`".
- 4.7.3 (`:4184–4202`): the S₄ image classification.
- 4.10.2 (`:4937–4944`): the 6₁/9₄₆ separation.

**Claim.** Each theorem has a locator.

**Witness.**
- None of the four sections cites an outside source. The two Knot Atlas links in 4.10.2 locate its hypotheses, not the theorem.
- The R10 repair added the "proved here from the constructions" clause only to 4.2.9 and 4.10.4.

**Repair.** For each section, either cite a source you have checked, or add one clause as in 4.2.9 saying the section proves its statements from the stated constructions and cites no outside proof.

The mathematics checks out (table below). For example, 4.7.3's classification holds on all 216 residue triples mod 6.

## R05 (P3) — 4.5.3's derivative formula holds only for the derivative in `u`, which the text does not fix

**Location.** `README.md:3338–3341`: "With the Laurent derivative `∂(t^k)=k t^(k−1)` on the native integral carrier (agreeing with analytic differentiation away from 0, and near t = 1 with the branch u(1) = 1) … `(∂H_L)(1)=3(−2)^(μ−1)λ`".

**Claim.** The formula holds as written.

**Witness.**
- The pinned `jonesPolynomial` is in `T = t^(1/2)` (`TauCeti/KnotTheory/PDCode/Jones/Basic.lean:104–110`).
- Positive Hopf link: `H = −u − u⁵`.
  - `dH/du(1) = −6 = 3·(−2)·1`, as the README states.
  - `d/dt(−t^(1/2) − t^(5/2))` at `t = 1` is `−3`.
- The skein derivative at `t = 1` changes by `(3/2)(−2)^(μ−1)` in `t`.
- Jones 1985, Theorem 16 (p. 107) states only the knot case.

**Repair.** Write "∂ = d/du on ℤ[u,u⁻¹], u = t^(1/2)" and add the Hopf Check: `(∂H)(1) = −6`, whereas d/dt gives `−3`.

## R06 (P3) — `Suggested.lean` and the README disagree about who proves Mostow rigidity

**Location.**
- `Suggested.lean:34`: "The proofs of the Smale conjecture (Layer 3), Mostow rigidity (Layer 7), the cyclic surgery theorem … are GeometricTopology, Part II's".
- The README Scope at `:78` claims Mostow rigidity for Layer 7.
- `:6370–6374` gives this roadmap's proof route.
- Part II's list at `:160–181` does not include Mostow rigidity.

**Claim.** The roadmap agrees with itself on ownership.

**Witness.** The README makes Layer 7 the owner of the proof; the Lean docstring assigns it to Part II.

**Repair.** If Layer 7.2 owns the proof, delete "Mostow rigidity (Layer 7)," from `Suggested.lean:34`. Otherwise, add it to Part II's list and say "State" in 7.2 and in the Scope.

## R07 (P3) — `cyclic_surgery_theorem` binds `hΦ` twice

**Location.** `Suggested.lean:147–149`: `(hΦ : TauCeti.IsLocallyFlat …)` and then `(hΦ : ¬ TauCeti.IsSeifertFibered (TauCeti.knotExterior (Φ := Φ)))`.

**Claim.** The binders are well formed.

**Witness.** The second binder shadows the first. Lean elaborates the first as an anonymous arrow, so a proof cannot refer to it by name.

**Repair.** Rename the second binder to `hSF`. I tested this on a scratch copy: it elaborates with only the 25 `sorry` warnings and the same type.

## Verified sound

**Gate, dependency check and build** (my runs on `50f3162`):
- Gate: `set_option=0 … tex=0 … outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- Dependency check: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean Suggested.lean` exits 0 with exactly 25 `declaration uses sorry` warnings.

**Lean signatures and padding.**
- I put `#check @` for all 25 theorems in one scratch file. The types match the worker's `signatures.md` and the README statements. There are no `variable`s, so no section binder is lost.
- Padding probe: each theorem with `first | rfl | simp | infer_instance | decide` fails (25 errors out of 25).
- No pinned theorem has the type of a headline. Of the pinned propositions, only `triangulationConjecture_zero` (dimension 0) is proved, and no headline states dimension 0.
- I opened the pinned propositions behind the new headlines:
  - `KneserPrimeDecompositionTheorem` and `MilnorPrimeDecompositionTheorem` (`LowDimTopology/PrimeDecomposition.lean:79, 91`);
  - `LiRankGenusTheorem` (`Heegaard/RankGenus.lean:138`);
  - `GabaiMeyerhoffMilleyTheorem` (`Hyperbolic/Weeks.lean:77`);
  - `IsWeeksManifold` (`DehnSurgery/Link/Weeks.lean:95`);
  - `DehnFilling` (`DehnSurgery/Filling.lean:164`);
  - `knotExterior` (`SolidTorusNeighborhood/Exterior.lean:73`);
  - `IsSolidTorusNeighborhood` (`…/Basic.lean:222`);
  - `IsSeifertFibered` (`LowDimTopology/SeifertFibration.lean:223`, whose charts allow boundary fibres).

  Each matches its docstring.
- "Not statable" claims:
  - Kondo: the pin has only the grid-diagram state sum `GridDiagram.weightMatrix` (`Grid/Determinant.lean:132`), with no invariance and no Alexander polynomial of a `GridLink`.
  - Novikov–Rosenberg: the pin has no transverse orientation and no leaf topology.
  - Zeeman: the proposition is open.

**Seeded sample** (all 15 sections opened):
- 4.2.1: Birman–Brendle (author page) §§1.1–1.3, pp. 3–5 give `B_n`, `P_n`, the presentations and `P_n` of index `n!`.
- 4.5.3: `jones1985` (AMS open archive) p. 107, lines 177–195, give Theorems 14–20 as cited. `murakami1986` lines 22–26 use the branch `√i = e^{5πi/4} = −u₄`, which matches the README's parity conversion.
- 4.8: Armond–Lowrance (arXiv 1507.02771v2) line 20 has inequality (1.1), and line 606 (§4) has Turaev's genus-zero criterion. Franks–Williams (Trans. AMS 303) has its main theorem (Corollary 1.9) at line 78.
- 4.11: Jones's notes, §7.5, p. 44, lines 811–815, give the torus-knot formula as stated.
- 5.4.1: Taylor (arXiv 0806.1572v2) Theorem 5.12, p. 31, lines 1123–1130. Its hypotheses and conclusion match the README, and Corollary 5.13 (lines 1135–1142) gives distance `2n`.
- 6.2 and 6.2.1: Conway (arXiv 1903.04477v1) has Proposition 2.7 (line 191), Theorem 2.9 (line 242), Theorem 2.12 (line 282) and the Powell remark in §2.4 (lines 295–298). The knot-only "exactly at `S¹_!`" also uses Cha–Livingston (line 244).
- 10.1 and 10.2: `calegari2007` has Theorem 4.5 (line 5900), §4.6 (p. 161), Theorem 4.35 (p. 163, line 6702), Theorem 4.37 (Novikov, line 6876) and Theorem 4.38 (p. 168, line 6916).
- 11.1: `hatcher-at` Proposition A.1 (line 22534) applies because the pinned realization has the weak topology (`Realization/Basic.lean` docstring).
- Other locators checked:
  - `li2013` Theorem 1.1, lines 66–68 ("arbitrarily large");
  - `gmm2009` Theorem 1.1, lines 52–55;
  - `hatcher-3m` Proposition 1.4 (line 147) and Theorem 3.8 (line 2152);
  - `hatcher-torustrick` Theorem A (line 44).

**Adversarial table** (values computed this round; scripts in scratch):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 4.2.1 `N_gen`, `N_all` | n=3, b=σ₀σ₁; n=2; n=0,1 | perm(b²) a 3-cycle, so b²∉N_gen; quotients of order 6 and 2; B₂: both 2ℤ; trivial groups | right |
| 4.3.3 strip | ±t sin(3s/2) | 3 crossings; writhe +3 (README map), −3 (old map) | right |
| 4.4.7 items 1–7 | n=0,1,2,3,5; σ₁⁻¹ | Fox row of xyxy⁻¹x⁻¹y⁻¹ = (F₃,−F₃); D₂=F₃; C₂=z, C₃=z²+1, C₄=z³+2z, reversed −2z; x=b⁻²a, y=a⁻¹b³ inverse; (B(σ₁)ⁿ−1)₁₁ = −t, −t+t², −1 for σ₁⁻¹; m·gcd(m,n), so 9 at (m,n)=(3,3) | right; no locator (R04) |
| 4.5.1 threshold | 19-letter word (exact Burau) | e=9, perm a 4-cycle, Δ as stated, Δ(ζ)=6.931116=36−13√5; Squier minors 1, 0.618, 0.236 | right; Jones Cor. 24 false |
| 4.5.3 | σ₁³, σ₁², σ₁⁴; W | Clifford H(u₄) = −1, 0, +√2; Gauss sum −2 gives −1; T(2,4) radical (1,0,1) with q=0, Arf 1; D(i)=2, D(−1)=4; Hopf dH/du=−6, dH/dt=−3 | right; R05 |
| 4.5.5 | R_c, F, E | R_c(1)=3+c, R_c′(1)=2+c, R_c(−1)=15−c; F(±1)=1, 49; E(−1)=9 | right |
| 4.7.2 | trefoil; (123),(345) | H-orbit ((12),(23))→((13),(12))→((23),(13))→back; group orders 60 and 120 | right; R04 |
| 4.7.3 | all (p,q,r) mod 6; [−7,7]³ | 0 mismatches with the four criteria; 0 periodicity failures; P(3,3,3): 126 = 6+96+24; P(3,3,4) path closes; P(3,3,5) has no S₄ | right; R04 |
| 4.8 | unlinks; trefoil | spans 1 and 2; MFW window [2,4] = v-support {2,4} | right |
| 4.10.2 | S₄ witness; matrices | w=(132), aw²=w²b=(1324), a²b=(14), \|⟨a,b⟩\|=24; star closes P(3,3,−3); both determinants −2t²+5t−2; σ=0 (det −9); 9/5 signs +−−++−−+ give w² | right; R04 |
| 4.10.3 | 9 triples; E | \|p\| ∈ {3,5,9,11,17,19,29}; (1,1,1) gives (−1,−1); E is (29,6), switched (1,2) | right |
| 4.11, 4.11.1 | T(2,3); c₀,c₁ | V = t+t³−t⁴; braid relation of length 5 holds, H⁵ fixes the pair, H cycles the factorizations | right |
| 4.11.2 | V_(ε,m) | S_ε, C_ε congruences hold; det H_ω = −c(1+εmc); d = 3, 13, 11; QV_(+,1)Qᵀ = [[1,1],[0,−1]] | right |
| 4.11.3 | A₂, B₁; F-witnesses | Δ(A₂) symmetric of span 4, σ=−4; b(B₁)=3; b(C_r)=3r+1, b(E_r)=2r+2, r=F(·)+1 refutes each bound | right |
| 5.2 | Hopf (a,b); RHT ±1 | L(−1,0)=S³, L(0,1)=S¹×S², L(5,2); Σ(2,3,5), Σ(2,3,7) | right |
| 5.3–5.4 | horned torus; T(2,3) | wild exterior is not a manifold while 5/2 gives L(5,2), so hΦ is needed; L(5,4), L(7,2), and 6 is reducible | right |
| 5.4.1 | n=1 | i(m_U,m_K)=4, d=2; tubed disc χ=−1, g=1 | right |
| 6.2.1 | isotropic V; trefoil | inertia (2,1,1) raw +1, both sides (2,2,0); trefoil (0,1,1) raw −1, sides −2 and 0, σ̄ = −1; det formula (−\|1−ω\|²)^g Δ(ω) checked | right |
| 6.4 Levine | `levine2016` line 144 | proof uses τ and ε | unowned input (R01) |
| 4.5.6 positivity | Subfactors §3.2 | `markovTrace_nonneg_iff` on main | supplier not cited (R02) |
| 11.1, 1.6, 11.3 | pin | 7 pinned declarations (R03 table) | duplicated (R03) |
| `property_P`, `property_R` | unknot; slopes | S³_{±1}(U)=S³, S³_0(U)=S¹×S²; H₁ = ℤ/p, so only slope 0 gives S¹×S² | right |
| `cyclic_surgery_theorem` | unknot; satellite | the solid torus is V(0,1) (excluded); Δ(p/q, 1/0) = \|q\| in every framing | right; R07 |
| 25 headlines | `#check`; one-tactic probe; pin | types as in the README; 25 of 25 fail the probe; none proved at the pin | right |

**Overlaps and citations.**
- `overlaps.md`: no id is dropped and none is defined only by an open revision.
- Of the three anchors this pull request drops, `#layer-1-manifold-library-buildout-general-dimension-general-structure-group` and `#layer-4-knot-theory-done-properly-owned-here` are cited by RealAnalyticGeometry (main `:674`) and KhovanovHomology (main `:21`). `#the-smoothing-and-triangulation-comparison-far-horizon` is cited by RiemannianGeometry (#1683 `:1048`). All three are mapped at `README.md:643–649`.
- The conflicts with #1517, #1791 and #1797 were settled earlier as not actionable in this folder. That reason holds, so I do not raise them.
- Suppliers DifferentialGeometry, TypeAHeckeAlgebras, ReductiveGroups, SuccessiveMinima and TemperleyLieb are on main, and HopfRinow is in `Completed/`.

**Ownership.**
- Compact-surface mapping class groups, Dehn twists and Lickorish's theorem (Layer 1.7.2) are also claimed by SurfaceTopology (#271, Layer 9; on the never-cite list). The MappingClassGroupsAndCanonicalRepresentations package (merge-order line 287) defers them to SurfaceTopology.
- This roadmap is the owner:
  - it is on main;
  - main already used "layer 3's surface mapping classes" (main `:759`);
  - SurfaceTopology cannot be cited.
- The citation should come from those two roadmaps; nothing changes here.
- FourManifolds, KhovanovHomology and TeichmullerGeometry are named in Scope as consumers. I did not compare their open heads beyond this.

## Not verifiable

- **Lickorish, *An Introduction to Knot Theory*** (Chapters 5, 12, 16) and **Rolfsen, *Knots and Links*** (Chapters 2, 3, 9) are not in the manifest, and I found no legal copy.
- **Schubert 1954**, **Bleiler 1984** and **Teragaito 2018**: the sources service found no legal source. **Thistlethwaite 1988**, **Morton 1986**, **Turaev 1987**, **Novikov 1965** and **Palmeira 1978** are paywalled, and I did not fetch them.
- **`rourke-sanderson1972`** and **`hirsch1976`** are settled as uncertified. **`kauffman1990`** is image-only.
- **Knot Atlas pages** were not fetched. The values were reproduced by computation.
- The texts I read through the sources service are not in the package manifest, because this review edits none: Taylor, Conway, Powell, Birman–Brendle, Jones 1985, Armond–Lowrance, Jones's notes, Franks–Williams and Levine.

## Source issues

- **Error** in jones1985 at Corollary 24, p. 108: the source says a knot with `Δ_K(e^{2πi/5}) > 6.5` is not a closed 4-braid; it should be a larger threshold (unitarity gives `|Δ(ζ)| ≤ 8`), since a four-braid knot closure has `Δ(ζ) = 36 − 13√5 ≈ 6.93`; affects a stated result.
