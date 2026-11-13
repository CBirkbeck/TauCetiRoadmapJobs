<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12942#issuecomment-6849586752 -->
Red team round 2 pass a (claude) of d244e8e

Verdict: needs_changes

1. **F01** (P2) Q6.8: the proof route of the torsion-free presentations cites two supplier statements for more than they state

   **Location.** `README.md:837–841`: "`Ã' = W(B)/(ξ̃)` is integral perfectoid (Q6.1) … let `Ã` be the
   `ϖ̃'`-adic completion of `Ã'[1/ũ]` … (integral perfectoid by
   `perfectoid_completely_etale_henselization` of PerfectoidQuotients §0.6)".

   **Claim.** Both inputs are supplied as cited.

   **Witness.** (a) Q6.1 needs a perfectoid base `A` and an `A♭`-algebra `B`; here `B` surjects onto
   `A♭` and `ξ̃` comes from no base. (b) PerfectoidQuotients §0.6 states only "the appropriate
   `p`-completion of ind-étale `R`-algebras"; for `A = 𝒪_C`, `ϖ = p^{1/p²}`,
   `ξ₀ = (ϖ♭)^p c`, `ξ̃₀ = X_{ϖ♭}^p X_c`, one has `p = unit · ϖ̃'^p (X_c)♯`, so no power of `ϖ̃'` lies in
   `pÃ'` and the two completions differ.

   **Repair.** Replace the two clauses by:

   > Then `(W(B), (ξ̃))` is a perfect prism (`B` is perfect and `ξ̃₀`-adically complete, by Stacks
   > Lemma 10.96.8 as `ξ̃₀ ∈ (X_{ϖ♭})`, and `ξ̃₁` is a unit), so `Ã' = W(B)/(ξ̃)` is integral
   > perfectoid with tilt `B` (PerfectoidSpaces P4.15.2; the argument of Q6.1 with no base ring).

   > In general let `R₁` be the `p`-adic completion of `Ã'[1/ũ]` for a lift `ũ` of `u`, integral
   > perfectoid by `perfectoid_completely_etale_henselization` (PerfectoidQuotients §0.6), and let `Ã`
   > be the `ϖ̃'`-adic completion of `R₁`, integral perfectoid by `perfectoid_sharp_ideal_completion`
   > (PerfectoidQuotients §0.6) at the one sharp `ϖ̃' = (X_{ϖ♭})♯`, whose image in `R₁` is a sharp by
   > `untilt_natural`. Since `p ∈ ϖ̃'^p Ã'`, `R₁/ϖ̃'ⁿ = Ã'[1/ũ]/ϖ̃'ⁿ` for every `n`, so `Ã` is the
   > `ϖ̃'`-adic completion of `Ã'[1/ũ]`; put `ϖ̃ = ϖ̃'ũ`.

   Add `PerfectoidSpaces P4.15.2`, `PerfectoidQuotients §0.2 (untilt_natural)` and the two §0.6 names
   to the *Needs* line of Q6.8. Tested on the witness: `pⁿ = 0` in `R₁/ϖ̃'ⁿ` (as `p ∈ (ϖ̃'^p)`), so
   the two-step completion is `ϖ̃'`-adically complete and is the ring the theorem needs, where the
   `p`-adic completion alone is not `ϖ̃'`-adically complete. This also gives Stacks Lemma 10.96.8
   (090T), listed in the References (`README.md:1862`) and cited nowhere in the body, its use.

