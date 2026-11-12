# Review of ModularCharactersAndBlocksPartII (design, round 5)

**Verdict:** needs changes

Three findings: one P2 and two P3; one blocking. All seven round-4 findings are repaired (checked below, with the repaired passages). The blocking finding is a generality mismatch with the base roadmap at its present head: the block strand is quantified over every splitting `p`-modular system, while the base develops its Layers 2–8 for the system of its §1.1 and states the second main theorem only there (or over an algebraically closed residue field). The mathematics is not in doubt; the supplier contract is. The scope remains a legitimate Part II.

## R01 (P2) — The block strand quantifies over every splitting system; the base supplies its §1.1 system

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:171`–175 (Conventions, “`(K, O, k)` is a splitting `p`-modular system for `G` in the sense of the base §1.1: `O` is a complete discrete valuation ring …”); line 988 (“Heights do not depend on the splitting `p`-modular system (base §2.4)”); line 1336 (“every splitting `p`-modular system for `G`”); §8.1 *Needs:* line 1239 (“base §§5.1, 6.3, 7.2”). The plan carries the same generic hypothesis on every target of Layers 6–9.

**Claim:** The base supplies its block theory, in particular the second main theorem (§7.2), for an arbitrary complete discrete valuation ring of characteristic zero containing the `exp(G)`-th roots of unity with residue characteristic `p`.

**Witness:** Base §1.1: “All later layers use this system”; base §7.2 passes only “to the system of §1.1”, `k` being “finite, hence perfect”. `S₃`, `p = 2`, `O` the Gauss completion of `ℤ₂[ζ₃][T]`, `k = 𝔽₄(T)`: admitted here, uncovered there.

**Repair:** Align the system with the supplier, in Conventions and in the plan hypotheses of Layers 6–9:

1. Conventions, Blocks: `(K, O, k)` is the splitting system of base §1.1 at a place `v` of `F = ℚ(ζ_e)` over `p`; every place is allowed, and `F → K` is the canonical map of base §1.1. Keep the description of `O`, `m`, `K`, `k` as properties of that system.
2. §9.1: quantify the property over every finite group `G`, every place `v` of `F` over `p` (equivalently every maximal ideal `M ∋ p` of the algebraic integers, base §4.2 `SameBlock`) and every block; same in §9.2.
3. §6.3, third API bullet, and the §9.1 API bullet: replace “do not depend on the splitting `p`-modular system (base §2.4)” by what the cited inputs prove: for `σ ∈ Gal(F/ℚ)` the blocks at `σv` are the `σ`-images of the blocks at `v` (the central-character congruence of base §4.2 transported by `σ`), with the same defect classes and defect groups, so `h_{σv}(σχ) = h_v(χ)`; as the Galois group is transitive on the places over `p`, the height zero and Alperin–McKay properties hold at one place exactly when they hold at every place. *Needs:* base §§1.1, 4.2, 6.2.

An acceptable alternative keeps arbitrary systems and adds a comparison target (an arbitrary splitting system with a chosen `F → K` has the same `Irr(B)`, defect groups and heights as the base system at the place under `m`, by base `exists_blockIdempotent_iff_centralCharacter_congr` and the scalar extension of base §6.2), listed in the *Needs:* of §§8.1 and 9.1. Do not leave §8.1 citing base §7.2 at a generality it does not state.

**Repair test:** On the witness: the only place of `ℚ(ζ₃)` over `2` gives the base system `K = ℚ₂(ζ₃)`, `k = 𝔽₄`; its blocks are `{1, sgn}` and `{std}` (`3 ≡ −3`, `3 ≢ 0` modulo `m`), with defect groups `C₂` and `1`; base §7.2 applies and gives `std(t) = 0`, as §8.1 states. For repair 3: `C₇`, `p = 2`, `F = ℚ(ζ₇)` has two places over `2` (the order of `2` modulo `7` is `3`), exchanged by `σ : ζ₇ ↦ ζ₇³`; the block `{χ}` at `v` goes to `{σχ}` at `σv`, both of defect zero and height `0`.

## R02 (P3) — The compatibility law of §4.5 is not well-formed for an arbitrary family

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:804`–805: “`π(Γ, S)(χ) = π(C_Γ(T), S/T)(π(Γ, T)(χ))` for every `T ⊴ S`, where `π(Γ, T)(χ)` is `S/T`-invariant by §4.4”; plan 4.5 statement.

