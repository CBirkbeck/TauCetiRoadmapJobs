<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6915999672 -->
Red team round 2 pass a (claude) of a2b9a07

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §0.14 step 3 attributes to Becher an argument his text does not contain

   **Location.** `packages/RealSurfacePeriodIndex/README.md:564` (§0.14, step 3): "Becher's argument (§3) produces from it an anisotropic torsion Albert form, using that I³F is torsion-free".

   **Claim.** BEC05 §3 proves that u(F) = 6 gives an anisotropic torsion Albert form.

   **Witness.** BEC05 lines 102–104 state this as known, with no proof; BEC05 line 119 (proof of Theorem 3.1) asserts it again and argues only from the Albert form onwards. No argument produces the Albert form from a six-dimensional form.

   **Repair.** Replace step 3 by the following, which uses only step 2:

   > 3. If u(F) = 6, let φ = φ′ ⊥ ⟨a⟩ be anisotropic of dimension 6 with zero total signature, hence torsion (§0.6a), and let d = −det φ be its signed discriminant. At every ordering φ has three positive and three negative diagonal entries, so d is positive there and ⟨1, −d⟩ is torsion (§0.6a). Put A = φ′ ⊥ ⟨ad⟩. It has dimension 6 and signed discriminant d², and A − φ = a⟨d, −1⟩ in W(F), so A is a torsion Albert form. A is anisotropic: otherwise A ≅ ℍ ⊥ ρ with ρ of dimension 4, of trivial discriminant and torsion, so ρ ≅ eπ for a torsion 2-fold Pfister form π and some e ∈ Fˣ. For every z ∈ Fˣ the 3-fold Pfister form π ⊗ ⟨1, −z⟩ is torsion, hence hyperbolic because I³F is torsion-free (step 2), so π ≅ zπ: π represents every element of Fˣ and ρ ≅ π. Witt cancellation (QuadraticFormInvariants Layer 1) gives φ′ ≅ ρ ⊥ ⟨−ad⟩, so φ ≅ π ⊥ ⟨a, −ad⟩ with π representing −a, and φ is isotropic, a contradiction. A torsion form has zero total signature (§0.6a, step 1). The statement is Elman–Lam's; BEC05, §3, p. 3, recalls it without proof.

   Add "QuadraticFormInvariants Layer 1" to the *Needs:* line of §0.14 (`:571`). Tested on F = ℝ(x, y) and π = ⟨1, −(1 + x²), −y, y(1 + x²)⟩ (torsion and anisotropic by the Check at `:569`): π represents −1, since x²·1 − (1 + x²)·1 + 1 = 0 is a zero of π ⊥ ⟨1⟩ with last coordinate 1, as the universality step predicts.

2. **F02** (P3) "EL73, cited by locator" carries no locator

   **Location.** `packages/RealSurfacePeriodIndex/README.md:558` and `:563` (§0.14): "EL73, cited by locator, for u(F) ∈ {0, 1, 2, 4, 6} and the Albert form"; `packages/RealSurfacePeriodIndex/sources.toml:216`: `locator = "u-invariant of real fields"`.

   **Claim.** The value set u(F) ∈ {0, 1, 2, 4, 6}, on which §0.15, §7.8 and `not_anisotropic_of_hasZeroTotalSignature` rest, has a locator.

   **Witness.** No theorem, section or page of EL73 is given anywhere in the README or the manifest. The readable sources prove less: EKM Theorem 37.4 (2) (EKM line 9122) gives u(F) < 4·u(F(√−1)), that is u < 16, and Corollary 37.5 (EKM line 9241) gives u < 2ⁿ⁺².

   **Repair.** (i) State what is taken from EL73 as narrowly as the route needs: in §0.14 replace "u(F) ∈ {0, 1, 2, 4, 6}" as a cited conclusion by "u(F) ≤ 6 (Elman–Lam; hence u(F) ∈ {0, 1, 2, 4, 6}, odd values above 1 being excluded for a real field by parity of zero-signature forms and for a nonreal field by EKM Corollary 36.4)", and with S01 the Albert form no longer comes from EL73. (ii) Replace both occurrences of "EL73, cited by locator" by "EL73, in the form quoted in BEC05, §1, p. 1 (transcendence degree 2 over a real closed field) and §3, p. 3 (u(F(√−1)) = 4); the theorem number in EL73 is not recorded, the text not having been read", and set the manifest locator to the same words. (iii) Whoever holds the text supplies the theorem number; until then the item stays under "Not verifiable". Tested on F = ℝ(x, y): u(ℂ(x, y)) = 4, the narrowed statement gives u(F) ≤ 6, which is what the Check at `:568` uses.

