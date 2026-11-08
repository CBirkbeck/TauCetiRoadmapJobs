# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at c60423f)

**Verdict:** needs changes

Full review of the head after the 234-line repair. The gate passes, the dependency check is clean and
the mathematics of every sampled target and every `Suggested.lean` statement survived the
adversarial pass. The four findings below are all P3. R01 is the part of the previous review's repair
that this head did not carry out.

## R01 (P3) — `Suggested.lean` re-adds the Fitting and Schur–Zassenhaus API as declarations

**Location.**
- `Suggested.lean:254–297`: seven declarations, `exists_conj_eq_of_isComplement'_of_coprime`,
  `fitting`, `isNilpotent_sup_of_normal`, `fitting_characteristic`, `le_fitting`,
  `fitting_nilpotent` and `frattini_le_fitting`.
- `Suggested.lean:19–22`, the docstring lines that announce them.
- README:3309 and README:4241–4242, the two `*Lean:*` lines.
- README:4211: "define the Fitting subgroup `F(G)`, `fitting G`, as the supremum of the nilpotent
  normal subgroups".
- README:4267–4270, the three API bullets of *Fitting supplements* that "restate *The Fitting
  subgroup*".

**Claim.** None of the seven declarations is a headline theorem. The end theorems (README:38–42) are:
- Hilbert irreducibility with full-group and disjoint specializations;
- rational rigidity and the stable classification;
- Shafarevich's theorem;
- the Hurwitz component identifications.

Schur–Zassenhaus conjugacy is an input that two targets consume. `fitting` is a definition that no
headline uses (`shafarevich`, line 301, mentions no Fitting object), and the other five declarations
are its API. Two of them close in one term, which is padding by the probe.

**Witness.** I elaborated a scratch copy that keeps the file's `fitting` definition:
- `le_fitting` closes as `le_iSup₂_of_le N ‹_› (le_iSup_of_le ‹_› le_rfl)`;
- `frattini_le_fitting` closes as
  `le_iSup₂_of_le (frattini G) inferInstance (le_iSup_of_le frattini_nilpotent le_rfl)`.

The previous review's repair said "no Suggested.lean declarations (the 506a7ed declarations were an
API catalogue)".

**Repair.**
1. Delete the seven declarations, `Suggested.lean` lines 254–264 and 274–298.
2. Return docstring lines 19–22 to the b275043 wording: IG.3 contributes rigidity and the stable
   classification; IG.4 contributes split nilpotent embedding problems, Shafarevich, the Grunwald
   prescriptions and coprime degrees.
3. In the README, delete the `*Lean:*` lines at 3309 and 4241–4242.
4. At README:4211, write "define the Fitting subgroup `F(G)` as the supremum…" with no backticked
   `fitting G`. Otherwise the own-name check fails once the declaration is gone.
5. In *Fitting supplements for solvable groups*, delete the parenthesis at 4267–4268 and the three
   bullets at 4268–4270. Its API keeps the three results it proves.

Tested on the refuted instance: the file with exactly those lines removed elaborates with exit 0 and
18 `declaration uses sorry` warnings, the count at b275043, and no other diagnostic. No remaining
declaration refers to the deleted ones.

## R02 (P3) — *Arithmetic representations* is restricted to characteristic zero; its source is not

**Location.** README:1368–1369: "Let `X` be a geometrically connected variety over a finitely
generated field `K` of characteristic zero". Also the Check at README:1386–1388, whose argument uses
topological finite generation of `π₁^ét(X_{K̄})`.

**Claim.** None of the definition or its API (conjugation invariance, restriction to finite
extensions, finiteness of the orbit set, independence of the lift) needs characteristic zero. The
restriction narrows the target below its source. The Check's argument is the only place that uses
characteristic zero, and in characteristic `p` the argument fails although its conclusion still holds.

**Witness.**
- landesman-litt lines 1865–1870 (Definition 9.1.1, p. 45) define arithmeticity for a variety over
  any finitely generated field, with no hypothesis on the characteristic.
- Over `K = 𝔽_p(s)`, `π₁^ét(𝔸¹_{K̄})` is not topologically finitely generated: the Artin–Schreier
  covers `y^p − y = x^m` with `p ∤ m` are independent.