**Claim:** The uniqueness statement ranges over all assignments satisfying the two properties.

**Witness:** §4.4 proves invariance for the constructed `Λ` only. For an arbitrary assignment and `T` not a `p`-group (`S = C₆`, `T = C₆`, or `T = C₂ × C₃ ⊴ S`), nothing makes `π(Γ, T)(χ)` an element of `Irr_{S/T}(C_Γ(T))`, the domain of `π(C_Γ(T), S/T)`.

**Repair:** State the law as a conjunction: for every `T ⊴ S` and `χ ∈ Irr_S(Γ)`, `π(Γ, T)(χ)` is `S/T`-invariant and `π(Γ, S)(χ) = π(C_Γ(T), S/T)(π(Γ, T)(χ))`. Say that §4.4 gives the invariance for the constructed family. Mirror it in plan 4.5. Tested on the uniqueness induction: for `S = C₆` and `T = C₃` of index `2`, the law gives `π(Γ, C₆) = π(C_Γ(C₃), C₂) ∘ π(Γ, C₃)`, both factors fixed by the `p`-group property; for `T = S` it reads `π(Γ, S) = π(C, 1) ∘ π(Γ, S)` with `π(C, 1) = id` (multiplicity `1`, prime to every `p`).

## R03 (P3) — Two descriptions of the base no longer match its head

**Location:** `packages/ModularCharactersAndBlocksPartII/design/README.md:199` (“`λ_B : Z(k[G]) → k` is the central character of a block (base §7.1)”) and lines 308–310 (“The base's product form of the first main theorem is stated over an algebraically closed field and is not consumed”).

**Claim:** Base §7.1 introduces `λ_B`, and states the product form over algebraically closed fields only.

**Witness:** Base head, §6.2: “so `B` has a **central character** `λ_B : Z(k[G]) → k`”; §7.1 opens “(§6.2)”. Base §7.1, second bullet: “The same rule is a bijection … over every field `k` of characteristic `p` that splits `G` and all its subgroups”.

**Repair:** Cite base §6.2 for `λ_B` (Conventions, the §6.2 and §7.1 contract bullets, and the `*Needs:*` of §6.1 already lists §6.2). Reword the §7.1 contract sentence: “The base's `brauer_first_main` is stated over an algebraically closed field; its form over a field splitting `G` and all its subgroups (base §7.1) agrees with the Brauer correspondent of Conventions, which is taken from §6.2.” The `S₃`, `p = 2`, `𝔽₄` witness of Conventions is unchanged by either edit.

## Verified sound

### Round-4 findings, checked first

- **R01 (valuation at zero) — repaired.** Lines 186–190: “`ν_p = padicValRat p` on rationals; both send `0` to `0` … `q ∈ m` exactly when `q = 0` or `ν_p(q) > 0`. Witness at `p = 2`: `0 ∈ m` although `ν_p(0) = 0`; `3/2 ∉ O` …; `2/3 ∈ m`”. Pin: `padicValRat.zero`, `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:144`. Pattern: the only other rational membership test (§6.2 route, `|𝒞|/χ(1) ∉ m`) has a nonzero argument.
- **R02 (prohibited supplier) — repaired.** No occurrence of the prohibited roadmap in README or plan. Lines 105–106 and 327–331 import “InverseGaloisAndArithmeticFundamentalGroups IG.3.4, target *Conjugacy of coprime complements*”; §1.2 (lines 423–438) proves the fixed-point lemma from complements. The target exists at that roadmap's head under IG.3.4 (“any two complements `H` and `K` of `N` are conjugate by an element of `N`”, with `N` or `G/N` solvable). The fix report's correction is right: that roadmap is a new-roadmap pull request earlier in the merge order, not on main; it is a permitted supplier.
- **R03 (two-series Check) — repaired.** Lines 736–744: “`S = C₁₅ = C₃ × C₅` acting on `Γ = Q₈ × C₁₁` (`gcd(15, 88) = 1`) …”, and §4.3 line 777. Recomputed below.
- **R04 (identity element) — repaired.** Lines 478–480: “each nonidentity element fixes four vectors and four characters and the identity fixes eight of each … both orbit counts are `(8 + 4 + 4 + 4)/4 = 5`”.
- **R05 (covering and domination) — repaired.** §7.3 (lines 1106–1148) now defines domination for any `N ⊴ G` and proves it here; the §8.1 contract (lines 313–316) limits the base to normal `p`-subgroups, which is what base §8.1 states. For covering the fix report's dispute is upheld: base §8.2 reads “Block covering, for an arbitrary normal subgroup `N` of `G`” with Martínez Definition 7.3 and Theorem 7.7 in both forms, as the contract (lines 317–323) says.
- **R06 (algebraic closure) — repaired.** Lines 191–199 define `ω_χ` over `K` by its values and prove the algebra-homomorphism property in §6.1 (lines 913–922) through the native map over `ℂ` (`[IsAlgClosed k]` at `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean:82`). The Brauer correspondent is `e_{b'} = Br_D(e_B)` (lines 179–185); base §6.2's last bullet states it “Over a field `k` of characteristic `p` that splits `G` and all its subgroups”, and base §7.1 gives `Br_P(e_B) = ∑_{b^G = B} e_b`. R03 above records the residue of this repair; R01 above is the same pattern (supplier hypothesis narrower than the consumer's) on a different hypothesis.
- **R07 (defect classes) — repaired.** Lines 47–48 and 929–932: “the defect classes of `B` (base §6.2: the classes `𝒞` with `a_B(𝒞) λ_B(𝒞⁺) ≠ 0`) exist … and consist of `p`-regular elements”; contract lines 294–296: “this roadmap does not redefine them”. Base §6.2 defines “A **defect class** of `B`” with that predicate. Plan 6.1 has no defect-class definition entry.