2. **F02** (P3) Q8.4: the Lean statement quantifies value groups over an independent universe that the proof route does not reach

   **Location.** `Suggested.lean:206`: "`∀ (Γ₀ : Type v) [LinearOrderedCommGroupWithZero Γ₀] (v :
   Valuation R Γ₀)`" with `R : Type u`; `README.md:1195–1198` builds the separating valuation from a
   valuation ring `V` dominating a quotient of `A₀[1/a]`.

   **Claim.** The route proves the "if" direction as typed.

   **Witness.** The value group of `V̄` lives in `Type u`. For `v < u` (value groups in `Type 0`,
   `R : Type 1`) the route produces no admissible `Γ₀`, so the converse is not proved at the stated
   generality; the README's universe paragraph (`README.md:147–148`) is silent on value groups.

   **Repair.** The statement is true for every `v`; add to the end of the Q8.4 proof route:

   > The valuation may be taken of rank one, so the criterion holds with value groups in any universe:
   > for a continuous `v` with `v(A₀) ≤ 1` and `v(a) ≥ 1`, let `H` be the largest convex subgroup of
   > `Γ_v` not containing `v(ϖ)`; as the powers of `v(ϖ)` are cofinal, `Γ_v/H` has rank one, the
   > coarsening `w` is continuous, `w(A₀) ≤ 1`, `w(a) ≥ 1`, and its value group embeds in `ℝ_{>0}`.

   and to the universe paragraph of the Conventions: "the valuations of Q8.3 and Q8.4 take values in an
   arbitrary universe". Tested: `R = ℚ_p⟨T⟩`, `A₀ = ℤ_p⟨T⟩`, `a = T`, and `v` the rank-two valuation
   `v(f) = (|f|_Gauss, γ^{ord_{T=1} f̄})` in `p^ℤ × γ^ℤ` (lexicographic, `γ < 1`, `f̄` the reduction of
   `f` scaled to Gauss norm one). Then `v(A₀) ≤ 1`, `v(p)ⁿ = (p^{−n}, 1)` is cofinal, `v(T) = (1, 1) = 1`,
   `H = γ^ℤ`, and the coarsening is the Gauss valuation, with `w(T) = 1` and value group
   `p^ℤ ⊆ ℝ_{>0}`.

3. **F03** (P3) Q7.2 and the Tau Ceti contract omit pinned syntomic API and cite the Stacks project for what the pin proves

   **Location.** `README.md:226–231` ("Base change and invariance under isomorphism are supplied");
   `README.md:926–927` ("composition (Stacks Lemma 10.136.17)"); `README.md:936–937`, `940`.

   **Claim.** The pinned Tau Ceti supplies only base change and isomorphism invariance of standard
   syntomic algebras.

   **Witness.** At the pin: `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension.trans`
   (`TauCeti/RingTheory/Syntomic/Composition.lean:43`), `.localization_away`,
   `.trans_localization_away`, `.localization_away_trans` (`…/Syntomic/Localization.lean:57–75`),
   `.mvPolynomial` (`…/Syntomic/StandardSyntomic.lean:232`).

   **Repair.** In the Tau Ceti contract replace "Base change and invariance under isomorphism are
   supplied." by:

   > Supplied there: base change (`baseChange`), invariance under isomorphism (`of_algEquiv`),
   > polynomial rings (`mvPolynomial`), composition with addition of relative dimensions (`trans`,
   > `TauCeti/RingTheory/Syntomic/Composition.lean`), and localization away from an element on either
   > side (`localization_away`, `trans_localization_away`, `localization_away_trans`,
   > `TauCeti/RingTheory/Syntomic/Localization.lean`), all in the namespace
   > `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`.

   In the Q7.2 API write "composition (from Tau Ceti's `trans` and `trans_localization_away` on the
   charts; Stacks Lemma 10.136.17)"; in the Checks cite `mvPolynomial` for `A[T^{1/pⁿ}]` and
   `localization_away` for `ℤ → ℤ[1/p]`. In the same contract bullet, "that a relative global complete
   intersection is automatically flat (Stacks Lemma 10.136.13) is Q7.6 here" overstates Q7.6, which
   treats one equation: write "for one equation this is Q7.6 here". Tested: `ℤ[x]/(px − 1)` is
   `localization_away` at `r = p`, relative dimension `0`, the value the Check needs.

4. **F04** (P3) the Summary and the scope name layers and ownership by a source's sections

   **Location.** `README.md:11`: "(Layers Q5–Q6, after Česnavičius–Scholze §2.1)"; `README.md:15`:
   "(Layers Q7–Q9, after Česnavičius–Scholze §2.3)"; `README.md:39–42`: "It owns the remaining
   structure theory of Česnavičius–Scholze §2.1 (…), all of Česnavičius–Scholze §2.3".

   **Claim.** The organisation is the roadmap's own.

   **Witness.** The planning principle: a roadmap does not say it follows a source and derives no
   layer from a source's section; results that appear in a source are cited with exact locators. These
   three passages assign layers and ownership to §2.1 and §2.3 of CS24 as blocks.

   **Repair.** Line 11: "(Layers Q5–Q6; Česnavičius–Scholze Propositions 2.1.4, 2.1.9 and 2.1.12)".
   Line 15: "(Layers Q7–Q9; Česnavičius–Scholze Theorem 2.3.4 and Corollary 2.3.7)". Lines 39–46: "It
   owns the tilting identities for rings with torsion, fibre products, the relative tilting
   equivalence with completeness, valuation rings and algebraically closed fraction fields, and
   torsion-free presentations (Česnavičius–Scholze (2.1.1.3), (2.1.2.2), (2.1.2.5), Propositions 2.1.4,
   2.1.9 and 2.1.12); ind-fppf and ind-syntomic ring maps, the approximation lemma, the valuative
   nilpotence criterion, the ind-syntomic André lemma and semiperfectoid covers (§2.3.3, Lemmas 2.3.1
   and 2.3.2, Theorem 2.3.4, Corollary 2.3.7); the unramified refinement …" (rest unchanged).

One P2 finding (S01, a proof route of a headline theorem that rests on two supplier statements
which do not say what is used) and three P3 findings. No statement of `Suggested.lean` and no bold
README target was found false. All fifteen round-1 findings are repaired at this head and no repair
introduced an error.

## Round-1 findings at this head

| Round-1 id | Status | Witness at d244e8e |
|---|---|---|
| 1a/F01 (Q6.3 inequality reversed) | repaired | `README.md:693–697`: "`x_n^{pⁿ} = x♯` dividing `y♯ = y_n^{pⁿ}` … `|y_n|^{pⁿ} ≤ |x_n|^{pⁿ}`, hence `|y_n| ≤ |x_n|`"; recomputed on `x = 1`, `y = p♭` in `𝒪_C`: `|p|^{1/pⁿ} ≤ 1`, `z = p♭`. |
| 1a/F02, 1b/F04 (Q5.4 Check with a non-separated element) | repaired | `README.md:522–526`: `ϖ = (p^{1/p²}, 0)` admissible, `(p^{1/p}, 1)` recorded as inadmissible; recomputed `⋂ₙ (p^{n/p}𝒪_C × 𝔽̄_p) = 0 × 𝔽̄_p ≠ 0`, `A[ϖ] = 0 × 𝔽̄_p = A♭[ϖ♭]`. |
| 1a/F03 (Q6.5, `a = 0`) | repaired | `README.md:749–758`: "For `a = 0` there is nothing to prove … Let `a ≠ 0`"; the limit of the four-term sequences was recomputed (left system has zero transition maps, so `lim = 0` and `lim¹ = 0`). |
| 1a/F04 (Frobenius lift unowned) | repaired | `README.md:332–342`, `1530–1534`; DeformationAndDerivedPatchingAlgebra §1.10 at its head states "compatible coefficient lifting into a prescribed complete local target" from a unital residue map, with no perfectness; applied with target `W` and `x ↦ x^p`. |
| 1a/F05 (headline Q10.4 absent) | repaired | `Suggested.lean:284–294` and `README.md:1621–1625`; binders compared with the elaborated signature (complete, `CharZero`, residue `CharP p`, `F`-finite all present). |
| 1a/F06, 1b/F06 (page locators) | repaired | `README.md:564` (p. 12, CS24 line 468), `1581`/`1618` (p. 83, BS22 line 3206), `1843` (Theorem 7.4 p. 56, BS22 line 2175; proof p. 62, BS22 line 2431). |
| 1b/F01 (Q9.2 Frobenius step cited a `p`-torsion-free target) | repaired | `README.md:1294–1298`: iterates the bijection of PerfectoidSpaces P1.24 at `π = ϖ^{1/pʲ}`; CS24 line 425 is (2.1.2.4); tested at `p = 0`, `A = 𝔽_p[t^{1/p^∞}]^∧`. |
| 1b/F02 (consumer claims) | repaired | `README.md:101–105`, `1825–1834`; PurityForFlatCohomology (its contract, "§§Q5.2, Q5.4, Q6.3–Q6.7, Q10.1" and §Q7.1), EtaleDualityAndPerverseSheavesPartII (§§8.1–8.5 exist; cites §§Q5.1–Q5.3) and ArcTopologyAndDescent §12.6 agree. |
| 1b/F03 (Q10.6 Check, non-normal `S`) | repaired | `README.md:1777–1782`; recomputed `Tor_1^R(𝔪, k) = Tor_2^R(k, k) = ∧²k² = k`. |
| 1b/F05 (Q7.6, `n = 0`) | repaired | `README.md:1029–1037`; pin: `Nat.card ι = n + Nat.card σ` in `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean`, `0 = m + 1` has no solution. |
| 1b/F07 (Bhatt Proposition 5.2 citation) | repaired | `README.md:1523–1527`, `Suggested.lean:266–270`; Bha18 lines 469–479 (torsion-free hypothesis, modification (a)). |
| 1b/F08 (docstring "Q6.8 (2)") | repaired | `Suggested.lean:155`: "README Q6.8, second theorem". |
| 1b/F09 ("kept variant") | repaired | `README.md:433–434`, `471–473`; no "kept" remains. |

## Verified sound

Counts: 19 declarations of `Suggested.lean` read (3 definitions, 16 theorems) and compared with the
elaborated signatures supplied to this pass; 37 README targets read (Q5.1–Q10.6); 143 Check bullets
evaluated; 52 source locators located in the cached texts, 30 of them with the statement read in
full; 56 pinned declarations and 64 sibling citations (names and section ids) resolved at the pins,
on main and at the open heads. No
Lean was run here (read-only pass); nothing in the package was edited.

**Policy and form.** The pull request changes only `packages/PerfectoidQuotientsPartII/`. No
`set_option`, `lemma`, `#eval`, `#print`, `True` placeholder, sorry'd data or process words in the
README or the Lean file. `design/plan.json` has `"gaps": []`, and the README declares none. Imports
are `Mathlib` and four `TauCeti.*` modules, each used. Every Lean name is backticked in the README.