**Repair.**
1. Delete "of characteristic zero" at README:1369.
2. Replace the argument of the second Check by descent: a finite-image `ρ` factors through a finite
   Galois cover of `X_{K̄}`. That cover is defined over a finite separable `K′/K`, so `Γ_{K′}` fixes
   the class of `ρ`, and the orbit has at most `[K′ : K]` elements.
3. Keep the `𝔾_m` Check in characteristic zero.
4. Add a characteristic-`p` Check. The character of `y^p − y = x` on `𝔸¹` over `𝔽_p(s)`, with values
   in `μ_p ⊂ ℚ̄_ℓ^×`, has a one-element orbit, because the cover is defined over `𝔽_p`. This holds
   although `π₁` is not finitely generated.

Tested on that instance: the orbit has one element.

## R03 (P3) — Two locators do not point at the statement

1. **Raynaud, wrong page range.**
   - Location: README:6837, "n° 4, the proof, pp. 133–136".
   - Witness: in raynaud-bourbaki-286, printed p. 137 begins at line 221, the proof of Théorème 1
     ends at line 240 and Part II starts at line 242. Page 137 belongs to the proof.
   - Repair: "pp. 133–137".
2. **Aschbacher, chapter only.**
   - Location: README:3305, "Aschbacher, *Finite Group Theory*, Chapter 6 (extensions of groups and
     modules)".
   - Witness: the locator names a whole chapter, not a statement, and the work has no entry in the
     roadmap's source manifest.
   - Repair: cite the numbered statement in that chapter, or delete the second source. Ribes–Zalesskii
     Theorem 2.3.15 already locates the target.

## R04 (P3) — The build overview understates what IG.4 takes from IG.3

**Location.** README:445–447: "Layer IG.4 is independent of IG.3 except for the reduced Schur covers
it uses for central lifts and the conjugacy of coprime complements".

**Witness.**
- IG.4's own *Dependencies* (README:5335–5336) list four IG.3 targets: *Reduced Schur covers*,
  *Conjugacy classes lift bijectively*, *The kernel of the universal marked extension* and
  *Conjugacy of coprime complements*.
- *The global arithmetic lifting invariant* needs *The kernel of the universal marked extension*
  (README:5141).

**Repair.** "Layer IG.4 uses from IG.3 only *Reduced Schur covers*, *Conjugacy classes lift
bijectively*, *The kernel of the universal marked extension* and *Conjugacy of coprime complements*."
This matches README:5335–5336.

## Previous findings

**R01 of the previous review (LocalFiniteGroupTheory refused as a supplier): partly repaired.**

Repaired:
- `LocalFiniteGroupTheory` occurs 0 times in README.md and Suggested.lean.
- The gate run below reports `dropped=0`.
- The pull-request description no longer lists #1634.
- README:259–264 now reads "Conjugacy of such complements, under the solvability alternatives, is the
  Layer IG.3 target *Conjugacy of coprime complements*".
- Both targets are restored with the requested hypotheses, proof routes, locators and Checks:
  README:3286–3317 and 4210–4250.

Not repaired: the repair also asked for "no Suggested.lean declarations", for the `*Lean:*` lines to
be dropped, and for `F(G)` to be written without a backticked name. This head adds all three. That
is R01 above.

## Verified sound

**Gate, build, dependency check.**
- The brief's gate command on c60423f: every counter 0, `OK`. This covers `set_option`,
  `sorry-data`, `imports`, `mathlib-subimports`, `statement-hygiene`, `dropped`,
  `readme-ids-missing`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`,
  `outside-folder` and `source-material`.
- `lake env lean Suggested.lean`: exit 0. There are 24 diagnostics, all `declaration uses sorry`, at
  lines 80, 84, 91, 106, 114, 121, 129, 183, 238, 259, 269, 280, 285, 288, 293, 297, 301, 317, 342,
  364, 383, 408, 415 and 425.
- Dependency check (the brief's command), output: `depcheck: 245 roadmaps, 2483 edges, 0
  problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff origin/main...HEAD` outside the folder: empty.

**`#check @name` for all 43 declarations.** The file is a `module` without `public section`, so its
names are not visible from another file. I therefore appended the 43 `#check @` lines to a scratch
copy of the file and elaborated it: exit 0. Each elaborated type matches its README statement, and
no binder is lost. Two examples:
- `exists_conj_eq_of_isComplement'_of_coprime : ∀ {G} [Group G] {N} [N.Normal], (Nat.card N).Coprime N.index → IsSolvable N ∨ IsSolvable (G ⧸ N) → ∀ {H K}, N.IsComplement' H → N.IsComplement' K → ∃ n ∈ N, MulAut.conj n • H = K`;
- `fitting_nilpotent : ∀ (G) [Group G] [Finite G], Group.IsNilpotent (fitting G)`.

