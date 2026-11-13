<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6857076151 -->
Red team round 1 pass b (claude) of db295a0

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `A_st` is used in §3.3 and defined nowhere

   - **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:460`: "the exact
     sequence `0 → O(Y_S)/O_C → Symb_p(Y) → (A_st ⊗̂ H¹_dR(Ỹ_S))^{N=0, φ=p} → 0` does not depend on
     `r ↦ p^r`".
   - **Claim:** the target is stated with a ring `A_st` and an operator `N` on `A_st ⊗̂ H¹_dR(Ỹ_S)`.
   - **Witness:** `grep -n "A_st" README.md` returns line 460 only; the Conventions define `A_cris`,
     `B_cris^+`, `B_st^+` and no `A_st`. The source defines it at CDN-CURVES lines 3749–3758.
   - **Repair:** append to that sentence of §3.3:
     "Here `A_st = A_cris[Log p̃]^PD` is the divided-power polynomial algebra over `A_cris` in one
     variable, with `φ(Log p̃) = p·Log p̃` and the `A_cris`-derivation `N` with `N(Log p̃) = −1` (the
     convention of `u` in the Conventions), `Nφ = pφN`, `0 → A_cris → A_st --N--> A_st → 0` exact, and
     `N = N ⊗ 1 + 1 ⊗ N` on `A_st ⊗̂_{A_cris} H¹_dR(Ỹ_S)` (CDN-CURVES §6.4.4, lines 3749–3758, which
     normalizes `N(Log p̃) = +1`; the two `N = 0, φ = p` subspaces correspond under the
     `φ`-equivariant automorphism `Log p̃ ↦ −Log p̃`, and both map to `H¹_dR(Ỹ_S)^{φ=p}` by
     `Log p̃ ↦ 0`)."
     Tested: for `N² = 0` on `H¹`, the kernel is `{x + Log p̃ ⊗ Nx}` with `N(Log p̃) = −1` and
     `{x − Log p̃ ⊗ Nx}` with `+1` (CDN-CURVES line 3759); the automorphism exchanges them and
     `φ(Log p̃ ⊗ Nx) = p·Log p̃ ⊗ p^{−1}Nφx`, so `φ = p` is the same condition `φx = px` on both.

2. **F02** (P3) sections the build uses have no entry under "It imports" or "Exact supplier contracts"

   - **Location:** `README.md:622` and `README.md:638` (`*Needs:*` of §§4.8–4.9:
     "FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.26", "§§R07.2.20 and R07.2.28");
     also lines 352, 407, 456, 591, 638, 772, 858.
   - **Claim:** every supplier section a proof plan uses has its contract stated under
     `## Exact supplier contracts` (README lines 60–143) and its roadmap under "It imports"
     (lines 18–36).
   - **Witness:** in README lines 5–145 these strings occur 0 times: `FiniteFlatGroups`,
     `A4.CR.7.2`, `RD.4.34`, `RD.4.38`, `SR.0d`, `Layer 8`, `§9.1`, `ClassicalAdicEtaleCohomology §1.4`,
     `AdicSpacesPartIII F0`; in lines 146–990 they occur 5, 3, 3, 4, 2, 2, 2, 6 and 2 times.
   - **Repair:** all eleven sections exist at the suppliers' current heads with the content used
     (headings read). Add under "It imports":
     "- **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §§R07.2.20, R07.2.25–R07.2.26 and R07.2.28:
     the covariant Dieudonné module, the universal cover of a `p`-divisible group, its rigidity along
     nilpotent thickenings and the period isomorphism over `f`-semiperfect rings, compared with
     `ι_st` in §§4.8–4.9."
     and under `## Exact supplier contracts`:
     "### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory
     - §R07.2.20 (*The covariant Dieudonné module and the comparison of conventions*):
       `M_cov(G) = M(G^D)` with its transposed Frobenius. §R07.2.25 (*The Tate module sheaf and the
       universal cover of a `p`-divisible group*): `G̃(S) = lim_{×p} G(S)` on `Nilp_R`, with
       `0 → T_pG → G̃ → G → 0`. §R07.2.26 (*Rigidity … along nilpotent thickenings*):
       `G̃(S) = G̃(S/p)` for `S ∈ Nilp_A`. §R07.2.28 (*Scholze–Weinstein: Dieudonné theory over
       `f`-semiperfect rings*): `G̃(R)` is the `F = p` part of the rational covariant module over
       `B_cris^+(R)`."
     and one bullet each in the existing subsections:
     "- AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (*Crystalline Dieudonné theory*): the
     contravariant crystalline Dieudonné module and Grothendieck–Messing theory (§4.9)."
     "- PadicDifferentialEquationsAndRigidCohomology §RD.4.34 (*Rigid cohomology of affine space*,
     §6.3) and §RD.4.38 (*The rational rigid–crystalline comparison for smooth proper varieties*,
     §§3.2 and 4.6)."
     "- ClassicalAdicEtaleCohomology §1.4 (*Finite local systems, constructibility and twists*: `μ_n`
     and the Kummer sequence, §§2.4, 4.5, 6.2), Layer 8 (*Proper supports and the all-torsion
     calculus*) and §9.1 (*Overconvergent proper supports*), used in §6.10."
     "- SmoothRepresentationsOfLocalGroups SR.0d (the derived smooth category, §6.10)."
     "- AdicSpacesPartIII Layer F0 (*formal geometry*: the formal schemes of §2.1)."