3. **F03** (P3) the *Needs:* line of §0.13 omits two layers its proof plan uses

   **Location.** `packages/RealSurfacePeriodIndex/README.md:552`: "*Needs:* Mathlib `CliffordAlgebra.even`; Mathlib `QuadraticMap.Anisotropic`; QuadraticFormInvariants Layer 5; §0.12."

   **Claim.** The line lists what the statement and the suggested route use.

   **Witness.** Step 1 (`:542`) uses "diagonal calculus, QuadraticFormInvariants Layer 0"; step 3 (`:544`) uses "the pure reduced norm forms … of QuadraticFormInvariants Layer 2". Neither layer is in the line. Both are in the Layer 0 Dependencies (`:598`), so no layer-level edge is missing.

   **Repair.** `:552` becomes "*Needs:* Mathlib `CliffordAlgebra.even`; Mathlib `QuadraticMap.Anisotropic`; QuadraticFormInvariants Layer 0; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 5; §0.12."

4. **F04** (P3) two layer comments of Suggested.lean do not carry the README's layer titles

   **Location.** `packages/RealSurfacePeriodIndex/Suggested.lean:62`: "## Layer 0: real function fields"; `:97`: "## Layer 7: period equals index, the u-invariant and quadratic forms".

   **Claim.** The section comments are `Layer k: <title>` with the README's titles.

   **Witness.** `README.md:148`: "## Layer 0: real function fields: orderings, real closures, Brauer index and the Elman–Lam invariant"; `README.md:1946`: "## Layer 7: period equals index: the main theorems and the u-invariant". The Layer 2 comment (`Suggested.lean:76`) does equal `README.md:829`.

   **Repair.** `Suggested.lean:62` becomes `/-! ## Layer 0: real function fields: orderings, real closures, Brauer index and the Elman–Lam invariant -/` and `:97` becomes `/-! ## Layer 7: period equals index: the main theorems and the u-invariant -/`. No declaration changes.

Four new findings, all P3 (S01–S04). No statement of `packages/RealSurfacePeriodIndex/Suggested.lean` and no README target was found false. Files read in full: `packages/RealSurfacePeriodIndex/README.md` (2828 lines), `packages/RealSurfacePeriodIndex/Suggested.lean` (165 lines), `packages/RealSurfacePeriodIndex/sources.toml`. No Lean was run in this pass (the brief gives no Lean command); the elaborated types are those of the supplied signature transcript.

## Round 1 findings at this head