A scratch example confirms that `MulAut.conj n • H` contains `n * h * n⁻¹`, so the direction of the
conjugation is as the README says.

**Library declarations opened at the pins.**

Mathlib 1b1ccf4:
- `Subgroup.QuotientDiff`, `GroupTheory/SchurZassenhaus.lean:39`. Its hypotheses
  `[IsMulCommutative H] [FiniteIndex H]` (line 35) are the abelian case of the proof sketch.
- `Subgroup.exists_smul_eq` (:103) and `Subgroup.isComplement'_stabilizer_of_coprime` (:114). There
  is no conjugacy theorem for complements.
- `Subgroup.lowerCentralSeries`, `GroupTheory/Nilpotent/LowerCentralSeries.lean:61`, computed in `G`
  with `γ_k(S) = S.lowerCentralSeries (k − 1)` as the README says.
- `Subgroup.isNilpotent_iff_lowerCentralSeries`, `GroupTheory/Nilpotent.lean:376`.
- `frattini_characteristic`, `GroupTheory/Frattini.lean:42`, an instance.
- `frattini_nilpotent`, `GroupTheory/Frattini.lean:58`, a theorem under `[Finite G]`.
- `Polynomial.Gal.galActionHom_injective`, `FieldTheory/PolynomialGaloisGroup.lean:212`.

Tau Ceti 2fd255d:
- `Polynomial.HasFullSymmetricGaloisGroup` (`FieldTheory/GaloisGroups/Symmetric/Basic.lean:35`,
  separable and surjective action) and `.nonempty_mulEquiv` (:87, `f.Gal ≃* Perm (Fin f.natDegree)`).
- `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`
  (`.../Symmetric/Realization.lean:44`, `1 ≤ n`).
- `TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup`
  (`Topology/Algebra/Group/Generation.lean:261`, `[CompactSpace G]`).
- `TauCeti.FiniteEmbeddingProblem` (`.../EmbeddingProblem/Basic.lean:60`; `π` surjective at :75,
  `α` surjective at :79) and `IsSolution` (:92).
- `exists_isSolution_iff_obstruction_eq_zero` (`.../EmbeddingProblem/Cohomology.lean:110`).
- `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
  (`GroupTheory/GroupExtension/Cohomology.lean:319`).
- `TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_artinMap`
  (`NumberTheory/ClassFieldTheory/Local/Unramified.lean:456`).

Searched by object, neither pin has a Fitting subgroup, Fitting's theorem or Schur–Zassenhaus
conjugacy. Tau Ceti's `IsComplement'` files concern Frobenius complements and elementary groups.

**Ownership of the two restored inputs (main and the open heads).**
- FiniteGroupExtensionSplitting on main leaves "Hall subgroups and the conjugacy of coprime
  complements" to LocalFiniteGroupTheory (README:41). Its §1.5 conjugates kernels of crossed maps,
  not coprime complements.
- OddOrderTheorem (README:163–164) and FiniteGroupInvariants (README:30, 320) consume both inputs from
  LocalFiniteGroupTheory and own neither.
- So this roadmap is the only owner other than LocalFiniteGroupTheory, which the project never cites
  as a supplier.
- Consumers still resolve. ArithmeticStatisticsPartVIII (README:22) cites *Coprime profinite
  complements*, present at README:4884. InductionRestrictionPartII cites IG.3.4 targets that are
  unchanged.