3. **F03** (P3) three pinned Mathlib line numbers are off by one

   - **Location:** `README.md:67` ("`Matrix.GeneralLinearGroup.toLin` (… `Defs.lean`, line 120)",
     "`LocallyConstant.comapₗ` (… `Algebra.lean`, line 326)") and `README.md:72`
     ("`WittVector.Isocrystal` (… `Isocrystal.lean`, line 113)").
   - **Claim:** the declarations are at those lines of the pinned Mathlib.
   - **Witness:** at the pin, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:121` is
     `def toLin`, `Mathlib/Topology/LocallyConstant/Algebra.lean:327` is `def comapₗ`,
     `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` is `class Isocrystal`; lines 120, 326 and 113
     are a docstring line, `@[simps!]` and the field `frob`.
   - **Repair:** write "line 121", "line 327" and "line 112". (The other thirteen pinned locators of
     lines 64–77 point at their declarations.)

4. **F04** (P3) the Steinberg supplier target is in SR.3.4, and is stated on `B∖G`

   - **Location:** `README.md:140`: "SR.3 (*steinberg*: `St_G` as the quotient of the smooth
     functions on the flag variety by those pulled back from the partial flag varieties)"; also lines
     34, 200, 221.
   - **Claim:** `Sp_∅(ℂ)` is the representation `St_G` of SmoothRepresentationsOfLocalGroups SR.3.
   - **Witness:** at the supplier's head the target *steinberg* is in §SR.3.4 (*The split Iwahori
     block and nonsplit components*) and reads `St_G := C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G)`; it also proves
     `St_G` irreducible, which is §0.4(a) at `J = ∅`, `A = ℂ`.
   - **Repair:** cite "SR.3.4 (*steinberg*)" in the four places, and replace the first sentence of
     the Check at line 200 by: "Over `ℂ`, `Sp_∅(ℂ)` is the representation `St_G` of
     SmoothRepresentationsOfLocalGroups SR.3.4 (*steinberg*), which is formed on `B∖G`, through
     `f ↦ (g ↦ f(g⁻¹))` from functions on `B∖G` to functions on `G/B` (as in the first Check of
     §6.10); its irreducibility there is the case `J = ∅`, `A = ℂ` of §0.4(a)."
     Tested on `GL₂`: the map sends right translation `(g·f)(x) = f(xg)` on `B∖G` to
     `f(g⁻¹x)` on `G/B`, and constants to constants, so the quotients by the constants correspond.

5. **F05** (P3) `C ⊗ Lie(J)` in §4.8 has no base for the tensor product

   - **Location:** `README.md:607`: "Prove the exact sequence `0 → V_p(J) → Ĵ → C ⊗ Lie(J) → 0`
     given by `log_J`", for "a smooth proper connected curve over `C`".
   - **Claim:** the cokernel of `V_p(J) → Ĵ` is `C ⊗ Lie(J)`.
   - **Witness:** CDN-CURVES lines 4016–4027 take `X` over a complete subfield `K ⊂ C` and write
     `C ⊗_K Lie(J)`; for `J` over `C`, `Lie(J)` is already a `C`-space and `C ⊗_{ℚ_p} Lie(J)` is a
     different (larger) space. The Checks at lines 616–618 use the target `C` for `g = 1`.
   - **Repair:** write "`0 → V_p(J) → Ĵ → Lie(J) → 0`, with `Lie(J)` the Lie algebra of the
     `C`-Lie group `J(C)`, equal to `C ⊗_K Lie(J_K)` when `X` comes from a curve over a closed
     subfield `K ⊂ C`", and the same in the Check at line 617 ("would no longer be `Lie(J)`").
     Tested on `g = 1`: `Lie(J) = C`, the value used by the Tate-curve and ordinary Checks; with
     `⊗_{ℚ_p}` the target would be `C ⊗_{ℚ_p} C`, not `C`.

Five findings, all P3 (undefined notation, supplier contracts missing for sections the build uses,
three pinned line numbers, one supplier locator, one tensor product without a base). No statement
was found false, no supplier citation fails to resolve, the dependency check is clean.

## Declarations of Suggested.lean

No `variable` or `include` line occurs in the file, so no declaration can lose a binder; compared
with the elaborated types of the job's `signatures.md` (7 declarations, 0 dropped binders). No Lean
was run in this pass (the brief authorises no Lean command).

| Declaration | Context it carries | Instances computed | Result |
|---|---|---|---|
| `parabolic K d J` (def) | `[Field K]`, `J : Set (Fin d)` | `d = 0`: empty infimum, `GL₁(K)`; `d = 1`, `J = ∅`: stabilizer of `flag 1 = Ke₀`, upper triangular (`[[1,0],[1,1]]e₀ = e₀ + e₁ ∉ Ke₀`); `J = univ`: no condition, `GL₂` | equals `B W_J B` of README §0.3 |
| `parabolic_mono` (proved) | same | `J ⊆ J'` drops conditions | used by `steinbergRelations`; not padding (the data needs the proof) |
| `translation G H A` (def) | `[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CommRing A]` | `S₃`, `f = 1_e`, `x = gh`: `((gh)·f)(x) = f(1) = 1 = (g·(h·f))(x)`; with `f(gx)`: `0` against `1` | left action, as README Check 207 |
| `steinbergRelations K A d J` (def) | `[Field K] [TopologicalSpace K] [IsTopologicalRing K] [CommRing A]` | `J = univ`: empty supremum, `⊥`; `d = 1`, `J = ∅`: constants | `Σ_{i∉J} LC(X_{J∪{i}}, A)` |
| `steinbergRelations_le_comap` (proved) | same | pullback of a translate is the translate of the pullback | used by `generalizedSteinberg`; not padding |
| `generalizedSteinberg K A d J` (def) | same | `J = univ`: `LC(pt, A)/0 = A` trivial; `d = 1`, `J = ∅`: `LC(ℙ¹(K), A)/A` | `Sp_J(A)` of README §0.3 |
| `generalizedSteinberg_isIrreducible` | `[Fact p.Prime] [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] [Field A]`, `CharZero A ∨ CharP A p` | `d = 0`: one-dimensional trivial module, simple; `A = ℚ` (not algebraically closed): simple because `Sp_J(ℚ)^U` is absolutely simple over the Hecke algebra; `A = 𝔽_p`, `p = 2`: GK14 Corollary 4.3 (type `A`, no exceptional factor); `char A = ℓ ≠ p` excluded by the hypothesis (CDN-STEIN Remark 5.2); abstract irreducibility equals smooth irreducibility since every vector of `LC(G/P_J, A)` is smooth | true as typed, at the README's generality (§0.4(a), every `d ≥ 0`) |

