<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2428#issuecomment-6672146877 -->
Review (claude) of 4ac1ea9

Verdict: needs_changes

1. **F01** (P2) §10.1 route: false divisibility claim for elements of `GL_{n/d_v}(D_v)`

   Location: `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md` line 433, "An element of `GL_n(F_v)` coming from `GL_{n/d_v}(D_v)` has characteristic polynomial whose irreducible factors have degrees divisible by `d_v`."

   Claim: every irreducible factor of the (reduced) characteristic polynomial of an element of `GL_{n/d_v}(D_v)` has degree divisible by `d_v`.

   Witness: a central element `γ ∈ F_v^× ⊂ GL_{n/d_v}(D_v)` has reduced characteristic polynomial `(X − γ)^n`, whose only irreducible factor has degree `1`; take `n = 2`, `d_v = 2`, `D_v` the quaternion algebra. What holds is the divisibility of each isotypic degree: for `γ` semisimple with reduced characteristic polynomial `∏ f_i^{m_i}`, `f_i` irreducible of degree `e_i`, the `f_i`-isotypic part of `D_v^{n/d_v}` is a module over the central simple `K_i`-algebra `K_i ⊗ D_v` (`K_i = F_v[X]/f_i`), of index `d_i = d_v / gcd(d_v, e_i)`, so `m_i = s_i d_i` and `m_i e_i = s_i · lcm(d_v, e_i)` is divisible by `d_v`.

   Repair: replace the sentence by "An element of `GL_n(F_v)` coming from `GL_{n/d_v}(D_v)` has reduced characteristic polynomial `∏ f_i^{m_i}` in which every isotypic degree `m_i · deg f_i` is divisible by `d_v`." The next sentence then reads: "For the image of a `(G, H)`-regular `γ_H` the factors of `P_1` (degree `n₁`) and `P_2` (degree `n₂`) have no common root, so `P_1` is a product of whole isotypic factors and `d_v | n₁`." Tested on the witness: `(X − γ)^n` has one isotypic factor of degree `n`, divisible by `d_v`, and the conclusion `d_v | n₁` is unaffected.

2. **F02** (P3) Parent citations carry an `IG.` prefix the parent's head does not use

   Location: `README.md` lines 3, 7, 46–53 and the `*Needs:*`/Dependencies lines of Layers 8–11 (lines 200, 202, 216, 269, 280, 282, 351, 539, 550, 552, 576, 626 among others): "IgusaVarietiesAndTorsionConcentration §IG.3.17", "§§IG.1.3", "Layers IG.0–IG.1", "IG.5–IG.7".

   Witness: at the parent's open head (5447ef6) the headings are `### 0.11`, `### 1.3`, `### 1.4`, `### 1.6`, `### 1.7`, `### 1.8`, `### 3.14`, `### 3.17`, `### 4.4`, `### 4.5`, `### 5.1`, `### 5.2`, `### 5.4`, `### 5.5`, `### 7.6`, `### 0.4`, and the layers are `## Layer 0` … `## Layer 7`; the string `IG.` does not occur in that README. The resolver reports all twelve prefixed citations as found nowhere.

   Repair: drop the prefix everywhere: `§IG.3.17` → `§3.17`, `§§IG.1.3, IG.1.4 and IG.1.6` → `§§1.3, 1.4 and 1.6`, "Layers IG.0–IG.1" → "Layers 0–1", "IG.5–IG.7" → "Layers 5–7", "§§IG.4.4–IG.4.5" → "§§4.4–4.5", and likewise in the supplier contract, the four Dependencies paragraphs and the Scope paragraph. Every renumbered target was read at the head and states what this roadmap attributes to it (see Verified sound).

3. **F03** (P3) ShimuraCompactifications labels `C1.4`, `C5.3`, `C5.5` do not exist at its head

   Location: `README.md` lines 110 and 191–193: "§C1.4: cusp labels", "§§C5.3 and C5.5: integral toroidal compactifications and their properness".

   Witness: at the ShimuraCompactifications head (f51ec79) the sections are `### 1.4 Cusp labels`, `### 7.3 Integral toroidal compactifications`, `### 7.5 Properness`; Layer 5 there is "general-data maps and correspondences" with a single subsection 5.1, and no heading carries a `C` prefix.

   Repair: `§C1.4` → `§1.4`; `§C5.3` → `§7.3`; `§C5.5` → `§7.5` (in the supplier contract, §8.2 prose and *Needs:*, and the Layer 8 Dependencies). §7.5 states properness "for complete `Σ`": keep the phrase "projective admissible fan" in §8.2, which is a complete collection.

4. **F04** (P3) The stated library pins are not the manifest's

   Location: `README.md` line 38: "The library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`."

   Witness: `lake-manifest.json` of the content checkout pins mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and TauCeti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; the design's `plan.json` baseline names a third pair. The file was elaborated against the manifest's pins.

   Repair: replace the two hashes by the manifest's revisions, or delete the sentence and keep "at the pins".