- No `Suggested.lean` declaration shares a fully qualified name with another roadmap's declaration.
  LocalFiniteGroupTheory's is `exists_conj_eq_of_isComplement'`, in its own namespace.

**Cross-roadmap citations (`scratch/citations.md`, 51 Lean-name leads, no unresolved roadmap
citation).**
- The `VanishingCycles.*` names other than IG.0.T1–T4 resolve in EtaleCohomologyFoundations on main.
  Examples: `exists_stable_lattice_iff` at `Suggested.lean:275`, `HenselianTrait` at :538.
- `Algebra.galoisTensorMap` and `galoisTensorMap_restrictScalars` resolve in AdicEtaleGeometry
  (main), namespace `Algebra` at `Suggested.lean:263`.
- `grothendieck_existence` resolves in SchemeAndStackFoundations (`Suggested.lean:2088`), with
  `Proetale.isReplete_proetale` in the same roadmap.
- `ClassicalDerived.enhancedCategory` and `inverseLimits` resolve in EnhancedDerivedSheaves.
- `Approximation.hasWeakApproximation_of_simplyConnected` resolves in AdelicAlgebraicGroups
  (`Suggested.lean:377`), which is earlier in the merge order.
- The four IG.0.T1–T4 names (`VanishingCycles.curveEndomorphismTrace`, `etaleTraceFormulaFinite`,
  `etaleTraceFormula`, `pointCountTrace`) are this roadmap's public names. They are consumed by name in
  SchemeAndStackFoundations (main README:7388–7391) and in several open roadmaps
  (AbelianSchemesAndArithmeticModuli README:245, EtaleDualityAndPerverseSheaves README:7124), and they cannot be
  declared at the pins (`Suggested.lean:28–30`). The full review of the earlier head recorded them as
  such, and I leave that settlement unchanged.

**Overlap leads (`scratch/overlaps.md`).**
- "PolynomialGaloisGroups Layer 9 dropped by #763 and #986" is a false positive. Both heads add a new
  folder, `TauCetiRoadmap/PolynomialGaloisGroups` (part III, insertions only: 890 and 420 lines).
  Its README:4 links the base roadmap, `Completed/PolynomialGaloisGroups`, whose README:1385 is still
  "Layer 9: `Sₙ` as a Galois group over `ℚ`".
- No open pull request changes this roadmap.

**Seeded sample: sources read at the cited place.** Keys are the texts fetched through the sources
service for this review.

| Target (README line) | Text read | Result |
| --- | --- | --- |
| Arithmetic representations (1368) | landesman-litt lines 1858–1870, Definition 9.1.1, p. 45 | Number and page correct; README narrower than source (R02) |
| Compatibility with polynomial coefficient maps (1722) | debes-arith-rev lines 5087–5160, §§5.2.1–5.2.2, printed pp. 135–137 | Locator correct; background for the specialization notion |
| Hilbert irreducibility over number fields (1996) | debes-arith-rev lines 5154–5161 (Prop. 5.2.5, p. 137), 5282–5286 (Thm 5.2.9, p. 140), proof to p. 143; Definition 5.2.2 (Zariski density, guard hypersurface) at 5117–5122 | Correct; Serre part not verifiable |
| The integral thin-set count (2116) | Serre and Masser–Zannier not readable | See *Not verifiable*; Checks computed below |
| Full-group specialization of regular covers (2152) | Serre only | See *Not verifiable*; Checks computed below |
| The marked fibre product (3225) | wood-lifting lines 42–44 (Notation 1.1), 84–127 (Definition, Lemmas 2.2–2.4, Theorem 2.5, pp. 3–4), 130–160 (proof) | Correct; the `φψ⁻¹` correction is right (source misprint at line 151) |
| The kernel of the universal marked extension (3262) | wood-lifting lines 53–60 (Lemma 2.1), 114–127 | Follows from Theorem 2.5 as sketched |
| Two independent cyclic degree-eight lifts (3838) | hw-massey lines 1205–1219 (Lemma 7.6, p. 28), 1252–1255 (independence, p. 29), 1276–1280 (quadratic subfields, p. 30) | Hypotheses (`p ≠ q`, both `≡ 1 mod 8`) and conclusions match |
| Identity-root obstruction (5159) | wood-moments-arxiv lines 361–390 (Definition 3.1), 524 (Lemma 3.11), 1131–1144 (Conjecture 5.1) | Numbering matches; Conjecture 5.1 admits `u = 1` (source issue) |
| A normal-crossings configuration compactification (5482) | evw-arxiv (0912.0325v4) lines 1495–1540, Lemma 7.6 with proof, pp. 32–33 | Statement, frame `(p₂ − p₁, p₁)` and `P¹ × P¹` boundary match |
| General-genus Hurwitz comparison (5799) | sga1 lines 9872–9875 (XII Théorème 5.1, printed p. 251), 9957–9961 (Corollaire 5.2, p. 253); chen-nonabelian lines 624–700 (Def. 2.1.4, Rem. 2.1.5, Def. 2.1.6, pp. 14–15), 1064–1073 (Thm 2.4.9, p. 23) | Correct |
| General rational-class fixed-fiber formula (6303) | lwzb lines 2321–2375 (Proposition 12.7 and proof, pp. 50–51) | Fixedness equation `h^{q−1} = W^q` and `nr_{q−1}(W^q) = nr_{q−1}(W)` match lines 2364–2369 |
| Semidirect components versus quotient components (6377) | lwzb lines 1844–1855 (Thm 10.4, pp. 39–40), 2428–2469 (Lemma 12.10, p. 53), 2476–2557 (proof, pp. 54–55) | Hypotheses `gcd(q(q−1), |H|) = 1`, `q ≡ a mod |G|²` match; the lower bound is stated for `π_Γ` in the source, and the README's bound for `π_{G,c}` follows from the uniform error term |
| Euler characteristic of `ℓ`-torsion local systems (6802) | raynaud-bourbaki-286 lines 56–97 (n° 1, Prop. 1, pp. 130–131), 130–144 (n° 3, Théorème 1, (2 ter), p. 133), 145–241 (n° 4, pp. 133–137); stacks-03RR lines 5187–5192 (Lemma 59.69.3); stacks-03RT lines 7241–7244 (Theorem 59.83.11) | Correct except the page range (R03) |
| Symmetric groups as realizations (7309) | Completed/PolynomialGaloisGroups README:1385–1386; the Tau Ceti and Mathlib declarations listed above | Correct; Serre §4.4 not verifiable |

**Adversarial pass.** Each row gives the values computed on each side.

| Statement | Instances and values | Result |
| --- | --- | --- |
| *Conjugacy of coprime complements* / `exists_conj_eq_of_isComplement'_of_coprime` (README 3286, Lean 259) | `N = ⊥`: only complement `⊤`, `n = 1`. `A₄`, `N = V₄`: `gcd(4, 3) = 1`; four Sylow-3 complements; `N_{A₄}(P) = P`, so the `V₄`-orbit has `4/|V₄ ∩ P| = 4` elements. `S₃`, `N = A₃`: `(123)(12)(123)⁻¹ = (23)`. `C₂ × C₂`, `N = C₂ × 1`: `gcd(2, 2) = 2`; `1 × C₂` and the diagonal are not conjugate. `G = ℤ`: `N = 2ℤ` gives `gcd(0, 2) = 2`, excluded; `N = ℤ` gives `gcd(0, 1) = 1`, unique complement `⊥` | Holds; coprimality necessary (R01 concerns only its Lean copy) |
| Its proof sketch, solvable `G/N` step | `M = N(H ∩ M)` (Dedekind); Sylow conjugator `m = kn` with `k ∈ K ∩ M` gives `n(H ∩ M)n⁻¹ = K ∩ M`; `N_G(P) = (N ∩ N_G(P))H`; for `P ⊴ G` the conjugator from `NP = N·P` reduces to `N` since `P ≤ K` | Sound |
| *The Fitting subgroup* (4210) | `F(A₄) = V₄` (normal subgroups `1, V₄, A₄`; `A₄` not nilpotent). Wrong models: `Φ(A₄) = 1`, `Z(A₄) = 1`, `[S₄, S₄] = A₄ ≠ V₄ = F(S₄)`. `⟨(12)⟩ ⊔ ⟨(13)⟩ = S₃` is not nilpotent (normality needed). `D₈ = ⟨r⟩ ⊔ ⟨r², s⟩`: classes 1 and 1, join of class 2 = 1 + 1 (bound attained). Restricted product of the `D_{2^n}`: classes `n − 1` unbounded, `F = G` not nilpotent | Holds; Checks discriminate |
| `le_fitting`, `frattini_le_fitting` (Lean 288, 297) | One term each (probe above) | Padding (R01) |
| *Fitting supplements* (4253) | `S₃`: `F = A₃`, `Φ = 1`, `U = ⟨(12)⟩`, `C₃ ⋊ C₂ ≅ S₃`. `S₄`: `F = V₄`, `U = S₃`. `G = 1`: `F = Φ = 1`, so nontriviality is needed | Holds |
| *Coprime profinite complements* (4884) | `S₃ = C₃ ⋊ C₂`: three complements, conjugate under `C₃`. `C₄ → C₂`: kernel `C₂`, no section | Holds |
| Arithmetic representations (1368) | Trivial `ρ`: orbit 1. `𝔾_m`: `diag(χ,1)[[1,x],[0,1]]diag(χ,1)⁻¹ = [[1,χx],[0,1]]`, orbit 1, image `≅ ℤ_ℓ`. Characteristic `p`, Artin–Schreier character over `𝔽_p(s)`: orbit 1, `π₁` not finitely generated | Holds; scope (R02) |
| Compatibility with coefficient maps (1722) | `q = (T−1)⁻¹Y + T`: at `t = 0` both sides `−Y`; at `t = 2` both `Y + 2` | Holds |
| Specialization preserves addition, Check (1751) | `C(T⁻¹) + C(1 − T⁻¹)` at `0`: `sp₀(1) = 1` against `0 + 0` | Check correct |
| Hilbert irreducibility over number fields (1996); `hilbert_irreducibility` (Lean 91) | `Y² − p` irreducible for primes `p`. `ℝ`: `Y² − (T² + 1)` irreducible over `ℝ(T)`, every `t² + 1 > 0` splits. `r = 0`: empty point, trivial. Guard `g`: `g(T)·Y − 1` keeps degree 1 exactly when `g(t) ≠ 0` | Holds |
| `IsHilbertian` (Lean 73) | `𝔽₂`: `Y² + Y + T` reducible at `t = 0`, `Y² + Y + T + 1` reducible at `t = 1`, so no common `t`. `ℂ`: `Y² − T` | Discriminates; the guard is absorbed by the degree clause |
| `isHilbertian_ratFunc` (Lean 80) | Over `𝔽₂(S)` at `t = S`: `Y² + Y + S` and `Y² + Y + S + 1` are irreducible (simple pole at `∞`, while `a² + a` has an even pole order) | Holds |
| Integral thin-set count (2116) | Squares, `r = 1`: `⌊√N⌋ + 1 ≤ C√N log N`. `E = {1,…,M}` at `N = M`: `C_E ≥ √M / log M`. `N = 1`: `log 1 = 0 < 1` | Checks correct |
| Full-group specialization (2152); `IsHilbertian.infinite_full_group` (Lean 106) | `Y² − T`: `t = 2` gives `ℚ(√2)`, `t = 1` gives `ℚ × ℚ`, `t = 4` keeps degree 2 but splits. `ℂ(T)(√T)`: split everywhere. `(Y² − 2)(Y² − T)`: `t = 3` gives `C₂²`, `t = 8` gives `C₂` (excluded). `f = C c`: trivial group, cofinite set | Holds |
| `IsHilbertian.of_isGalois_of_one_lt_finrank` (Lean 114) | `M = ℚ(μ_{2^∞})`, `L = M(∛2)`: `[L : M] = 3`. `L = M` is excluded by `1 < finrank` | Holds |
| `not_isTopologicallyFinitelyGenerated`, `normal_subgroup_absoluteGaloisGroup_eq_bot` (Lean 121, 129) | `ℚ`: `r` primes give `C₂^r`. `ℝ` is not Hilbertian. `ℚ` with `N = Γ_{ℚ(i)}`: index 2, not finitely generated | Holds |
| `hasRegularRealization_of_rigid`, `IsRigid`, `IsRationalClass` (Lean 156–183) | `S₃`, `(2A, 3A, 2A)`: 6 generating product-one triples, one free orbit. `G = 1`, `r = 0`: rigid, `L = K(T)`. `C₂`, `r = 1`: product `g ≠ 1`, not rigid. `C₃` with class `{a}`: `a² ∉ {a}`, not rational | Holds |
| Marked fibre product (3225) | `C₂`: `P = {(gⁿ, n)} ≅ ℤ`. Kernel `ℤ/3`, `k = 1`: `φψ⁻¹` gives `0`, `φψ` gives `2` | Holds |
| Kernel of `U(G, c)` (3262) | `C₂`: `K = 2ℤ`, `M = 0`. `C₂²` with the three involutions: `⟨x, y⟩` generates `M(C₂²) = C₂`, so `M(G, c) = 0` and `K ≅ ker(ℤ³ → C₂²)` has rank 3 | Holds |
| `LiftingInvariant.stable_classification` (Lean 238) | `C₂`, `c = {g}`: `deg [g]ⁿ = n`, one orbit for each `n ≥ 1`. `G = 1`, `c = ∅`: `U = 1`, only `r = 0`. `G = 1`, `c = {1}`: `U = ℤ`, invariant equals length, and moves `(1, b) ↦ (b, 1)` preserve it | Holds |
| Two independent cyclic degree-eight lifts (3838) | `p = 17`, `q = 41`: subfields `ℚ(√17)`, `ℚ(√82)`, `ℚ(√1394)`. At `2`: `q` is a square, and `(2, −1)₂ = 1` since `−1 = 1 − 2`. `(ψ, 3ψ)` has image of order 8 | Holds |
| Identity-root obstruction (5159) | `I(φ, ·)` is a homomorphism, so `I(φ, 1) = 1`; for `h ≠ 1` the count is 0 | Holds |
| `exists_proper_solution_of_split_nilpotent`, `shafarevich` (Lean 269, 301) | Kernel `1`: `β = s ∘ π` is surjective. `C₄ → C₂` has no section, excluded. `S₃` via `ℚ(∛2, ω)` | Holds |
| `IsSupersolvable` and the Grunwald statements (Lean 308–342) | `S₃`: `1 < ⟨(123)⟩ < S₃`. `A₄`: the only proper nontrivial normal subgroup, `V₄`, is not cyclic, so there is no chain. `C₈` at `2`: `8 ∈ (2)`, excluded (Wang). `QuaternionGroup 2` has order `8 = 2^(0+3)` | Holds |
| `exists_realizations_coprime_degrees` (Lean 364) | `G = 1`: `n = 1`, `E = K`. `n = 0`: the gcd over the empty set is `0 ≠ 1` | Holds |
| Normal-crossings compactification (5482) | `n = 2`: `P¹ × P¹` minus `{0, ∞} × P¹ ∪ P¹ × {∞}` is `𝔾_m × 𝔾_a`; dimension `n = (n − 2) + 2`. `(0, 2) ∉ PConf₂(ℤ)` since `2 ∉ ℤ^×` | Holds |
| General-genus Hurwitz comparison (5799) | `g = 2` étale double cover: `2g′ − 2 = 2·2`, so `g′ = 3`. `P¹` with no markings: trivial torsor only | Holds |
| Fixed-fiber formula (6303) | `h = h^{q⁻¹}W ⇔ h^{q−1} = W^q`. `A = C₃`, `q = 5`, `W = a`: `h = a²`, `(a²)⁴ = a² = a⁵`; `h⁴ = a` is solved by `a`. `q = 2`: unique solution | Holds |
| Semidirect components (6377) | `H = 𝔽₃²`, `Γ = C₂`, `q = 7`: `M(G, c) = ℤ/3`, `A[6] = ℤ/3`, `W = 1` (`q ≡ 1 mod 6`), so the counts are 3 against 1; `gcd(42, 9) = 3`, excluded. `H = 1`: identity | Holds |
| Euler characteristic (6802) | Trivial `M`: `dim H¹ = 2g + s − 1`, rank in Stacks 03RR. `y² − y = x`, `ℓ = 3`: `Sw = 1`, `H¹ = 0`. `x = z³`: `Sw = 3`, `H¹ = 2 = 2·1 + 1 − 1`. Kummer on `𝔾_m`: `2 − 2 = 0` | Holds |
| `abhyankar_affine_curve` (Lean 383) | `g = 0`, `D = {∞}`: bound 0, so `C_ℓ` (`ℓ ≠ p`) is excluded and `C_p` occurs (Artin–Schreier). `D = ∅` is excluded by `hD`; otherwise `0 − 1 = 0` would admit `C_p` on `P¹` | Holds |
| Symmetric groups (7309) | `n = 1`: trivial; `n = 2`: `C₂`. `X²`: root set `{0}`, not separable. `X³ − 3X + 1`: discriminant 81, group `C₃` | Holds |
| `exists_realization`, `exists_disjoint_realizations`, `inverseGaloisProblem_of_regular` (Lean 408–425) | `ℚ(T)(√T)` at `T = 2`. `M = ℚ(√2)`: `t = 3` is disjoint, `t = 8` gives `M` | Holds |
| IG.0.T1, IG.0.T4 (481, 562) | `P¹`, `z ↦ z²`: fixed points `0, 1, ∞`, `3 = 1 + 2`. Elliptic translation: `1 − 2 + 1 = 0`. Constant map: `Δ·(C × {c}) = 1 = 1 − 0 + 0`. `𝔾_m`: `q^r − 1`. `Pⁿ`: `1 + q^r + ⋯ + q^{nr}` | Holds |