**Headlines.** Stated: Q5.6, Q6.2, Q6.4 (two), Q6.7, Q6.8 (three), Q8.3, Q8.4, Q9.3, Q9.6, Q10.2,
Q10.4, Q10.5, Q10.6. Not statable and named in the module docstring: Q6.1. Padding probe: no
declaration follows from one tactic or one pinned lemma; the pinned
`Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent` is one direction of Q8.4 only.

**Dependency check** (complete output):

    depcheck: 206 roadmaps, 1900 edges, 0 problem(s)

Suppliers: PerfectoidSpaces, EnhancedDerivedSheaves, StableReduction (main); DerivedDeRhamCohomology
(order line 23), PerfectoidQuotients (25), DeformationAndDerivedPatchingAlgebra (79),
PrismaticCohomology (83); this roadmap is at line 220. No supplier is on the forbidden list.

**Suppliers resolved.** All 23 PerfectoidQuotients names of the contract exist at its head in the
cited sections (§§0.2–0.6, 1.2, 1.4), with the hypotheses the README restates (S01 excepted).
PerfectoidSpaces P0.1, P0.2, P0.11, P1.4–P1.6, P1.15, P1.24, P1.25, P3.7, P4.15.2, P4.15.4, P7.16a,
P7.17 and the seven names exist on main. PrismaticCohomology §§0.61–0.63, 0.79, 0.83–0.84, 2.30,
2.31 exist with the cited content. EnhancedDerivedSheaves §E1.6 `frobenius_flat_of_isRegular`,
DerivedDeRhamCohomology §1.10 (both names; Noetherian, torsion-free, classically complete) and
DeformationAndDerivedPatchingAlgebra §1.10 exist as cited.

