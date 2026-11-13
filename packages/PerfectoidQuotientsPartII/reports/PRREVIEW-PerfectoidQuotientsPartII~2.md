# Review of PerfectoidQuotientsPartII (pull request #2259 at 2aa6d55)

**Verdict:** accepted

No finding. The five findings of the review at `9f411af` are repaired (first five rows of the table), the gate passes, and the whole folder was read again.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Earlier R01: Q10.5 route, README l. 1806–1827, "`c_k` lies in the kernel `⋂ₙ (JP + pⁿP)`" | `R = ℤ_p`, `R_∞` completed `ℤ_p^{cycl}`, `c = p`, `k = 1`; `c = 0` | `(P/JP)^∧ = P ⊗̂ (R_∞/c)_perfd` reduced, `c_k^{pᵏ} = c ↦ 0`; `b_1`, `p^{1/p}` both of valuation `1/p`; `c_k = 0` | repaired; no enlargement left | none |
| Earlier R02: l. 406–407 and l. 1895, "*Needs:* Layer Q5; …" | every `*Needs:*` of Q10.1–Q10.6 | own layers used: Q5.4, Q10.2–Q10.5 only; Q7, Q9 no longer occur | repaired | none |
| Earlier R03: l. 111–116, "belongs to DirectSummandsAndBigCohenMacaulay §§3.2–3.3" | its open head §3.2, §3.3; Bha18 lines 469–480 | §3.2 a `K°`-algebra; §3.3 almost faithfully flat, faithfully flat if unramified; modification (a) on p. 8 | repaired | none |
| Earlier R04: l. 260–271 and 1004–1007, `SyntomicOfRelativeDimension n` | `ℤ → ℤ × ℤ[x]`, `n = 0, 1` | `n = 0`: fibre `κ × κ[x]` has dimension 1; `n = 1`: an isolated point has codimension `1 + c` in `𝔸^{1+c}`, cut by `c` equations | repaired; pin `Syntomic/Basic.lean` 47, 83, 120, 182 | none |
| Earlier R05: l. 1514–1516, "by Mathlib `Ring.mem_jacobson_iff` at `x = p`" | pin | `Jacobson/Ideal.lean:295` states `x ∈ Ring.jacobson R ↔ ∀ y, IsUnit (x * y + 1)`; `jacobson_bot` at `:79` | repaired | none |
| Q5.6 `isIntegralPerfectoid_fibreProduct` | `A' = 0`; `A = B = 𝔽_p[t^{1/p^∞}] → 𝔽_p`; `A' = ℤ/p²` in Q5.2 | `A × B`; `{a(0) = b(0)}` perfect, own tilt; `1` killed by `p²` not `p`, hypothesis fails | holds; CS24 lines 468–473 | none |
| Q6.2 `isAdicComplete_preTilt_iff` | `ϖ♭` a unit; `ϖ♭ = 0`; `𝒪_C × 𝔽̄_p`, `ϖ♭ = (t^{1/p}, 1)` | both sides false (`⋂ ⊤ⁿ ≠ 0`, sharp of a unit is a unit); both true; `(t, 0) = ϖ♭·(t^{1−1/p}, 0)`, both false | iff holds; CS24 lines 544–545 | none |
| Q6.4 `valuationRing_iff_preTilt` | `𝔽_p`; `𝒪_C × 𝒪_C` | tilt `𝔽_p`, both true; neither a domain, both false | holds | none |
| Q6.4 `untilt_dvd_iff_and_exists_isUnit_mul_untilt` | `x = 0`; `a = 1 + p` | `0 ∣ y ⇔ y♯ = 0 ⇔ y = 0`; `1 + p = (1 + p)·1♯` | holds; CS24 lines 568–576 | none |
| Q6.7 `isAlgClosed_fractionRing_iff` | `pA = 0`; completed `ℤ_p[p^{1/p^∞}]`, `p` odd; primes without `p` | `A = A♭`; `X² − u` rootless over residue field `𝔽_p`; `⋂pⁿV = 0` is the only one | holds; Sch12 line 751, p. 17 | none |
| Q6.8, three theorems | `A = 0`; `A = 𝔽_p`, `ϖ = 0`; `A` perfect, `u ≠ 1` | `Ã = 0`; completed `ℤ_p[p^{1/p^∞}]`, `ϖ̃ = p^{1/p}`, roots `↦ 0`; `B[1/X_u]` not `X_0`-complete (`1 − X_0/X_u` not a unit) | holds; CS24 lines 682–684 | none |
| Q8.3 `exists_approximation` | `ϖ = 0`, `A` perfect; `m = 0`; `a = b♯` | bound `0`, forces `a' = a`; bound `v(p)`, any `a'♯ ≡ a mod p`; difference `0` | holds; CS24 lines 895–900; Sch12 Corollary 6.7 (i), line 1679 | none |
| Q8.4 `isTopologicallyNilpotent_iff_forall_lt_one` | `ℚ_p⟨T⟩`, `a = T`, Gauss and rank two; non-Hausdorff `a ∈ ⋂ϖⁿA₀` | `v(T) = 1` resp. `(1, 1)`, coarsening by `1 × γ^ℤ` is Gauss; nilpotent and `v(a) < 1` | holds in every universe of value groups; CS24 line 959 | none |
| Q8.1 Tate-ring check | rank-two `v` on `ℚ_p⟨T⟩` | `v(p)ⁿ = (0, −n) > (−1, 0) = v(T)`; `v ≤ 1` on `ℤ_p⟨T⟩`, `v < 1` on `pA₀` | not continuous, as stated | none |
| Q9.3 `exists_indSyntomic_andre` | `A = 0`; `A = 𝔽_p`, `ϖ = 0`; `ϖ` a unit in (ii); `P = 1` | zero; `I' = 0`, `A' = 𝔽̄_p`; `HenselianRing A ⊤` forces `A = 0`; excluded by `0 < natDegree` | holds; CS24 lines 1004–1010 | none |
| Q9.6 `exists_semiperfectoid_cover` | `A = ℤ_(p)`; `𝔽_p`; `ℚ`; `ℤ` | `ℤ̄_p`, completion `𝒪_{ℂ_p}`; `ℤ̄_p/p`, reduction `𝔽̄_p`; `1 + p·(−1/p) = 0`; `1 + p` not a unit | holds; CS24 lines 1157–1160 | none |
| Q9.4 cyclotomic check | `a ∈ {p, 1 + p}`, `p` odd | `p`-th powers of `1 + pℤ_p` lie in `1 + p²ℤ_p`; degree-`p` subfield would contain `ζ_p`, `p − 1 ∤ p` | no `p`-th root, as stated | none |
| Q10.2 `exists_faithfullyFlat_isIntegralPerfectoid` | `R = ℤ_p`; a field; `f(0) = pu` | `f = p − x₁`, cover completed `ℤ_p[p^{1/p^∞}]`; perfect closure; `δ(pu) = φ(u) − p^{p−1}uᵖ`, a unit | holds; BS22 lines 1299–1321 | none |
| Q10.4 `…_injective_completion` | `R = ℤ_p`; `k = 𝔽_p(t)`, `d = 2`; `f = p² − x₁`; perfect `k`, `f = p − g` | rank `pⁿ`; rank `pⁿ·p^{2n}`; `φ(f) ∈ 𝔪²`, `(x−2)(x+2) = 0` at `p = 2`; `w ↦ φ_W^{−n}(w)`, `x ↦ x^{1/pⁿ}` gives the P7.17 stage | holds | none |
| Q10.5 `tor_map_mul_root_eq_zero_of_cover` | `c = 0`; `S = R`; `i = 0`, `R = S = ℤ_p`, `c = p` | `c_k = 0`; source `0`; `1 ↦ p^{1/p} ≠ 0` in `R⁺/p` | holds; BS22 lines 3206–3226 | none |
| Q10.6 `tor_map_mul_root_eq_zero` | `R = ℤ_p⟦x⟧`, `S = R ⊕ 𝔪√x`, `c = px`; `dim R = 1` | `Tor₁^R(𝔪, k) = Tor₂^R(k, k) = k ≠ 0`, `2x` invertible in `R[1/c]`; `S` free, source `0` | holds, not vacuous; HM17 lines 65–70 | none |
| Q7.2 `IsSyntomic`, `IsIndSyntomic` | `S = 0`; `ℤ → ℤ[1/p]`; `𝔽_p[x, y]/(x², xy, y²)` | `s = ∅` spans `⊤`; one generator, one relation, dimension 0, not faithfully flat; not a complete intersection | as described | none |
| Q7.4 negative control | `A = ℤ ⊕ ℤ[1/p]/ℤ`, `M = ℤ`, `f = p` | `A/pA = 𝔽_p = M/pM`, `A[1/p] = M[1/p]`, `Tor₁^A(M, M) = N/N² = N ≠ 0` | regularity on `A` needed, as stated | none |
| Q9.5 `IsPZariski` | `ℤ/pⁿ`; `ℤ`; `B = ℚ_p` over `ℤ_p` | `p` nilpotent; `1 + p` not a unit; Zariskization `0` | definition right | none |