No round-4 finding was marked not actionable.

### Principles, shape and structure

Read the whole README (1423 lines) and the plan (35 targets, 9 layers, 4 suppliers, 1 gap). Nine layers, each ending with Examples and Dependencies; 35 `*Needs:*` paragraphs and 35 Checks lists, one per subsection; every plan target has at least three tests (minimum 3, maximum 4). Layers are named by their mathematics; the order cyclic → solvable → degrees and heights → normal subgroups → normal defect is forced by the dependency lines (§4.1 needs §3.2, §4.2 needs §3.4, §7.4 needs §§6.2–7.2, §8.3 needs §§7.6, 8.2). No README sentence says it follows a source. No LaTeX delimiters, machine paths, pull-request numbers, process words, algorithms, `set_option` or sorry'd data. The plan and README agree on the repaired targets 1.2, 1.3, 3.1, 4.1, 4.3, 6.1, 6.4, 7.3, 9.2 (statements, prerequisites, tests read side by side).

### Sources: the 15 sampled targets

No locator is flagged unverified by the author. All ten cached texts were opened at the cited lines.

| Target | Lines read | Result |
|---|---|---|
| 1.1 | glauberman line 94 (p. 1467); hartley-turull line 302 (p. 182) | The conjugate of a character and invariance; Glauberman writes operators on the right, the README on the left, the invariant set is the same. |
| 1.3 | glauberman lines 354–358 (p. 1473) | Brauer's theorem for a cyclic operator group: fixed characters equal fixed classes. isaacs Theorem 6.32 uncertified. |
| 2.1 | glauberman lines 100–112 (Theorem 1, p. 1467) | Absolutely irreducible `R`, `|A|` prime to the degree, twists equivalent, unique `R*` with determinant `1` on `A`. The README's “all endomorphisms scalar” is the only property the proof uses (recomputed below). |
| 2.4 | glauberman lines 240–243 (Theorem 2 (c)) | Both directions of the bijection through `GA/G`. isaacs Corollary 6.17 uncertified. |
| 4.4 | glauberman lines 601–629 (Corollaries 7–9, pp. 1479–1480) | Equivariance, bijectivity, both counts and the nontrivial fixed character. |
| 4.5 | glauberman lines 537–543 (Theorem 4), 630–635; spath-vallejo lines 118–130 (pp. 278–279) | `p`-group congruence; the law `π(G, A) = π(T, A/B) ∘ π(G, B)` for `B ⊴ A`. navarro-2018 uncertified. |
| 6.1 | martinez lines 351–374 (pp. 9–10), 414 (Prop. 2.3), 512–515 (Prop. 2.5), 566 (Cor. 2.7), 694–699, 756–761 | Central characters, Osima, integrality and vanishing of the coefficients, existence and `p`-regularity of defect classes. |
| 6.4 | martinez lines 718–726 (§3.2, p. 18), 583–586 (Theorem 2.8) | Heights and the defect-zero criterion; the source's slip at line 725 is not imported. |
| 7.1 | martinez lines 710–713 (Theorem 3.3), 984–996 (Lemma 4.4) | Both containments in the stated direction; induced blocks. |
| 7.3 | martinez lines 1895–1897, 1904–1910, 1914–1927, 1928–1932 (pp. 51–52) | Unique dominating block, the idempotent criterion, `λ_{B̄} ∘ π = λ_B`, Theorem 8.5 (i) and (ii), all for arbitrary `N ⊴ G`. |
| 7.5 | martinez lines 2161, 2222–2224, 2265–2268, 2279–2280, 2288–2294 | Regularity, its two criteria, unique covering, Fong's theorem with `G`-invariant `b` and maximal defect. |
| 7.6 | martinez lines 1985–1988 (Theorem 8.8), 2295–2296 (Theorem 9.6); sambale lines 499–502 (Theorem 1.18) | Orbit, defect group, Brauer correspondent, the prime-to-`p` index condition. |
| 8.3 | reynolds lines 531–540 (Theorem 8, p. 30) | The height formula; Schur's degree theorem is the step at line 538, declared as the gap. |
| 9.1 | martinez lines 2321–2322; mnst lines 48–73; kessar-malle lines 22–26; ruhstorfer lines 25–34 | Predicate and the three cited theorems. |
| 9.2 | ruhstorfer lines 16–20; martinez lines 2360–2361 | The conjecture with the Brauer correspondent in `N_G(D)`; Theorem A at `p = 2`. |

