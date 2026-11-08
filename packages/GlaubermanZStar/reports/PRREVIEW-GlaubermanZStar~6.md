# Review of GlaubermanZStar (pull request #1778 at 581115c)

**Verdict:** accepted

Incremental re-review of the 16 lines changed since 1fd7422, all in `TauCetiRoadmap/GlaubermanZStar/README.md`: step 2 of the case `n = 3` of §2.5 (lines 655–663), the `*Needs:*` line of §2.5 (line 711) and one new Check (lines 734–737). They repair the one finding of the previous report, and the repair introduces no new problem. `Suggested.lean` is byte-identical to the file the previous review read (`git diff 1fd7422 HEAD` on it is empty), nothing outside the folder changed, the gate passes and the dependency check reports no problem. No finding remains, new or carried.

## Previous findings

- R01 — repaired: "Let `q` be the product of the primes dividing `|G|` but not `2 |O(C)|`; the moduli `4 q` and `|O(C)|` are coprime, so the Chinese remainder theorem (`Nat.chineseRemainder`) gives an integer `a` with `a ≡ 1 (mod 4 q)` and `a ≡ −1 (mod |O(C)|)`" (lines 656–658), with the primality to `|G|` argued prime by prime (lines 659–660), `Nat.chineseRemainder` added to the `*Needs:*` line (line 711), and the refuting instance `SL(2, 3)`, `a = 9` versus `a = 13`, recorded as a Check (lines 734–737). This is the first of the two repairs the previous report offered.

## Verified sound

**The changed passage, clause by clause** (README lines 655–663).

- *The moduli are coprime.* `|O(C)|` is odd (`O(C)` is the largest normal subgroup of odd order of `C`, Conventions line 85) and `q` is a product of primes not dividing `|O(C)|`, so `gcd(4 q, |O(C)|) = 1`. At the pin `Nat.chineseRemainder` (`Mathlib/Data/Nat/ModEq.lean` line 472) takes `n.Coprime m` and two residues `a b : ℕ` and returns `{k // k ≡ a [MOD n] ∧ k ≡ b [MOD m]}`; the residue `−1` is `|O(C)| − 1`, a natural number, and the resulting `k` is the integer `a` the README names.
- *`a` is prime to `|G|`.* Every prime `p` dividing `|G|` is `2` (then `a ≡ 1 (mod 4)` is odd), or divides `|O(C)|` (then `a ≡ −1 (mod p)`), or is an odd prime not dividing `|O(C)|`, hence divides `q` (then `a ≡ 1 (mod p)`). The three cases are exhaustive, so `gcd(a, |G|) = 1` and step 1 (line 653–654, `ψᵢ(g^a) = ψᵢ(g)` for `a` prime to `|G|`) applies to `g = u v` and `g = u⁻¹ v`.
- *`u` and `v` commute.* §2.3 gives `C = O(C) ⋊ X` (line 503) and `C = C_G(U)`; for `n = 3`, `X = U` (line 644), and `U` is central in `C_G(U)`, so the semidirect product is direct: `C = O(C) × U`, as line 644 and line 661 say.
- *The powers.* `u` has order `4` and `a ≡ 1 (mod 4)`, so `u^a = u`; `v ∈ O(C)` has order dividing `|O(C)|` and `a ≡ −1 (mod |O(C)|)`, so `v^a = v⁻¹`; with `u v = v u`, `(u v)^a = u^a v^a = u v⁻¹` and `(u⁻¹ v)^a = u⁻¹ v⁻¹ = (u v)⁻¹`. `ψᵢ((u v)⁻¹) = \overline{ψᵢ(u v)} = ψᵢ(u v)` since `ψᵢ` is integer-valued (step 1). So `aᵥ = ψᵢ(u v)` satisfies `aᵥ = a_{v⁻¹}` and `ψᵢ(u⁻¹ v) = aᵥ`, which is what the unchanged remainder of step 2 (lines 664–672) consumes; the two cosets `u O(C)` and `u⁻¹ O(C)` are disjoint (`u⁻¹ = u z`, `z ∉ O(C)`), so `∑_{k ∈ K} ψᵢ(k) = 2 ∑ᵥ aᵥ`, consistent with line 664.
- *The Check* (lines 734–737). `SL(2, 3)`, `U = ⟨i⟩`: `C = U` and `O(C) = 1` (§2.3 Check, lines 525–527); the primes dividing `24` but not `2 · 1` are `{3}`, so `q = 3`; `9 ≡ 1 (mod 4)`, `9 ≡ −1 (mod 1)` trivially, `gcd(9, 24) = 3`; `13 ≡ 1 (mod 12)`, `gcd(13, 24) = 1`. Values correct; the Check records a plausible wrong choice and the instance that refutes it.
- *Style.* The new lines are timeless prose, mathematics in Unicode, a Mathlib name in backticks, no LaTeX, no pull-request number, no process word; the `*Needs:*` line names the new input under Mathlib.