- Source locators checked against the cached texts this round: 55 (CS24 24, BS22 5, BMS1 5, Stacks 8 tags, Bha18 3, Ces19 3, Wedhorn 4 pages, Sch12 2, HM17 1); the statements of all 16 README theorems, which contain the seeded sample, agree with their sources in number, page and hypotheses.
- Library declarations opened at the pins: the 9 added since `9f411af` (`TauCeti/RingTheory/RegularLocalRing/Frobenius.lean:67` and `:85`, `TauCeti/AlgebraicGeometry/Morphisms/Syntomic/Basic.lean:47`, `:83`, `:120`, `:182`, `TauCeti/RingTheory/RingHom/StandardSyntomic.lean:64`, `Mathlib/RingTheory/Jacobson/Ideal.lean:79` and `:295`) and 34 further names of the contracts, all found. No pinned declaration states a `Suggested.lean` theorem; `TauCeti.Perfectoid.uniformTilt.plusEquiv` is the Tate-ring form of Q5.1 (1), which the scope section assigns to PerfectoidSpaces P1.4–P1.6.
- Cross-roadmap citations resolved: PerfectoidQuotients (23 identifiers, §§0.2–0.6, 1.2, 1.4, at its open head), PerfectoidSpaces (14 sections and 9 names on main, among them P4.15.5 `semiperfectoidPerfectoidization_surjective`), PrismaticCohomology §§0.61–0.63, 0.79, 0.83–0.84, 2.30–2.31, DerivedDeRhamCohomology §1.10 (both names), DeformationAndDerivedPatchingAlgebra §1.10, StableReduction Layer 1, DirectSummandsAndBigCohenMacaulay §§3.2–3.3; the consumers' sections exist (EtaleDualityAndPerverseSheavesPartII §§8.1–8.5, ArcTopologyAndDescent §12.6). The three names of the worker's citation list are declarations of open suppliers.
- Gate at this head: every check passed. Dependency check: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: `sorry` the only warning. One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop`): none of the 16 theorems closes. The 19 elaborated signatures were compared with the README statements: no binder lost, nothing changed. Every headline statable at the pins is stated; the relative tilting equivalence (Q6.1) is named in the docstring.
- Pull request text read against the head: no sentence contradicted; it adds the roadmap, and its dependency paragraph names DirectSummandsAndBigCohenMacaulay and ArcTopologyAndDescent as owners of related results, as the scope section now does.
- PurityForFlatCohomology (open) declares `gap:regular-tower-tilt` on §Q10.1; this head does not state it.
- Overlap check: read PerfectoidQuotients, DirectSummandsAndBigCohenMacaulay, PrismaticCohomology, PurityForFlatCohomology, PrismaticCohomologyPartIII, PerfectoidSpaces, SchemeAndStackFoundations, AdicEtaleGeometry; perfectoid covers of regular local rings are two different statements with two owners (Bhatt's `K°`-algebra cover: DirectSummandsAndBigCohenMacaulay §§3.2–3.3; the prismatic cover: Q10.2 here), and the scope section says so; nothing else shared.

Source independence: 12 passages compared with 4 sources (CS24, BS22, Bha18, HM17), and every 8-word run of the README and of `Suggested.lean` searched in 8 cached texts, none reproduced beyond clauses of theorem statements and of one definition (longest 12 words); largest share CS24, 60 of about 125 locators; contents compared with CS24: independent (Q5 and Q6 divide its §2.1, its §2.2 is absent, Q7 precedes Q8 where the source has 2.3.3 after 2.3.1–2.3.2, Q10 is not from it; the order Q5 → Q6 → Q9 is forced by the `*Needs:*` lines of Q6.2, Q6.8 and Q9.3).

## Not verifiable

- Stacks Lemma 15.32.2 as the number of tag 0BIQ: the cached Stacks text is the Commutative Algebra chapter only; the tag is the one CS24 cites at (2.3.6.1).

## Source issues

- **Misprint** in CS24 at Theorem 2.3.4, p. 25, and Corollary 2.3.7, p. 28: the source says every monic polynomial acquires a root; it should be every monic polynomial of positive degree, since the constant `1` has no root in a nonzero ring; affects nothing.
- **Misprint** in CS24 at proof of Corollary 2.3.7, p. 29: the source says part (d) of Proposition 2.1.11 gives perfectoidness of the completion of the reduced quotient; it should be part (c), on quotients by root-stable sets; affects nothing.
- **Gap** in BS22 at Remark 10.13, p. 83: the source says Remark 3.11 gives, for every complete regular local ring of mixed characteristic, a faithfully flat perfectoid cover inside the completed absolute integral closure; it should assume an `F`-finite residue field, as HM17 Theorem 1.3 does, and construct the map; affects the proof.

## For the human reviewers

- Licence: `Wedhorn` is cited from an arXiv text (1910.05934v1) with no journal reference, and `HM17` from arXiv 1708.05761v3 with no journal named in the README.