**Ownership.** Searched by object over main and the open heads: ind-fppf, ind-syntomic,
`p`-Zariski, the integral approximation lemma, Heitmann–Ma Theorem 1.3 and Bhatt–Scholze
Remark 10.13, and every theorem name of `Suggested.lean`: no second owner and no shared fully
qualified name. PerfectoidQuotients §1.2 owns only the modulo-`p` refinement and hands the ordinary
statement to this roadmap; DirectSummandsAndBigCohenMacaulay does not state the `Tor` theorem or
the prismatic cover. SchemeAndStackFoundations §0.11 owns the absolute integral closure of a
scheme; this roadmap uses Mathlib's ring expression and defines nothing. The pinned Tau Ceti has no
ind-syntomic, `p`-Zariski, fibre-product or tilted-valuation statement.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsSyntomic` | `S = 0`; `ℤ[1/p]`; `𝔽_p[x,y]/(x²,xy,y²)` | `span ∅ = ⊥ = ⊤` in `0`, vacuous charts; one chart, dimension 0; no presentation with `n + c`, `c` and fibre dimension `n` | determines the notion |
| `IsIndSyntomic` | `S = 0`; `ℤ → 𝔽_p`; `A[T^{1/p^∞}]` | factors through `T = 0`; `B = 𝔽_p` cannot map to a flat `ℤ`-algebra compatibly (`p = 0` in a flat algebra forces `0`, and `0 → 𝔽_p` is not unital); stages `A[T^{1/pⁿ}]` | sound; test algebras and `T` in `Type u` |
| `IsPZariski` | `0`; `ℤ/pⁿ`; `ℚ`; `ℤ` | unit; `p` nilpotent; `1 + p(−1/p) = 0`; `1 + p` nonunit | sound |
| `isIntegralPerfectoid_fibreProduct` (Q5.6) | `A' = 0`; all zero; `𝔽_p[t^{1/p^∞}] ×_{𝔽_p} 𝔽_p[t^{1/p^∞}]` | `A × B`; `0`; perfect ring `{a(0) = b(0)}` | holds; `f` surjective in scope |
| Q5.2 (2) | `(a,b) = p^{n+1}(a₁,b₁)`; `A' = ℤ/p²` | defect killed by `p`, `(a,b) = pⁿ(pa₁,pb₁)`; `1` killed by `p²` only | holds; hypothesis discriminates |
| Q5.3, Q5.4 | perfect ring; `𝒪_C × 𝔽̄_p`; `𝔽_p[t^{1/p^∞}]/(t)` | identity; `0 × 𝔽̄_p` both sides; `A♭` a domain, `A` has nilpotent `t^{1/p}` | hold; (ϖ♭) determined since `x^p = y^p u` gives `x = y u^{1/p}` in a perfect ring |
| `isAdicComplete_preTilt_iff` (Q6.2) | `ϖ♭` a unit; `ϖ♭ = 0`; `(p♭, 1)` and `(1, 0)` in `𝒪_{C♭} × 𝔽̄_p`; `∏ 𝒪_C` | both sides false (⊤-adic completeness forces `0`, `A'♭ ≠ 0`); both true; both non-separated (`⋂ = 0 × 𝔽̄_p`, resp. `𝒪 × 0`); both complete | iff holds in each; CS24 line 544 |
| `valuationRing_iff_preTilt` | perfect field; `𝔽_p × 𝔽_p`; `A♭` a field | both true; both false; then `ξ₀ = 0` and `A = A♭` | holds |
| `untilt_dvd_iff_…` (Q6.4) | `a = 0`; `x = 0, y ≠ 0`; `a = 1 + p` | `0 = 1 · 0♯`; `0 ∤ y`, `0 ∤ y♯` as `y♯ ≠ 0`; `u = 1 + p`, `b = 1` | holds |
| `isAlgClosed_fractionRing_iff` | perfect field; `ℤ_p[p^{1/p^∞}]^∧`, `p` odd | tautology; `X² − u` rootless on both sides; `√(pA')` has height one because `⋂ pⁿA' = 0` is the largest prime avoiding `p` | holds |
| Q6.8 (three theorems) | `A = 0`; `A = 𝔽_p`, `ϖ = 0`; `ϖ = 1` | any torsion-free perfectoid maps to `0`; `ℤ_p[p^{1/p^∞}]^∧`, `p^{1/p} ↦ 0`; excluded, `𝔽_p` not `1`-adically separated | statements hold; route: S01 |
| Q7.4 | `ℤ, p, ℤ_p`; `ℤ, p, ℤ/p`; `A = ℤ ⊕ ℤ[1/p]/ℤ` | flat; not flat; `Tor_1^A(A/N, A/N) = N/N² = N ≠ 0` | both regularity hypotheses needed; Stacks line 11208 |
| Q7.5 | `ℤ_p[T], p, T`; `ℤ, 2, 2`; `g = 0` | `ℤ_p[X]`; torsion `X − 1`; torsion `X`; `aX − g` regular on `R[X]` by its leading coefficient, so `(aX − g, a)` is regular | holds |
| Q7.6 | `ϖX − q`; `pX`; `1 + px`; `n = 0` | fibres nonzero; zero at `p`; `ℚ_p`; unit, zero algebra | holds for `n ≥ 1`; Stacks lines 16782, 16817 |
| Q8.1 | trivial valuation on `ℤ_p`; `v(ϖ) = 0`; rank-two `v` on `ℚ_p⟨T⟩` | `{v < 1} = {0}` not open; continuous; `v(T) = (−1,0) < (0,−n) = v(p)ⁿ` | holds; cofinality clause needed |
| `exists_approximation` (Q8.3) | `m = 0`; `pA = 0`; `a = b♯`; `ϖ = 0`; step `θ(z_{n+1}) = θ(z_n)` | bound `v(p)`; `a' = a`, both sides `0`; `0`; then `p = 0`; `θ([ξ̄]) = −pθ(u)` gives equality | holds; `v(ϖ) < 1` follows from continuity, so (2.3.1.1) follows |
| `isTopologicallyNilpotent_iff_forall_lt_one` (Q8.4) | zero ring; `ℚ_p`, `a = p, 1`; `ℚ_p⟨T⟩`, `a = T`; unbounded `B = ℚ_p`; universes `v < u` | both sides true; `<1`, `=1`; Gauss `v(T) = 1`; right side vacuous; rank-one coarsening in `ℝ_{>0}` | true as typed; S02 |
| `exists_indSyntomic_andre` (Q9.3) | `A = 0`; `A = 𝔽_p`, `ϖ = 0`; (ii) with `ϖ` a unit; `P = 1` | zero; `A' = 𝔽̄_p`, `I' = 0`; forces `A = 0`; excluded by positive degree | holds; matches CS24 lines 1004–1010 |
| `exists_semiperfectoid_cover` (Q9.6) | `A = 0`; `𝔽_p`; `ℤ_(p)`; `ℚ`, `ℤ` | `0`; `ℤ̄_p/p`, reduction `𝔽̄_p`; `ℤ̄_p`; not `p`-Zariski | holds with `Ã_∞ = B/J` |
| `exists_faithfullyFlat_isIntegralPerfectoid` (Q10.2) | field of characteristic `p`; characteristic-`0` field; `ℤ_(p)`; `ℤ_p` | perfect closure; excluded (`p ∉ 0`); via `ℤ_p`; `δ(pu) = φ(u) − p^{p−1}u^p` a unit | holds |
| Q10.4 and its theorem | `ℤ_p`; `ℤ_p[√p]`; `k = 𝔽_p(t)`, `d = 2`; `f = p² − x_1`; `dim R = 0` | `ℤ_p[p^{1/pⁿ}]`, rank `pⁿ`; `φ_Aⁿ(f) ≡ φ_Wⁿ(f(0))` mod `𝔪_A²`, valuation one; rank `p^{3n}`; `φ_A(f) ∈ 𝔪_A²`; impossible | holds; `K = pK`, `K ⊆` free, so `K = 0` |
| Q10.5, Q10.6 (`Tor`) | `c = 0`; `S = R`; `S = R ⊕ 𝔪√x`; direction of `J ⊆ (p)_perfd` | localizations zero, map zero; source zero; source `k`; `c ∈ pR` gives `(R'/c)_perfd → (R'/p)_perfd`, so `J` kills the `p`-torsion | holds; BS22 lines 3206–3222, HM17 line 65 |
| Q9.4 Check, `ℤ_p^{cycl}` | `a = p`, `a = 1 + p`, `p` odd | Eisenstein; `1 + p ∉ 1 + p²ℤ_p`; a degree-`p` subextension of an abelian extension would contain `ζ_p`, and `p − 1 ∤ p` | holds |

