# GATE-PeriodsAndSpecialValues~5: answers to human review

Reviewed head `5e9d167`; repairs committed as `723667b` on the pull-request branch (not pushed). Files changed: `TauCetiRoadmap/PeriodsAndSpecialValues/README.md` only; `Suggested.lean` is unchanged.

## H01 (roed-math) — applied differently

Yes, this roadmap now consumes BorelRegulators §§5.3–5.4, and the consumption is made actual rather than promised: the supplier contract heading and text (README line 142–144) now import §5.3 (integral image lattice Λ_n(F), its positive covolume R_Bo) and §5.4 (R_Bo ∈ ℚˣ·ζ_F*(1−n), R_Bo ∈ ℚ_>0·√Δ_F·π^(d_n−Nn)·ζ_F(n), and the signed rational-basis determinant in Tate-divided coordinates), and a new target PS.3.3a "Borel's theorem as a proved case" proves the Beilinson leading-term assertion of PS.3.3 (predicted order 0, L* = ζ_F(j), regulator exactness from PS.3.2a, and LeadingTermRational) for M = h⁰(Spec F)(j), every number field F and every j ≥ 2. The old PS.3.2a sentence "Rationality and integrality of the leading term for these positive twists j≥2 are the predicates of PS.3.3 and PS.5.2" now reads "Rationality … is proved in PS.3.3a from Borel's theorem; integrality is the predicate of PS.5.2". The step this roadmap owns, beyond §5.4 and r_Bo = −2·r_Be (§6.2), is the comparison of the two rational structures on det(coker α): the de Rham structure d(t_M)·d(B⁺)⁻¹ of Ξ and the Tate-divided Betti structure of V_j(F) differ by a factor in ℚˣ·√Δ_F·π^(d_j−Nj) (computed place by place: an integral basis of F contributes √Δ_F/2^(r₂), each killed real axis (2π)^j, each surviving axis (2π)^(j−1), total exponent Nj − d_j), which cancels exactly the factor √Δ_F·π^(d_j−Nj) in §5.4, leaving det r_Be ∈ ℚˣ·ζ_F(j) and hence θ_∞⁻¹(ζ_F(j)⁻¹) ∈ Ξ_ℚ(M). BorelRegulators' downstream note (§§2.1–2.3, 5.3–5.4, 6.1–6.3) is therefore right as it stands, except that this roadmap also uses its §6.0a. The scope line (README line 29), the predicates line (line 45), the Layer PS.3 dependencies and the Burgos reference (Theorem 9.12, printed p. 80) were updated to match. Ownership: a search of main and all open roadmap heads (roadmaps grep for Beilinson's conjecture over number fields and for Borel's theorem) found no roadmap stating the fundamental-line form of Borel's theorem; BorelRegulators owns the regulator theorems and Polylogarithms consumes §§5.3–5.4 for polylogarithm periods, so PS.3.3a is the owner of the translation into Ξ and imports everything else.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| L_fin(h⁰(Spec F)(j), s) = ζ_F(s+j), ramified primes included | F = ℚ(i), p = 2 (ramified, f = 1); F = ℚ(i), p = 3 (inert, f = 2); p = 5 (split) | inertia invariants of Ind ℚ_ℓ(j) at p have basis I_p\G/H of size f_v, Frobenius cyclic of length f_v times p^(−j): P_v(T) = 1 − 2^(−j)T, 1 − 9^(−j)T², (1 − 5^(−j)T)²; product equals the ζ_{ℚ(i)} factors (ζ·L(χ_{−4}) has 2-factor (1 − 2^(−s))⁻¹) | holds | none |
| predicted order 0 and L* = ζ_F(j) > 0 | j = 2, 3; j = 1 as negative control | H_f^i(M^∨(1)) = K_(2−2j), K_(1−2j) of F = 0 for j ≥ 2; ζ_F(j) Euler product converges for j ≥ 2; at j = 1 pole at s = 0 and H_f¹ = O_F^× ⊗ ℚ | holds for j ≥ 2; j = 1 excluded | j = 1 Check added |
| structure ratio e_dR ∈ ℚˣ·√Δ_F·π^(d_j−Nj)·e_B | ℚ, j = 2 (d = 0): ratio (2πi)^(−2) ∈ ℚˣπ^(−2); ℚ, j = 3 (d = 1): the surviving lift has coordinate (2π)^(j−1) = 4π², so e_dR = e_B/(±4π²) ∈ ℚˣ·π^(1−3)·e_B; ℚ(i), j = 2: e_dR = e_B/(−8π³) vs √4·π^(1−4) = 2π^(−3); ℚ(√5), j = 2: θ_∞(ξ) = −√5/(16π⁴) vs √5·π^(−4) | exponent Nj − d_j matches in all four | none |
| det r_Be against the de Rham structure ∈ ℚˣ·ζ_F(j) | ℚ, j = 3: t ∈ ℚˣζ(3)/π², r_Bo(k) = −4π²t ∈ ℚˣζ(3), r_Be = −r_Bo/2; ℚ(i), j = 2: Betti determinant ∈ ℚˣ·2ζ_F(2)/π³ (BorelRegulators §5.4 Check), divided by ratio π^(−3): ℚˣζ_F(2) | holds | none |
| functional-equation exponent in §5.4: ζ_F*(1−n) ∈ ℚˣ√Δ_F π^(d_n−Nn) ζ_F(n) (relied on) | general r₁, r₂, n even and odd from Λ_F(s) = Λ_F(1−s); ℚ, n = 2: ζ*(−1) = −1/12 vs ζ(2)/π² = 1/6; ℚ, n = 3: ζ′(−2) = −ζ(3)/(4π²) vs ζ(3)/π² | gamma-pole count d_n, π-exponent −Nn + d_n in both parities, Δ-exponent n − 1/2 | holds | none |
| θ_∞ convention (ordered determinants, PS.3.2) makes θ_∞⁻¹((L*)⁻¹) ∈ Ξ the right membership | ℚ, j = 2 | θ_∞(((2πi)²)⁻¹ ⊗ 1) = (2πi)⁻² and ζ(2)⁻¹ = −24·(2πi)⁻²; inverse convention gives ratio −3/(2π⁴), irrational | holds | witness Check added |
| wrong model: Betti structure instead of de Rham | ℚ, j = 3 | would need ζ(3)/π² ∈ ℚˣζ(3), i.e. π² rational | excluded | negative-control Check added |
| wrong model: embedding coordinates as rational structure of t_M (drops √Δ_F) | ℚ(√5), j = 2 | ratio 75√5/2 ∉ ℚ | excluded | negative-control Check added |
| rational factor unspecified; integrality separate | ℚ, j = 2 | factor −24; ℤξ and 2ℤξ same ℚ-line | holds | Check added |
| supplier contract §5.3: R_Bo = 1 when d_n = 0; §5.4 rank-zero case | totally real F, even n (ℚ, n = 2; ℚ(√5), n = 2) | empty determinant 1; √Δ ζ_F(2)/π⁴ = 1/6, 2/75 | agrees with BorelRegulators §§5.1, 5.3, 5.4 Checks | none |