**Gate and build.** The gate at this head, run from the worktree: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`). The movable dependency check: `depcheck: 224 roadmaps, 2101 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. `lake env lean` on `TauCetiRoadmap/GlaubermanZStar/Suggested.lean` from the worktree: four `declaration uses sorry` warnings (lines 38, 48, 59, 82), nothing else.

**Signatures.** `#check @name` for the five declarations on a scratch copy of the file, elaborated once: `glauberman_zStar`, `glauberman_zStar_sylow`, `brauer_suzuki` and `principalBlock_involution_section_constancy` carry `[Finite G]` and match Conventions lines 79–92, §2.5 lines 694–697, §3.1 and §3.2 of the README, as in the previous report; `InPrincipalTwoBlock` elaborates to `{G : Type u} → [Group G] → Ideal (integralClosure ℤ ℂ) → (G → ℂ) → Prop` without `[Finite G]`, which its type does not mention and the constancy theorem carries. Nothing changed.

**Headline theorems and padding.** The README names four (lines 11–13): Z* in isolated form, Z* in Sylow form, Brauer–Suzuki, principal-block section constancy; all four are in `Suggested.lean`, and the docstring says none is missing. The one-tactic probes of the previous report (`simp` made no progress on the three existence statements; `simp [InPrincipalTwoBlock] at *` leaves `χ (s * ↑↑v) = χ s` open) stand, the file being unchanged.

**Citations.** The diff cites no roadmap section; the `*Needs:*` line's other items resolve as the previous report resolved them (LocalFiniteGroupTheory L1, L4 and OddOrderTheorem F2 §2.4 at their open heads, CharacterTheory and InductionRestriction on main `d0bb87a`, ModularCharactersAndBlocks M8 at its head). The worker's three "Lean names found nowhere" (README lines 142, 158, 167) are the contract headings `From TauCetiRoadmap.RepresentationTheory.<X>`, the sub-roadmap folder names under `TauCetiRoadmap/RepresentationTheory/` on main, not declarations.

**Library declarations opened at the pins** (Mathlib `358314d`, Tau Ceti `f6090c7`): `Nat.chineseRemainder` (`Mathlib/Data/Nat/ModEq.lean` line 472, with `chineseRemainder_lt_mul` line 482 and `chineseRemainder_modEq_unique` line 489); the previous report's list (`TauCeti.ClassFunction.characterPairing`, `TauCeti.irreducibleCharacters`, `TauCeti.IsTISet`, `TauCeti.characterPairing_ind_ind_of_isTISet`, `Subgroup.indClassFunction`) is unchanged at the same pins.

**Ownership.** The change adds no object; the previous report's search over main and the open heads stands.