| Id | Status | Witness at a2b9a07 |
|---|---|---|
| 1a/F01 (P1) Pfister's local–global principle unowned | repaired | `README.md:366` (§0.6a): "sign_P(q) = 0 for every P ∈ X_F if and only if the Witt class of q is torsion in W(F), and in that case 2^m·q is hyperbolic for some m ≥ 0". Cited in the *Needs:* of §0.8 (`:433`) and §0.14 (`:571`). EKM Theorem 31.22 is at EKM line 6811, printed p. 128; Lemma 31.19 at EKM line 6701, p. 126; Corollary 34.12 at EKM line 7657, p. 141. The inline proof (steps 2–5) was recomputed, see the table below. |
| 1a/F02 (P2) Artin–Lang unowned | repaired | `README.md:306` (§0.5a): "there is an R-algebra homomorphism x : A → R with f_i(x) > 0 for every i". *Needs:* of §0.9 (`:456`), §7.6 (`:2062`), §7.11 (`:2162`), §7.13 (`:2203`) carry §0.5a. The transfer step cites K3BlochGroups §5.8, whose text at its open head (README line 2052) states "every ordered-field embedding between real closed fields is elementary, including formulas with parameters in its domain". RealAlgebraicGeometry Layer 6 on main says its quantifier elimination "is over ℝ" (its README line 476), so the repair's change of supplier is correct. |
| 1a/F03 (P3) §1.3 cites §7.4 for a twisted formula | repaired | `README.md:667`: "adding ω ∪ (a₀, a₁) = (a₀, a₁, 0) gives (0, a₁, Sq¹a₁)". AlgebraicTopologyPartII §7.4 at its head gives b_i = β(a_{i−1}) + (k − i)a_i, which for k = 1 is (a₀, 0, Sq¹a₁); §14.2 gives β_L = β + e ∪ and names ℤ(1) as the sign system of S × G → S. Sum recomputed: (a₀, 0, Sq¹a₁) + (a₀, a₁, 0) = (0, a₁, Sq¹a₁). |
| 1a/F04, 1b/F07 (P3) uncited source corrections | repaired | Every entry E1–E15, E17, E18, E20–E26 now occurs at least twice in the README (count by `grep -o`), e.g. `README.md:1209` "(source correction E11)", `:2302` "(source correction E7)". |
| 1a/F05 (P3) "merge order" in the README | repaired | `README.md:24`: "QuadraticFormInvariantsPartII consumes it for its Layer 5"; `grep 'merge order'` on the README is empty. |
| 1b/F01 (P2) layers follow B19's sections | partly repaired | Headings of Layers 2, 3, 4, 5, 8 no longer repeat B19's titles (`README.md:1066`: "double covers branched along a curve: finite and incidence models and their cohomology"). The pairs by number are unchanged: Layer 3 ↔ §3, 5 ↔ §4, 4 ↔ §5, 6 ↔ §§6.1–6.2, 7 ↔ §§6.3–6.4, 8 ↔ §7, 9 ↔ §8. Not re-raised as a finding: the order is not B19's (Layers 4 and 5 are transposed, B19 §2 has no layer, Layers 0 and 1 have no section) and the *Needs:* lines force 3 → {4, 5} → 6 → 7 → 9 and 8 → 9. Whether the scope of each layer is the roadmap's own is left to the human reviewers, as in round 1 of this pass. |
| 1b/F02 (P2) §6.2 follows Assumption 6.1 clause by clause | repaired | `README.md:1663`: "(i) No connected component of Ξ is disjoint from ι(𝒮). (ii) The pushforward of the mod-2 fundamental class, ι_*[𝒮], equals cl_R(R)". Against B19 lines 1111–1121 the longest shared run is now three words. §5.1 (`:1454`) against B19 lines 676–685: reworded likewise. Condition (iv) recomputed on Ξ = S² with one circle: the two open discs, each adherent to the circle; disc ∪ circle is a closed disc, connected. |
| 1b/F03 (P3) BEC05 Theorem 3.1 does not state the criterion | repaired | `README.md:577`: "BEC05's Theorem 3.1 and Remark 3.2 are different criteria for u ≤ 4, by universality of four-dimensional forms, and are not used". B19 lines 1308–1310 state the criterion with the attribution to Pfister. |
| 1b/F04 (P3) §0.14 step 2 rests on a recollection | repaired for I³F; see S01, S02 for what remains | `README.md:563`: "this property descends to F (EKM, Theorem 35.12, p. 152), and for F it is equivalent to the torsion-freeness of I³F (EKM, Proposition 35.9, p. 150)". EKM line 8404 (finite normal K/F, A_n descends) and EKM line 8317 (A₃ ⟺ I³F torsion-free) say this. |
| 1b/F05 (P3) "no half-branches" inference | repaired | `README.md:447`: "If C(ℝ) = ∅, then F is nonreal by §0.5a … X_F is empty, every β vanishes at all real closures, and (a) gives β = 0". |
| 1b/F06 (P3) §0.2 pointer Check | repaired | `README.md:202`: "`X_{F_n}` has 2ⁿ points … with Z_n the orderings at which √p₁ < 0, every Z_n has 2ⁿ⁻¹ points and the limit is the nonempty half". Recomputed: [F_n : ℚ] = 2ⁿ, all embeddings real, p_{n+1} positive and a non-square in F_n, so each ordering has two extensions. |

