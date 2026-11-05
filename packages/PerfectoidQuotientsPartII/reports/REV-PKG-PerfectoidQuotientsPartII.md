<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2229#issuecomment-6628199560 -->
Review (claude) of 7cfbf22

Verdict: needs_changes

1. **F01** (P2) Almost vanishing of `Tor` narrowed below Heitmann–Ma; the plan's gap has no supplier

   Location: `packages/PerfectoidQuotientsPartII/README.md` lines 1500–1505 (Q10.6, "whose residue
   field is perfect of characteristic `p`"), line 21 ("recovering Heitmann–Ma (Layer Q10)"), line
   1461 (Q10.5, "recovering Heitmann–Ma Theorem 1.3, p. 2, there stated for `F`-finite residue
   fields"); `packages/PerfectoidQuotientsPartII/Suggested.lean` line 325
   (`[PerfectRing (ResidueField R) p]`) and line 317 ("recovering Heitmann–Ma Theorem 1.3");
   `design/plan.json`, the `gaps` entry "A perfectoid cover inside (R⁺)^∧ for imperfect residue
   fields", which names no supplier.

   Claim: the unconditional theorem holds for perfect residue fields; for other residue fields the
   input "a faithfully flat perfectoid `R → R_∞` with an `R`-map `R_∞ → (R⁺)^∧`" is an unresolved
   input of the plan.

   Witness: HM17 line 65–70 states Theorem 1.3 for a complete regular local ring of mixed
   characteristic with an `F`-finite residue field; BS22 line 3208–3215 states Remark 10.13 for every
   complete regular local ring of mixed characteristic and takes the cover inside `(R⁺)^∧` from
   Remark 3.11 (BS22 line 1299–1320), which constructs `R_∞` for an arbitrary residue field but
   never the map to `(R⁺)^∧`. So Q10.6 recovers Heitmann–Ma only for perfect residue fields, the
   Summary and the docstring overclaim, and the plan records the missing input as a gap with
   supplier `none`.

   Repair, tested on `R = ℤ_p[t]_{(p)}^∧⟦x⟧` (residue field `𝔽_p(t)`, `F`-finite, not perfect) and
   on `R = ℤ_p⟦x⟧`:

   1. Extend Q10.4 to `F`-finite residue fields by finite stages. With `A = W⟦x_1, …, x_d⟧`,
      `R = A/(f)` and the δ-structure of Q10.2, put `R_n := A/(φ_A^n(f))`, an `R`-algebra through
      `φ_A^n`. For `F`-finite `k`, `W` is finite over `φ_W^n(W)` (Nakayama on the `p`-complete
      module `W`, whose reduction `k` is finite over `k^{p^n}`), hence `A` is finite over
      `φ_A^n(A)` (a monomial basis `x^a`, `0 ≤ a_i < p^n`, over a basis of `W`), flat by miracle
      flatness (regular source, Cohen–Macaulay target of the same dimension), so `R_n` is finite
      flat over `R` and `(colim_φ A)/(f) = colim_n R_n`, whence `R_∞ = (colim_n R_n)^∧_p`. Choose a
      compatible system of minimal primes `𝔮_n ⊆ R_n` (an inverse limit of nonempty finite sets);
      `colim_n R_n/𝔮_n` is a domain integral over `R`, so it embeds `R`-linearly into `R⁺`, and
      completing gives `R_∞ → (R⁺)^∧`. For `R = ℤ_p[t]_{(p)}^∧⟦x⟧`, `f = x_1 − p`: `W` is free of
      rank `p^n` over `φ^n(W)` with basis `1, t, …, t^{p^n − 1}` when `φ_W(t) = t^p`, and `R_n` is
      `W⟦x_1, x_2⟧/(x_1^{p^n} − p)` twisted by `φ^n` on `W`, finite free of rank `p^{3n}` over `R`.
      For `R = ℤ_p⟦x⟧` this is the tower of P7.17.
   2. State Q10.6 and `tor_map_mul_root_eq_zero` for `F`-finite residue fields (Heitmann–Ma's
      hypothesis), replacing `[PerfectRing (ResidueField R) p]` by the hypothesis that the residue
      field is a finitely generated algebra over its subfield of `p`-th powers, for instance
      `∃ s : Finset (ResidueField R), Algebra.adjoin ((frobenius (ResidueField R) p).fieldRange)
      (s : Set _) = ⊤` (a `Subfield` is an algebra over its ambient field in Mathlib), or, if that
      encoding is judged unstatable, keep the perfect-residue-field Lean statement and name the
      `F`-finite form in the module docstring as not statable.
   3. Reword line 21, line 1461 and the docstring at line 317 so that "recovering Heitmann–Ma" is
      asserted exactly where it holds, and state in `## Scope and ownership` that for residue fields
      that are not `F`-finite the cover inside `(R⁺)^∧` is not constructed here and Q10.5 carries it
      as a hypothesis; a limitation of the known proof is a scope statement, not a supplier gap with
      supplier `none`. Since `plan.json` cannot be edited after the design, the README's wording is
      what the intake reads.

2. **F02** (P2) Q8.1's Tate-ring clause is false: the cofinality condition of Wedhorn 7.10 is dropped

   Location: `packages/PerfectoidQuotientsPartII/README.md` lines 1000–1002: "for a Tate ring `R`
   with pair of definition `(A₀, I)` and `v` with `v(A₀) ≤ 1`, that `v` is continuous iff `v(a) < 1`
   for all `a ∈ I`".

   Claim: `v(I) < 1` characterises continuity among valuations bounded by `1` on `A₀`.

   Witness: Wedhorn line 2429–2431 (Theorem 7.10) reads `Cont(A) = {v ∈ Spv(A, I·A) : v(a) < 1 for a
   ∈ I}`; the membership `v ∈ Spv(A, I·A)` (the values `v(a)`, `a ∈ I`, are cofinal in `Γ_v`) is
   part of the statement. Counterexample: `R = ℚ_p⟨T⟩`, `A₀ = ℤ_p⟨T⟩`, `I = pA₀`, and
   `v(f) = (−ord_T f, −v_p(a_{ord_T f})) ∈ ℤ² ∪ {0}` with the lexicographic order (the `T`-adic
   valuation composed with the `p`-adic valuation on its residue field `ℚ_p`). Then `v(A₀) ≤ (0, 0)`,
   `v(p) = (0, −1) < 1`, `v(pf) < 1` for every `f ∈ A₀`, but `v(T) = (−1, 0) < v(p)^n` for every
   `n`, so `{g : v(g) < v(T)}` contains no `p^k A₀` (`v(p^k) = (0, −k)`) and is not open: `v` is not
   continuous in Tau Ceti's sense (`Valuation.IsContinuous`, attained values) nor Wedhorn's. The
   first clause of Q8.1 (element-adic topology, cofinality of `v(ϖ)^n`) is correct and is the one
   Q8.2, Q8.3 and the proof route of Q8.4 use; the Lean statement
   `isTopologicallyNilpotent_iff_forall_lt_one` quantifies over `v.IsContinuous` and is unaffected.

   Repair: replace the clause by "for a Tate ring `R` with pair of definition `(A₀, I)` and `v` with
   `v(A₀) ≤ 1`, `v` is continuous iff for every `γ ∈ Γ_v` there is `n` with `v(a) < γ` for all
   `a ∈ Iⁿ`; equivalently iff `v(ϖ) < 1` and the powers `v(ϖ)ⁿ` are cofinal in `Γ_v` for one
   (equivalently every) topologically nilpotent unit `ϖ`" (Wedhorn Theorem 7.10 together with
   Lemma 7.4 (iii), line 2434), and add the valuation above as a negative-control Check ("`v(p) < 1`
   and `v ≤ 1` on `ℤ_p⟨T⟩`, yet `T` is infinitesimal against `p` and `v` is not continuous").
   On the instance, the corrected criterion rejects `v` because `v(T) < v(p)^n` for all `n`.

3. **F03** (P3) Q10.5's proof route does not reach annihilation by `c_k ∈ R⁺`

   Location: `packages/PerfectoidQuotientsPartII/README.md` lines 1468–1476 (Q10.5 proof route:
   "`Tor_i^{R_∞/pⁿ}(T_perfd/pⁿ, R_∞ ⊗_R N)` … is `c`-almost zero … the map `S/pⁿ → R⁺/pⁿ` factors
   … through `T_perfd/pⁿ`").

   Claim: almost vanishing of the middle `Tor` as a `T_perfd`-module (killed by
   `(cT_perfd)_perfd`) gives annihilation of the image in `Tor_i^{R/pⁿ}(R⁺/pⁿ, N)` by every
   `p`-power root `c_k ∈ R⁺` of `c`.

   Witness: the image is only a `T_perfd`-submodule of an `R⁺`-module; it is killed by the image of
   `(cT_perfd)_perfd`, and `c_k` need not lie in the ideal that image generates. In `T_perfd`, `c =
   pr` with `p = uϖ^p`; an element `ϖ^{1/p^k} r` lies in `√(cT_perfd) ⊆ (cT_perfd)_perfd` and has
   valuation `v(p)/p^{k+1} + v(r)`, larger than `v(c^{1/p^k}) = (v(p) + v(r))/p^k` as soon as
   `v(r) > 0` and `k ≥ 1`; the cover `R_∞` of Q10.2 or Q10.4 (roots of the `x_i` and, when
   unramified, of `p`) contains no roots of a general `c ∈ pR`, so nothing in `(cT_perfd)_perfd`
   maps to a unit multiple of `c_k`. The same step is taken without comment in BS22 line 3217–3226.

   Repair: before forming `T`, enlarge the cover. Apply Q9.3 (i) to `R_∞` with `𝒫 = {T − c}` (as in
   Q9.4) and let `R'_∞` be the `ϖ`-adic completion of `A'/I'`: it is integral perfectoid, `R_∞ →
   R'_∞` is `p`-completely faithfully flat, `R'_∞` contains the compatible roots `T^{1/p^k}` of `c`,
   and the given map `R_∞ → (R⁺)^∧` extends to `R'_∞ → (R⁺)^∧` sending `T^{1/p^k} ↦ c_k`: `A_0 →
   (R⁺)^∧` is defined by the roots, `(T − c)/ϖ^m ↦ 0`, and the `p`-integral closure `A'` maps into
   the `p`-integral closure of `(R⁺)^∧` in `(R⁺)^∧[1/p]`, which is `(R⁺)^∧` itself (Q10.3 with
   PerfectoidQuotients §0.5). Then run the route with `T' = S ⊗_R R'_∞`: `c_k = ` the image of
   `T^{1/p^k} ∈ (cR'_∞)_perfd ⊆ (cT'_perfd)_perfd`, and `c_k ψ(y) = ψ(T^{1/p^k} y) = 0`. Add Q9.3,
   Q9.4 and Q10.3 to Q10.5's `*Needs:*` line, and record the step as a gap of the source (below).
   Tested on `R = ℤ_p⟦x⟧`, `c = p(1 + x)`, `k = 1`: `R_∞` of Q10.4 contains `p^{1/p}` but no square
   or `p`-th root of `1 + x`, while `R'_∞` contains `(p(1+x))^{1/p}` mapping to the chosen `c_1`.

4. **F04** (P3) PrismaticCohomology declarations cited by names that do not exist at its head

   Location: `packages/PerfectoidQuotientsPartII/README.md` lines 264–270
   (`Prismatic.Perfection.perfectSite_equiv`, `Prismatic.Perfectoidization.integral_discrete`,
   `Prismatic.Perfectoidization.almostPurity`) and lines 1470–1471 (Q10.5 proof route).

   Claim: these are declarations of PrismaticCohomology §§2.30–2.31.

   Witness: PrismaticCohomology at its open head (36d19e5) has §2.30 and §2.31 with the cited
   content, but neither its README nor its `Suggested.lean` contains any of the three names (its Lean
   file declares δ-structures, oriented prisms and envelopes only).

   Repair: cite "PrismaticCohomology §2.30 (perfect-site description, `S_perfd = lim_{S → T} T`)" and
   "PrismaticCohomology §2.31 (integral perfectoidization, almost purity for `J_perfd`)" without Lean
   names, here and in Q10.5.

5. **F05** (P3) Q5.4's fourth Check computes the wrong tilt

   Location: `packages/PerfectoidQuotientsPartII/README.md` lines 474–476: "for the semiperfect but
   nonreduced `A = 𝔽_p[t^{1/p^∞}]/(t)` with `ϖ = 0`, `A♭ = lim_F A = 𝔽_p`, so `A♭[0] = 𝔽_p`".

   Claim: the Frobenius inverse limit of `𝔽_p[t^{1/p^∞}]/(t)` is `𝔽_p`.

   Witness: the sequence `(t^{1/p^{n+1}} mod t)_{n ≥ 0}` has `x_{n+1}^p = x_n` and every term
   nonzero (exponent `< 1`), so it is a nonzero element of `lim_F A` with zeroth coordinate
   `t^{1/p}`. Since Frobenius of `B = 𝔽_p[t^{1/p^∞}]` is an automorphism carrying `(t)` to `(t^p)`,
   `lim_F B/t ≅ lim_n B/t^{p^n}`, the `t`-adic completion of `B`, a domain.

   Repair: "`A♭ = lim_F A` is the `t`-adic completion of `𝔽_p[t^{1/p^∞}]`, a domain, so `A♭[0] = A♭`
   is reduced while `A[0] = A` contains the nilpotent `t^{1/p}`; (2) fails for this non-perfectoid
   `A`" — the conclusion of the Check survives with the corrected value.

6. **F06** (P3) Value groups confined to the ring's universe

   Location: `packages/PerfectoidQuotientsPartII/Suggested.lean` lines 200 and 213
   (`∀ (Γ₀ : Type u) …` in `exists_approximation` and `isTopologicallyNilpotent_iff_forall_lt_one`).

   Claim: "every continuous valuation" (README Q8.3, Q8.4).

   Witness: the elaborated types (`#check`) quantify `Γ₀ : Type u` with `u` the universe of `A`,
   respectively `R`; a valuation into a value group in another universe is not covered. Both
   statements remain true (every valuation is equivalent to one into its own value group, which lives
   in the ring's universe), so this is a shape note.

   Repair: declare a second universe and write `∀ (Γ₀ : Type v)`, or say in the docstrings that
   the value group is taken in the ring's universe.

Two P2 findings (a headline narrowed below the source it claims to recover, with the plan's gap
left unowned; a false "iff" in Q8.1), four P3 findings. Elaboration is clean, the dependency check
reports no problem, the padding probe closes nothing, and the fifteen sampled `**Theorem**` targets
agree with their sources except as recorded under R01.

## Verified sound

**Principles.** No route-specific shortcut, no re-planning: PerfectoidQuotients §§0.0–2.1 are
imported by section and name (all 24 cited names occur in its README at head a3fe4b4, once each,
stating what is cited: lines 628, 670, 688–694, 747, 792–799, 821, 888–907, 928–985, 1098, 1199).
Supply is downward: depcheck output `depcheck: 205 roadmaps, 1751 edges, 0 problem(s)`, no UPWARD
or CYCLE line. No copied passages (statements are paraphrased with locators), no algorithms, no
sorry'd data, no `set_option`, no `lemma`, no `#print`/`#eval`, no process words, no LaTeX, no
machine paths (greps on README, Suggested.lean, sources.toml).

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0, exactly
15 warnings, all `declaration uses 'sorry'` (lines 98, 116, 127, 137, 147, 156, 167, 178, 196,
209, 232, 253, 276, 290, 323). The three Tau Ceti imports have object files at the pin.
`#check @name` for all 19 declarations in a scratch copy: elaborated types identical to the
worker's `signatures.md` for all 19 (mechanical diff); each compared with its README statement
(table below). No section binder was lost: every instance hypothesis of the README statements
(`IsIntegralPerfectoid`, `ValuationRing`, `IsDomain`, `IsRegularLocalRing`,
`IsAdicComplete (maximalIdeal R) R`, `CharZero`, `CharP`, `Module.FaithfullyFlat`,
`Module.Finite`, `Algebra.Etale`) occurs in the elaborated type.

**Padding probe.** Each of the 15 sorried theorems replaced by `first | rfl | trivial |
infer_instance | simp`: 15 errors (5 `simp made no progress`, 10 `unsolved goals`), nothing closes.
No declaration restates a definition, mirrors a Check or computes a value. The four definitions are
the ones the headlines need: `IsIntegralPerfectoid` (verbatim PerfectoidSpaces P1.24, main
`TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` line 659–670, the accepted pattern since a
roadmap's Lean file cannot import another's), `IsSyntomic`, `IsIndSyntomic`, `IsPZariski`.

**Headline theorems.** From the README (line 18–22): Q9.3, Q9.6, Q5.6, Q6.4, Q6.7, Q6.8, Q10.2,
Q10.5–Q10.6, plus Q6.2, Q8.3, Q8.4 as transfer and approximation statements. All stated; Q6.1
(the tilting equivalence as a functor) correctly named not statable (no tilt functor at the pin:
`PreTilt` is a type, `Mathlib/RingTheory/Perfection.lean` line 633).

**Sources, the seeded sample (15 `**Theorem**` targets) and flagged locators.**

| Target | Source at locator | Result |
|---|---|---|
| Q5.6 fibre products | CS24 line 468–486, Prop 2.1.4 | agrees: `A ↠ A'` surjective, `B → A'` any, `C` perfectoid with `C♭ ≅ A♭ ×_{A'♭} B♭` |
| Q6.2 completeness transfer | CS24 line 544–545 | agrees: `ϖ♭ ∣ ξ₀`, `A'♭` `ϖ♭`-complete iff `A'` `(ϖ♭)♯`-complete; proof line 548–565 as in the route |
| Q6.4 valuation rings, value groups | CS24 line 545–547, 568–576 | agrees, including `a = u b♯` (line 572) and the value-group isomorphism |
| Q6.7 algebraically closed fraction fields | CS24 line 545, 576–582 | agrees; dimension `≤ 1` by Sch12 line 751–761, higher rank by localisation at the height-one prime |
| Q6.8 (three theorems) | CS24 line 682–702, Prop 2.1.12 and proof | agrees; the roots variant is the proof with `u = 1` (line 687, 695–699), the `p`-torsion-free variant line 700–702 |
| Q8.3 approximation | CS24 line 895–901 | agrees with (2.3.1.2): `|a − a'♯| ≤ |p|·max(|a'♯|, |ϖ|^{pm})`; continuity convention line 901 |
| Q8.4 nilpotence | CS24 line 959–978, Wedhorn line 2494–2503 | agrees in the Tate-ring form; Huber's Lemma 3.3 (i) replaced by Tau Ceti `isIntegral_of_forall_continuous_valuation_le_one` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Integral.lean`, `[IsHuberRing R]`, open subring), and `IsTateRing extends IsHuberRing` (`TauCeti/RingTheory/Huber/Basic.lean` line 192) |
| Q9.3 André lemma | CS24 line 1004–1010 | agrees clause by clause; "monic" read as positive degree (see Source issues) |
| Q9.6 semiperfectoid covers | CS24 line 1157–1160 | agrees: `Ã_∞` need not be an `A`-algebra, roots live in `Ã_∞` |
| Q10.2 perfectoid covers | BS22 line 1299–1320; Bha18 line 469–479 | agrees for complete `R`; Bhatt's Prop 5.2 gives the non-complete regular local case under modification (a) (generalized integral perfectoid), which is the roadmap's notion; the equal-characteristic case is Kunz (EnhancedDerivedSheaves E1.6 line 706) |
| Q10.5–Q10.6 `Tor` | BS22 line 3206–3226; HM17 line 65–70 | statement agrees with the Remark; generality and proof route: R01, R03 |
| Q7.5 blowup | Stacks (More on Algebra) line 3872–3875, 0BIQ | agrees (`H₁`-regular, `r = 2`) |
| Stacks tags 090T, 031A, 0H7N, 07C3, 00SO, 00SV, 00SW, 00SY, 00SZ, 00HP, 07DV, 0C33, 00E0, 00FK, 00IA, 00SL | Stacks (Algebra) lines 10626, 10646, 11208, 14640, 16656, 16782, 16817, 16828, 16866, 4367, 7566, 21812, 1595, 2986, 5504, 16637 | each states what the README cites; 090T confirms "ϖ-adically complete implies p-adically complete" (Conventions, line 131–133) |
| BMS1 Def 3.5, Lemmas 3.2, 3.9, 3.10 | BMS1 lines 1008–1010, 863–870, 1033–1041, 1062–1067 | agree with Conventions, Q5.1 (1), P1.24 import |
| Ces19 Lemmas 4.7, 5.1, 5.2 | Ces19 lines 303–310, 419–428, 447–456 | agree with Q10.3, Q10.1, P7.17 |
| Wedhorn Def 7.7, Thm 7.10, Prop 7.18 | Wedhorn lines 2413–2415, 2429–2438, 2494–2503 | Def and Prop agree; Thm 7.10: R02 |
| Sch12 Thm 3.7, Prop 3.8, Cor 6.7 | Sch12 lines 751–767, 1675–1683 | agree (Q6.7, Q8.3 analogue) |

No locator was flagged unverified by the author. All CS24 page numbers quoted (pp. 10–18, 22–29)
match the page markers of the arXiv v3 text.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `IsIntegralPerfectoid` | zero ring; `ℤ_p`; perfect `𝔽_p`-algebra; `𝒪_C` | zero ring: `π = 0`, `0^p ∣ 0`, Frobenius on `0` surjective, kernel clause vacuous (`p` a unit) → holds; `ℤ_p`: `π^p ∣ p` forces `π` a unit, `lim ℤ_p/πⁿ = 0 ≠ ℤ_p` → fails; perfect: `π = 0`, `ker θ = (p)` → holds; `𝒪_C`: `π = p^{1/p}` → holds | matches BMS1 Def 3.5 and P1.24's Checks |
| `IsSyntomic` | `S = 0`; `A → A[X]`; `𝔽_p → 𝔽_p[x,y]/(x²,xy,y²)` | `s = ∅`, `span ∅ = ⊤` in `0` → syntomic (Stacks 00SL: empty fibres); polynomial ring: standard syntomic of dimension 1 (Tau Ceti `mvPolynomial`); the non-lci fibre: no presentation with `n + c` generators, `c` relations, fibre dimension `n` → not syntomic | agrees with Stacks 00SO/00SY |
| `IsIndSyntomic` | `A → A`; `A → A[T^{1/p^∞}]`; `ℤ → 𝔽_p` | identity factors through `B`; each `A[T^{1/pⁿ}]` syntomic, a test map lands in a finite stage; `𝔽_p` not flat over `ℤ` so no syntomic factorisation of `ℤ[x] → 𝔽_p`, `x ↦ 0` | agrees with CS24 line 984–986 |
| `IsPZariski` | `0`; `ℤ/pⁿ`; `ℤ`; `ℚ` | all units; `1 + pa` unit as `p` nilpotent; `1 + p` not a unit; `1 + p(−1/p) = 0` | matches Q9.5 Checks and `Ideal.mem_jacobson_bot` (`Mathlib/RingTheory/Jacobson/Ideal.lean` line 288) |
| `isIntegralPerfectoid_fibreProduct` | `A' = 0`; `g = id_{A'}`; `𝒪_C ×_{k̄} 𝒪_C` | eqLocus `= A × B`, perfectoid by PQ §0.6 products; eqLocus `≅ A`; `C/p = 𝒪_C/p ×_{k̄} 𝒪_C/p`, Frobenius surjective, `ξ = p + [p♭]x` common generator | holds |
| `isAdicComplete_preTilt_iff` | `ϖ = 0` (allowed when `ξ₀ = 0`); `A' = 𝒪_C`, `ϖ = (p♭)^{1/p}`; `A' = ∏_ℕ 𝒪_C` | `(0)`-adic completeness holds on both sides (`0ⁿM = 0`, `n ≥ 1`); both complete; both complete, non-noetherian | holds; hypothesis `ϖ ∣ ξ₀` independent of the generator (generators differ by a unit of `W(A'♭)`, zeroth coordinate a unit) |
| `valuationRing_iff_preTilt` | `𝔽_p`; `𝒪_C × 𝒪_C`; `k̄ = 𝒪_C/(p^{1/p^∞})` | `PreTilt 𝔽_p p = 𝔽_p`, both sides true; neither side a domain, both false; `k̄` perfect field, both true | holds |
| `untilt_dvd_iff_and_exists_isUnit_mul_untilt` | `A = ℤ_p[p^{1/p^∞}]^∧`; `A = k̄` | `(t^{1/p})♯ = p^{1/p}`, `1 + p = (1 + p)·1♯`, every value in `ℤ[1/p]` attained by a sharp; `♯ = id`, `u = 1` | holds |
| `isAlgClosed_fractionRing_iff` | `𝔽̄_p`; `𝔽_p`; `ℤ_p[p^{1/p^∞}]^∧` (p odd) | both true; both false; `X² − u` rootless (residue field `𝔽_p`) on the left, `𝔽_p((t^{1/p^∞}))^∧` not closed on the right | holds |
| `exists_surjective_of_isSMulRegular` (3 forms) | `A = 0`; `A = k̄`; `A` torsion-free | `Ã = 0`, `IsSMulRegular` vacuous; `Ã = W(k̄)[p^{1/p^∞}]^∧`, `ϖ̃ = p^{1/p} ↦ 0`, roots `p^{1/p^{n+1}} ↦ 0`; `Ã = A` | holds |
| `exists_approximation` | `a = b♯`; `m = 0`; `v(p) = 0` | `a' = b`, left side `0`; bound `v(p)`, any `a' ≡ a mod p` works since `a − a'♯ ∈ pA`; bound `0` forces `a ≡ a'♯` mod support | holds; universe note R06 |
| `isTopologicallyNilpotent_iff_forall_lt_one` | zero ring; `ℚ_p`, `a = p`, `a = 1`; `ℚ_p⟨T⟩`, `a = T`; unbounded "ring of definition" | no valuations (`0 ≠ 1` in `Γ₀`), both sides true for `a = 0`; `v(p) < 1`, `v(1) = 1`; Gauss valuation `v(T) = 1`; excluded by `PairOfDefinition` (bounded, `TauCeti/RingTheory/Huber/Basic.lean` line 65) | holds; converse constructed via a minimal prime below a maximal ideal containing `ϖ`, a dominating valuation ring, and `V/⋂ϖⁿV` (CS24 line 970–978) |
| `exists_indSyntomic_andre` | `A = 0`; `𝒪_C`, `ϖ = p^{1/p}`; `P = 1` | everything zero; `A' = A`, `I = 0`; excluded by `0 < natDegree` (`1` has no root in a nonzero ring) | holds; matches CS24 line 1004–1010 |
| `exists_semiperfectoid_cover` | `A = ℤ_(p)`; `A = 𝔽_p`; `A = 0` | `Ã = A' = ℤ̄_p`, `p`-torsion-free, henselian along `p`, completion `𝒪_{ℂ_p}`; `A' = ℤ̄_p/p`, `A'_red = 𝔽̄_p`; `A' = Ã = 0` | holds |
| `exists_faithfullyFlat_isIntegralPerfectoid` | `R = ℤ_p`; `R = 𝔽_p⟦t⟧`; `R` a field of char `p`; crystalline prism | `R_∞ = ℤ_p[p^{1/p^∞}]^∧` from `ℤ_p⟦x⟧/(p − x)`; `⋃𝔽_p⟦t^{1/pⁿ}⟧` faithfully flat (Kunz); perfect closure; `(ℤ_p, (p))` perfect with reduction `𝔽_p` not flat, showing the presentation with `d` variables matters | holds |
| `tor_map_mul_root_eq_zero(_of_cover)` | `S = R`; `R` étale over `S`; `c = 0`; `R = ℤ_p`, `S = ℤ_p[ζ_p]`; `dim R = 2` | source `Tor` vanishes; vanishes; `cr k = 0` in the domain `R⁺`, multiplication by `0`; `S` free, vanishes; finite normal `S` is CM hence free, vanishes; content only for `dim R ≥ 3` | statement true; generality R01, route R03; Mathlib `Tor` derives in the second factor (`Mathlib/CategoryTheory/Monoidal/Tor.lean` line 44), the map is in the first, as the README says; `Algebra R (AdicCompletion I R⁺)` is the composite through `R⁺` (`Mathlib/RingTheory/AdicCompletion/Algebra.lean` line 103) |
| Q5.1 (1), uniqueness of `θ` | `ℤ_p` (`p = 2`); perfect ring; `ε = (1, ζ_p, …)` | sequences `0` and constant `1` (no `√−1` in `ℤ_2`); `♯ = id`; `ε♯ = 1 = 1♯`, `ε ≠ 1` | Checks correct; `quotientMulEquiv` needs `CharP (R/I) p` and `IsAdicComplete I R` (`Mathlib/RingTheory/Teichmuller.lean` line 194) |
| Q5.2 (2) completeness | `A' = ℤ/p²`, `A = B = ℤ_p` | `(p², p²·0)`: defect killed by `p²` not `p`; `p^{n+1}(A×B) ∩ C ⊄ pⁿC` for `a₁ ≢ b₁ mod p` | the Check states the failure of the inclusion step, correctly |
| Q5.4 Check 4 | `𝔽_p[t^{1/p^∞}]/(t)` | `(t^{1/p^{n+1}})_n ≠ 0` in `lim_F A` | R05 |
| Q7.4 | `M = ℤ/p` over `ℤ`; `𝔽_p` over `𝔽_p[ε]/ε²` | `M[1/p] = 0`, `M/p` flat, `M` not flat; same with `ε` a zero divisor | Checks correct, Stacks 0H7N |
| Q7.5 | `R = ℤ`, `a = g = 2` | `R[g/a] = ℤ`, `ℤ[X]/(2X − 2) ∋ X − 1` with `2(X−1) = 0` | Check correct |
| Q7.6 | `g = pX` over `ℤ`; `g = 1 + px` over `ℤ_p`; `n = 0` | fibre at `p` zero, `ℤ[X]/(pX)` not flat; `ℚ_p` flat with empty special fibre; `A[x]/(g) = 0`, "dimension `n − 1`" is ℕ-junk `0`, harmless since the zero ring is standard syntomic of every dimension | Checks correct |
| Q8.1 Tate clause | `ℚ_p⟨T⟩`, lexicographic `v` | `v(T) = (−1,0) < (0,−n) = v(p)ⁿ` for all `n` | R02 |
| Q9.5 | `ℤ`; `ℤ_(p)` | `n^{p−1} ∈ 1 + pℤ` for `p ∤ n` | Check correct |
| Q10.3 | `R = 𝔽_p⟦t⟧`; `R = ℚ` | `R⁺` perfect, `p = 0` not a nonzerodivisor; `(R⁺)^∧ = 0` | Checks correct |
| Q10.6 Check 2 | `dim R = 2`, `S` finite normal | normal ⇒ `S₂` ⇒ depth 2 ⇒ CM ⇒ free (Auslander–Buchsbaum) | correct |

**Duplication audit (by object, at the pins).** Mathlib has no perfectoid predicate (only
`PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta` in `Mathlib/RingTheory/Perfection.lean`,
`Perfectoid/Untilt.lean`, `Perfectoid/FontaineTheta.lean`), no syntomic ring maps (grep
`Syntomic`: none), no `p`-Zariski predicate. Tau Ceti has `IsStandardSyntomicOfRelativeDimension`
(fixed dimension, `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean` line 86: flat, presentation
with `n + c` generators, fibres of dimension `n`) and scheme-level `SyntomicOfRelativeDimension`
(`TauCeti/AlgebraicGeometry/Morphisms/Syntomic/Basic.lean` line 46), neither of which is the
varying-dimension `IsSyntomic` or ind-syntomic maps; `Valuation.IsContinuous` is the attained-value
predicate (`TauCeti/RingTheory/Valuation/Continuous/Basic.lean` line 125, module doc), as the
README says. Across roadmaps: `IsIntegralPerfectoid` exists only in PerfectoidSpaces (main, and its
revising pull request #1187, same class); "ind-syntomic" occurs only in PerfectoidQuotients (its
§1.2 modulo-`p` refinement, which Q9.4 compares against, not restates); "`p`-Zariski" occurs
nowhere else; CS24 Props 2.1.4, 2.1.9, 2.1.12, Thm 2.3.4, Cor 2.3.7 are owned by no other roadmap.
DirectSummandsAndBigCohenMacaulay (head aa4beac) builds Bhatt's almost faithfully flat
`K°`-perfectoid cover of a complete regular local ring (its §3.2–3.3, Bha18 Prop 5.2 (1)) and
Hochster–Huneke in characteristic `p` (§4.9); it does not state the fibre-product, tilting,
André or Heitmann–Ma `Tor` results. ArcTopologyAndDescent (head faa84e8) §12.6 imports "tilting
equivalence for these valuation rings" from PerfectoidSpaces, PrismaticCohomology §§0.79–0.82 and
PerfectoidQuotients §§0.4–0.6 without naming this roadmap; the owner of CS24 Prop 2.1.9's
valuation-ring clause is this roadmap (Q6.4), which is a note for that consumer, not a finding
here. Ownership against open pull requests whose files the brief did not give was not checked.

**Supplier citations resolved.** PerfectoidSpaces (main): P0.1, P0.2, P0.11, P1.4–P1.6, P1.15,
P1.24, P1.25, P3.7, P4.15.2, P4.15.4, P7.16a, P7.17 at README lines 879, 965, 1714, 3843–4040,
4453, 5049, 5101, 8424, 11053, 11144, 17397, 17487; names `isPerfectoidTateRing_iff_integral`
(5132), `isAlgClosed_tilt`/`isAlgClosed_of_tilt` (8433–8437), `exists_residueTower`,
`cohen_unramified`, `cohen_ramified`, `cohen_equalCharacteristic` (17425–17443),
`RegularTower.exists_perfectoidTower` (17507). PrismaticCohomology (head 36d19e5): §0.61 (1169),
§0.62–0.63 (1193–1215), §0.79 (1454), §0.83–0.84 (49, 60), §2.30 (2789), §2.31 (2801); Lean names
R04. SchemeAndStackFoundations (main): §0.12 (969, `Henselization.algebra`), §0.13 (1032,
`IndEtale`, `henselization_flat`, `henselization_quotient_pow`), §0.14 (1068, permanence under
quotients and integral extensions). EnhancedDerivedSheaves (main): E1.6 line 689,
`frobenius_flat_of_isRegular` line 706 and `Suggested.lean` line 102. DerivedDeRhamCohomology
(head e0b83c0): §1.10 line 538 with both names in its `Suggested.lean` lines 86, 97 (the worker's
`citations.md` lead is resolved: they are that roadmap's names). StableReduction (main): Layer 1
builds syntomic morphisms (line 375). PerfectoidQuotients (head a3fe4b4): all 24 names, above.
The `*Needs:*` lines cite only these suppliers and Mathlib/Tau Ceti; no upward citation.

**Shape.** Headings in the upstream order (Summary, Scope and ownership, Conventions, Exact
supplier contracts, How to read the build, Layers Q5–Q10 each ending with Examples and
Dependencies, Worked examples, Downstream consumers, References). Every definition (Q7.1, Q7.2,
Q8.2, Q9.1, Q9.5) has an API list and at least three Checks (5, 5, 3, 4, 4); every theorem has
hypotheses and a locator. `sources.toml`: eight certified open-repository entries; the Stacks entry
was kept as recorded when I fetched tag 0BIQ (More on Algebra) through the service.

## Not verifiable

- None. Every cited text was read at its locator from the cache (CS24, BS22, BMS1, Wedhorn, Sch12,
  Ces19, HM17, Bha18, Stacks Algebra and More on Algebra).

## Source issues

- **Misprint** in CS24 at Corollary 2.3.7, proof, printed page 29 (line 1174): the source invokes
  Proposition 2.1.11 (d), which concerns products, to conclude that the completion of the reduced
  quotient is perfectoid; it should invoke part (c), quotients by root-stable ideals; affects
  nothing.
- **Misprint** in CS24 at Theorem 2.3.4, printed page 25 (line 1009–1010): the source says every
  monic `P ∈ A'[T]` has a root in `A'/I'`; it should say every monic polynomial of positive degree,
  since the constant `1` has no root in the nonzero ring `A'/I'`; affects nothing.
- **Gap** in BS22 at Remark 10.13, printed pages 83–84 (lines 3214–3215): the source says a
  faithfully flat perfectoid `R → R_∞` inside the `p`-adic completion of `R⁺` exists for every
  complete regular local ring of mixed characteristic by Remark 3.11; it should give the embedding,
  which Remark 3.11 does not construct and which the finite stages `A/(φⁿ(f))` supply when the
  residue field is `F`-finite; affects a stated result (the generality of the reproof of
  Heitmann–Ma Theorem 1.3).
- **Gap** in BS22 at Remark 10.13, printed pages 83–84 (lines 3217–3226): the source says the
  `c`-almost vanishing of `Tor_i^{R/pⁿ}(T_perfd/pⁿ, −)` makes the image in
  `Tor_i^{R/pⁿ}(R⁺/pⁿ, −)` annihilated by all `c^{1/pⁿ} ∈ R⁺`; it should first enlarge `R_∞` to
  contain compatible roots of `c` mapping to those of `R⁺` (André's lemma), since the image is only
  a `T_perfd`-submodule; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7cfbf22320f8456821f181a403db115f82aff95c", "job": "REV-PKG-PerfectoidQuotientsPartII", "model": "fable", "worker": "chris-x12"} -->