**Headline theorems.**
- The end theorems of README:38–42 that are statable at the pins are all stated:
  `isHilbertian_of_numberField`, `hilbert_irreducibility`, `IsHilbertian.infinite_full_group`,
  `HasRegularRealization.exists_disjoint_realizations`, `hasRegularRealization_of_rigid`,
  `LiftingInvariant.stable_classification` and `shafarevich`.
- The Hurwitz component identifications are named in the docstring as not statable (Hurwitz schemes
  absent, lines 33–34).
- Padding probe, this round covering the six new theorems:
  - `le_fitting` and `frattini_le_fitting` close in one term (R01).
  - `fitting_characteristic` does not close by `simp`.
  - Fitting's theorem, nilpotence of `F(G)` and Schur–Zassenhaus conjugacy have no pinned lemma to
    close them.
  - The 18 statements unchanged since b275043 were probed in the earlier rounds.

## Not verifiable

- **Serre, *Topics in Galois Theory*.** The cited places are Cor. 3.2.2 and 3.2.4, Prop. 3.3.1 and
  3.3.3, Cor. 3.3.4, Thm 3.4.1, 3.4.4 and 3.6.2, Appendix §§10.1–10.4, and §4.4. There is no legal
  open copy. These are the Serre locators of the sampled thin-set count, full-group specialization,
  Hilbert irreducibility and symmetric-group targets; their mathematics was checked through the rows
  above.