No repair was found to introduce a false statement. Two things the repairs left behind are S01 and S02.

## Verified sound

**Dependency check** (the command of the brief, run on `packages/RealSurfacePeriodIndex/README.md`):

    depcheck: 262 roadmaps, 2537 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Counts.** 9 declarations of `Suggested.lean` read with their elaborated types (1 definition, 8 theorems); 110 README sections read; 56 source locators read at the text (EKM 23, B19 22, BEC05 3, MVH98 3, CT05 2, VA13 2, BW20 1) and 11 located only (BW20 6, CT05 3, BW20II 1, B19 1); 48 Checks recomputed of 326 read; 10 pinned declarations opened at the pin; 36 sibling citations resolved at main or at the open head.

**Suggested.lean, one row per declaration.** There are no `variable` lines in the file; every binder is in the declaration's own signature, and the transcript shows none lost. (The transcript's tenth entry, a "structure" at line 66, is the word "structure" at the start of a docstring line and is not a declaration.)

| Declaration | Section and context | Instances and values computed | Result |
|---|---|---|---|
| `HasZeroTotalSignature` | Layer 0; K : Type u with `[Invertible (2 : K)]`, V finite-dimensional, R : Type u real closed | ⟨1, −1⟩ over ℝ: W = line x = y, 2·1 = 2, holds. ⟨1, 1⟩: maximal isotropic dimension (2 − 2)/2 = 0 ≠ 1, fails. Odd dimension: 2·dim W odd impossible, fails whether or not q is degenerate. ⟨1, 0⟩ over ℝ: radical line, holds (signature 1). K = ℂ(x, y): −1 a square maps to a square of R, no K-algebra R exists, holds for all q. Real closures of K exist in Type u (`TauCeti.RealClosure.exists_realClosure`) | equals sign_P(q) = 0 for all P when q is nondegenerate; the degenerate case is isotropic anyway |
| `index_eq_orderOf_of_isAlgClosed` | Layer 2; k, K : Type u, `EssFiniteType`, trdeg = 2 | A = M_n(K): 1 = 1. (x, y) over ℚ̄(x, y): norm form anisotropic over ℚ̄((x))((y)), residue forms ⟨1⟩, ⟨1⟩ twice, so 2 = 2. Period l^r: ind divides l^(r−1)·l | true as typed |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | Layer 2; R real closed | √−1 ∈ K: K ⊇ R(√−1), ind = per. Otherwise ind(α) divides 2·ind(α_{K(i)}) = 2·per(α_{K(i)}), which divides 2·per(α). Albert class over ℝ(x, y): 4 = 2·2 | true as typed, sharp |
| `index_eq_orderOf_of_not_isSemireal` | Layer 7; K over ℝ, `¬ IsSemireal K` | ℂ(x, y): de Jong case. ℝ(x, y) is semireal and excluded; the Albert class there has 4 ≠ 2 | true as typed; hypothesis needed |
| `index_eq_orderOf_of_forall_isRealClosed` | Layer 7; hypothesis over all R : Type u with `Algebra K R`, algebraic or not | Nonreal K: hypothesis empty, gives Theorem 0.3. R not algebraic over K: its relative algebraic closure R₀ of K is a real closure and Br(R₀) → Br(R) is injective, both ℤ/2 generated by (−1, −1), so the hypothesis equals vanishing at real closures. ℍ ⊗ ℝ(x, y): hypothesis fails | true as typed |
| `not_anisotropic_of_hasZeroTotalSignature` | Layer 7; no `EssFiniteType`; 4 < finrank | Degenerate q: radical vector. Real K, dimension 5: predicate false. Algebraic closure of ℝ(x, y): forms of dimension ≥ 2 isotropic. Rests on §0.14 (S02) | true as typed |
| `exists_anisotropic_hasZeroTotalSignature` | Layer 7; `EssFiniteType`; `Fin 4 → K` | w′ = (w² − 1)/(2w): w′² + 1 = (w² + 1)²/(4w²) ∈ m². dy_j ≡ 2(1 + i)dz_j mod m. Signature 1 + 1 − 1 − 1 = 0. Residues of ⟨1, y₁⟩ ⊥ (−y₂)⟨1, y₁⟩ over ℂ((y₁)): ⟨1⟩, ⟨1⟩ | true as typed |
| `not_anisotropic_of_not_isSemireal` | Layer 7; no `EssFiniteType`; 5 ≤ finrank | ℝ(x, y): 5⟨1⟩ anisotropic, excluded by semireality. ℂ(x, y, z): ⟨1, x⟩ ⊗ ⟨1, y⟩ ⊗ ⟨1, z⟩ anisotropic of dimension 8, excluded by trdeg | true as typed |
| `exists_common_zero_of_not_isSemireal` | Layer 7; trdeg = 1 | K(t) nonreal of trdeg 2, q₁ + tq₂ of dimension ≥ 5 isotropic, Amer–Brumer. ℝ(x): 5⟨1⟩ has no zero, excluded. ℂ(x, y): ⟨1, x, y, xy, 0⟩ and ⟨0, 0, 0, 0, 1⟩ share no zero, excluded by trdeg | true as typed |

