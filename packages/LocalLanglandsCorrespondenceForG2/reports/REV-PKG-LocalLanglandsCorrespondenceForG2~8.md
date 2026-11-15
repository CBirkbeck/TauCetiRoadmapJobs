<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6903142207 -->
Review (claude) of 4dc7e1e

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.11(ii)(a): the route identifies A_u with Lif(Π_u) at every place, which needs a generic global Arthur parameter

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:644`, §3.11, Route: "satisfies γ(s, A_u × T_u, ψ_u) = γ(s, Π_u × T_u, ψ_u) at every place u (GF, §2.7(a), pp. 6–7, where A_u ≅ Lif(Π_u): at the finite places by §3.9 and Arthur's local packets".

   **Claim:** For every cuspidal Π on Aut(O) with a nonzero cuspidal lift Σ to PGSp₆, the component A_u of the GL₇ transfer is Lif(Π_u). Lif(Π_u) has the L-parameter of θ(Π_u) restricted to Sp₆ (§§3.2, 3.9). A_u has the L-parameter attached to the local Arthur parameter ψ_u of Σ. The multiplicity formula places θ(Π_u) in the Arthur packet of ψ_u. That packet is an L-packet only when the Arthur SL₂ is trivial. Hypothesis (a) does not make the global parameter generic, so the step is not available at the stated generality, and no supplier gives the equality of gamma factors that would replace it. The step is taken from inside GF's proof (GF lines 241–245), which asserts it without a hypothesis.

   **Witness:** ModularityAndLanglandsExtensions at its open head, §3.15(c): "if `ψ=φ` has trivial Arthur `SL₂`, `Π̃_φ` is tempered … these packets partition the tempered dual"; §3.17 puts the components in `Π̃_{ψ_v}` for every ψ. GF line 243.

   **Exact repair:**

   1. In §3.11(ii) replace "(a) Π has a nonzero cuspidal global theta lift to split PGSp₆" by "(a) Π has a nonzero cuspidal global theta lift to split PGSp₆ whose restriction to Sp₆ has a generic global Arthur parameter (ModularityAndLanglandsExtensions §§3.8, 3.17: the standard transfer is an isobaric sum of distinct unitary self-dual cuspidal representations)".
   2. In the Route of (ii)(a) replace "where A_u ≅ Lif(Π_u): at the finite places by §3.9 and Arthur's local packets" by "where A_u ≅ Lif(Π_u): the global parameter being generic, its localization at u is an L-parameter and the component of Σ at u lies in its L-packet (§§3.15, 3.17), at the finite places with §3.9".
   3. In the uniqueness Route, case Irr♥, after "cuspidal (§10.5, the Steinberg alternative)" add: "its component at v₁ is θ(St) = St_PGSp₆, whose Sp₆-parameter Sym⁶ is irreducible, so the transfer is a single cuspidal representation of GL₇ and the parameter is generic (as in §3.15)".
   4. Add to Notes on the sources: "GF §2.7(a), pp. 6–7, identifies the components of the transfer with Lif(Π_v) for every Π with cuspidal lift; this uses that the local packets are L-packets, which holds for a generic global parameter. §3.11(ii)(a) carries that hypothesis; the uniqueness argument uses only Π with a Steinberg component, where it holds."
   5. Add the Check: "The Steinberg component forces genericity. A summand μ ⊠ S_a ⊠ S_b of a local Arthur parameter has exponents (a−1)/2 − i + (b−1)/2 − j. The seven exponents 3, 2, 1, 0, −1, −2, −3 of Sym⁶, each once, arise only from (a, b) = (7, 1) or (1, 7), and the packet of (1, 7) is the trivial representation; so St lies only in the packet of Sym⁶ ⊠ 1."

   If the unrestricted form of GF Theorem 2.4(ii)(a) is wanted instead, it needs a new contract on ModularityAndLanglandsExtensions §3.15: at every place, finite or real, the gamma factors of the L-parameter of every member of a local Arthur packet of Sp₆, twisted by any parameter of GL_r, equal those of the L-parameter attached to the Arthur parameter.

   **Repair test:** For the Π of the uniqueness argument (St at v₁) the transfer is one cuspidal representation of GL₇, the new hypothesis holds and the argument is unchanged. For a Π whose lift has a parameter with nontrivial Arthur SL₂, (ii)(a) no longer asserts anything, so the unsupported step is not used. Narrowing (ii) weakens only the existence half; "any two families satisfying (i) and (ii) coincide" becomes stronger.

2. **F02** (P2) §3.11(ii)(b): the contract cubic-global-jacquet-langlands is false for one-dimensional Π′, and for split D the route applies AL.3.6.2 to a representation that need not be cuspidal

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:75`: "with JL(Π′)_v ≅ Π′_v where D splits and JL(Π′)_v the Jacquet–Langlands transfer of §4.7a of Π′_v where D ramifies"; `README.md:644`: "(cubic-global-jacquet-langlands contract; JL(Π′) = Π′ when D is split)".

   **Claim:** (1) The contract quantifies over every Π′ in the discrete spectrum of D×. For Π′ = χ ∘ Nrd the transfer is χ ∘ det, with component χ_v ∘ det at a ramified v. The transfer of §4.7a of χ_v ∘ Nrd is χ_v ⊗ St₃, since §4.7a is a bijection of essentially square-integrable representations. The same sentence asks for L-functions that are "a product of shifted L-functions", which is this case, so the contract contradicts itself. (2) For split D a constituent Π′ of the lift to PGL₃ need not be cuspidal. AL.3.6.2 is stated for unitary cuspidal representations.

   **Witness:** D× is compact modulo centre at a ramified v, so 1 is square-integrable there and its transfer is St₃ ≠ 1_GL₃. AutomorphicLFunctionsAndLocalFactors AL.3.6.2: "Use unitary cuspidal representations". EndoscopicTransferAndUnitaryTraceComparison §4.7a: "the unique bijection between essentially square-integrable irreducible representations".

   **Exact repair:**

   1. In the contract (README and the `needs` of the same slug in `design/plan.json`) replace the clause quoted above by: "with JL(Π′)_v ≅ Π′_v where D splits; where D ramifies, JL(Π′)_v is the Jacquet–Langlands transfer of §4.7a of Π′_v when Π′ is infinite-dimensional, and JL(Π′) is then cuspidal; for Π′ = χ ∘ Nrd, JL(Π′) = χ ∘ det, whose component χ_v ∘ det at a ramified v has the cuspidal support χ_v|·|, χ_v, χ_v|·|⁻¹ of the transfer χ_v ⊗ St₃ of Π′_v; the standard L-function of JL(Π′) is that of a cuspidal representation or L(s + 1, χ) L(s, χ) L(s − 1, χ)".
   2. In the Route of (ii)(b), after the displayed identity of gamma factors add: "a Rankin–Selberg factor depends only on the cuspidal support (AL.3.3.1), which covers JL(Π′)_u = χ_u ∘ det against χ_u ⊗ St₃ at a ramified u".
   3. Replace "JL(Π′) = Π′ when D is split" by: "when D is split, Π′ is an irreducible automorphic representation of PGL₃, a subquotient of the normalized induction of a cuspidal datum (AutomorphicLFunctionsAndLocalFactorsPartII §10.0, first statement); JL(Π′) then denotes the isobaric sum of that datum, which has the partial L-functions of Π′, its gamma factors at the finite places (AL.3.3.1) and, at the real places, where Π′_u is spherical, its parameter χ₁ ⊕ χ₂ ⊕ χ₃"; and say that AL.3.6.2 is applied to each cuspidal summand, twisted to be unitary.
   4. Add the Check: "For Π′ = 1 on D× the transfer is the trivial representation of GL₃, not a representation with Steinberg components: at a ramified u, γ(s, 1_GL₃ × T_u, ψ_u) = γ(s + 1, T_u, ψ_u) γ(s, T_u, ψ_u) γ(s − 1, T_u, ψ_u) = γ(s, St₃ × T_u, ψ_u), which is the factor that Lif(π_deg[1]), of parameter Sym² ⊕ 1 ⊕ Sym², contributes."

   **Repair test:** At Π′ = 1 and a ramified u: Π_u = θ(1) = π_deg[1], Lif has parameter Sym² ⊕ 1 ⊕ Sym², and the left side is γ(T_u) γ(St₃ × T_u)². The right side is γ(T_u) γ(1_GL₃ × T_u)², equal by the common cuspidal support. The uniqueness argument is unaffected: its Ξ has Ξ_v₀ ≅ τ′ ≠ 1, and an infinite-dimensional or one-dimensional constituent is covered by the two cases.