Also read reynolds lines 542–543 (Theorem 9). `sources.toml` parses; 15 entries with distinct keys (10 certified, 5 uncertified), every work of the References has one; no entry was added or changed.

### Adversarial pass (computed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, valuation | `p = 2`: `0, 3/2, 2/3, 1` | `ν_p = 0, −1, 1, 0`; in `m`: T, F, T, F; `q = 0 ∨ ν_p > 0`: T, F, T, F | holds |
| Conventions, Brauer correspondent | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; `D ⊴ G` | `Br_D(1 + r + r²) = 1`, `Br_D(r + r²) = 0`; `Br_1 = id`, `b' = B`; `N_G(D) = G`, `b' = B` | holds |
| 1.1 action | `C₇`, `r ↦ r²`; `Q₈` with `C₃` | `s⁻¹ • r = r⁴`, value `ζ₇⁴` against the wrong `ζ₇²`; invariant characters `{1, χ₂}`, `C = {±1}` | holds |
| 1.2 route (new) | general; `A₅` on `𝔽₇⁵`; swap on `C₂²`; inner `C₂` on `S₃` | `x⁻¹ s x · ω = x⁻¹ s (xω) = ω`, so both complements lie in `M`; `[xy, s] ∈ inl(X) ∩ inr(S) = 1`. Constant vector `3c`: `15c = c` in `𝔽₇`. Coset `{(1,0),(0,1)}`: `0` fixed points. Three invariant classes against two classes of `⟨t⟩` | holds under its hypotheses; controls fail as stated |
| 1.3 permutation lemma | `1, a, b, ab` on `𝔽₂³` | fixed vectors `8, 4, 4, 4` (`v₂ = 0`; `v₃ = 0`; `v₂ + v₃ = 0`); fixed characters `8, 4, 4, 4` (`w₁ = 0`); common `2` and `4`; orbits `20/4 = 5` each | holds |
| 2.1 normalised extension | general; `Q₈` with `C₂ = ⟨i⟩`; `A = 1` | `c^n = e(b)e(c)/e(bc)`, `c^r = d(b)d(c)/d(bc)`, so `c = c^{in + jr}` is a coboundary with no roots of unity needed; determinant character `δ` of order dividing `n`, `h = δ^{−r'}` with `r r' ≡ 1 (mod n)`. Uniqueness: `h^n = h^r = 1`. `Q₈`: `S = ±√−1 ρ(i)`, `det = (−1)·1 = −1`, `gcd(2, 2) = 2` | holds over every field; coprimality needed |
| 2.2 canonical extension (headline) | `SL(2,3)`; `S₃` | eigenvalues `ω, ω²`: trace `−1`, det `1`; twist by `λ`: det `λ² ≠ 1`; `1_{C₃}` extends to `1` (det `1`) and `sgn` (det `−1`) | holds |
| 2.4 Gallagher (headline) | `SL(2,3)` over `χ₂`; `Q₈` over the faithful character of `Z`; `N = G`, `N = 1` | `3 = |Irr(C₃)|` extensions; `1` character over `θ` against `4 = |Irr(Q₈/Z)|`, no extension; `{θ}`; identity | holds; hypothesis needed |
| 3.1 cosets | `SL(2,3)`; `D₈` | `(a(−1))⁴ = a`, order `3`; centraliser `6 = 3 · 2`, classes of size `4`; reflections `{a, ax²}`, `{ax, ax³}` | holds |
| 4.1/4.3 two series | `C₁₅` on `Q₈ × C₁₁` | `gcd(15, 88) = 1`; `3^k mod 11 = 3, 9, 5, 4, 1`; `C_Γ(C₃) = {±1} × C₁₁`, `C_Γ(C₅) = Q₈`, `C = {±1}`; both series end at `χ₂ × 1` | holds |
| 4.2 `p`-group case (headline) | `SL(2,3)`; `3^{1+2}` with `C₂` | `(2 sgn + sgn)/3 = sgn`; `(3ω − ω)/2 = ω` | holds |
| 4.4 count (headline) | `Q₈, C₃`; `C₇, C₃` | `2 = 2 = 2`; `1 = 1 = 1` | holds |
| 4.5 unique family (headline) | swap on `C₃²`; swap on `C₂²`; `T = S`; `S = 1` | `(ψ_a × ψ_a)(r, r) = ζ₃^{2a}`, correspondent `ψ_{2a}`, multiplicity `1`; two invariant characters both restrict to `1`: no injection; `π(C, 1) = id`; identity | holds; R02 on the form of the law |
| 5.1 degree relation (headline) | `SL(2,3)`; `3^{1+2}`; `θ = 1`, `C ≠ Γ` | `2 ∣ 4`; `3 ∣ 9`; class of `a` has size `|Γ : C|`, `χ̂(a) = ±θ*(1)`; reverse `|Γ : C| ∤ 1` | holds |
| 6.1 central characters, Osima, defect classes | `S₃`, `p = 2`; `C₃` over `ℚ₂(ζ₃)` | coefficients of `B₀`: `1/3, 1/3, 0 → 1, 1, 0`; of `{std}`: `2/3, −1/3, 0 → 0, 1, 0`; `λ_{B₀} = 1, 0, 1`; defect classes `{1}` and `{r, r²}`; Osima at `x = r`: `1 · 2/6 = 1/3`; `ζ₃ · ζ₃² = 1` | holds |
| 6.2 Brauer heights (headline) | `S₃`, `p = 2`; `A₅`, `p = 2`; `SL(2,3)`, `p = 3` | `min ν = 0 = 1 − 1`, `1 = 1 − 0`; `0 = 2 − 2`, `2 = 2 − 0`; `ν₃(2) = 0 = 1 − 1`, `ν₃(3) = 1 = 1 − 0` | holds |
| 6.4 special blocks | `S₃`; `A₅` and `A₄`; `SL(2,3)`, `p = 3` | `2` odd degrees; `4` and `4` (`|A₄ : V₄|₂ = 1`); `3` and `3` in `C₆` | holds |
| 7.1 Min–Max | `S₃` at `2` and `3` | `p = 2`: `λ(T) = 3 ≡ 1`, `D_t = C₂ ⊇ D_B`; `a(R) = 1`, `D_r = 1 ≤ C₂`. `p = 3`: `λ(T) = 3 ≡ 0`, `λ(R) = 2 ≠ 0`, `D_r = C₃` | both directions hold |
| 7.2 covering iff `e_B e_b ≠ 0` (contract) | orbit sum `f`; `S₃`, `C₃`, `p = 2` | `e_B f = e_B` or `0`; `e_B e_{b^g} = (e_B e_b)^g`; `e_α + e_{α²} = r + r²` | holds |
| 7.3 domination (new) | `S₃`, `C₃`, `p = 2` and `3`; `S₃ × C₂`, `N = S₃ × 1`; `N = G` | images `(1, 0)`; `1 = e₊ + e₋`; `(1, 0)`; augmentation `(1, 0)`. Exactly one dominating block each time. `π(Tr_D^G a) = |N : N ∩ D| Tr_{DN/N}^{G/N}(ā)`: fibres of `G/D → G/DN` have `|DN : D| = |N : N ∩ D|` elements; factors `3` and `1`, units | holds; no bijection at `p = 3` |
| 7.3 `λ_{B̄} ∘ π = λ_B` | `S₃`, `C₃`, `p = 2` | on `1, R, T`: `1, aug(2) = 0, 1` against `1, 2 ≡ 0, 3 ≡ 1` | equal |
| 7.4 Fong–Reynolds (headline) | `S₃`, `C₃`, `p = 2`; `S₄`, `V₄`, `p = 3` | heights `0 = 0`; `T = D₈`, index `3`, two linear extensions inducing to degree `3`, `ν₃`: `0 → 1`, defects `0 → 0` | holds |
| 7.5 regular blocks, Fong | `S₃`, `C₃`, `p = 2` and `3` | `λ_{B₀}(T) = 1 ≠ 0`: not regular; `λ_{std}(T) = 0`: regular; `|G : PN| = 2`, `P ∩ N = C₃` | holds |
| 7.6 extended first main | `S₃`; `S₄`, `P = V₄`, `p = 2` | indices `1` and `2`; `|S₄ : V₄| = 6` even and the block has defect `D₈` | index condition needed |
| 8.1 vanishing | witness of R01 | the base's two hypotheses on `k` both fail for `𝔽₄(T)`; conclusion `std(t) = 0` still true | R01 |
| 8.3 height formula | `SL(2,3)`, `p = 2`; general | `ν(χ(1)) ≥ ν(|G : T|) + ν(|N : D|) + ν(ξ(1)) = ν(|G : D|) + ν(ξ(1))` since `p ∤ |T : N|`; heights `0, 0, 0, 1, 1, 1, 0` | holds, conditional on the gap |
| 8.4 Reynolds (headline) | `D₈`; `C₂²`; `D = 1` | heights `0, 0, 0, 0, 1`, nonabelian; all `0`, abelian; one character | both directions hold |
| 9.1 predicate | `S₃`; `S₄`, `p = 2`; `G = 1`; `C₇`, `p = 2`, two places | all `0`, cyclic; height `1`, `D₈`; one block; heights `0` at both places | holds; quantifier in R01 |
| 9.2 predicate (headline) | `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `2 = 2`; `4 = 4`; `3 = 3` twice | holds |
| Gap `clifford-multiplicity-dvd-index` | `N = G`; `Q₈ ⊵ Z`; nonnormal `C₂ ≤ S₃` | `1 ∣ 1`; `2 ∣ 4`; `2 ∤ 3` | precise; normality needed |

For §§2.3, 3.2–3.4, 4.6, 5.2, 6.3, 8.2 I recomputed the Checks while reading (values `2, −2, 0, −1, 1`; `ε = −1`; `(2 sgn + sgn)/3`; `ψ_{4a} = ψ_a`; `1 ∣ 2`, `2 ∤ 1`; heights `0, 0, 0, 1, 1, 1, 0`; `θ_ξ(1) = θ(1) ξ(1)`) and found no disagreement with the theorems of their sections; round 4's rows for them carry the same values.

### Pins and citations resolved

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (the plan's). Opened at the pins:

| File | Declaration and line |
|---|---|
| `Mathlib/Algebra/Group/Action/Basic.lean` | `arrowAction`, 103 |
| `Mathlib/GroupTheory/SemidirectProduct.lean` | `inl_aut`, 138; `range_inl_eq_ker_rightHom`, 175 |
| `Mathlib/GroupTheory/SchurZassenhaus.lean` | `exists_right_complement'_of_coprime`, 277 (existence only) |
| `Mathlib/GroupTheory/Complement.lean`; `GroupAction/Defs.lean` | `IsComplement'`, 53; `MulAction.stabilizer`, 515 |
| `Mathlib/GroupTheory/GroupAction/OfQuotient.lean` | the instance on `FixedPoints.subgroup H α`, 62 |
| `Mathlib/GroupTheory/Subgroup/Centralizer.lean` | normaliser action, 177; `normalizerMonoidHom`, 186 |
| `Mathlib/RepresentationTheory/Induced.lean`; `Character.lean` | `Rep.indResAdjunction`, 155; `isIntegral_character`, 102 |
| `Mathlib/Data/ZMod/Basic.lean`; `NumberTheory/Padics/PadicVal/Basic.lean` | `ZMod.chineseRemainder`, 889; `padicValRat.zero`, 144 |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean` | `irreducibleCharacters`, 114; `mem_irreducibleCharacters_iff`, 123; `card_irreducibleCharacters`, 181; `characterTable`, 337; `sum_characterTable_mul_conj`, 585 |
| `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean`; `Degree.lean` | `centralCharacter`, 89 (`[IsAlgClosed k]`, 82); `finrank_dvd_card`, 117 (algebraically closed, characteristic zero) |
| `TauCeti/RepresentationTheory/CharacterTable/ClassSum/Basis.lean`; `ClassSum/Basic.lean`; `CentralIdempotent.lean`; `VirtualCharacter.lean`; `Pairing.lean`; `FieldOfValues.lean`; `Cyclotomic/Action.lean` | `classSumCenter`, 76; `classSum`, 31; `primitiveCentralIdempotent`, 301; `virtualCharacters`, 127; `characterPairing`, 48; `characterField`, 44; `cyclotomicIrreducibleCharacterAction_apply`, 201 |
| `TauCeti/RepresentationTheory/Induction/Conjugate.lean`; `Inertia.lean` | `char_conjFDRep`, 485; `conjNormalFDRep`, 683; `conjNormalFDRep_ρ`, 836; `inertia`, 94; `mem_inertia_iff`, 100; `le_inertia`, 111 |
| `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean`; `Decomposition.lean`; `Dimension.lean`; `Classes.lean`; `Obstruction.lean` | `isSemisimpleRepresentation_comp_subtype`, 327 (no closure or unit hypothesis); `clifford_restrict_character`, 305; `clifford_restrict_dvd_finrank`, 113 (divides out the multiplicity `e`; does not bound `e`, so the gap is not already provided); `cliffordCorrespondence`, 125; `IsProjectiveInertiaExtension`, 87; `cliffordObstruction`, 304 (algebraically closed) |
| `TauCeti/GroupTheory/SemidirectProduct.lean` | `range_monoidHomSubgroup`, 33 |

Cross-roadmap citations, resolved now:

- ModularCharactersAndBlocks at the head of its open pull request (a new roadmap): §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2 all exist; read §§0.2, 1.1, 1.3, 2.1, 2.3, 2.4, 4.1, 4.2, 5.1, 6.2, 6.3, 7.1, 7.2, 8.1, 8.2 in full. The names `existsUnique_blockIdempotent_map_residue`, `IsDefectGroup`, `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero` are there. Differences: R01 and R03.
- InverseGaloisAndArithmeticFundamentalGroups at the head of its open pull request (a new roadmap, earlier in the merge order): IG.3.4, target *Conjugacy of coprime complements*, with the hypotheses the contract quotes.
- CharacterTheory on main: §§2.1, 3.5, 3.6, 4.3, 4.4 exist; `fieldOfValues_eq_map_fixedField_stabilizer` is the §4.4 target.
- InductionRestriction on main: Layers 1, 2, 5, 7 exist; Layer 7 states no degree divisibility. The gap `clifford-multiplicity-dvd-index` is precise (one statement with its hypotheses), minimal (not at the pins, not on main, not in InductionRestrictionPartII, whose README I searched for degree divisibility) and declared under the same slug in README and plan with supplier and section.

Dependency gate, run on the candidate:

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after InverseGaloisAndArithmeticFundamentalGroups (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 229 roadmaps, 2061 edges, 0 problem(s)
```