- **Masser–Zannier, Annals 191 (2020), proof of Lemma 5.1, p. 659.** The arXiv search returned HTTP
  429 and then 503. The Project Euclid landing page has no PDF, and the Annals site is not an allowed
  source class.
- **Published page numbers of EVW (Annals 183, pp. 767–768) and Wood's moments paper (published
  pp. 388–393, 411).** The numbering was checked on arXiv 0912.0325v4 and arXiv 1702.04644. The NSF
  repository copy timed out twice.
- **Settled as uncertified:** Ribes–Zalesskii, Theorem 2.3.15, and Huppert, Kap. III §4,
  Satz 3.2(b) and 4.2(c).
- **Aschbacher, Chapter 6:** no legal copy (R03).

## Source issues

- **Misprint** in wood-lifting at the proof of Theorem 2.5, p. 4: the source multiplies the lift `φ`
  by the discrepancy homomorphism `ψ` to recover the marked generators; it should multiply by `ψ⁻¹`,
  since `φ` sends each marked generator to `[x]k_x`; affects the proof.
- **Error** in wood-moments at Conjecture 5.1, p. 411 (arXiv 1702.04644, Conjecture 5.1): `u` may be
  any root of unity of the cyclotomic field, including `u = 1`, where the invariant is always trivial;
  `u` should generate that group of roots of unity; affects a stated result.
- **Gap** in lwzb at Corollary 12.9, arXiv v2 p. 52: it asserts a non-empty `E_a` and positive
  `r_{a,b}` for every `(G, c)` of Notation 10.1 and every `n ≥ 0`. For `G = 1` (`c` empty, `d = 0`)
  there are no components for `n ≥ 1`, and `n^{d−1}` is undefined at `n = 0`. It should assume
  `G ≠ 1` and `n ≥ 1`; affects a stated result.