5. **F05** (P3) Page of CS17 Theorem 4.4.4

   Location: `README.md` line 196 and line 530 ("Theorem 4.4.4, p. 726"); `sources.toml` CS17 `locator` ("Theorem 4.4.4, p. 726").

   Witness: CS17 line 3236 lies on pdf page 81, journal page 729 (the page-3 header reads 651 and page 4 reads 652, offset 648); the parent cites "Theorem 4.4.4, p. 729".

   Repair: "p. 726" → "p. 729" in both README occurrences and in the manifest locator (the author's entry is kept otherwise).

6. **F06** (P3) §8.5 defines `ι` and `𝔪^∨` without API bullets or a Checks list

   Location: `README.md` lines 260–262: "Let `ι` be the involution of `𝕋^S` induced by `[K_qgK_q] ↦ [K_qg⁻¹K_q]`. … Put `𝔪^∨ = ι(𝔪)`".

   Witness: the section has four numbered theorems and a route, but no "The API:" list and no `**Checks.**` list; the only tests are two items in the Layer 8 Examples (`(𝔪^∨)^∨ = 𝔪`; roots `{1, 2} ↦ {7, 9}`). The parent's §5.1, which this section restates at rank `n`, carries four Checks.

   Repair: add an API list (ι is an involution of a commutative ring; `𝔪^∨` is maximal with the same residue field; `ι(T_{i,v}) = T_{n,v}⁻¹ T_{n−i,v}`; compatibility with `𝕋^{S′} ⊂ 𝕋^S`) and a `**Checks.**` list with at least three discriminating tests, for instance: for `n = 1`, `ι(T_{1,v}) = T_{1,v}⁻¹` and the root `λ` goes to `λ⁻¹` (exponent `i(n−1) = 0`); for `n = 2`, `q_v = 7`, `ℓ = 11`, roots `{1, 2}` go to `{7, 9}` and `𝔪^∨ ≠ 𝔪`; a definition with `ι(T_{i,v}) = T_{n−i,v}` (no `T_{n,v}⁻¹`) would send `{1, 2}` to `{7·1⁻¹·T_2, …}` with the wrong constant term `(−1)^n q_v^{n(n−1)/2} T_{n,v}⁻¹` instead of `… T_{n,v}`.

7. **F07** (P3) Scope does not name the ACC+ counterpart of §8.8(a)

   Location: `README.md` line 9: "AutomorphicGaloisRepresentationsPartII AG2.7 «Strong local decomposed genericity» owns the local predicate over a finite extension of `ℚ_p`. `IsStrongGenericAt` of §8.7 applies that predicate at a prime of a number field …"

   Witness: AG2.7 at its head (902b706) also owns the global objects: «Completely split generic prime», and the compiled `FiniteModelDecomposedGenericPrime r p` with `infinitelyManyDecomposedGenericPrimes` in its `Suggested.lean` (lines 74–96), which has the same shape as `IsCompletelySplitStrongGenericPrime` (complete splitting as `#primesOver = [F:ℚ]`, trivial image of inertia, ordered ratio `≠ p`) minus the ratio-`1` exclusion. §8.8(a) is a kept variant; the Scope section, the only place that may say "stated by roadmap X", does not say so.

   Repair: add to the Scope paragraph one clause: "AG2.7 «Infinitely many decomposed generic primes» states the same existence theorem for the ACC+ predicate (`FiniteModelDecomposedGenericPrime`, ratio `q_v` excluded only); §8.8(a) is its strong form (ratio `1` excluded too), so `IsCompletelySplitStrongGenericPrime r p` implies AG2.7's predicate and not conversely." Tested: for `k = 𝔽_11`, `q_v = 7`, eigenvalues `{3, 3}` satisfy AG2.7's predicate (`3 ≠ 21 ≡ 10`) and fail the strong one (ratio `1`).

8. **F08** (P3) "positive multiple" in the Layer 10 Examples

   Location: `README.md` line 497: "When every contributing `π_∞` is a discrete series, `ep(π_∞) = (−1)^{q(G)}` and `c(π_f)` is a positive multiple of the summed automorphic multiplicity."

   Witness: by §10.3, `c(π_f) = (−1)^{q(G)}(ε_G d(G_ℝ))⁻¹ Σ_a Σ_{π_∞} m_a(π_f ⊗ π_∞) ep(π_∞)`, which with `ep = (−1)^{q(G)}` equals `(ε_G d(G_ℝ))⁻¹ Σ m_a`; CS17 line 4077 says only that `ε_G, d(G_ℝ)` are nonzero constants, and no sign of `ε_G` is fixed anywhere in the roadmap.

   Repair: "a nonzero multiple of the summed automorphic multiplicity, with the sign of `ε_G`".

9. **F09** (P3) Kept variant of the parent's §5.1/§5.2/§0.4 not listed under the parent's section numbers

   Location: `README.md` line 7: "The parent's §§IG.0.4, IG.5.1, IG.5.2 and IG.5.4 state the Hecke algebra, the dual ideal, Igusa Poincaré duality and the rational constituent for its rank-`2n` quasi-split datum".

   Witness: same label drift as R02 (the parent's headings are `0.4`, `5.1`, `5.2`, `5.4`); listed separately because this sentence is the ownership declaration the gate reads.

   Repair: as in R02, drop the `IG.` prefix in this sentence.

Nine findings, one blocking (P2). Elaboration passes with `sorry` as the only warning. No principle violation: the roadmap extends the parent (whose Layers 5–7 are written for the non-compact quasi-split `(n, n)` datum of the sequel paper), consumes only earlier roadmaps, copies no source passage, contains no algorithm, no sorry'd data and no `set_option`.

## Verified sound

**Principles.** No route-specific shortcut (Cases 1 and 2 of CS17 §6.3 in full generality, every rank and signature). Not a re-plan: the parent's Layers 5–7 (read at head 5447ef6, lines 2081–2388) are for the rank-`2n` quasi-split `(n, n)` datum of the non-compact paper; this roadmap's compact end theorems appear nowhere else (`roadmaps grep` on main and 457 open heads for the CS17 Theorem 6.3.1 statement, Kottwitz's simple Shimura varieties with torsion concentration, `IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, CS-auxiliary pairs: no match outside this package). No copied passage, no algorithm, no sorry'd data, no `set_option`, single `import Mathlib`.

**Dependency check.** Output: `depcheck: 241 roadmaps, 2440 edges, 0 problem(s)`. No UPWARD or CYCLE line. Every supplier named is earlier in the merge order or on main (SchemeAndStackFoundations).

**Elaboration.** `lake env lean Suggested.lean` from the content checkout: two warnings `declaration uses sorry` (lines 79 and 91), exit 0. A scratch copy with `#check @name` for the four declarations elaborated; the four types agree with `scratch/signatures.md` and with the README statements (F number field, `L/F` finite Galois, `k` finite, `n : ℕ`, `v : Ideal (𝓞 F)`, `p : ℕ`); no binder is lost, none is a section variable.

**One-tactic probe (every sorried theorem).** `infinite_setOf_isCompletelySplitStrongGenericPrime` and `infinite_setOf_isStrongGenericAt_degree_one`: `first | simp | (simp_all; done) | rfl | infer_instance` fails on both ("no one-tactic close"). Neither restates a definition, mirrors a Check or computes a value. No padding.

**Headline theorems.** From the README summary: Theorem 6.3.1(1) (§11.5), Theorem 6.3.1(2) (§11.6), Theorem 1.1 (§11.7), Remarks 1.3 and 1.7.1 (§11.8), Theorem 5.5.7 (§9.6), Corollaries 5.6.2–5.6.3 (§§10.3, 10.6), Lemma 5.5.1 and Proposition 5.6.1 (§§9.3, 10.1), and the auxiliary-prime existence theorems (§8.8). The module docstring names every unstatable one with the missing carrier (compact PEL Shimura varieties and their torsion étale cohomology with `𝕋^S`-action; Mantovan's Igusa varieties, `B(G, μ⁻¹)`, Grothendieck groups of `J_b(ℚ_p)`, base change; the PEL signature and the sets `S_i`). Grep of the pinned Mathlib and Tau Ceti confirms none of these carriers exists. The two statable headlines (§8.8(a), (b)) are stated. No stand-in.

**Library declarations opened at the pin.** `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean:183`, abbrev on a monoid action, `σ • x ≡ x^{#(R/Q∩R)} mod Q`); `Ideal.inertia` (`Mathlib/RingTheory/Ideal/Defs.lean:154`, abbrev for `AddSubgroup.inertia`, `Mathlib/Algebra/Group/Subgroup/Basic.lean:1177`); `Ideal.primesOver` (`Over.lean:375`, `{P | P.IsPrime ∧ P.LiesOver p}`) and `Ideal.LiesOver` (`Over.lean:124`); `HeckeRing` (`NumberTheory/HeckeRing/Defs.lean:189`); `NumberField.IsCMField` (`CMField.lean:69`); `NumberField.maximalRealSubfield` (`TotallyRealComplex.lean:125`); `Localization.AtPrime` (`AtPrime/Basic.lean:55`); `IsLocalization` (`Localization/Defs.lean:102`); `Module.Free` (`FreeModule/Basic.lean:43`). Tau Ceti: `HeckeCosetModule.instRingHeckeRing` (`HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient` (`Commutativity.lean:135`), `HeckeAntiInvolution.onHeckeCoset` (`Commutativity.lean:165`), `HeckeRing/GLn/` present. All names and files as cited.

**Supplier citations resolved (every `*Needs:*` line and contract).** Open heads read: EndoscopicTransferAndUnitaryTraceComparison (7205732) §§1.8, 1.16, 5.1, 6.1, 6.3, 6.6–6.10, 6.15, 6.18, 6.21–6.23, 6.25, 7.5, 7.10, 8.1, 8.11, 8.21, 10.32, 14.2, 14.3 (content read for 1.8, 6.3, 6.10, 6.15, 6.23, 6.25, 8.21, 10.32, 14.2, 14.3: §6.3 gives `ϖ` with finite `Ram_ℚ(ϖ)` and no avoidance, so the gap is real; §6.25 covers every rank, both parities and arbitrary signature under `[F⁺:ℚ] ≥ 2`; §6.10 makes `Π^n⃗_∞` cohomological for `Ξ(φ_n⃗)`, as §9.3 says). AutomorphicGaloisRepresentationsPartII (902b706): Layers AG2.0, AG2.2, AG2.3, AG2.5, AG2.7 and the named subsections «The Caraiani–Scholze discrete normalization» (rank `n₁+n₂`, `B = F`, Case 2 setting), «Galois assembly for discrete unitary transfer» (rank `2n`), «Arbitrary regular conjugate-self-dual existence», «Caraiani's full away-prime compatibility», «Residual representation of `π`», «Dual and character-twist Hecke comparison» (`r_{m^∨} ≅ r_m^∨ ⊗ ε̄^{1−n}`, eigenvalues `q_v^{n−1}/α_i`), «Strong local decomposed genericity», «Infinitely many decomposed generic primes», «Unitary discrete-parameter export». BunGAndNewtonStrata (c7d0555) §§1.13, 1.23, 1.25, 1.26, 1.30 (bound on `H` is the sum of component cocharacters), 1.32 (CS17 Lemma 5.5.8 with the single-noncentral-embedding extension). PELModuli (697b514) M0.2, M0.6, M0.7, M0.9, M0.13, M0.16, M0.17, M0.27, M1.13, M2.8 (algebraic space at neat level), M2.10, M2.11, M3.1, M3.4, M4.3, M5.5, M6.1. PerfectoidShimuraVarieties (cfba9f7) §§2.2, 3.5. SmoothRepresentationsOfLocalGroups (4178a1e) SR.1.2, SR.2.2, SR.4.1, SR.4.3 (`S([K diag(ϖ^{(r)},1^{(n−r)}) K]) = q^{r(n−r)/2} e_r`). ArithmeticGaloisRepresentations (cdbe447) §§1.8, 5.1, 5.9. AutomorphicSpectralTheory (539ae72) §§4.7, 6.17, 6.19, 6.20. AutomorphicLFunctionsAndLocalFactors (4ea5784) AL.3.7. ArithmeticLocallySymmetricSpaces (360d0bc) ALS.5a.2, ALS.5a.4 (`⟨x,[KgK]y⟩ = ⟨[Kg⁻¹K]x,y⟩`), ALS.5b.4. EtaleDualityAndPerverseSheaves (23180d4) §0.5. ComplexComparisonPartII (84cbfee) C6.3, C6.4. ClassicalAdicEtaleCohomology (18700fd) §1.3 (Cartan–Leray for pro-finite-étale torsors with continuous `E_2` under hypothesis (★), which the colimit statement of DEC C0.18 supplies), §1.4 (every sheaf on qcqs locally noetherian `X` is a filtered colimit of constructible sheaves), §8.2. DiamondEtaleCohomology (d91fdb5) C0.1, C0.18. ArithmeticGaloisDuality (59edfe2) R02.2.1. AlgebraicModularFormsAndSerreWeights (364af81) Layer 5 = `R15.5` by its own citation dictionary (line 18), §5.10 Deligne–Serre lifting on finite free modules over a DVR. IntegralHeckeAndGaloisDeterminants (0609cf2) §§1.2, 3b.1. SchemeAndStackFoundations on main §§2.2, 2.15. Parent IgusaVarietiesAndTorsionConcentration (5447ef6): §0.11 (unramified local PEL data of type (A)/(C)), §1.3 (Mantovan's Igusa varieties), §1.4, §1.6, §1.7, §1.8, §3.14, §3.17 (compact fibre theorem, "proper over `O_{E,𝔭}`, equivalently `G^ad` anisotropic"), §4.4, §4.5 (minimal-stratum concentration for `𝔪`-torsion, any subalgebra of `𝕋^S`, `p ∈ S`), §5.1, §5.2, §5.4, §5.5 (splitting of generic lifts over any finite `L/ℚ_p`), §7.6 — all exist and say what is attributed, modulo the `IG.` prefix (R02). No upward citation; no two-owner conflict.

**Declared gaps.** Both slugs are in `design/plan.json` `gaps` and under `## Exact supplier contracts` with their suppliers. `gap:auxiliary-character-finite-avoidance`: precise (finite `D ∩ S = ∅`, archimedean type, `Ram ⊂ Spl`, `Ram ∩ D = ∅`), minimal (ETUTC §6.3 and Shin11 Lemma 7.1, line 3470, give no avoidance). `gap:division-algebra-unitary-base-change`: its hypotheses are explicit; minimal, since AG2.2's assembly is for `B = F` (two-block, rank `n₁+n₂`; HLTT rank `2n`) and Shin-BCU lines 13–17 take a hermitian form on `F^n`; CS17 line 4091–4093 cites Shin-BCU for Case 1 nevertheless (Source issues). The intake has announced both since the design.

**Sources, sampled targets (all at the cached text).** Theorem 1.1 CS17 lines 89–95 (p. 651) with footnote 2 lines 113–115; Remarks 1.2–1.7.1 lines 96–133; Definition 1.9 line 149 (p. 652); Theorem 4.4.4 line 3236 (p. 729, R05); §5.1 setup lines 3258–3292 (the three Case 2 conditions, `p` split in `𝒦`); Theorem 5.2.3 line 3419, Corollary 5.2.5 line 3485, Remark 5.2.6 line 3491 (`ι(G,H) = τ(G)τ(H)⁻¹|Out|⁻¹`, line 3432); Proposition 5.3.1 line 3551 (`[F⁺:ℚ] ≥ 2` at line 3561), Theorem 5.3.2 line 3588 (`ε_n⃗ = 1/2` for `(n/2,n/2)`); `Red^b_n⃗` lines 3638–3656, Remark 5.4.1 line 3662, Lemma 5.4.2 line 3666, product decomposition lines 3678–3700, Lemma 5.4.3 line 3714 (prints `Red(π_p)`); Lemma 5.5.1 line 3740, Corollary 5.5.2 line 3804, Remark 5.5.3 line 3829, Corollary 5.5.5 line 3899, Remark 5.5.6 line 3950, `r`-part paragraph lines 3967–3971, Theorem 5.5.7 line 3978 (prints `ι_p ∘ τ`, line 3979; `BC^p`, line 3987; proof uses `BC^S`, line 3990), proof lines 3988–4036, Lemma 5.5.8 line 4037; §5.6 lines 4060–4067 (`B` split above `p`; Shin12 inert assumption not needed), Proposition 5.6.1 line 4068, display 4076, Corollary 5.6.2 line 4082, Shin-BCU citation lines 4091–4093, Corollary 5.6.3 line 4102; Corollary 6.1.4 line 4244 (`𝔪`-torsion); Definition 6.2.1 line 4326, Lemma 6.2.2 line 4339; Cases 1–2 lines 4367–4371, `𝕋^S` lines 4381–4383, Theorem 6.3.1 lines 4384–4416 (prints `ℤ_p^×`, `ℚ_p^×` at lines 4402, 4407), Remarks 6.3.2–6.3.3 lines 4422–4434, footnotes 33–34 lines 4451–4454, proof lines 4435–4497. Shin-BCU Theorem 1.1 lines 41–54, setting lines 13–18 (hermitian form on an `n`-dimensional `F`-space; no quasi-splitness or signature condition). Shin11 Lemma 7.1 line 3470, p. 1722 (`Ram_ℚ(ϖ) ⊂ Spl_{F/F⁺}`). Every sampled hypothesis and conclusion is as the README states; the only page slip is R05.

**Adversarial table** (sampled targets, headlines and the findings' targets).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.1 dimension `d = Σ_{τ∈Φ} p_τq_τ` | `[F⁺:ℚ]=2, n=3`, `(1,2)` at `τ₀`, `(0,3)` at `τ₁`; HT signature; `n=1` | `d = 2`; over all four embeddings `4`; HT `d = n−1`; `n=1`: `d=0` | sound | none |
| §8.1 compactness hypothesis in Case 2 | `n=3`, `(1,2)` at every `τ∈Φ` | hermitian space of dim 3 isotropic at all finite places and indefinite at all real places ⇒ isotropic ⇒ `G^ad` isotropic | non-example valid; hypothesis needed | none |
| §8.3(5) central correction | `S_i={τ,τ′}`, `(1,1)`, `(2,0)`, `n=2` | Shapiro bound `diag(t²,t)`, `κ(μ⁻¹) = −3`; `κ(μ_{i,τ}⁻¹) = −1`; `p·I_2` shifts `κ` by `2` | sound; CS17 omits the shift | Source issue only |
| §8.3(2) `τ ∈ ⋃S_i ⇔ τc ∉ ⋃S_i` | `p` split completely in `F`; `p` inert in real quadratic `F⁺` | `m=[F⁺:ℚ]`, singletons; `m=1`, `S_1` has one of each conjugate pair | sound | none |
| §8.4 Hecke polynomial vs Satake | `n=1`; `n=2` with SR.4.3 `S(T_r)=q^{r(n−r)/2}e_r` | `n=1`: `X−T_1`; `n=2`: `X²−T_1X+qT_2 ↦ (X−q^{1/2}x_1)(X−q^{1/2}x_2)`; general: coefficient of `X^{n−i}` is `(−1)^i q^{i(n−1)/2}e_i(x)` | sound | none |
| §8.5(1) `ι(T_{i,v}) = T_{n,v}⁻¹T_{n−i,v}` | `diag(ϖ^{(i)},1^{(n−i)})⁻¹ = ϖ⁻¹·diag(1^{(i)},ϖ^{(n−i)})` | central factor `[Kϖ⁻¹K] = T_{n,v}⁻¹`; permutation gives `T_{n−i,v}` | sound | none |
| §8.5(2) exponent `i(n−1)` | symbolic | `i(i−1)/2 + n(n−1)/2 − (n−i)(n−i−1)/2 = ni − i` | sound | none |
| §8.5/§8 Example dual roots | `n=2, q_v=7, ℓ=11`, roots `{1,2}` | `7·1⁻¹=7`, `7·2⁻¹=7·6=42≡9`; ordered ratios of `{7,9}`: `7·5=35≡2`, `9·8=72≡6`; of `{1,2}`: `2, 6`; arithmetic normalisation `{8, 4}` | sound | none |
| §8.7 `IsStrongGenericAt` degenerate cases | `n=0`; `n=1`; `v=⊥`; `Q=⊥`; `v | ℓ` | `n=0`: charpoly `1 = ∏_∅`, ratio clause vacuous; `n=1`: no pairs; `⊥` not maximal / does not lie over `v≠⊥`; `v | ℓ` excluded by `(ℓ : 𝓞 F) ∉ v` | sound, non-vacuous | none |
| §8.7 Checks | `{3,3}`, `{1,2}`, `{1,7}` at `q_v=7`, `ℓ=11` | `{3,3}`: ratio `1` fails strong, `3 ≠ 21≡10` passes weak; `{1,2}`: `{2,6} ∩ {1,7} = ∅`; `{1,7}`: `7∈{1,7}` fails | sound | none |
| §8.7 Frobenius choice | `Q` ramified in `L/F`, `r` kills inertia | Frobenius lifts form an inertia coset; `r` constant on it; `IsArithFrobAt` forces `σ(Q) ⊆ Q` | well defined | none |
| §8.8(a) `infinite_setOf_isCompletelySplitStrongGenericPrime` | `L_r` cut out by `r`, `L̃` Galois closure of `L_r(ζ_ℓ)/ℚ`; `n=0`; `L=F`, `n≥2` | Frobenius elements over `p` fill the class `C ⊂ Gal(L̃/ℚ)`, each in `Gal(L̃/F̃)`, restriction to `L_r` reproduces `r(Frob_{v₀})` exactly and `p ≡ p₀ mod ℓ`; `n=0`: predicate = "splits completely", infinite by Chebotarev; `L=F`: hypothesis false for `n≥2` (ratio `1`), statement vacuous but true | true | none |
| §8.8(b) `infinite_setOf_isStrongGenericAt_degree_one` | `v₀` of degree 2; `F=ℚ`; `v₀` ramified in `L` but `r` unramified | Chebotarev in `Gal(L_r(ζ_ℓ)/F)` for class of `Frob_{v₀}` (unramified since `r` kills inertia and `v₀∤ℓ`); same eigenvalues, `q_v ≡ q_{v₀} mod ℓ` via `ζ_ℓ`; degree-`≥2` places have density `0`; `F=ℚ`: all primes degree one | true | none |
| §8.8(b) consequence: auxiliary pair | real quadratic `F⁺`, `n=3`, non-definite `τ₀` | `τ₀c` lies over `u^c`, so only `τ₀` can enter `⋃S_i`; `ι_p` chosen with `ι_p⁻¹∘τ₀` inducing `v` puts it in `S_i` for `𝔭_i=v`; other `S_j` definite | sound | none |
| §9.1 trace identity constants | `n⃗=(n/2,n/2)` vs others | `ι(G,G_n⃗)τ(G_n⃗) = τ(G)|Out|⁻¹`, `|Out|=2` iff `n₁=n₂` ⇒ `ε=1/2` | matches CS17 line 3592 | none |
| §9.2 / Layer 9 Example | split `GL_2`, `μ=(1,0)` | ordinary slopes `(−1,0)`, `J_b=GL_1×GL_1`; basic slope `−1/2`, `J_b=D^×`; `LJ(1)=LJ(Ind)−LJ(St)=0−1_{D^×}` | agrees with ETUTC §10.32 | none |
| §9.3(1) archimedean component | proper `n⃗` | ETUTC §6.10: `f^n⃗_∞ = Σ f_{𝒢_n⃗,Ξ(φ_n⃗)}`, so `Π^n⃗_∞` cohomological for `Ξ(φ_n⃗)`; CS17 line 3755 prints "trivial" | README right | Source issue |
| §9.4 `r`-part | `n=1`, `Π=ψ⊗Π⁰`; zero class | index from `Π⁰` only; `ψ` change keeps index; zero class ⇒ all parts zero | sound | none |
| §9.5 | `S_i` without nontrivial `τ`; one nontrivial `τ` | `B(G_i,μ_i⁻¹)` a point, `J_{b_i}=Res GL_n` quasi-split; `J_b = Res(GL_{p_τ}×GL_{q_τ})` for ordinary `diag(ϖ^{−1(p_τ)},1^{(q_τ)})` | sound | none |
| §9.6 | `G_ℝ` definite | `B(G,μ⁻¹)` a point, statement empty | sound | none |
| §10.1 route | `γ ∈ F_v^×` central in `GL_{n/d_v}(D_v)`, `n=2`, `d_v=2` | reduced charpoly `(X−γ)²`, irreducible factor degree `1 ∤ 2`; isotypic degree `2` | step false as printed, conclusion `d_v | n₁` holds with isotypic version | R01 |
| §10.1 `lcm_v d_v = n` | `B` division of degree `n` | Brauer–Hasse–Noether: index = lcm of local indices; `n₁ < n` ⇒ some `d_v ∤ n₁` | sound | none |
| §10.3 coefficient | symbolic from Matsushima and §10.2 | `(−1)^{q(G)}c(π_f) = (ε_G d(G_ℝ))⁻¹ Σ_a Σ_{π_∞} m_a ep(π_∞)` | sound | none |
| Layer 10 Example sign | discrete-series `π_∞` | `c(π_f) = (ε_G d(G_ℝ))⁻¹ Σ m_a`; sign of `ε_G` unfixed | overclaim "positive" | R08 |
| §10.4 vs Shin-BCU | `B = F` vs division `B` | Shin-BCU lines 13–17: hermitian form on `F^n`; `(iii)` infinitesimal character of `(ξ⊗ξ)^∨` with `ξ` trivial | gap correctly declared | none |
| §11.1 contraction | `S′=S`; finite `M` | trivial; `M = ⊕_𝔐 M_𝔐` over the Artinian image, summands with `𝔐∩𝕋^{S′} ≠ 𝔪′` die after localising (an element of `𝔐∩𝕋^{S′}∖𝔪′` acts nilpotently and invertibly) | sound | none |
| §11.2(a) vs CS17 | `n=1`, `K_p=ℤ_p^×`, `ℓ | p−1` | `H^1_cts(ℤ_p^×,𝔽_ℓ) = Hom(ℤ_p^×,𝔽_ℓ) ≠ 0`, so the row `a>0` of `E_2` need not vanish; only "some `j ≤ i`" follows | README's weakening correct | Source issue |
| §11.4(2) freeness | universal coefficients | `H^i(ℤ_ℓ)_𝔪/ℓ ↪ H^i(𝔽_ℓ)_𝔪`, `H^{i+1}(ℤ_ℓ)_𝔪[ℓ]` quotient of `H^i(𝔽_ℓ)_𝔪`; Nakayama on finitely generated modules | sound | none |
| §11.5 uniqueness set | places above `Spl_{𝒦/ℚ}` | every degree-one place of `F` lies above a prime split or ramified in `𝒦`; density one | sound | none |
| §11.6 step 2 | `r` lifting `(𝔪′)^∨` | `r̄^{ss} = ρ_{𝔪^∨} = ρ_𝔪^∨⊗ε̄^{1−n}` on a density-one set ⇒ globally (Brauer–Nesbitt) | sound | none |
| §11.7 Theorem 1.1 forms | (2) completely split `p`; (3) HT-type signature | (2) every `S_i` singleton; (3) via §8.8(b) | sound | none |
| §11.8(2) upper bound | `K/K′` with `ℓ | |K/K′|` | `E_2^{a,d}`, `a>0`, may be nonzero, so duality with `L_{V^∨}(d)` and `𝔪^∨` is needed; `2d−i<d ⇔ i>d` | sound | none |
| Worked example | real quadratic `F⁺`, `n=3`, `(1,2)`, `(0,3)` | `d=2`; `p` split in `F⁺`: `q_{𝔭_1}=p`; `p` inert: `m=1`, `q_{𝔭_1}=p²`, `c_1 ∈ {0,1}` | sound | none |

**Conventions.** `ε̄(Frob^geom_v) = q_v⁻¹` pinned by the `{1,2} ↦ {7,9}` example; `d_b = d` for the `μ`-ordinary class (`⟨2ρ, −w₀μ⟩ = ⟨2ρ, μ⟩`); `B(G,μ⁻¹)` slopes in `[−1,0]` as in CS17 Lemma 5.5.8.

**README shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 8–11 with Examples and Dependencies, Downstream consumers, Worked examples, References. Definitions with API and ≥3 Checks: §8.1 (5), §8.3 (4), §8.4 (4), §8.7 (5), §9.4 (3), §10.5 (3); §8.5 lacks them (R06). No LaTeX delimiters, no process words, no pull-request numbers, no local paths, no `lemma`, no `set_option`. Cached-text line citations (`CS17 line N`) follow the practice of roadmaps on main and at open heads (for instance AdicCoefficientsAndComparisonsPartII cites `temkin10 line 2339`). Every backticked name attributed to this roadmap (`IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, the two theorems) is declared in `Suggested.lean`; the resolver lists no missing Lean name.

**Manifest.** Three sources recorded, all certified from legal places (Annals open PDFs, author page); no local path. No fetch was needed.

## Not verifiable

- Shin, *A stable trace formula for Igusa varieties* (Lemma 7.1, cited by CS17 line 4071 for Proposition 5.6.1) and Shin 2012 §6 are not in the manifest; the README supplies its own route for §10.1 (R01), so no citation into them is made and nothing was fetched.
- The root disk of the worker was full for part of the session (0 bytes free); intermediate output was kept on a temporary filesystem and copied into the job scratch directory once space returned. No deliverable was affected.

## Source issues

- **Misprint** in CS17 at Theorem 5.5.7 and Corollary 5.6.3, printed pp. 747 and 750: the source defines `S_i` through the composite `ι_p ∘ τ`, which is not defined since `τ` lands in `ℂ`; it should be `ι_p⁻¹ ∘ τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7 and the preceding paragraph, printed pp. 746–747: the source writes the restricted summand as a base change at the single place `p` (`BC^p`); the proof and Corollary 5.5.2 use the base change outside `S`; affects nothing.
- **Misprint** in CS17 at Lemma 5.4.3, printed p. 741: the conclusion is printed for `π_p`; the representation reduced is the component `π^n⃗_p` of the endoscopic group; affects nothing.
- **Misprint** in CS17 at Lemma 5.5.1, printed p. 742: the source says `Π^n⃗_∞` is cohomological for the trivial algebraic representation; for a proper endoscopic `n⃗` it is cohomological for the twisted coefficient system `Ξ(φ_n⃗)` entering `f^n⃗_∞` (its §5.3), trivial only for `n⃗ = (n)`; affects nothing.
- **Misprint** in CS17 at Theorem 6.3.1(1), printed p. 757: the similitude factor at a prime `q` is printed as `ℤ_p^× ⊂ ℚ_p^×`; it should be `ℤ_q^× ⊂ ℚ_q^×`; affects nothing.
- **Misprint** in CS17 at §5.2, printed p. 735: the source cites Proposition 7.1 of Shin's Annals 2011 paper for the choice of `ϖ`; the statement is Lemma 7.1 there (p. 1722); affects nothing.
- **Gap** in CS17 at §5.6, paragraph after Corollary 5.6.2, printed p. 749: the source says base change to `GL_n` for Kottwitz's simple Shimura varieties (division algebra `B`) is established in Shin's appendix to Goldring; that appendix treats the unitary similitude group of a hermitian form on `F^n`, so the division-algebra case also needs the global Jacquet–Langlands correspondence; affects the proof (of the existence of `r_{π,ℓ}` in Case 1).
- **Gap** in CS17 at proof of Theorem 5.5.7, printed p. 748: the source identifies `B(G_i, μ_i⁻¹)` with `B(GL_n/F_{𝔭_i}, μ_{i,τ}⁻¹)` by Shapiro; the Shapiro bound is the sum of the component cocharacters, which differs from `μ_{i,τ}` by the central cocharacter `c_i·z` when `S_i` has `c_i` embeddings of signature `(n,0)`, so the identification is Shapiro followed by translation by `p^{c_i}`; affects nothing.
- **Gap** in CS17 at proof of Theorem 6.3.1, printed p. 758: the source says that for the least `i` with `H^i(S_K, 𝔽_ℓ)_𝔪 ≠ 0` the perfectoid-level group `H^i(𝒮_{K^p}, 𝔽_ℓ)_𝔪` is nonzero; the Hochschild–Serre sequence for hyperspecial `K_p`, whose continuous cohomology need not vanish in positive degrees, gives only some degree `j ≤ i`, which is all the proof uses; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4ac1ea9f64e6fe132da129103b543caaf6858ef7", "job": "REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII", "model": "fable", "worker": "chris-x19"} -->