**Adversarial table.** New rows first, with the values computed this round; rows for statements the diff leaves untouched are carried from the previous report and marked "(r5)" or "(r4)".

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `gcd(4 q, |O(C)|) = 1` (step 2) | `|O(C)| = 1`, `q = 3`; `|O(C)| = 3`, primes of `|G|` `{2, 3, 5}` | `gcd(12, 1) = 1`; `q = 5`, `gcd(20, 3) = 1` | coprime; CRT applies |
| `a ≡ 1 (mod 4 q)`, `a ≡ −1 (mod |O(C)|)` ⇒ `gcd(a, |G|) = 1` | `SL(2, 3)`: `a = 13`; `SL(2, 5)`, `U` of order `4`, `O(C) = 1`, `q = 15`: `a = 61`; `𝔽₃² ⋊ Q₈`, `O(C) = 1`, `q = 3`: `a = 13`; hypothetical `|O(C)| = 3`, `|G| = 120`: `a = 41` | `gcd(13, 24) = 1`; `gcd(61, 120) = 1`; `gcd(13, 72) = 1`; `41 ≡ 1 (20)`, `41 ≡ 2 (3)`, `gcd(41, 120) = 1` | holds |
| negative control: the two congruences alone | `SL(2, 3)`, `a = 9` | `9 ≡ 1 (4)`, `gcd(9, 24) = 3` | third congruence needed; the new Check records it |
| `u^a = u`, `v^a = v⁻¹` | `u` of order `4`, `a = 13`; `v` of order `3`, `a = 41` | `13 mod 4 = 1`; `41 mod 3 = 2`, `v^41 = v² = v⁻¹` | holds |
| `(u v)^a = u v⁻¹`, `(u⁻¹ v)^a = (u v)⁻¹` | `C = O(C) × U`, `v = 1` and `v` of order `3` | `u^a v^a = u v⁻¹`; `u^{−a} v^a = u⁻¹ v⁻¹ = (u v)⁻¹` | holds; needs `u v = v u`, which §2.3 line 503 with `X = U` central supplies |
| `ψᵢ((u v)⁻¹) = ψᵢ(u v)` | integer-valued `ψᵢ` (step 1) | `\overline{n} = n` for `n ∈ ℤ` | holds |
| `∑_K ψᵢ = 2 ∑ᵥ aᵥ` | `K = u O(C) ⊔ u⁻¹ O(C)` | `u⁻¹ = u z`, `z ∉ O(C)`, cosets disjoint; `ψᵢ(u⁻¹ v) = aᵥ` | holds; `∑ᵥ aᵥ = |O(C)| εᵢ` as line 664 says |
| degenerate: `q = 1`, `|O(C)| = 1` | moduli `4` and `1` | `a = 1` | trivially fine |
| OddOrderTheorem F2 §2.4 contract: trivial complements ⇔ `C_G(a) ≤ L` | `C₃ × S₃`, `L = S₃`, `a = (1 2)`; `S₃`, `L = ⟨(1 2)⟩` | `C_G(a) = C₃ × ⟨(1 2)⟩ ⊄ L`, `H a = C₃`; `C_G((1 2)) = L`, `H a = ⊥` | paraphrase correct both ways (r5) |
| §2.3 data are a Dade datum with `H_a = ⊥` | `SL(2, 3)`, `U = ⟨i⟩`, `H = Q₈`, `K = {i, −i}` | class of `i` has `6` elements so `C_G(i) = ⟨i⟩ ≤ Q₈`; `j i j⁻¹ = −i ∈ K`; `N_G(K) = Q₈`; `u = i ∈ K ≠ ∅` | every §2.2 clause holds (r5) |
| `(Ind f) a = f a` and the isometry | `SL(2, 3)`, `f = 1 + ε_X − ε₂ − ε₃` on `Q₈`, `Ind f = 1 + λ + λ̄ − ψ₃` | `(Ind f)(i) = 4 = f(i)`; `‖Ind f‖² = 4 = ‖f‖²`; `(Ind f)(−1) = 0 = f(−1)` | holds (r5) |
| negative control: fusion not controlled by `L` | `S₃`, `L = A₃`, `A = A₃^#`, `f = ω − ω²` | `‖f‖² = 2`; `Ind f = 0`, norm `0` | induction not an isometry; fusion clause excludes it (r5) |
| `orderOf t = 2 ↔ t ≠ 1 ∧ t² = 1` (§0.1) | pin | `orderOf_eq_prime_iff`: `x ^ p = 1 ∧ x ≠ 1` | holds (r4) |
| isolation (§0.1) | `S₃` `(12)`; `A₅` `(12)(34)`; `D₈` `s`; `S₄` `(12)(34)` | `(13)`, `(23)` do not commute; `(234)` gives `(13)(24)` commuting; `r s r⁻¹ = s r²`; `(13)(24)` commutes | holds; wrong model excluded (r4) |
| dihedral formula (§0.3) | `r = ab` | `r^(-j) a r^j = a r^(2j)`; `D₈`, `j = 1`: `s r²` | holds (r4) |
| `k` even ⇒ not isolated | `D₈`, `k = 2` | `a r² = s r²` commutes with `s`, conjugate via `j = 1` | holds (r4) |
| `k` odd, `b ∼ a` ⇒ not isolated | `GL(2,3)`, `a = diag(1,−1)`, `r` of order `6`, `k = 3` | `b = (−1 −1; 0 1)`, `b² = 1`, `det b = −1`; `a r³ = diag(−1,1)` commutes, conjugate to `a` | holds (r4) |
| | `D₁₂` alone | `a r³` in the class of `b = a r` | conjugate to `b`, not to `a` (r4) |
| Lemma 3.1 (3), (5) | `m` odd / `2k`, `k` even / `k` odd | conjugate; `k` even bullet; `k` odd bullet | odd for `w ∼ t`; `2·odd` for `w ≁ t` (r4) |
| fusion in overgroups (§0.2) | `S₄`, `t = (12)`, `H = ⟨(12),(34)⟩` | `(34) ∈ H` not `H`-conjugate | negative control holds (r4) |
| descent (§0.2) | `M = ⟨x,t⟩N`, `M/N` of order `≤ 4` | `M = SN`, `n⁻¹xn ∈ S`, weak closure | holds (r4) |
| lifting through odd `N` | `x = t^g`, `[x,t] = 1`, `x̄ = t̄` | `xt ∈ N` of order `≤ 2` in odd order | `x = t` (r4) |
| product conjugacy | `S₃ × C₂` / `S₄` | `((23),1)` conjugates; `(12)(34)` vs `1` | holds / fails without isolation (r4) |
| §0.4 (i) ⇔ (ii) | `S₄`, `(12)(34)`; `S₃`, `(12)` | `(14)(23) ∈ S`; `t^G ∩ S = {t}` | neither / both (r4) |
| §1.1 (a)–(d) | `F₂₀`, `t = c²`; `D₈` | `O = C₅`, `G/O ≅ C₄`; `O = 1`, `⁅r,s⁆ = r²` | `t ∈ Z* ∖ Z`; `s ∉ Z*` (r4) |
| (c) ⇒ (d) / (d) ⇒ (c) | `g = n · c` / `O(G)⟨t⟩` | `⁅n · c, t⁆ = ⁅n, t⁆ ∈ O(G)`; Sylow of order `2` conjugate by `n ∈ O(G)` | holds (r4) |
| §1.2 lifting / last bullet | `D₈`, `N = ⟨r²⟩`; `S₄`, `H = V₄`; `S₃ × C₂`, `H = G` | `s̄` central in `V₄`, `s ∉ Z*`; `t ∈ Z*(V₄)`, `t ∉ Z*(S₄)`; conjugates of `t̄` in `Z(H̄)` | odd order and isolation needed (r4) |
| §1.3 reductions 1–5 | Waldecker 4.4 (1)–(2), 4.2 (1)–(2) | `O(G) = 1`, `G = ⟨t^G⟩`, `X = ⟨w⟩ × O(X)`, `O(X) ≤ O(G) = 1` | matches `waldecker2013` lines 963–985 (r4) |
| §2.1 | `QuaternionGroup (2^(n−2))` | order `2^n`; `a 1` of order `2^(n−1)`; `xa i` of order `4`; `(xa 0)⁻¹(a 1)(xa 0) = (a 1)⁻¹` | holds; `n = 2` cyclic, excluded (r4) |
| §2.2 | `F₂₀`, `C₆`, `A₅` | complements `C₅`, `C₃`; `A₅` Sylow `V₄` | holds (r4) |
| §2.3 `C_G(k) ≤ H`, `K` T.I. | `k ∈ K ∩ gKg⁻¹` | `U, gUg⁻¹ ≤ ⟨k₂⟩` cyclic | `g ∈ H` (r4) |
| §2.3 products of involutions | `x ≠ y`, `xy` of order `2k` | `⟨x,(xy)^k⟩ ≅ V₄` in a quaternion `2`-group | impossible; `𝔽₃² ⋊ Q₈`: `(v,−1)(w,−1) = (v−w,1)` (r4) |
| §2.3 Checks | `Q₈`, `SL(2,3)`, `𝔽₃² ⋊ Q₈`, `K' = C ∖ {1}` | `K = {i,−i}`, `O(C) = 1`; `{i,−1,−i} ∩ {j,−1,−j} = {−1}` | holds; wrong model excluded (r4) |
| §2.4 characters of `S` | `m = n − 1` | `4 + 4(2^(m−1) − 1) = 2^n`; `χ_j(z) = 2(−1)^j` | holds (r4) |
| `β₂` on `Q₁₆`, `f` on `Q₈` | values at `1, z, xa i, a 1` / `1, −1, i, j, k` | `0, 0, 0, 2`, norm `3`; `0, 0, 4, 0, 0`, norm `4`; `β₁(z) = 4` | holds (r4) |
| `‖Ind 1_H‖²` | `H = Q₈ ⊴ SL(2,3)` | `3` double cosets `≠ 1` | wrong model excluded (r4) |
| structure-constant formula (§2.5) | `S₃`, transpositions, `g = (123)` | `(9/6)(1 + 1 + 0) = 3` pairs | holds (r4) |
| `Φ` vanishing | `Q₈` | `Φ(1) = 8`, `Φ(z) = 4 − 4 = 0`, `Φ(i) = 0` | holds (r4) |
| three relations | `eᵢ²/dᵢ = dᵢ − 2fᵢ + fᵢ²/dᵢ` | `∑εᵢfᵢ²/dᵢ = 0` | holds (r4) |
| `4 ∣ fᵢ` | `u ∼ u⁻¹` in `S` | `dim E_{−1}(z) = 2 dim E_i(u)` | holds (r4) |
| `fᵢ > 0` needs simplicity | `SL(2,7)`, Sylow `Q₁₆` | relations satisfiable with `z ∈ ker ψᵢ` (`1 + 7 − 8 = 0`) | hypothesis needed, as the Check says (r4) |
| case `n ≥ 4` | `ε₁f₁ + ε₂f₂ = 0`, `fᵢ > 0` | `ε₂ = −ε₁`, `f₁ = f₂`, `d₁ = d₂`, `1 = 0` | contradiction holds (r4) |
| case `n = 3` step 1 | `σψ₁ = ψ₂` | `f₃ = 2f₁`, `ε₃ = −ε₁`, `d₃ = 2d₁`, `1 = 0` | holds (r4) |
| step 2 sums | `|H| = 8|O(C)|`, `f = 4` on `K` | `∑_K ψᵢ = 2|O(C)|εᵢ`; `a₁` odd; `∑(aᵥ − εᵢ)² = (m − 1)|O(C)|` | holds (r4) |
| step 2 bound | `m ≥ 3` | `|G|(m + 1)/4 + dᵢ² + εᵢdᵢ > |G|` | `m = 1`, `ψᵢ(u) = εᵢ` (r4) |
| step 3 transfer | orbit sizes `1, 2, 4` on `G/S` | sizes `2, 4` give `z, 1 ∈ [S,S]`; odd count of size `1`; `u^{odd}[S,S] ≠ 1` | all six elements of order four conjugate (r4) |
| step 4 | `S = Q₈` | `(dᵢ + eᵢ + 6εᵢ)/8 ∈ ℤ`, `dᵢ ≡ εᵢ + 2cᵢ (mod 4)` | holds (r4) |
| step 5 | `∑εᵢwᵢ = 0`, `gcd = 1` | one `wᵢ` even; `ε₂d₂ + ε₃d₃ ≡ 0` vs `≡ −2 (mod 4)` | contradiction holds (r4) |
| negative control | `PSL(2,7)`: `(3,6,8)`, `(−1,2,0)`, `(−,−,+)` | `1−3−6+8 = 0`, `1+1−2+0 = 0`, `1−1/3−2/3+0 = 0`; `d₃ = 8 ≢ 1`; `χ₈(4A) = 0 ≠ ε₃` | three relations alone insufficient (r4) |
| `InPrincipalTwoBlock` | trivial; `C₂` sign; `S₃` degree `2`; `S₃` sign; `3 ∈ m`; `m = ⊤` | `z = |Cl g|`; `−2 ∈ m`; `−3 ∉ m`; `−6 ∈ m`; `−3 ∈ m`; everything | `IsMaximal`, `2 ∈ m` needed (r4) |
| constancy (§3.2) | `P = ⟨s⟩`, `H = C_G(s)` | `b^G = B₀ ⇒ b = B₀(H)`; `φ(v) = φ(1)`; `χ(sv) = χ(s)` | holds; `C₆`, `S₃ × C₂` Checks `−1 = −1`, `−2 ≠ 1` (r4) |
| §4.1 package | `d = th`, order `2k`, `k` odd | `(th)² ∈ N`, `v = (th)^(k+1) ∈ N`, `μ = tw`, `μh = (th)^(1−k) ∈ N` | holds (r4) |
| §4.2 identity | `S₃` `3`-cycles; `S₄` `χ₃` | `C² = 2 + C`, `ω = −1`; `−3 ≠ 1` | holds; fails without isolation (r4) |
| §4.3 alternative | `S₃ × C₂`, `sgn ⊗ 1` | `χ(t) = χ(1) = 1`, `⟨t^G⟩ ≠ G` | `⟨t^G⟩ = G` needed (r4) |
| §4.4 contradiction | `(s,t)`, `(s,1)`; `S₃ × C₂` | nontrivial terms `0`, trivial `2`; `1 − 1 − 1 + 1 = 0` | holds (r4) |
| `glauberman_zStar` / `brauer_suzuki` | `C₂, S₃, Q₈, V₄, A₅` / `Q₈, SL(2,3), SL(2,5), 𝔽₃² ⋊ Q₈` | `N = ⊥, A₃, ⊥, ⊥`; `A₅` fails both; `N = ⊥, ⊥, ⊥, 𝔽₃²` | holds; negative control (r4) |
| §5.2 | `S₃`, `sgn` | `χ(t) = −1 = −χ(1)` | holds (r4) |