## Not verifiable

- No Lean was elaborated in this pass (read-only); the elaborated signatures supplied with the job
  were used. The repair of S02 changes no signature; S01, S03 and S04 change only the README.
- Stacks Lemma 15.32.2 (0BIQ): the cached Stacks text is the Commutative Algebra chapter, so the
  statement was not read. The identification of Q7.5 was checked directly instead (row Q7.5 above).
- Gabber's result behind CS24 footnote 12 (CS24 lines 993–996), used for the last Check of Q7.1,
  was verified only as the footnote states it.
- Published pagination: locators were checked against the arXiv versions the README names.
- PurityForFlatCohomology, later in the merge order, states `gap:regular-tower-tilt` on §Q10.1 of
  this roadmap. Nothing here provides it; it is that consumer's declared contract and not a finding
  of this pass.
- SchemeAndStackFoundationsPartII, named under "Downstream consumers", is in the merge order and is
  a board package, not yet an open pull request; its citations of §§Q7.1–Q7.3 were read from the
  board package.

## Source issues

- **Gap** in CS24 at Corollary 2.3.7, proof, p. 29 (CS24 lines 1170–1172): the source says Theorem 2.3.4 yields a ring in which every monic polynomial has a root; it should take the quotient of that ring by the theorem's divisible ideal; affects the proof.
- **Misprint** in CS24 at Corollary 2.3.7, proof, p. 29 (CS24 line 1174): the source says part (d) of Proposition 2.1.11 gives perfectoidness of the completed reduced quotient; it should be part (c), root-stable quotients; affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, p. 25 (CS24 lines 1009–1010): the source says every monic polynomial acquires a root; it should be every monic polynomial of positive degree; affects a stated result.
- **Error** in CS24 at §2.3.3, p. 24 (CS24 line 987): the source says a finite product of ind-fppf algebras is ind-fppf; it should be a nonempty finite product; affects a stated result.
- **Gap** in BS22 at Remark 3.11, p. 33 (BS22 lines 1317–1318): the source says a change of variables makes the defining element `x_1 − p` when its `p`-coefficient vanishes; it should say the presentation is replaced, the quotient being a power series ring in one fewer variable; affects nothing.
- **Gap** in BS22 at Remark 10.13, p. 83 (BS22 lines 3214–3216): the source says Remark 3.11 gives a faithfully flat perfectoid cover inside the completed absolute integral closure; it should restrict to covers with finite Frobenius stages, as for `F`-finite residue fields; affects the proof.
- **Gap** in BS22 at Remark 10.13, pp. 83–84 (BS22 lines 3217–3222): the source says almost vanishing of the middle `Tor` gives annihilation by the chosen roots of `c`; it should first enlarge the cover by roots mapping to the chosen ones; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d244e8e9490e7fbe9af34defe45ec7475bef9910", "job": "RT-PerfectoidQuotientsPartII~2a", "model": "fable", "worker": "chris-x14"} -->