3. **F03** (P3) one locator without a number, and two manifest entries that omit cited statements

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:958` (§7.2): "(GS, §1.4, p. 6; HKT, main theorem)"; `packages/LocalLanglandsCorrespondenceForG2/sources.toml:47` and `:56` (HKT); `sources.toml:84` (GS).

   **Claim:** (a) "main theorem" is not a locator: HKT numbers its statements. (b) The HKT entry records only Lemma 4.6 and `cited_for = ["0.0", "0.5"]`, but §7.2 and Notes on the sources cite it. (c) The GS `locator` omits seven statements the README cites. Round 6 repaired the same omission for CG.

   **Witness:** HKT line 716 (Theorem 3.3, p. 17: the map is surjective); HKT line 802 (Proposition 4.3, p. 19). README lines 12, 17, 225, 243, 814, 1221, 1222 cite GS Corollary 10.6, Proposition 11.6, Definition 12.1, Lemma 12.2, Corollary 5.3, Lemma 10.1, Theorem 2.1.

   **Exact repair:** (a) In §7.2 write "HKT, abstract, p. 1, and Theorem 3.3, p. 17, for surjectivity; §4, p. 19, for injectivity", after reading the conclusion of Proposition 4.3. (b) In the HKT entry set the `locator` to "Lemma 4.6; Theorem 3.3; Proposition 4.3" and add "7.2" and "Notes on the sources" to `cited_for`. (c) Add to the GS `locator`: "Theorem 2.1; Corollary 5.3; Lemma 10.1; Corollary 10.6; Proposition 11.6; Definition 12.1; Lemma 12.2".

   **Repair test:** After (c) every numbered GS statement that a search of the README for "GS" followed by a statement number returns is in the entry.

Three findings: two P2, both in the existence half of §3.11(ii) (the global functional equation of the G₂ × GL_r factors), which round 8 rewrote, and one P3 (a locator and two manifest entries). All three round-7 findings are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, and neither admitted theorem is padding. The uniqueness half of §3.11, the new statements §1.3(a′), §1.3(c), §1.4(ii), the new §8.1 route and the three new contracts were recomputed and hold, except as R01 and R02 say.

## Previous findings (round 7)

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P1), §3.11: undefined real factors, unsupplied global lifts, uncontrolled place | `README.md:634`: "At a real place u of a number field the factors are the same for every family"; rule (e) at `:638`; S defined at `:640`; new contracts at `:62`, `:63`, `:75`; §1.3(a′), (c) at `:346`; §1.4(ii) at `:359`. | Repaired, by a route different from the one proposed. The uniqueness half is sound (rows below). The rewritten existence half has two gaps: R01, R02. |
| F02 (P2), contract pgsp6-pgso8-unramified-theta not minimal | Contract gone from the README and from `design/plan.json` (18 slugs in both). §8.1 Route at `:1005`: "so no value is `q^(±1)`, the unramified principal series with Satake parameter s̃ is irreducible and σ_v⁰ is generic". | Repaired. |
| F03 (P3), four *Needs:* lines | `:395` no longer lists §1.6; `:657` and `:667` no longer list §3.11; `:476` cites "SRU.5 (§5.3, *spherical-generic-criterion*)". | Repaired. |

No finding of the repair report was marked not actionable. Patterns searched for in the rest of the package: a route step with no supplier (found in §3.11(ii): R01, R02; none in §§1.4, 2.3, 2.4, 3.1, 3.15, 6.4, 6.5, 8.1); a contract asking for what is provided (none); a manifest locator that omits cited statements (R03).

## Verified sound

### Principles and shape

All 75 numbered targets were read with their *Needs:* lines, API bullets and Checks. No route-specific shortcut (residue characteristics 2 and 3 are inside every statement; the exception at p = 3 is the source's, GS line 162, stated as an injection). No re-planned roadmap, no algorithm, no `set_option`, no sorry'd data, no `lemma`. Residue scan of `README.md` and `Suggested.lean` for pull-request numbers, round labels, process words, paths, HTML anchors and LaTeX delimiters: 0 hits. Layer titles name mathematics. Every definition has an API list and at least three Checks; every layer ends with Examples and Dependencies.

### Seeded source sample (15 of 15 read)

| Target | Text opened | Result |
|---|---|---|
| 0.1 | GS lines 700–710 (§4.1, pp. 16–17); 377–394 (§2.2, p. 9) | Restrictions std ⊕ 1 and spin, as stated. |
| 0.4 | GS lines 415–418 (Lemma 2.4(iii), p. 9); 587–591 (p. 13) | Injectivity of std∗ ∘ ι∗ and its discrete restriction. |
| 1.5 | GS lines 1243–1250 (Lemma 10.8, p. 30) | Hypotheses on σ and δ as stated. |
| 1.7 | GS lines 1541–1570 (Lemma 12.4, p. 37); Shin lines 471, 861–866, 954–992 (pp. 14, 24, 26–27) | Statement matches; Theorem 5.8 gives no spin regularity, as the README says. |
| 2.1 | GS lines 690–699 (p. 16) | Three maps, permuted by triality; f₁ standard. |
| 2.3 | GS lines 737–747 (pp. 17–18); 872–874 (p. 21); 1574–1590 (pp. 37–38) | Global lift and its components; route through the Rallis formula. |
| 3.5 | GS lines 113–115 (p. 3), 511–512 (p. 12); HD lines 1600, 1799, 2001–2009 (PDF pp. 42, 47, 52) | Langlands-quotient rule; Theorem 15.1(v). |
| 3.14 | GS line 145 (p. 4); 532–535 (p. 12) | Characterization by (i)–(iv). |
| 5.1 | GS lines 839–862 (§5.2, p. 20) | The two conditions; non-uniqueness. |
| 6.4 | GS lines 1018–1051 (pp. 24–25) | Both globalizations, two equal places. |
| 7.1 | GS lines 102–176 (pp. 3–4) | Items (i)–(x), with the exception at p = 3. |
| 9.1 | GS lines 1454–1509 (§§12.2–12.3, pp. 34–36) | Partition, two definitions, agreement on the club locus. |
| 10.2 | GS lines 1610–1613 (Theorem 12.6, p. 38) | Tempered and discrete preserved. |
| 10.3 | GS lines 1614–1627 (pp. 38–39) | Twist rule through f₂ and the spinor norm. |
| 10.8 | GS line 1644 (p. 39) | The source asserts the reduction; the README states it as a target. |

GF lines 60–362 (pp. 2–9) were read in full for §3.11. The author flagged no locator as unverified.

### Adversarial table (sampled targets, headlines, changed passages, targets the findings touch)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.0 `griess_conjugacy` | 20 one-tactic probes; t against t², ζ⁵ = 1 | all probes fail; multiplicity of ζ: 2 against 1 | Not padding; hypothesis is the intertwiner. |
| §0.8 `spin7_not_acceptable` | probe with the trivial group | goal reduces to `False` | Not padding. |
| §0.1 | a = 2, b = 3; a = −1, b = 1; λ = (1, 0, 0, 0) | product 1·2·3·(1/6)·(1/2)·(1/3)·6 = 1; three 1 and four −1, spin four and four, traces −1 and 0; μ ∈ {(1,0,0), (0,0,0)}, 7 + 1 = 8 | Holds. |
| §0.4 | A₂ image | 7 = 1 + 3 + 3, reducible | Injectivity does not need irreducibility. |
| §1.5 | δ = St | θ(St) = St, discrete | Inside the hypothesis. |
| §1.7 | t = 0, 1; general t | h₁ − h₂ − h₃ = 2t; (11, 6, 3) gives 10, 7, 4, 1; coordinate sum 14t; pairings 2t, …, 12t | Spin-regular exactly for t ≥ 1. |
| §2.1 | centre of Spin₈ | μ₂ × μ₂ has 3 subgroups of order 2 | Three kernels. |
| §2.3 | St place | invariants of Sym⁶: 0; of 1 ⊕ Λ²Sym³: 2 | Lower lift excluded. |
| §3.5, §3.14 | trivial representation; diagrams alone | exponents q^(±3), q^(±2), q^(±1), 1; on the spade locus j ∘ L, on the heart §0.4 | Diagrams determine L; §§3.5–3.7 unused there (no change needed). |
| §3.11 rule (e) against (a) | torus data | ∏ χ_i^(±1)(a)^r = 1; ω_τ(a)⁷; exponent 7r | Consistent. |
| §3.11 uniqueness without (e) | ψ_F(a·), a transcendental | components of global characters are ψ_F(b·), b algebraic; ω_τ = ω_τ₁ ω_τ₂ keeps (d) | Counter-family exists; (e) needed. |
| §3.11 uniqueness, heart case | S = {v₀, v₁} | k totally real has a free real place; every finite u ≠ v₀ is St or spherical; R = 1 there | R_π = 1. |
| §3.11 uniqueness, spade case | invariants ±1/3; x near x₀ | sum 0, period 3 = index; y y₀⁻¹ = 1 + (y − y₀) y₀⁻¹ uniformly near 1 on primitive (a, b, c) | D exists; fixed vector persists. |
| §3.11 real factor, compact | λ = 0 | long coroots pair with ρ as 1, 2, 3; det of each induced summand sgn, sgn³ = sgn | Weights 0, ±1, ±2, ±3; zero weight carries sgn. |
| §3.11(ii)(a), R01 | Arthur SL₂ nontrivial; St component | packet not an L-packet; exponents 3, …, −3 only from (7, 1), (1, 7) | Hypothesis missing. |
| §3.11(ii)(b), R02 | Π′ = 1; D split | 1_GL₃ against St₃, equal supports \|·\|, 1, \|·\|⁻¹; lift need not be cuspidal | Contract and route to be corrected. |
| §1.3(a′) | k totally real, free real place u | points of G_D \ G integral outside u with compact conditions: finite, since every real group is compact | Small support at u separates. |
| §1.3(c) | δ = 1; character nontrivial on e× | constant function; no fixed vector | Matches the Check. |
| §1.4(ii) | ℚ, S = {p, ∞}; S = {p, p′} | 0 and 1 free real places | Hypothesis needed and sufficient. |
| §8.1 | trivial representation; component of Σ | (q³, q², q), λ₁/λ₂ = q; \|λ_i\|, \|λ_i λ_j^(±1)\| in (q⁻¹, q) | Generic in every residue characteristic. |
| §5.1 | St; central twist | q: Sym⁶ both; s: traces 8 and −8 | s-condition selects. |
| §6.4 | diamond π generic | θ(π) discrete, so §1.5 applies | Hypotheses met. |
| §7.1 | principal, subregular | fibres 1 and 3; \|S₃\| = 6 | Irr(S_φ), not S_φ. |
| §9.1 | τ against τ∨ | 4 + 4 = 8, sum unchanged | Well defined. |
| §10.2 | centralizer of φ̃ against that of q ∘ φ̃ | kernel μ₂, cokernel inside Hom(WD_F, μ₂), identity component maps trivially | Discreteness depends on q ∘ φ̃ only. |
| §10.3 | trivial parameter, unramified χ | eight eigenvalues 1 become −1; standard unchanged | f₂, not f₁. |
| §10.8 | Borel Levi, unramified data | singletons | Non-vacuous only on reducible inductions. |

### Lean file

- `lake env lean` on `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, from the content checkout: exit 0; the only diagnostics are `declaration uses 'sorry'` at 118:8 and 137:8.
- `#check @` on the five declarations in a scratch copy: the types equal the worker's signature list and the README statements of §§0.0 and 0.8. Nothing changed.
- One-tactic probe on both sorried theorems, ten tactics each (`simp`, `rfl`, `infer_instance`, `decide`, `aesop`, `tauto`, `trivial`, `simp_all`, and two `exact` terms with trivial witnesses): 20 of 20 fail.
- Headlines: Griess (§0.0) and unacceptability (§0.8) are stated; every other headline of the Summary is named in the module docstring with the missing carrier. The five backticked names of the roadmap's own are declared. Imports: `import Mathlib` and one used Tau Ceti module.
- Pinned declarations opened: Mathlib `LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62`, `:293`; `RepresentationTheory/Semisimple.lean:34`; `LinearAlgebra/QuadraticForm/Basic.lean:1408`; `LinearAlgebra/Matrix/Charpoly/Basic.lean:158`; `Charpoly/Coeff.lean:115`, `:119`; `Determinant/Basic.lean:80`; `Algebra/Quaternion.lean:684`. Tau Ceti `Algebra/Octonion/Basic.lean:143`, `:336`, `:354`, `:365`, `:537`, `:551`, `:831`, `:861`; `Algebra/CayleyDickson/Quaternion.lean:116`, `:124`; `NumberTheory/QuadraticForm/Global/AnisotropicPlaces.lean:121`; `LinearAlgebra/QuadraticForm/Witt/Extension.lean:50`; `NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Invariant.lean:65`; `Algebra/Lie/D4/Tripled/Triality/Basic.lean:155`; `NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`, `:235`.

