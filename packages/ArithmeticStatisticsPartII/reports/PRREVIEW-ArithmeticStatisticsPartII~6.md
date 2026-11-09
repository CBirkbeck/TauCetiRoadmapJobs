# Review of ArithmeticStatisticsPartII (pull request #1173 at 30098d6)

**Verdict:** needs changes

🤖 Independent AI review, full pass. The head is the one the previous review read (no change in the folder since 30098d6). The gate passes. The four field-level headline theorems survive a brute-force test over 𝔽₅, 𝔽₇ and 𝔽₁₁ (172 nonsingular invariant fibres, no violation), and every sampled locator matches its source. Five findings remain. In order: a §1.8 headline is statable at the pins but absent; a dropped target is still cited by two sibling parts; the description still lists QuadraticFormsOverABase as a supplier (the previous review's R01); two loose paragraphs at the end of Layer 1 are not in target form; and three formulas print `ℤ` for the variable `Z`.

## R01 (P2) — The §1.8 orbit bijection is statable at the pins but is not stated

Location: `TauCetiRoadmap/ArithmeticStatisticsPartII/Suggested.lean:35–36`, “The ternary-pair orbit and fibre theorems (§1.8) need the integer-valued quadratic-pair action and its resolvent construction.” Target: `README.md:1287`, **Orbit bijection for the embedding** (Bhargava–Shankar Theorem 2.14).

Claim: the module docstring lists §1.8's orbit theorems among the headline signatures that need objects absent from the pins. The orbit bijection needs neither a new action carrier nor the resolvent. It needs the Veronese forms `A₁` and `B_f` on `MvPolynomial (Fin 3) ℤ` and integral linear substitution, which the pins already have: Mathlib `MvPolynomial.eval₂Hom`, as `twistedForm` already uses it, or Tau Ceti `MvPolynomial.linearSubst`. A statable headline is therefore absent, and the docstring gives a reason that is false at the pins.

Witness: pinned Tau Ceti `TauCeti/RingTheory/MvPolynomial/LinearSubst.lean:74` defines `linearSubst M := aeval fun i ↦ ∑ j, C (M i j) * X j`, with `linearSubst_one` (:205) and `linearSubst_mul` (:210). The statement below elaborates at the pins, with `sorry` as the only warning.

Repair: add the two definitions and the theorem under the Layer 1 section of `Suggested.lean`, name them in README §1.8, and rewrite the docstring sentence. The sentence should keep only the fibre bound, if it stays unstated, with an accurate reason: it needs orbit-class counting, not a missing action. Tested statement (scratch file, `import TauCeti.RingTheory.MvPolynomial.LinearSubst`, `open MvPolynomial`):

```lean
def veroneseA : MvPolynomial (Fin 3) ℤ := X 0 * X 2 - X 1 ^ 2

def veroneseB (f : Fin 5 → ℤ) : MvPolynomial (Fin 3) ℤ :=
  C (f 0) * X 0 ^ 2 + C (f 1) * X 0 * X 1 + C (f 2) * X 1 ^ 2 + C (f 3) * X 1 * X 2 +
    C (f 4) * X 2 ^ 2

theorem orbit_bijection_embedding (f g : Fin 5 → ℤ) :
    (∃ γ : Matrix.GeneralLinearGroup (Fin 2) ℤ, form g = linearSubst γ.val (form f)) ↔
      ∃ (M : Matrix.SpecialLinearGroup (Fin 3) ℤ) (r : ℤ),
        linearSubst M.val veroneseA = veroneseA ∧
          veroneseB g = C r * veroneseA + linearSubst M.val (veroneseB f) := by
  sorry
```

The statement is true. `B_f(x², xy, y²) = f` and `A₁` vanishes on the conic. For γ ∈ GL₂(ℤ), `±Sym²γ ∈ SL₃(ℤ)` preserves `A₁`, and `B_{f∘γ} − B_f∘Sym²γ` vanishes on the conic, so it is an integral multiple of `A₁`. The converse is README **Special orthogonal group of the veronese form**. Both sides quantify over groups, so the substitution convention does not matter.

## R02 (P3) — A dropped target is still cited by Parts III and V

Location: `README.md:86–199` (§1.1) and the first Scope bullet (`README.md:11`). The README has no target **Delone Faddeev parametrization of cubic rings**. Commit 86c45111 moved it to AnalyticNumberTheoryPartII §5.5.

Claim: two open sibling roadmaps cite the target under this roadmap's name, and the README gives no old → new mapping, so those citations are unresolved.

Witness: ArithmeticStatisticsPartIII (#1174) `README.md:926`, `:1106` and the link `:2340` (`#delone-faddeev-parametrization-of-cubic-rings`); ArithmeticStatisticsPartV (#1175) `README.md:74`, `:133`, `:163`, `:243`, `:414`, `:446`, `:724`. `git log -S` finds the target last in 86c45111.

Repair: either add a mapping sentence to the first Scope bullet, “The Delone–Faddeev parametrization of cubic rings is AnalyticNumberTheoryPartII §5.5's projective cubic-algebra equivalence; this part retains only its based adapters (§1.1).”, or repoint the cited lines of Parts III and V to AnalyticNumberTheoryPartII §5.5 (“### 5.5 Cubic algebras and projective forms”, line 814 at #1167). Tested: §5.5 exists at that head, and no other target title of this README matches the cited name.

## R03 (P3) — The description still lists QuadraticFormsOverABase as a supplier

Location: the pull-request description, the `**Depends on**` list (“- [ ] #1930 QuadraticFormsOverABase”) and the merge-order paragraph (“#1747 (PCurvature, mycaule) → #1930 (QuadraticFormsOverABase, mycaule) → #1006 …”).

Claim: this is the previous review's R01, unrepaired: head and description are unchanged. The README names QuadraticFormsOverABase only under Downstream consumers (`README.md:2128`). That roadmap is not in the merge order, and its own suppliers sit after this roadmap, so the description's wait can never end.

Witness: `grep QuadraticFormsOverABase README.md` finds only line 2128. The dependency check reports `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`.

Repair: regenerate both blocks from the README's supplier citations, which drops #1930. Nothing in the folder changes.

## R04 (P3) — Two loose paragraphs at the end of Layer 1 are not in target form

Location: `README.md:2081`, “The BSS marked genus-one statistic requires an *even-degree monicization* adapter … describe every integral multiplicity and stabilizer, and identify the increasingly sparse congruence support …”. Also `README.md:2112`, “Quintic integral realization also includes rational *nonétale* algebras … Sources are HCL IV, §§2–4, including its multiplication and resolvent formulas.”

Claim: the paragraph at 2081 asks for a construction and theorems but has no bold title, no exact statement ("describe", "identify"), no `*Needs:*` line and no Checks. It cites “BSS”, which is not a reference key; the work is [16]. It also overlaps §1.12 **Quartic monicization** and **Marked quartic Selmer embedding**. The paragraph at 2112 restates §1.10 (**Quintic multiplication**, **Sextic multiplication**, **Integral quintic realization**) and the `k≠i` note of §1.3 (`README.md:399`). Its locator is also wrong: HCL IV §§2–4 are the geometry, the discriminant and the quintic table, while the sextic resolvent and its table are §§5–6.

Witness: ref-7 lines 259, 510, 527, 812 and 1082 give the headings of §2, §3, §4, §5 and §6. The README cites [16] only at lines 1830 and 1845, and line 2081 has no Checks block before the next target (line 2083).

Repair: either merge the monicization adapter into §1.12 as a titled target, or delete it. A merged target states the integral multiplicity and stabilizer assertions with hypotheses, cites [16] by key with §§3–4 and §§6–7 page locators, and adds a `*Needs:*` line and three Checks (for example the `y ↦ ky` scaling of §1.12's Check at line 1850). Delete the paragraph at 2112: §1.10 and §1.3 already state everything in it. If it is kept, cite HCL IV §4 and §6 for the two tables.

## R05 (P3) — Three formulas print `ℤ` for the variable `Z`

Location: `README.md:817` (“has characteristic polynomial `ℤ^3 - pZ^2 + qZ - r^2`; if `z = z_1^2` then `h(ℤ^2) = -h_1(ℤ) h_1(-ℤ)`”), `README.md:1137` (“Substituting `(X,Y,ℤ)=(x+ξ·y,η·y−z,y)`”) and `README.md:1153` (“primitive vector `(X_0 : Y_0 : ℤ_0)`”).

Claim: the integer ring symbol stands where the polynomial or coordinate variable `Z` belongs, which makes all three formulas ill-formed.

Witness: line 817 mixes `ℤ^3` and `pZ^2` in one polynomial; at line 1137, `Mᵀ(x,y,z) = (x+ξy, ηy−z, y)` is the third coordinate `Z`.

Repair: read `Z^3 - pZ^2 + qZ - r^2`, `h(Z^2) = -h_1(Z) h_1(-Z)`, `(X,Y,Z)=(x+ξ·y,η·y−z,y)` and `(X_0 : Y_0 : Z_0)`. Tested: with `Z`, line 1137 reproduces `U∘M₀ = −((3ξ²+A)x+2ηz)y² + (z²−3ξx²)y − x³` (recomputed below).

## Previous findings

- R01 (description lists #1930): not repaired. The description still contains “- [ ] #1930 QuadraticFormsOverABase” and “→ #1930 (QuadraticFormsOverABase, mycaule) →”, and the head is unchanged at 30098d6. Raised again as R03 above. The repair report did not mark it as not actionable, so no `Re-raised:` line applies.

## Verified sound

**Gate** (independent rerun on this head):

```text
gate ArithmeticStatisticsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check** (the brief's command, real order, `--movable`): `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty, and the worktree is clean.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d) gives exactly seven `sorry` warnings, at lines 150, 160, 171, 178, 187, 196 and 203. I ran `#check @` on all 22 declarations in one scratch file and compared each with the README:
- the definitions carry only the binders their types mention;
- `curveIJ_isElliptic` carries `[NeZero 2] [NeZero 3] [NeZero (4I³−J²)]`;
- the orbit theorem carries `Nat.card K ≠ 5` and `4I³−J² ≠ 0`;
- the point, stabilizer, solubility and Selmer theorems carry `[NeZero (4I³−J²)]`, and the Selmer theorem also carries `[NumberField K]`;
- the local and global integral theorems carry `ℤ_[p]`/`ℚ_[p]` and `ℤ`/`ℚ` with `4A³+27B² ≠ 0`.

All 22 match the README (`:653–681`, `:747–773`, `:859–861`, `:879–895`, `:913–917`, `:933–937`, `:965–969`, `:1003–1009`, `:1147–1151`, `:1177–1181`). No binder was lost, and nothing changed.

**One-tactic probes.** `first | rfl | simp | infer_instance | decide | trivial | aesop` leaves unsolved goals on six theorems and exhausts the heartbeats on `cubicInvariant_determines_orbit`. None of the seven is padding.

**Brute-force test of the field-level headlines** (exact arithmetic over 𝔽_q, all quartics, orbits from GL₂ generators):

| q | nonsingular fibres | quartics without admissible point | point checks (`z∘q = μ`, every admissible point) | orbit-pair checks (class ⇔ orbit) | soluble ⇔ `~q(P)` | `q(P)~q(Q)` ⇔ `P−Q∈2E` | stabilizers = `#E[2]`, exponent 2 | violations |
|---|---|---|---|---|---|---|---|---|
| 5 | 20 | 60 | 120 | 66 | 2400 | 816 | 36 | 0 |
| 7 | 42 | 0 | 336 | 180 | 14112 | 2976 | 78 | 0 |
| 11 | 110 | 0 | 1320 | 500 | 145200 | 17040 | 210 | 0 |

This confirms that 𝔽₅ belongs in the point, orbit-of-points and stabilizer statements, and that `Nat.card K ≠ 5` is needed only for the existence clause.

**Adversarial table** (values computed this round; ref-N is the README's [N]).

| Statement | Instances and computed values | Result |
|---|---|---|
| `cubicInvariant_determines_orbit` | Brute-force rows above. ℚ, `x³y−xy³`: G at roots 0, 9, −9 of `T³−81T` is (1,1,1) at (1,0) and (25,49,1) at (1,2). 𝔽₅, `x⁴+y⁴`: `I=2`, `4I³=2`, `g₆²=1024x²y²(x⁴−y⁴)²` vanishes on all 6 points. Source: ref-8 Theorem 11 (line 255), standing hypotheses char≠2,3 and K≠𝔽₅ (lines 26, 72). | Holds |
| `solubleOrbit_bijection` | Rows above, 𝔽₅ included. ref-1 Theorem 3.2 (line 1251) covers every field of characteristic ≠2,3. BS representative = twisted `diag(−1/2,1)` transform of `q(P)`: `(1/4, 0, −3ξ′/2, 2η′, I/3−3ξ′²/4)`. | Holds |
| `cubicInvariant_quarticOfPoint_eq_mu` | Rows above. `y²=x³−43x+42`, `P=(−3,12)`: (−4,−9,4) on both sides. `y²=x³−81x`, `P=(0,0)`: corrected (−81,−9,9); the uncorrected (0,−9,9) is a nonunit. `fCofactor` (XSubT :185) `·(T−ξ) = f − f(ξ)`. | Holds |
| `stabilizer_twoTorsion` | 324 orbit representatives above, PGL₂ order = `#E[2]`, every element squares to a scalar. `x⁴−y⁴`: `X³+36X` has 1 rational root, order 2. | Holds |
| `mem_selmerGroup₂_iff` | `N(G(1,2))=1183744=g₆(1,2)²` for `x⁴−y⁴`. The `simp` normal form is `normM m=1`, plus `∃ P, μ₀ P = localRes m` at every finite place and every infinite place, which is the Tau Ceti definition (SelmerGroup.lean :104, :111). K infinite gives an admissible point. `x³y−xy³` has class 1 ∈ Sel. | Holds |
| `exists_integral_local`, `exists_integral` | `4(−48A)³−(1728B)² = −110592(4A³+27B²)`. Weierstrass projection `(0,4,0,4A,4B)`; `A=−7, B=10` gives (336, −17280). `U∘M₀` recomputed equals `q(P′)(z,x) = z⁴−6ξx²z²−8ηx³z−(3ξ²+4A)x⁴`. Negative control: `diag(1/3,1)`·(x⁴+y⁴) = `x⁴/9+9y⁴`. `y²=x³−2` gives (0, 3456). | Holds |
| Lean definitions | `x⁴−y⁴`: I=−12, J=0, Δ=−256. `diag(2,1)`: (4a,2b,c,d/2,e/4) vs untwisted (16a,8b,4c,2d,e). Δ(curveIJ)=2⁴·3⁹(4I³−J²). q(O) has invariants (I,J). (0,0) on `y²=x³−27x` maps to `X⁴+Y⁴/12`, I=1, J=0. hessian(x³y)=3x⁴; hessian(x⁴−y⁴)=48x²y². G(1,0)=p/3−(4a/9)T. | Hold |
| §1.1 index form, stabilizers | `⟨1,e₀,e₁⟩` gives `xy²−x²y`. ω=−e₀, θ=−e₁ give `xy(x−y)`, disc 1. `(ST)⁻ᵀ = [[−1,−1],[1,0]] = S⁻ᵀT⁻ᵀ`; `(ST)ᵀ=[[0,1],[−1,−1]]`. | Hold |
| §1.2 DH sets and counts | `x³+2y³`: `f(1+3t,1+3u) ≡ 3 (mod 9)`, so in U₃. `x³+y³ → 3x²y−3xy²+y³`. `f(1,−1+3t) ≡ 0 (mod 9)`. Index 3 = √(−27/−3). | Hold |
| §1.3 `4 Det` and transformation law | 4Det = 4·Gram det (100 random forms). `4Det(MGMᵀ)=det(M)²·4Det` (100 random M). `4Det(A₁x−B_f y)` monic (50 random). x₁²+x₂²+x₃² gives 4; x₁x₂+x₃² gives −1 vs `discr′`=−1/4; 𝔽₂ `xy+xz+yz` gives 1. | Hold |
| §1.3 quartic table | 40 random integral pairs: associative, `c⁰` independent of `k≠i`, integral, normal, trace disc = `disc(4Det(Ax−By))`. `k≠j` fails both. `det(1,x,y,xy) = B(x)A(y)−A(x)B(y)`, and the opposite sign fails. Test pair: −27 = −27. | Hold |
| §1.3 minors, fibres, content | Plücker `λ(i,k)λ(j,l)=λ(i,j)λ(k,l)+λ(i,l)λ(j,k)`. σ(2)=3. `Z+2Z⁴`: index 8, disc factor 64. `R_inv` index: n⁴/n³ = n. | Hold |
| §1.4 alternating quadruples | `x₁₂=x₃₄=1` (0-indexed) gives sub-Pfaffians (1,0,0,0,0); doubled gives (4,…). Scalar `cI₅` gives `c⁸⁰ = det(cI₅)¹⁶`. Kernel `(ζ⁻²I₄,ζI₅)` acts trivially when ζ⁵=1. | Hold |
| §1.5 covariants and syzygy | Syzygy on 200 random (f,x,y); (1,2,3,4,5) at (1,1): 17280000 on both sides. `g₄ = −(1/3)Hess`. Resultants: `x⁴−y⁴` gives 5308416 = 81·256² and −16777216 = (−256)³; `x³y−xy³` gives 1296 and 64. | Hold |
| §1.5 comparison chain, image | `X⁴+XY³`: I=0, J=−27, p=0, r=8. `r₂²=t³r₁²` from the seminvariant syzygy. Simon's quartic for `m=28+7φ`: `(1/84,0,−2,28/3,−7)`, I=3, J=0, Δ=4, `N(m)=9604=98²`. `Q_1 = t₁²+2t₀t₂+27It₂²`, det −1. | Hold |
| §1.6 Selmer Checks | 571a1: c₄=44608, 2c₆=18842960. Lind `2x⁴−34y⁴`: I=−816, curve `y²=x³+22032x`. | Hold |
| §1.7 projection and representatives | `2(3,5)` on `y²=x³−2` is (129/100, −383/1000), primitive (1290,−383,1000). Scaling `(36x,216y)`: 46656 = 6⁶. | Hold |
| §1.8 embedding, SO, fibres; R01 | `ρ([[1,1],[0,1]])=[[1,1,1],[0,1,2],[0,0,1]]`, `ρ(−1)=I`. Bennett: ≤10 solutions, so 2N=20; the disc-49 cubic has 9 solutions, so 18. f and −f share a fibre when J≠0. R01's statement elaborates. | Hold; R01 |
| §1.9 densities | Exact counts: 42768 of 9⁵ = 176/243; 384 of 4⁵ = 3/8; 5184 of 9⁴ = 64/81; 96 of 4⁴ = 3/8; 32 of 4³ = 1/2. Quadratic maximality: 11/16, 70/81, 596/625 at p=2,3,5, equal to β₂. The printed α₄(3) is 1600/2187 ≠ 1584/2187. | Hold |
| §1.10 quintic/sextic | `c⁴₁₃ = Q(A₁)ᵀA₂Q(A₃) = 1·(−1)·(−1) = 1` (1-indexed Check). 16³ = 4096. In `Z[t]/t⁶`, e₁² = e₂. C(10,5) = 252 maximal minors. | Hold |
| §1.11 monogenization, Wood adapter | `t`, `t+1` monogenizing, `t²` not. `4Det(z²−xy) = −1` vs `4Det(x₁x₃−x₂²) = +1`. The 3-cycle maps A₀ to −A₁ and B to B_f. | Hold |
| §1.12 pencils | `I₃`, `diag(1,2,3)`: 4 = 2^{2g} geometric points. `c=(−1,1,1)`: c²=1, N=−1. `N(c²tα) = (N(c)t^{n/2}s)²f₀^{n−3}`. 2^{n−2}. Monicization `(2,3,5,7,11) → (1,3,10,28,88)`; `2x⁴−2y⁴`: I −48 → −192, Δ −16384 → −1048576. | Hold |
| §1.13 Q and weak lifts | Q = −1 for g=1 and for g=2. `diag(−1,−1,1)` gives +1; `diag(2,1,1/2)` gives \|Q\|=2. `x³−x²y+p²y³`: disc 4p²−27p⁴, perturbed ≡ 4ph. `Δ(xf)=Δ(f)f(0,1)²`. | Hold |
| §1.14 stabilizers | 𝔽̄₅, `y²=x³+x+1`: Δ = −16·31 ≡ 4, j ≡ 2. Orders 2d² = 8, 18, 32. | Hold |
| §1.15, §1.16 | Z⁴ ↔ Z³ split. BGW Proposition 35 hypotheses (p odd, p²∤Δ, f₀≠0, Div¹(ℚ_p)≠∅, ref-19 lines 1206–1211) match. | Hold |
| Supporting descent | Degree-4 model: `16det(uA+vB) = u⁴+4v⁴` at 5 points, invariants (48,0) = (16·3, 0). `(I_BS,J_BS) = (3888,0) = (6⁴·3, 0)`. Divided D: (1,0,0,1) gives 1 vs −27; T·(1,0,0,1) = (2,1,1,1) with D=1, while ordinary substitution gives D=−23; (1,2,3,5) and (5,3,2,1) both give 5; diag(2,1) gives 64. Mass with m=3 is 1/3. | Hold |
| R02, R04, R05 targets | Delone–Faddeev is at ANT II §5.5 (#1167 line 814), not here. HCL IV §§5–6 hold the sextic material. `U∘M₀` with Z reproduces line 1137. | Findings |

**Sources sample.** The cache texts were fetched this round from legal copies; the two HCL papers and published BSW II come from the publishers' open-access PDFs. Every locator below was checked at the printed page:
- **§1.1:** ref-4 Lemma 1.1 (line 38, p. 1, R local or a PID); ref-3 Propositions 11–12 (lines 286, 306, pp. 5–6); Stacks 0BJF (finite locally free; étale iff the discriminant is empty).
- **§1.2:** ref-3 Lemma 13, Theorem 14, Propositions 15–16 (lines 330–363, pp. 6–7).
- **§1.3 and §1.15:** ref-6 (printed page = PDF page + 1328): Theorem 1 p. 1330, Corollaries 4–5 p. 1333, §2.3 pp. 1337–1339, (11) and Lemma 9 p. 1340, (20)–(23) pp. 1342–1343, Propositions 10–13 pp. 1343–1345, Lemmas 16–17 pp. 1348–1349, Corollary 18 p. 1350, Definitions 19–20 p. 1352, §4.1 p. 1353, Lemma 22 p. 1356.
- **§1.4 and §1.10:** ref-7 (page + 52): Theorem 1 p. 54, (16)–(22) pp. 67–68, Lemma 7 p. 78, Definitions 10–11 p. 83, Theorem 12 and Lemmas 13–15 pp. 84–85, Lemma 16, Theorem 17 and Corollaries 18–19 pp. 88–89, Theorem 21 p. 92 (“seventeen”, line 1852).
- **§1.5–1.6:** ref-8 Lemma 1 and Proposition 2 pp. 2–3, Propositions 6–8 pp. 5–6, Lemmas 9–10 pp. 6–7, Theorem 11 p. 7, Theorem 12 and Remark 1 p. 9, Theorem 13 and §6 p. 10; ref-1 (30)–(32) and Theorem 2.14 p. 16, Lemma 2.2, Theorem 3.2, Proposition 3.3, Lemma 3.4 (2⁴·3 | I, 2⁶·3³ | J) and Theorem 3.5 p. 23, Proposition 3.6 p. 24; ref-12 Theorem 4.1 and Remark 4.3 p. 26.
- **§1.7:** ref-9 Theorem 2.8 p. 6, Theorem 3.4 p. 10, Theorem 3.8 p. 12, §3.2 p. 13, Lemmas 3.11–3.14 pp. 13–15, proof of Lemma 3.10(i) p. 16 (line 617); ref-10 §§7.2–7.3 p. 27, Lemma 4.15 p. 13; ref-14 Proposition 1.4 p. 10.
- **§1.8:** ref-1 Proposition 2.16 p. 17; ref-13 Lemma 3.2 p. 7; ref-24 Theorem 1.4 p. 1509, which needs only two distinct roots of F(x,1), so it covers nonzero discriminant; the disc-49 example is on p. 1510.
- **§1.9 and §1.13:** ref-18, published pagination: (4)–(5) p. 9, Theorem 3.5 and Proposition 3.6 p. 11, Theorem 3.7 p. 12, Proposition 3.8 p. 13, Proposition 3.9 p. 14, Propositions A.1–A.2 pp. 53–55; ref-20 Theorems 2.3–2.4 p. 10, Theorem 3.3 p. 17.
- **§1.12 and §1.16:** ref-19 Theorems 14–16 pp. 5–7, Theorem 17 and Corollaries 19–20 pp. 8–9, Propositions 21–22 pp. 10–11, Theorems 23–25 pp. 12–16, Theorems 28–31 pp. 18–23, Proposition 34 p. 26, Proposition 35 p. 29; ref-16 Theorem 1.4 p. 4, Proposition 2.2 p. 8; ref-25 I §6 Lemma 6.1 p. 73, Proposition 6.4 p. 74.
- **§1.14:** ref-12 Theorems 4.1, 4.5, 4.11, 4.14 pp. 26–31.

Every theorem number, page and hypothesis matches the README's use.

**Library declarations opened at the pins** (13):
- Tau Ceti `XSubT.lean`: `f` :179, `fCofactor` :185, `A` :299, `M` :346, `μX` :615, `μX_of_eval_f_eq_zero` :625, `μ₀` :651, `μ` :861.
- Tau Ceti `SelmerGroup.lean`: `selmerGroup₂` :104, `mem_selmerGroup₂_iff` :111.
- Tau Ceti `LinearSubst.lean`: `linearSubst` :74, `linearSubst_mul` :210.
- Tau Ceti `BinaryForm/Basic.lean`: `binaryForms` :201. This is the SL₂ comodule of degree-d forms (contragredient action, no I, J, no determinant twist), so it is not the coefficient carrier of the headlines and duplicates nothing.

The library-matches leads found no pinned statement of any headline.

**Cross-roadmap citations resolved** (all present where cited):
- On main:
  - EllipticCurves Layers 1 and 5–8; Layer 7 has the `0→E/mE→Sel_m→Ш[m]→0` sequence and the named explicit/cohomological Sel₂ milestone (line 1241).
  - GlobalQuadraticForms Layer 5 (5.1, ternary).
  - SchemeAndStackFoundations §§3.6–3.7 (4905, 4937) and Layers 0–3.
  - JacobianChallenge Layers A and D (111, 218).
  - DiophantineApproximationAndTranscendence §4.3 (2872) and §2.4 (1085).
  - `Completed/` GlobalNumberFields Layer 11 (571), PolynomialGaloisGroups Layers 0, 2, 4, 6, and OrthogonalSpinGroups Layer 0.
- At open heads:
  - ArithmeticStatisticsPartI #1171: all 16 cited targets, under “Cubic supplier conventions”, §0.3, §0.4, §0.12, §0.22 and §0.23.
  - AnalyticNumberTheoryPartII #1167 §§5.4–5.5.
  - GeometryOfNumbersAndQuadraticArithmetic #851 §§0.2–0.3 and §4.1.
  - AbelianSchemesAndArithmeticModuli #849 A2–A3.
  - AlgebraicModuliForArithmeticGeometry #853 §§1.1–1.3.
  - NeronModelsAndSemistableAbelianVarieties #852 §§4.8–4.12, with all six `Bgw*` names.
  - SelmerIwasawaCohomology #869 §2.12a, with both named targets.
  - ArithmeticGaloisDuality #858 §R02.4.5.
  - Consumer HeightsRationalPointsAndObstructions #1017 §3.18a.

**Ownership.** ArithmeticStatisticsPartI cites this roadmap only as a consumer (its line 2607), so there is no cycle. Two remarks need no change in this folder:
- ArithmeticStatisticsPartIII (#1174, merge position 113, after this roadmap's 112) defines `Counting.ternaryDet4` (its README :1187, Suggested.lean :142) as its own target, with laws routed through QuadraticFormsOverABase. §1.3 here is the earlier owner, so Part III's review must make it cite §1.3.
- ArithmeticStatisticsPartV (#1175) sits at position 56 but consumes this roadmap. That upward edge is Part V's to resolve.

## Not verifiable

- ref-17 (O'Dorney, DOI 10.1186/s40687-016-0054-0): the service resolves it only to a paywalled Springer page and records it as `uncertified`. Its locators (Definition 2.1, Theorem 2.2, Theorems 8.4 and 8.7, Corollary 8.5, Example 8.10) are cited unread.
- ref-5 (Gan–Gross–Savin, Lemma 5.3, cited for §1.1's index formula): the sources service found no legal copy, since the DOI's Project Euclid landing page has no PDF link. The README's link is a copy on a third-party course page, not an author's or publisher's copy, so it was not fetched. The index formula itself was recomputed (the determinant of `⟨1, ξ, ξ²⟩` in the basis b is `I_b(m, n)`).
- ref-2, ref-11, ref-15 and ref-21–23 support targets outside the seeded sample and were not read this round.
- A `sorry` build checks elaboration, not truth. Apart from the brute-force tests over 𝔽₅, 𝔽₇ and 𝔽₁₁, the number-field and p-adic headlines are supported by their sources and the computed instances above, not by proof.

## Source issues

- **Misprint** in ref-6 at (23), printed p. 1343: the source says the constant-term formula holds for any k ≠ j; it should be k ≠ i (with k ≠ j the value depends on k and the table fails associativity on random integral pairs); affects a stated result.
- **Error** in ref-18 at Proposition A.1, printed p. 53: the source gives α₄(p) = (1−1/p)²(1+2/p−2/p⁴+1/p⁵); it should be (1−1/p)²(1+1/p)(1+1/p−1/p²) as for n ≥ 5 (p = 3: 1600/2187 vs the exact count 1584/2187); affects a stated result.
- **Error** in ref-18 at Proposition 3.6, printed p. 11: the source says the product of the two top-block Gram determinants divides Δ in ℤ[W₀]; it should be dropped, since it fails at g = 1 (top rows (0,1,1), (0,0,1), suitable lower blocks: Δ = 5, product 2) and its proof misreads det(MMᵗ) = 0; affects a stated result.
- **Gap** in ref-1 at Proposition 2.16 and proof, printed p. 17: the source bounds the preimages by the 12 solutions of g = 1, but its map from preimages to solutions can be two-to-one (f and −f share a first row); it should bound by twice the solution count; affects a stated result.
- **Misprint** in ref-12 at Remark 4.2, printed p. 26: the source says the degree-two pair is a torsor for (E, O(3O)); it should be (E, O(2O)) for degree-two line bundles; affects a stated result.