No UPWARD and no CYCLE line. The note concerns the base, which is not in the merge order yet; not a finding at the design stage.

### Ownership and overlaps

Read the board package index first. Searched main and the open heads by object with the roadmap tools: Gallagher's correspondence, canonical extension, Glauberman correspondence, Glauberman's lemma, coprime action, permutation lemma, Fong–Reynolds, Osima, height zero, domination of blocks, Min–Max, Alperin–McKay. No other owner of the correspondence, the height theorems, general domination or the predicates. Three leads read and cleared: OddOrderTheorem §1.3 (coprime action: commutator and centraliser statements, not the class and coset statements of §1.2 here); FiniteGroupExtensionSplitting on main (complements of abelian normal subgroups; it leaves conjugacy of coprime complements to another roadmap and does not state it); FiniteGroupInvariants §6.2 (the permutation lemma for the Galois action, which Scope cites and §1.3 does not restate). The fixed-point lemma for a coprime action on a transitive set appears otherwise only in the roadmap that may not be cited; it is proved inside the §1.2 route and is not a separate target, which is acceptable.

The overlap report lists no other pull request changing this roadmap, no dropped id and no id defined only by an open revision; its five closest roadmaps were read for ownership as above.

### Headlines and the acceptance file

Headlines from the Summary and *How to read the build*: canonical extension (§2.2), Gallagher's correspondence (§2.4), the `p`-group characterisation (§4.2), the counting theorem (§4.4), the Glauberman bijection with its constituent, field and degree properties (§§4.5–5.1), Brauer's theorem on heights (§6.2), Fong–Reynolds with heights (§7.4), Reynolds' theorem (§8.4), and the two predicates (Layer 9). This is the design lane: the package has no `Suggested.lean`, so there was nothing to probe for padding, no `#check @name` comparison and no import audit. Elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run and no build is claimed.

## Not verifiable

- `isaacs` (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), `isaacs-1973`, `navarro-1998` (Chapter 3, Theorem 5.9), `navarro-2018` (Chapter 2), `feit` (Chapter IV): settled as uncertified, cited by locator, texts not available and not requested again.
- Published pagination of kessar-malle, mnst and ruhstorfer: the cached texts are preprints; the cited statements are at the listed lines of those versions.
- Lean elaboration and the one-tactic probe: no acceptance file at the design stage.

## Source issues

- **Misprint** in martinez at §3.2, printed p. 18 (martinez line 725): the source says a character has height zero when the block's numerical defect equals the `p`-part of its degree; it should be that the `p`-part of the degree equals `p` to the power `a − d(B)`; affects a stated result.