Headlines: de Jong, the norm bound, Theorems 0.3, 0.4 (birational), 0.10, 0.12 (both halves) and the pair-of-quadrics form of 0.13 are stated; Theorems 0.4 (scheme form), 0.5, 0.6, Proposition 0.7 and Theorem 0.13 (del Pezzo form) are named in the module docstring with the missing carriers. The pins have no Brauer group of a scheme, no del Pezzo, Enriques or K3 carrier (grep of both libraries). One-tactic probe: none of the eight theorems is one library lemma or one tactic from another; the nearest, `not_anisotropic_of_not_isSemireal` from the upper bound, needs that a non-semireal field maps to no real closed field, an `Invertible 2` instance and 5 ≤ n ⟹ 4 < n. No padding, `set_option`, `lemma`, `#eval`, sorry'd data or machine path. The file uses the `module` / `public import` form, as 104 of the 250 `Suggested.lean` files on main do.

**README statements, computed in this pass.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.5 trace-form criterion | M_d(R); M_(d/2)(ℍ_R) | d(d+1)/2 − d(d−1)/2 = d; Trd(x²) on ℍ = 2(a² − b² − c² − d²), signature −2, times d/2 gives −d | holds | none |
| §0.5a equivalences | Spec ℝ; x² + y² = 0; x² + y² + z² = −1 | real, smooth point, dense: yes; nonreal ((y/x)² = −1), only a singular real point, not dense; V(ℝ) = ∅ and −1 a sum of squares | holds; "smooth" needed | none |
| §0.6a step 3 | φ(v + √a·w) = 0 with v = cw | 2cφ(w) = b_φ(v, w) = 0 forces c = 0, then aφ(w) = 0 forces w = 0 | v, w independent | none |
| §0.6a steps 4–5 | ⟨1, a⟩ ⊗ ⟨1, −a⟩; ⟨1, a⟩ + ⟨1, −a⟩; b² + c² = −d² | ⟨1, a, −a, −a²⟩ = 0; ⟨1, 1⟩ + ⟨a, −a⟩ = 2; ⟨1, 1, 1⟩ isotropic ⟹ ⟨1, 1, 1, 1⟩ hyperbolic ⟹ 4q = 0 | holds | none |
| §0.6a Checks | ⟨1, −(1 + t²)⟩ over ℝ(t); ⟨1⟩ over 𝔽₃ | ⟨1, 1⟩ ≅ ⟨1 + t², 1 + t²⟩, order 2; 1 + 1 = −1 so ⟨1, 1⟩ ≅ ⟨−1, −1⟩, order 4 | hold | none |
| §0.7 one-variable step | N(m + 1) unknowns against (dm + c + 1)·d^i | (N − d^(i+1))·m + N − d^i(c + 1) > 0 for m large when N > d^(i+1) | holds | none |
| §0.7 systems, F algebraically closed with i > 0 | r = 2, d = 2, N = 5 over ℂ | no normic form of degree > 1 exists; height ≤ 2 < 5 | first branch needed (see Source issues) | none |
| §0.9 (b) | (−1, t), (−1, 1 + t²) over ℝ(t) | t < 0 at an ordering gives real points with (−1, t₀) ≠ 0; 1 + t² > 0 everywhere, class 0 | holds | none |
| §0.12 step 2 | D ⊗ L ≅ M_d(L) acting on L^d | dim_K = d[L : K] = rank·d², rank = [L : K]/d | d divides [L : K] | none |
| §0.13 normal form | e = −x₁x₂x₃ | ex₃ ≡ −ab; ex₆ ≡ cd iff −x₁⋯x₆ is a square | holds | none |
| §0.14 step 2 | F = ℝ(x, y); ℂ(x, y); u(F(√−1)) = 3 | 8 > 4 so 3-fold Pfister forms over F(i) are hyperbolic; I³ = 0; 3 excluded by EKM 36.4 | holds | S01, S02 for step 3 and the value set |
| §0.14 step 3 as repaired in S01 | A = φ′ ⊥ ⟨ad⟩ | signed discriminant d·d; A − φ = a⟨d, −1⟩ torsion; isotropic A forces φ ≅ π ⊥ ⟨a, −ad⟩ isotropic | holds | S01 |
| §1.2 at Spec ℝ | H²(G, ℤ(1)), H³(G, ℤ(1)) | 0, ℤ/2 | holds | none |
| §1.3 and §5.4 Bockstein | k = 1 with ℤ(1); k = 2 with Z̃(1) on Ψ | (a₀, 0, Sq¹a₁) + (a₀, a₁, 0); (0, a₁, βa₁) + e₁·(a₀, a₁, a₂) with [e + ω]₀ = 1 + 1 = 0 gives (0, a₁ + a₀e₁, βa₁ + a₁e₁) | agree with AlgebraicTopologyPartII §§7.4, 14.2 | none |
| §1.7 Checks | (s, t) after adjoining √(st); 1 + s² + t² | (s, t) = (s, st) + (s, −1); b² + d² = 1 and ab + cd = 0 give a² + c² = λ², but 1 + s² is not a square | hold | none |
| §1.8 step 4 | s_t = c′ss′, s₁ = c″ss′ at a crossing | s_t/s₁^l = c·ss′·(ss′)^(−l); (s, s′) = (s, s_t/s₁^l) + (s, −c⁻¹) from (s, s) = (s, −1) | holds | none |
| §2.1 | ℙ², quintic | 2(−3 − 1) = −8; A² = A·K = 5 excluded | holds | none |
| §3.2 singular locus | charts r = su² and rt² = s | singular only at u = 0 over dr = 0 (Sing R); at R ∩ D, dr = u²ds contradicts transversality | points with w = 0 over Sing R | none |
| §4.2, §4.5, §4.6 twists | L = A^l ⊗ N(−R) | L²(R)(−C) = L ⊗ N; T_{X/S} = O(2) ⊗ L⁻¹, restricted to C equal to L; L(−C) = N(−R); ω = p̄*(K_S ⊗ L(R)) | hold | none |
| §5.5 Enriques example | B rows (1, j, j²), j = 1, 2, 3 | det 2; 8 sign vectors modulo ±1 give 4 spheres, ι antipodal, 4 copies of ℝℙ²; conj(P) = ι(P) forces x_j² = −(By′²)_j ≤ 0; c_Ψ = (1, 1, 0, 0)·(h₁ + h₃) = h₁, coefficient sum 1 | hypotheses hold and c_Ψ ∉ w₁^⊥ | none (see Not verifiable) |
| §6.4 torus Check | loops a, b, a + b | 3 double points; total class μ*(2a + 2b) + 2(e₁ + e₂ + e₃) = 0; span contains μ*a, μ*b, e_i: rank 5 | holds | none |
| §7.2 step 4 | cor(α_T) = 2α | per(2α) = n/2 divides m = per(α_T), and m divides n/2 | m = n/2 | none |
| §7.8 step 2 | K algebraic over K₀ | lim Z_i = Z(α) = ∅ by the restriction formula of §0.5; ind(α) divides ind(α_i) | holds | none |
| §7.9, source correction E10 | a = d(w² + 1) = αdz₁ + βdz₂, c = 2(1 + i) | det = c² + c(α + β); α = β = −c/2 is proportional to neither dz_j and gives 0 | the source's condition is insufficient; w′ repairs it | none |
| §7.12 | d = 4; d = 3 | 1 + d = 5, 1 + 3d = 13 < 15; 10 = 10 | holds | none |
| Layer 8 Examples | n = 4, x = (1, 0, 0, 0) | Tr(x)·1 − 4x = (−3, 1, 1, 1) ≡ (1, 1, 1, 1) = p*φ; (3, −1, −1, −1) ≡ (3, 3, 3, 3) | holds | none |
| §9.8, source correction E25 | any real Enriques surface | χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2, so the number of components of odd Euler characteristic is even | holds, independently of the route of §9.8 | none |
| §9.9 | all nonorientable components in Θ | deg(b·w₁) = deg(a₀w₁²) = number of odd-χ components mod 2 = 0 | index 2 | none |
| §9.12 | f = (1 − u² − v²)u²v² − t | critical values of (1 − u² − v²)u²v² are 0 and 1/27, t is neither; at [0:1:0], z² + u² + tw⁶: three blow-ups end in the conic z² + u² + t = 0 without K-points | four spheres, no further K-points | none |