**Hypothesis audit.** Unchanged from the previous reports: `hm`, `h2` needed; `hn : 3 ≤ n` needed (`QuaternionGroup 1` is cyclic); `hs : orderOf s = 2` not needed for the truth of the constancy theorem but used by every consumer.

**Sources at their locators.** The diff cites no source; the previous reports' checks of `waldecker2013` (Chapter 1 lines 60–95; Theorem 2.19–2.20 lines 506–512; Lemma 3.1 lines 652–683; Hypothesis 4.1 lines 902–911; Lemmas 4.2 and 4.4 lines 916–985), `guralnick_tongviet_tracey2024` (Theorem 5.1 lines 789–834) and `axiommath_cfsg_example3` (stage lemmas at lines 743, 2207, 2280, 2510, 3392, 4106, main theorem 6695) stand, the cache files being unchanged. The repaired step is the roadmap's own argument (a Galois-conjugation step inside Suzuki's Example 3 proof, uncertified); its arithmetic is checked above by computation.

## Not verifiable

- `brauer_suzuki1959`: the cached text is still the 9-line PMC placeholder while the board's manifest records it `certified`; the theorem on p. 1757 is checked against Waldecker Theorem 2.20 (`waldecker2013` lines 510–512) and Chapter 1 (lines 79–82), as in the previous reports. A manifest matter, not a README finding.
- Glauberman 1966 and Suzuki, *Group Theory II*, Example 3: settled `uncertified`; cited by locator, checked by computation and against the Apache-2.0 formalization's stage lemmas.
- Ownership against open pull requests: the change adds no object; the previous reports' `roadmaps grep` over the open heads and the board's package index stand.

## Source issues

- none