Degenerate cases: F = ℚ (N = 1, r₂ = 0), imaginary quadratic (r₁ = 0), real quadratic (r₂ = 0), d_j = 0 and d_j = 1 and d_j = 2 (real quadratic, j = 3: ratio (−2)² = 4, in PS.3.2a) all computed; j = 1 excluded explicitly. No `set_option`, no new Lean declaration, no new supplier later in the merge order (BorelRegulators and MotivesAndAlgebraicCycles precede this roadmap).

## Other repair

The gate's `tex` rule flagged README line 571 (PS.1.6, text unchanged since round 4) for the braced subscript `⊗_{K_μ}` in prose; replaced by `⊗_(K_μ)`, the README's own form for subscripts. No other braced sub- or superscript occurs outside code spans and fenced blocks.

## Suggested.lean

Unchanged. The elaborated signatures of its 38 declarations in `signatures.md` were compared with their README statements again; none loses a section binder, and nothing in this round adds or changes a Lean statement (PS.3.3a is not statable at the pins: no motivic cohomology, fundamental line or Borel regulator exists in Mathlib or Tau Ceti at the pins; the module docstring already records PS.3–PS.6 as not statable).

## Build, direction check and gate

    lake build TauCetiRoadmap.PeriodsAndSpecialValues.Suggested
    Build completed successfully (8976 jobs); 13 declarations use `sorry` (as intended), no errors.

    gate --depcheck … --movable
    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
    (no UPWARD, CYCLE or moved line for PeriodsAndSpecialValues)

    roadmaps resolve README.md
    Cross-roadmap citations found nowhere: none. Lean names found nowhere: none.

    gate PeriodsAndSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Commit: `723667b PeriodsAndSpecialValues: review repairs (Borel's theorem consumed as the proved case of Beilinson rationality)`. Not pushed.