Headline theorems (README Summary): the fundamental diagrams (§§3.5, 4.1, 4.2, 4.7), the Kummer
regulator (§2.4), the filtrations and the Weil–Deligne similarity (§§2.5, 3.2, 4.3, 4.6), the
Jacobian period isomorphism (§§4.8–4.9), the semistable Stein diagram (§5.5), the cohomology of
`Ω^d` (§§6.2, 6.4, 6.5, 6.9, 6.10), the tower theorems (§§7.1–7.8). Each needs rigid curves, étale
or pro-étale cohomology of adic spaces, Hyodo–Kato cohomology or the tower spaces, none of which
is at the pins; the module docstring names each group and its missing carrier. The one statable
deep statement, §0.4(a), is stated. No padding: no `example`, no `#check`, no boundary-case
theorem; the two proved theorems are proof terms inside the definitions.

## The adversarial pass

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions, `Nφ = pφN` on `u` | `u` | `N(pu) = −p`; `pφ(−1) = −p` | holds |
| Conventions, Weil–Deligne law | `Φ = diag(1, q)`, `Ne₁ = e₀` | `NΦe₁ = qe₀ = qΦNe₁`; `ΦNΦ⁻¹e₁ = q⁻¹e₀` | `p^{−deg}` correct; source exponent `+deg` refuted (Source issues) |
| §0.1 exact sequence, `S` finite | annulus graph (1 vertex, 2 legs) | `0 → 0 → L → L² → L → 0 → 0` | exact |
| §0.1 dual versus `ℤ`-dual | loop, `L = 𝔽₂²` | `|ker ∂^*| = 4`, `|Hom_ℤ| = 16` | Check true |
| §0.2 `N_µ` isomorphism needs compact | segment with 2 legs at each end | `H¹ = coker(L² → L) = 0`, `H¹_c^*` of rank `5 − 2 = 3` | Check true |
| §0.3 congruence invariants | `d = 1`, `U = 1 + ϖM₂(O_K)`, any `A` | `LC^U = A^{q+1}`; the obstruction `c: U → A` vanishes on unipotents and the torus, which generate `U`; rank `q` | holds for every `A`, also `A = 𝔽_p` |
| §0.4(a) route over a char-0 field | `A = ℚ` | Burnside over `ℂ` descends: `H_ℚ ⊗ ℂ → End ⊗ ℂ` onto implies `H_ℚ → End_ℚ` onto | sound |
| §0.4(b) lattice uniqueness | `O` of equal or mixed characteristic, residue char `p` | GK14 Corollary 4.5 assumes `char(k_K) = char(k_F)` only | generality supported |
| §0.5 presentation, all `r` | `r = 0`; `d = 1`, `r = 1`; `r = 2 > d = 1` | constants `= ℤ = Sp_0`; `g(H₁) − g(H₀)`, `Sp_1`; `0 = 0` | holds beyond the source's `1 ≤ r ≤ d` |
| §0.5 degenerate distributions, surjection | any abelian `A` | `LC/LC_c` embeds in a group of locally constant functions, hence free; `Ext¹ = 0` | surjective |
| §1.3 period spaces | `C̆(−1)`; `C̆`; slopes `(0,1)`; slope `1/2` | `ℚ_p`; `(B_cris^+)^{φ=p}`; Dimension `(1,2)`; `H⁰(O(−1/2)) = 0` so `θ` injective | Checks true |
| §1.4 `D_raw ∘ Ψ_ϖ = e·Ψ_ϖ ∘ D_p` | `f(u) ⊗ m` | both `f(eu − ℓ_a) ⊗ N_raw m − e f′(eu − ℓ_a) ⊗ m` | holds |
| §1.4 `ι_ϖ(Ψ_ϖ(u))` | `a = ϖ^e/p` | `e·log([ϖ^♭]/ϖ) − ℓ_a = log([p^♭]/p) − log_K(a)` | holds |
| §1.4 scaling Check | `e = 2`, `N_raw e₁ = 2e₀` | `D_p(e₁ + ue₀) = 0`, `D_raw(e₁ + 2ue₀) = 0`, `D_p(e₁ + 4ue₀) = −3e₀`, `D_p(e₁ + 2ue₀) = −e₀` | Check true |
| §1.4 independence of `ϖ` | `p = 3`, `ϖ = 12`, `a = 4` | `ι^{(p)}(e₁) = ι^{12}(e₁ − log 4·e₀) = ι^3(e₁)`; opposite sign `ι^3(e₁ + 2 log 4·e₀)` | sign pinned |
| §2.2 patterns | disc with two Gauss points; annulus | `H¹ = 0`, `H¹_c^* = 0`; `H¹ = 0`, `H¹_c^*` of rank 1 | Checks true |
| §2.3 negative control | `ω = Σ p^n T^{p^n−1} dT` | primitive needs `a_{p^n} = 1`, not null; partial sums exact | `[ω] ≠ 0`, `[ω]^sep = 0` |
| §2.4 third relation | trivial family | `(a_{i,n+1}/a_{j,n+1})^ℓ = (a_{i,n}/a_{j,n})(a_{i,n+1}^ℓ/a_{i,n})(a_{j,n}/a_{j,n+1}^ℓ)` | identity |
| §2.4(c) graph term | Tate curve, 3 vertices | `coker(ℤ_ℓ(1)⁶ → ℤ_ℓ(1)⁶) = ℤ_ℓ(1)` | Check true |
| §3.3 cone and shift | `Cone(f)[−1]` | `d(a, b) = (da, −f(a) − db)`, degree-0 term `F¹C⁰` | as stated |
| §3.3 sign Check | `f = 1 + pT`, `φ(T) = T^p` | `dy = pT^{p−1}dT/(1 + pT^p) − p·dT/(1 + pT) = (φ/p)x − x` | cocycle; other sign gives `2p ≠ 0` at `T = 0` |
| §3.5 first row, `Y` proper | `O(Y)^{**} = 1 + m_C` | `ℚ_p ⊗̂ (1 + m_C) = 0` (divisible) | reduces to §4.7 |
| §4.4/§4.5 Frobenius conventions | Tate module `diag(q⁻¹, 1)`, `Ne₁ = µe₀`; `g(u) = χ⁻¹(u + c)` | `NΦe₁ = µe₀ = qΦNe₁`; `N g(u^k) = χ⁻¹ g N(u^k)`; cocycle `c(gh) = c(g) + χ(g)c(h)` | consistent |
| §4.6 twist Check | `y² + y = x³` over `𝔽₂` | 3 points, `a = 0`, `X² + 2`, twisted `X² + 1/2` | Check true |
| §4.7 Dimension | slopes `r_i`, `Σ r_i = g` | `Σ(1 − r_i, 1) = (g, 2g)`; `(g, 2g) − (0, 2g) = (g, 0)` | holds; `g = 0` all zero |
| §4.8 limit condition | `k_C ≠ 𝔽̄_p`, non-torsion reduction | `p^m x` does not tend to `0` | the condition `x_n → 0` is not vacuous |
| §4.8 Check | `y² = x³ − x`, `p = 5` | discriminant `64`, a 5-adic unit | good reduction |
| §4.9 normalisations | `μ_{p^∞}` | `D_contra` slope `1`, `D_raw = D_contra^∨(−1)` slope `0`, `D_norm` slope `−1`; `(B_cris^+ ⊗ D_raw)^{F=p} = (B_cris^+)^{φ=p}` | agrees with FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.28 (`F = p` part) |
| §5.1 chain model of `𝔸¹` | node `C_m ∩ C_{m+1}` | `X₁X₂ = ϖ^{m+1}T·ϖ^{−m}T⁻¹ = ϖ` | Check true |
| §5.2/§5.4 transport sign | Kummer representation of `ϖ` | `x₁ = v₁ − t⁻¹uv₀` invariant, `Nx₁ = x₀`; under `ϖ ↦ ϖw` gains `+log_K(w)x₀` | matches `ι^{ϖw} = ι^ϖ ∘ exp(log_K(w)N_raw)` |
| §5.4 point Check | `𝔛 = Spf O_K`, `r = 1` | `ker θ = ℚ_p t`, `coker = 0` | `H⁰ = ℚ_p(1)`, `H¹ = 0` |
| §5.5 kernel at `r = 0` | `X^{−1}_st` | `(B_cris^+)^{φ=p⁻¹} = 0` | injective |
| §6.3 `N = 0` | `φ^f = q^s` | `q^s N = q^{s+1} N` | `N = 0` |
| §6.5 | `r = d + 1` | `Ω^d/ker d = 0`, `Sp_{d+1} = 0` | both rows zero |
| §6.7 sheaf sequence | `x = μ^i y` | `ξ^i φ⁻¹(μ)^i = μ^i`, so `(1 − ξ^iφ⁻¹)(μ^i y) = μ^i(y − φ⁻¹y)` | kernel contains `μ^i Ẑ_p` |
| §6.7 non-semistable Check | `y² = x³ + p`, `p ≥ 5` | singular point forces `x = y = 0`, `p = 0` | smooth generic fibre, cuspidal special fibre |
| §6.8 three-point relation | `0, 1, 2` | residues `(1,−1,0) + (0,1,−1) − (1,0,−1) = 0` | Check true |
| §6.10 indexing | `d = 1`; `d = 2`, `r = 1` | `H¹_c = π_∅ = St`, `H²_c = π_Δ(−1)`; `H³_c = π_{{1}}(−1)`, `Sp_1 = Sp_{{1}}` | Dat's `d − 1` is `d`; `(d+1)!` and order `≤ d + 1` match DAT06 Lemme 4.2.1 |
| §7 preamble dictionary | `q = 2` | `|O_D^×/(1 + ϖO_D)| = 3·4 = 12`, `|Ǧ_0/Ǧ_1| = 3` | Check true |
| §7 preamble negative control | `φe₁ = e₂`, `φe₂ = pe₁` | `φ² = p`, `X² − p` irreducible over `ℚ_p`, splits over `ℚ_p(√p)` | not supercuspidal |
| §7.1 centre | `(3I₂, 3)` over `ℚ_3`; `(ϖ, 1, Φ)`, `h = 1` | `9·9⁻¹ = 1`; `ϖ·rec_F(Φ)` a unit | consistent with STR08 line 382 and the trivial diagonal of the tower supplier's §12.7 |
| §7.1 multiplicity spaces | `z` central, `Z[ρ]` | `(z, 1) = (1, z⁻¹)`, acts by `ω_ρ(z)⁻¹` | Check true |
| §7.5 slope-`3/2` control | `φ²e = p³e` | `φ²(a) = p⁻¹a`, `(B_cris^+)^{φ²=p⁻¹} = 0` | Check true |
| §7.6 profinite systems | `{ℤ/p^n}`, constant `𝔽_p^{(ℕ)}` | limit `ℤ_p`; a pro-isomorphism would make `𝔽_p^{(ℕ)}` profinite | Check true |