### Suppliers, gaps, duplication, merge order

Citations added or changed by the last repair, resolved at the open heads or on main: ExceptionalThetaCorrespondencesForG2 §§5.1, 5.9, 6.7, 10.3–10.7 (Layer 10 has only the Albert E₇ pair, so the cubic and real contracts ask for nothing provided); AutomorphicLFunctionsAndLocalFactors AL.R.2, AL.1.4, AL.3.3.1, AL.3.3.8, AL.3.6.2; AutomorphicLFunctionsAndLocalFactorsPartII §10.0; SmoothRepresentationsOfLocalGroupsPartII SRU.5, §5.3, items 5.4 and 5.5; BorelRegulators §3.1; ClassFieldTheory Layers 5, 9, 10; AutomorphicFormsOnReductiveGroups §2.5; EndoscopicTransferAndUnitaryTraceComparison §4.7a (no global Jacquet–Langlands for degree three there, so that contract is needed); ModularityAndLanglandsExtensions §§2.43, 3.5, 3.8, 3.15, 3.17, 3.19, 3.27, 5.1; GL2AutomorphicRepresentationsAndTransfer R17.1.5 (paragraph "Ramification realization"); GlobalQuadraticForms §6.3. The remaining citations are unchanged since round 7, which resolved them.

Gaps: 18 slugs, the same in the README and in `design/plan.json`, each with a named supplier earlier in the merge order. cubic-jordan-global-theta and real-exceptional-theta-parameters are precise and ask for nothing provided. cubic-global-jacquet-langlands: R02.