**Suppliers.** K3BlochGroups §5.8 (text read); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3, 15.1–15.6, 16.1–16.4 exist at its open head (§§7.4 and 14.2 read; "e = ω" is the pullback of ω under the classification of §14.1); MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10 exist at its open head, and §7.10 states H¹_alg = w₁^⊥ on real Enriques surfaces with cl_R(K_X) = w₁ as an input to prove; QuadraticFormInvariants Layers 0, 1, 2, 4, 5 on main carry the titles the contract gives, and its line 994 excludes general torsion theorems for W(K), so §0.6a has no owner there. The other supplier sections were resolved in round 1 and `roadmaps resolve` reports none missing at this head.

**Declared gaps.** The three slugs stand in the README under their suppliers' subsections (`:98`, `:104`, `:114`) with the wording of the brief. BW20 Proposition 2.9 (BW20 line 1361) is stated for a smooth variety over a real closed field, which covers the gap's "smooth over ℝ". Not raised.

**Ownership.** Searched by object on main, in the pins and at the open heads: Artin–Lang, Pfister's local–global principle, the Harrison topology, the space of orderings, Amer–Brumer, Albert forms, the u-invariant, model completeness, Tsen–Lang. No owner on main or earlier in the merge order other than K3BlochGroups §5.8, which is cited. The Tsen–Lang overlap with QuadraticFormInvariantsPartII is settled (FIX-PKG-RealSurfacePeriodIndex~4, F04, not actionable in this package) and is under "For the human reviewers". No declaration of `Suggested.lean` shares a fully qualified name with another roadmap.