## Dependency check

```
depcheck: 223 roadmaps, 1995 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. None of the nine supplier READMEs searched for a back-citation
(CohomologyComparisons, CstConjectureForDaggerVarieties, LocallyAnalyticDistributions,
EndoscopicTransferAndUnitaryTraceComparison, PadicHodgeTheory, VectorBundlesAndIsocrystals,
SmoothRepresentationsOfLocalGroups, ModpRepresentationsOfGL2OverLocalFields,
PadicLocalLanglandsForGL2Qp) names this roadmap.

## Verified sound

- **Read in full:** README (1013 lines, 51 numbered sections) and Suggested.lean (128 lines, 7
  declarations).
- **Sibling citations:** about 105 distinct section or layer citations of 28 supplier roadmaps resolved by
  heading at the suppliers' current text (main, open heads through `roadmaps show`, and the board
  package for ModpRepresentationsOfGL2OverLocalFields); all exist. The two leads of
  `citations.md` are not defects: ModpRepresentationsOfGL2OverLocalFields is a board package
  earlier in the merge order, and PadicLocalLanglandsForGL2QpPartII §4.1 is a consumer (its §§4.1
  and 4.9 exist with the content the README states). `Semistable.aOmega` is a target name of
  AInfCohomology §AI.6.2, not a pinned declaration, and the README uses it as such.
- **Supplier content read, not only headings (22):** CohomologyComparisons §§4.5, 4.11, 4.12;
  PadicHodgeTheory §0.6 (`N = −N_π/e`); PadicPeriodRings §§4.1, 4.3; FiniteFlatGroupsAndIntegral
  PadicHodgeTheory §§R07.2.20, R07.2.25, R07.2.26, R07.2.28; EndoscopicTransferAndUnitaryTrace
  Comparison §§12.4, 12.7, 12.14, 12.19; CstConjectureForDaggerVarieties §1.5;
  LocallyAnalyticDistributions §0.CR.6.6; ModpRepresentationsOfGL2OverLocalFields §§0.7, 2.4, 2.6;
  SmoothRepresentationsOfLocalGroups *steinberg* and *segment-representations*;
  ClassicalAdicEtaleCohomology §9.6; CohomologyComparisonsPartII §4.4. Each states what the README attributes to it, with R04 the
  only correction.
- **Gaps:** the four slugs of `design/plan.json` are the four contracts of the README, each with a
  named supplier and section; each asks for something its supplier does not state (PadicPeriodRings
  builds `C_K` only and has no plus-ring sequences; PadicHodgeTheory §0.6 is for finite `K/ℚ_p`;
  §RD.7.7 is for Frobenius only; CohomologyComparisonsPartII §4.4 is for schemes étale locally CN semistable charts).
- **Ownership:** searched all roadmaps (open heads and main) for generalized Steinberg
  representations, Schneider–Stuhler, Drinfeld half-spaces, components of the Lubin–Tate tower,
  the Kummer regulator and adoc geometry: no second owner. The only overlap is `St_G` over `ℂ`
  (R04). No declaration of Suggested.lean shares a fully qualified name with another roadmap.
- **Source locators verified against the texts (52):** CDN-CURVES 22 (lines 92, 124, 130, 136,
  160–164, 170, Théorèmes 0.1, 0.9, 0.15, 0.17, Remarques 0.10(i), 0.16, 0.18, lines 436–440,
  §6.4.4, Théorèmes 6.24, 6.30, 6.32, Corollaire 6.25, Proposition 6.29, Remarque 6.33,
  §7.1.5, Remarque 8.6, §8.2.5, Théorème 8.12 with its proof); CDN-STEIN 13 (Remarks 1.4, 1.6,
  §§5.2.1–5.2.3, Propositions 5.1, 5.6, Corollaries 5.3, 5.4, 5.9, §5.4.1, §5.5); CDN-DUKE 6
  (§2.4, Theorem 2.9, Lemmas 2.11, 2.12, line 413, Corollary 2.13); DAT06 4 (Définition 2.1.6,
  Théorème 3.1.1, Lemme 4.2.1, Proposition 4.2.2); GK14 3 (Corollaries 4.3, 4.4, 4.5); CDN20 2
  (lines 142, 194–198); STR08 1 (Theorem 4.4); CN-I 1 (line 448).
- **Pinned library locators (16):** 12 exact, one (`ElladicCohomology.lean`, line 75) on the docstring line of its declaration, 3 off by one (R03). `Module.Basis.flag_zero`,
  `flag_last`, `flag_mono`, `mem_flag_iff_repr_eq_zero` exist; `Representation.IsIrreducible` is
  `IsSimpleOrder (Subrepresentation ρ)`, with no smoothness condition, as the README says. Neither
  library has a parabolic subgroup of `GL_n` or a Steinberg representation of a `p`-adic group.
- **Checks:** every section that makes a definition has at least three; about 70 recomputed (the
  table above lists the ones with numbers), none found false or vacuous.
- **Policy:** the pull request changes only this package folder; no pull-request number, no
  process narrative, `theorem` only, single `import Mathlib`, no `set_option`, no sorry'd data.
- **Arrangement:** CDN-CURVES has chapters 1 (graphs), 2 (curves), 3 (construction, adoc), 4
  (discs, legs, ghost circles), 5 (shorts), 6 (quasi-compact curves), 7 (overconvergent
  affinoids), 8 (curves without boundary). The README's Layer 2 draws on chapters 3, 4.1, 5.1 and
  6.2 together, Layer 3 on 4.2, 5.2 and 6.3–6.4, Layer 4 on 7 and 8 with the Jacobian (7.1.5, 7.2)
  placed after the Weil–Deligne sections of chapter 8, and Layers 0, 1, 5–7 on other sources: no
  one-to-one run. The order inside Layer 3 is forced by its `*Needs:*` lines (§3.2 needs §3.1,
  §3.3 needs §3.2, §3.5 needs §§3.2–3.4), and §4.4 → §4.5 → §4.6 likewise.

Source independence: 12 passages compared with 6 sources (CDN-CURVES, CDN-STEIN, CDN-DUKE, GK14,
STR08, DAT06), none shared beyond formulas and what the mathematics forces; largest share
CDN-CURVES, about 117 of 275 locators; contents compared with CDN-CURVES: independent.

## Not verifiable

- SS91 §§3–4, IS01, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4, KM74 Theorem 2 and BW00 Chapter X,
  Theorem 4.11: uncertified, cited by locator; the texts were not read.
- GK05, GK07, GK05-RT, THO24, CN-II, CGN23 and CDN23: in the cache but not opened in this pass;
  the locators into them (§§5.2, 6.1, 6.3, 6.6, 6.10 Check, 7.2, 7.6–7.8) were not checked. CDN20
  was checked at two places only; the claim that its Théorème 0.4 is printed without the slope
  hypothesis was not checked.
- The agreement of Dat's numbering of parabolics with that of CDN-STEIN under Poincaré duality
  (first Check of §6.10) was computed for `d = 1` and `d = 2`, `r = 1` only.
- Elaboration of Suggested.lean: not re-run; the types are those of the job's `signatures.md`.
- §4.6 for overconvergent affinoids and the logarithm comparison of §4.9 have routes written in
  the README and no proof in a source; the routes were read and no gap was found, but they were not
  checked line by line against a written proof.

## Source issues

- **Misprint** in CDN-CURVES at §8.2.5, printed p. 107 (line 4432): the source says the product of
  the Weil–Deligne group scales the second additive parameter by `p` to the power `+deg g₁`; it
  should be `−deg g₁`, as its own relation `Ng = p^{deg g}gN` five lines later requires; affects
  nothing.
- **Gap** in CDN-STEIN at §5.2.2, printed p. 38 (line 1936): the source says the dual of `Sp_J(Λ)`
  is the inverse limit of the duals of the full function spaces on the finite quotients; it should
  be the annihilator of the relation submodule in that limit (they agree only for `J = Δ`); affects
  nothing.

## For the human reviewers

- **Scope.** §4.6 for overconvergent affinoids rests on CDN-CURVES Remarque 0.16(ii) (lines
  412–415), stated there without proof; the README supplies its own route (README line 582).
- **Scope.** The good-reduction logarithm comparison of §4.9 is a deduction CDN-CURVES Remarque
  7.10(i) only suggests; the route is the README's own (README line 628).
- **Licence.** Six sources are uncertified and cited by locator alone: SS91, IS01, DS01, NAK84,
  KM74, BW00 (`sources.toml`).
- **Not tested.** GK05, GK07, GK05-RT, THO24, CN-II, CGN23 and CDN23 were not opened: wording and
  locators into them were not compared in this pass.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "db295a02958abb4c474d138e940671027f647b8c", "job": "RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1b", "model": "fable", "worker": "chris-x25"} -->