Duplication by object: the indexed search for Griess's theorem, unacceptability, a totally definite octonion algebra, Kret–Shin parameters, weak equivalence of Spin₇-valued parameters and G₂ × GL_r factors finds no other owner on main or at the open heads. No declaration of `Suggested.lean` has the name of a declaration in another roadmap. `scratch/overlaps.md` lists no dropped id, no revision-only id, no second copy and no other pull request changing this roadmap.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, SmoothRepresentationsOfLocalGroupsPartII (scope and cited sections; SmoothRepresentationsOfLocalGroups and SpinRepresentations by their cited sections); shared objects: the octonion model of G₂, dual inclusions, complex parameters and component groups — owner ExceptionalThetaCorrespondencesForG2 Layer 0, which takes the octonion algebra over a number field as given, so §1.1 here owns its classification; the spin factor of PGSp₆ — owner AutomorphicLFunctionsAndLocalFactorsPartII Layer 6; nothing owned twice.

Dependency check, output exactly:

```text
depcheck: 238 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No banned supplier is cited.

### Copyright, licences and scope

Wording: 30 passages of the README and the docstrings of `Suggested.lean` were set beside the sources at their locators (GS lines 102–176, 377–418, 500–591, 690–760, 839–880, 1014–1061, 1243–1250, 1431–1680; GF lines 93–362; HD lines 2001–2029; Shin lines 954–992). The longest shared run is eight words, in hypothesis (a) of §3.11(ii) against GF line 194, a statement of a dozen words; the list of data of §3.11(ii) is the list of hypotheses of GF Theorem 2.4 written as one sentence, with S and alternative (b) restated. Several routes differ from the source's (§§1.7, 2.4, 3.11, 8.1). Arrangement: GS §§2, 10, 4, 3, 3.5, 5, 6–8, 9, 12 correspond to Layers 0, 1, 2, 3, 4, 5, 6, 7, 8–10; the order is not the source's, Layer 6 merges three sections, and within §12 the order is 12.5–12.6, 12.2–12.4, 12.7–12.8. The run Layer 5 → 6 → 7 is forced (§6.1 needs §5.2; §7.1 needs §§6.1, 6.7). Reuse: no table, figure or list is taken over.

Source independence: 30 passages compared with 4 sources, none shared; largest share GS, about 81 of about 125 locators; contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1, and SpV, §1.5 and Theorems 1.7.1, 1.8.1: settled as uncertified; cited by locator, not read.
- The truth of the declared contracts was not checked beyond the use the sources make of them (GF lines 234–257, 321–356 for the three added in round 8).
- KS, SV, ILM, CG, C and GS20 were not reopened; their locators are unchanged since the rounds that read them.
- HKT Proposition 4.3: the statement was located, its conclusion not read in full (R03 asks the fix worker to read it).
- §1.7, last step of the Route: a global quadratic character with prescribed components at v₀ and v₁ follows from weak approximation; no supplier section for it was traced.
- Ownership against the open pull requests was checked through the indexed search and the overlap list, not by reading each.

## Source issues

- **Gap** in GF at Theorem 2.4, uniqueness, pp. 5, 7–9: the source says properties (i) and (ii) determine the factors; it should add the change-of-additive-character rule, since the global argument reaches only components of global characters; affects the proof.
- **Gap** in GF at §2.7(a), pp. 6–7: the source says the components of the GL₇ transfer are Lif of the local components for every Π with cuspidal lift; it should assume a generic Arthur parameter or compare gamma factors within Arthur packets; affects the proof.
- **Gap** in GF at §2.7(b), p. 7: the source says every summand has a Jacquet–Langlands transfer whose Rankin–Selberg equation gives the result; it should treat one-dimensional summands and, for split D, non-cuspidal lifts; affects the proof.
- **Gap** in GF at Theorem 2.4(ii)(b), pp. 5, 7: the source says O may be nonsplit; it should restrict to split O or identify the real components at compact places; affects a stated result.
- **Misprint** in GF at §2.7(b), display, p. 7: the source says the first factor is the gamma factor of the additive character alone; it should be the factor of the GL_r component; affects nothing.
- **Misprint** in GF at §2.8, p. 7: the source says the auxiliary cuspidal representation lives on GL_n(k); it should be GL_r over the adeles; affects nothing.
- **Misprint** in Shin at Theorem 5.8, proof, author PDF p. 27: the source says the contradiction is with Proposition 4.12; it should be Corollary 4.12; affects nothing.

## For the human reviewers

- **Licence.** `sources.toml` records Griess (doi:10.1007/BF01884298) as uncertified with licence class "none"; the headline `griess_conjugacy` (`Suggested.lean` line 118) rests on that locator, read only through C, HKT and GS.
- **Licence.** `sources.toml` records SpV (doi:10.1007/978-3-662-12622-6) as uncertified; §1.1(i) and the doubling step of §1.1(iii) cite its theorem numbers without the text.
- **Licence.** Shin is recorded with licence class author-page; its page numbers in §1.7 are those of the author PDF, not of the journal.
- **Scope.** GF is recorded as arXiv:2308.12561v1 with no journal reference (`sources.toml`, entry GF); §3.11 states its main theorem with three corrections listed in Notes on the sources and in R01–R02.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4dc7e1edda889e1fb2a1ef112630fcb1b5f87ba7", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~8", "model": "fable", "worker": "chris-x90"} -->