**Policy.** The pull request changes only `packages/RealSurfacePeriodIndex/`. No pull-request number, process word or `lemma` keyword; every target has a locator (S02 for one that names no place in its source); every definition has at least three Checks (fewest: §8.1, three).

**Copyright, wording.** 16 passages compared with 5 sources: B19 Assumptions 4.1 and 6.1, Theorems 0.6, 1.1 (proof), 1.5, 0.12 (proof), Lemma 1.3 (proof), Propositions 0.7, 6.6, 7.1, 8.1; EKM Lemma 31.19 (proof) and Proposition 37.7 (proof); BEC05 §3; MVH98 Theorem 1.3; CT05 proof of Theorem 3.14. Longest shared runs: nine words, a standing hypothesis ("S be a connected smooth projective surface over ℝ", README §9.1 against B19 line 1703), and eight words in the statement of Theorem 0.6 (README §9.10 against B19 lines 79–80). Both are statements with one way of writing the hypothesis. The proof of §0.6a shares the idea of EKM's proof of Lemma 31.19 (a maximal algebraic extension) and none of its sentences. No table, figure or list is taken over.

**Copyright, arrangement.** B19 has the largest share. Pairs by number: Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 5 ↔ §4, Layer 4 ↔ §5, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8; Layers 0 and 1 have no counterpart and B19 §2 has no layer. Not one run in one order; the forced edges are §§4.2, 5.1 on §3.2; §6.13 on Layers 4 and 5; §7.2 on §6.13; §§9.6, 9.7 on §§7.7, 8.10.

Source independence: 16 passages compared with 5 sources, none shared beyond runs of nine and eight words inside theorem hypotheses; largest share B19, 132 of 264 locators; contents compared with B19: the scope of Layers 3, 5, 4, 8, 9 is that of §§3, 4, 5, 7, 8, the order differs at Layers 4–5 and is forced elsewhere by the dependency lines named above: independent, with the scope question left to the human reviewers.

## Not verifiable

- The thirteen uncertified sources (BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85) were not read. §§0.5a, 6.5, 6.6, 9.13 and the BCR example of §9.12 rest on their locators; §0.14 rests on EL73 without one (S02).
- That τ ≠ 0 on the Enriques example of the §5.5 Checks: the hypotheses and the value c_Ψ = h₁ were recomputed; the conclusion follows from the roadmap's own criterion of §5.5, which was followed step by step and not derived a second way.
- §9.14 (the sign argument on the special fibre) and §§8.5–8.6 (stalks of 𝒢, the monodromy correction) were read for consistency with their statements, not recomputed.
- VOI06 Propositions 8 and 9 and BEN18 Propositions 1.1, 1.3, 2.1 were not reopened in this pass; round 1 read their statements.
- HeightsRationalPointsAndObstructions, ShimuraData, WeilConjectures, LefschetzPencilsAndVanishingCycles, PurityForFlatCohomology and EnriquesSurfaces were not reopened in this pass; round 1 resolved their sections and `roadmaps resolve` reports nothing missing at this head.
- Elaboration was not rerun; the signature transcript supplied with the job was used.

## Source issues

- **Error** in B19 at Theorem 0.6 (ii), printed page 65: the source says the criterion includes one nonempty half with an odd number of components of odd Euler characteristic; it should be dropped, since χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2 makes that number even; affects nothing.
- **Gap** in B19 at proof of Theorem 0.12, printed page 95: the source says K is the union of the finite extensions of a finitely generated subfield carrying the class; it should first adjoin a transcendence basis of K over ℝ to that subfield; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, lower bound, printed page 96: the source says y₁, y₂ are local parameters once neither z_j is proportional to w² + 1 modulo m²; it should be that the two differentials 2(1 + i)dz_j + d(w² + 1) are independent, which that condition does not give; affects the proof.
- **Misprint** in CT05 at proof of Théorème 3.14, property (iii), printed page 400: the source says the fibre birational to X lies over 0; it should be over 1, where the family t^l s₁^l + (1 − t)^l s₀ is an l-th power, as property (c) on page 402 records; affects the proof.
- **Gap** in EKM at proof of Theorem 97.2, printed page 385: the source says that after the cases n = 0 and d = 1 a normic form exists; it should also treat an algebraically closed field regarded as C_n with n > 0, where none exists and the first case applies; affects the proof.

## For the human reviewers

- **Scope.** Layers 3, 5, 4, 8, 9 have the scope of B19 §§3, 4, 5, 7, 8 (`packages/RealSurfacePeriodIndex/README.md:1066–2446`); 132 of 264 locators are to B19. Round 1 pass b raised this as P2; the repair renamed the layers and kept the arrangement.
- **Scope.** Source correction E3 (`README.md:2778`) states that B19's published Proposition 4.4 fails for some Ψ, on a counterexample built in the README (§5.5 Checks); no published correction is cited and none was found in the cached texts.
- **Ownership.** QuadraticFormInvariantsPartII at its open head (its README lines 118, 1540–1640, 2029) states C_i fields and Tsen–Lang as its own targets and says this roadmap takes them from it; `README.md:24` and `:2771` say the reverse.
- **Licence.** BEC05 is read from a preprint-server copy (`README.md:2814`); the page numbers cited in §§0.6, 0.8, 0.13–0.15 are the preprint's, and the published version was not collated.
- **Not tested.** EL73, the only source for u(F) ≤ 6 in §0.14, is paywalled and is cited without a theorem number (`sources.toml:216`); see S02.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a2b9a07cb202748f91935f93ee13c124999d2d9b", "job": "RT-RealSurfacePeriodIndex~2a", "model": "fable", "worker": "chris-x82"} -->
