# Review of GlaubermanZStar (pull request #1778 at 1a0a2cf)

**Verdict:** needs changes

The previous review's findings are repaired: R01 (the vacuous alternative and `ZStarConclusion` are gone; `Suggested.lean` has five declarations), R02 (gate `imports=0 mathlib-subimports=0 no-import-mathlib=0 build=0 OK`), R03 (house shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–5 with `### k.n`, `*Needs:*`, Checks, Examples, Dependencies, Downstream consumers, References), R04 (locators: Waldecker Lemma 3.1, Hypothesis 4.1, Lemmas 4.2–4.4, Theorems 2.19–2.20; GTT Theorem 5.1; Brauer–Suzuki p. 1757; Glauberman Theorem 1 uncertified), R05 (no pull-request number, no process lines; the AxiomMath licence is Apache-2.0 at commit `69cb972f`, checked), R06 (every Lean name is in the README, docstrings on all declarations, module docstring in the required form), R07 (quaternion convention in Conventions and §2.1 Checks; the probe `(xa 0)⁻¹ (a 1) (xa 0) = (a 1)⁻¹` in `QuaternionGroup 2` closes by `decide`). What remains is one blocking defect in Layer 2 and four notes.

## R01 (P2) — §2.5 names the Brauer–Suzuki contradiction colloquially and lists inputs that do not determine it

**Location.** `TauCetiRoadmap/GlaubermanZStar/README.md` lines 553–561: "derive the congruences modulo four and modulo eight satisfied by the degrees … and derive the contradiction that ends Suzuki's Example 3; the degree arithmetic is a target here, with §2.4 as its inputs. … *Needs:* §2.1–§2.4, §1.1, §1.2."

**Claim.** The contradiction follows from the signed decompositions of §2.4 and their values at `1`, at `z` and on `K`.

**Witness.** (1) The §2.4 inputs alone do not close even the two-constituent case. Write `Ind β_j = 1 + ε₁ψ₁ + ε₂ψ₂`, `d_i = ψ_i(1)`, `e_i = ψ_i(z)`. The values at `1` and `z` give `1 + ε₁d₁ + ε₂d₂ = 0` and `1 + ε₁e₁ + ε₂e₂ = 0`, so (up to swapping) `d₂ = d₁ + 1`, `e₂ = e₁ + 1`; with `|e_i| ≤ d_i` this is satisfiable (`d₁ = e₁ = 1`, `d₂ = e₂ = 2`), so no contradiction is available from these values. The argument needs a further identity: for `k ∈ K`, `k` is not a product of two involutions (an involution `x` inverting `k` would generate with `k₂` a dihedral `2`-group of order `≥ 8` inside a generalized quaternion Sylow subgroup, which has one involution), so the structure constant `a_{zz}^{k} = 0`, hence `∑_χ χ(z)² χ(k)/χ(1) = 0` on `K` and, pairing with `Ind β_j` (supported on the conjugates of `K`), `1 + ε₁e₁²/d₁ + ε₂e₂²/d₂ = 0`. On the two-constituent data this reads `(d₁ − e₁)² = 0`, so `z ∈ ker ψ₁ ∩ ker ψ₂`; the contradiction then needs the values on `K` and a reduction of `G` (a normal subgroup containing `z` and an induction on `|G|`), none of which §2.5 states. Numerical control: `SL(2, 3)`, `Ind f = 1 + λ + λ̄ − ψ₃`: `1 + 1 + 1 − 9/3 = 0`, consistent. (2) The formalization the README cites as prior art (`example_3.lean` at `69cb972f`) carries exactly these extra steps: a structure-constant identity `1 + ∑ ε_i χ_i(t)²/χ_i(1) = 0`, lemmas `chi 1 − chi t = 4c`, a `mod 4` degree lemma under `8 ∣ …`, stages assuming `IsSimpleGroup G` with an induction hypothesis over smaller groups, and a split `|Q| = 8` versus `|Q| ≥ 16`. (3) The source for the route, Suzuki *Group Theory II* Example 3, is settled `uncertified`, so an implementer has only the README's description, which does not say what to prove.

**Repair.** State the targets. In §2.3 add: no element of `K` is a product of two involutions of `G` (route as in the witness). In §2.5 replace the colloquial sentence by the explicit statements, each a target: (i) for `k ∈ K`, `∑_{χ ∈ Irr G} χ(z)² χ(k)/χ(1) = 0` (CharacterTheory §1.1 structure constants, §4.3 central characters: `a_{zz}^{k} = (|Cl z|²/|G|) ∑_χ χ(z)²χ(k)/χ(1)`); (ii) for each signed decomposition `Ind ζ = 1 + ∑ ε_i ψ_i` of §2.4 (`ζ = β_j` or `f`), the three relations `1 + ∑ ε_i ψ_i(1) = 0`, `1 + ∑ ε_i ψ_i(z) = 0`, `1 + ∑ ε_i ψ_i(z)²/ψ_i(1) = 0`; (iii) `4 ∣ ψ(1) − ψ(z)` for every irreducible `ψ`, since the element `u` of order four in `U` is inverted by `xa 0`, so `ψ(u)` is real and the `−1`-eigenspace of `z = u²` has even dimension; (iv) the reduction: a counterexample of least order with `O(G) = 1` and `z ∉ Z(G)`, what it gives for a proper normal subgroup containing `z` and for `G ⧸ ⟨z^G⟩`, and the two cases `n = 3` and `n ≥ 4`; (v) the degree arithmetic in each case, with the congruences written out. Add CharacterTheory §1.1, §4.3 to the `*Needs:*` line. If a certified text is wanted for the ordinary-character proof, Glauberman, *On groups with a quaternion Sylow 2-subgroup*, Illinois J. Math. 18 (1974) 60–65, DOI 10.1215/ijm/1256051349, is open access on Project Euclid (see Not verifiable: the fetch was blocked by the site, so it is named here, not checked).

## R02 (P3) — §0.3 proves Lemma 3.1 (3) only when `k` is even

**Location.** `README.md` lines 263–267: "if `m = 2k` with `k` even, then `a (a b)^k = … ` is a conjugate of `a` … hence `a` is not isolated; consequently … if `w` is conjugate to `t`, then `orderOf (t w)` is odd (Lemma 3.1 (3))"; §0.1 line 201–202 says "the proof is in §0.3". Waldecker gives no proof ("(1)–(3) are straightforward", `waldecker2013` line 669).

**Claim.** The bullets of §0.3 prove that `t w` has odd order when `w` is a conjugate of the isolated involution `t`.

**Witness.** They exclude `m = 2k` with `k` even only. For `k` odd: `D₁₂ = ⟨a, b⟩` with `a b` of order `6`, `k = 3`: `a (a b)³` is an involution commuting with `a`, distinct from `a`, and it is a conjugate of `b` (the reflections `a (a b)^(odd)` form the class of `b = a (a b)`), not of `a`. So if `w = b` is conjugate to `t = a` in `G`, then `a (a b)^k` is a `G`-conjugate of `t` commuting with `t`, against isolation; this case is not in §0.3.

**Repair.** Add the bullet: "if `m = 2k` with `k` odd, then `a (a b)^k = (a b)^(-(k-1)/2) b (a b)^((k-1)/2)` is a conjugate of `b` in `⟨a, b⟩`, distinct from `a`, commuting with `a`; hence if `b` is conjugate to `a` in `G`, `a` is not isolated", and derive Lemma 3.1 (3) from the two bullets together.

## R03 (P3) — InductionRestriction Layer 5 is cited for inflation, which it does not state

**Location.** `README.md` lines 57–58, 159–160, 507–508 ("inflated to `H`, InductionRestriction Layer 5"), 577.

**Claim.** InductionRestriction Layer 5 supplies Clifford theory and inflation of characters from a quotient by a normal subgroup.

**Witness.** `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md` on main (`929496d`): Layer 5 (line 607) is Clifford theory over a normal subgroup; the word "inflation" occurs nowhere in the file. Clifford theory is used by no target of this roadmap. ModularCharactersAndBlocks M8 at `#1775` states "the ordinary and Brauer character inflation laws" for a normal `p'`-subgroup, which is the case used (`O(C) ⊴ H`, odd order).

**Repair.** In §2.4 cite ModularCharactersAndBlocks M8 for inflation along `H → H ⧸ O(C)` (or own the pull-back of a class function along `QuotientGroup.mk'` as a one-line definition in §2.4); remove "Layer 5: Clifford theory and inflation" from the InductionRestriction contract, the Scope list and the Layer 2 Dependencies.

## R04 (P3) — §1.2's last route asserts that `H̄` is generated by the conjugates of `t̄`

**Location.** `README.md` lines 355–359: "the image of `H` is generated by the conjugates of `t̄`, all central in `H̄`, so `H̄` is elementary abelian".

**Claim.** For a normal `H ⊇ t^G` with `t ∈ Z*(H)`, `H ⧸ O(H)` is generated by the conjugates of `t̄`.

**Witness.** `G = S₃ × C₂`, `t = ((12), 1)`, `H = G`: `t^G` generates `S₃ × 1 ≠ H`. The statement of the bullet is true anyway: the conjugates of `t̄` lie in `Z(H̄)`, which is characteristic in `H̄` and so normal in `Ḡ`, hence they commute with `t̄`, and isolation of `t̄` finishes.

**Repair.** Replace the sentence by "every conjugate of `t̄` lies in `Z(H̄)`, a characteristic subgroup of the normal subgroup `H̄`, so commutes with `t̄`".

## R05 (P3) — §1.1 attributes its Sylow argument to GTT (vi) ⇒ (vii)

**Location.** `README.md` lines 325–328: "(this is the argument of Theorem 5.1, (vi) ⇒ (vii))".

**Claim.** The conjugacy-of-Sylow-subgroups argument for (d) ⇒ (c) is the one in Guralnick–Tong-Viet–Tracey.

**Witness.** `guralnick_tongviet_tracey2024` lines 827–830: (vi) ⇒ (vii) is deduced from "[19, Lemma 7.7]" (the lifting of centralizers of a central `p`-subgroup), not by the Sylow argument. The README's own argument is correct; the attribution is not.

**Repair.** Cite Theorem 5.1 (vi) ⇔ (vii) for the statement only and drop the parenthetical, or cite the lemma GTT invokes.

## Verified sound

**Gate and build.** `gate.md` at this head: every check passes (`build=0 OK`). `lake env lean TauCetiRoadmap/GlaubermanZStar/Suggested.lean` from the worktree: four `declaration uses sorry` warnings, nothing else (34 s). `git diff --stat origin/main...HEAD` outside the folder: empty. No `set_option`, no `lemma`, no sorried data (`InPrincipalTwoBlock` has a real body), no LaTeX, no pull-request number, no process narrative.

**Signatures.** `#check @name` for all five declarations on a scratch copy: the elaborated types agree with the README statements (Conventions lines 77–90, §2.5, §3.1, §3.2). The one "dropped" binder, `[Finite G]` on `InPrincipalTwoBlock`, is absent because the type does not mention finiteness; the only theorem using it carries `[Finite G]`. Nothing changed.

**One-tactic probes.** `simp` (and `simp [InPrincipalTwoBlock] at *` for the constancy theorem) on each of the four sorried theorems: "simp made no progress" or unsolved goal on all four. None is padding. Three sanity examples close: `Nat.card (QuaternionGroup 2) = 8`, `orderOf (xa 0 : QuaternionGroup 1) = 4` (so `QuaternionGroup 1` is cyclic, as §2.1 says), and `(xa 0)⁻¹ * a 1 * xa 0 = (a 1)⁻¹` in `QuaternionGroup 2` by `decide`.

**Headline theorems.** Listed by the README (lines 11–13): Z* in isolated form, Z* in Sylow form, Brauer–Suzuki, principal-block section constancy. All four are stated in `Suggested.lean`; the module docstring says none is missing. Correct.

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 205 roadmaps, 1657 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The three suppliers in pull requests (LocalFiniteGroupTheory `#1634`, ModularCharactersAndBlocks `#1775`, OddOrderTheorem `#1777`) are new roadmap folders; each excludes Z* and Brauer–Suzuki from its own scope (LFGT line 298–299, MCB line 66–68, OOT line 76–78), so there is no cycle.

**Cross-roadmap citations resolved** (all at the heads named above or on main `929496d`): LFGT L1 (`pPrimeCore p H`, `O_{p'} = piCore {q | q ≠ p}`, characteristic, `O_π(H/O_π(H)) = 1`, `O_π(N) = O_π(H) ⊓ N`, lines 139–142), L4 (`2`-rank one is cyclic or generalized quaternion, line 218–219), L5 (complement is `O_{p'}`, cyclic-Sylow Burnside case, lines 241–244); MCB M1 (cyclotomic field, prime-to-`p` root lifting, lines 146–157), M2 (transport between splitting modular systems, line 208–209), M4 (block partition by reduced central characters on integral class sums; principal block by the trivial module, lines 236–245), M5 (`χ(xu) = ∑_φ d^x_{χφ} φ(u)`, block-section orthogonality, lines 249–258), M7 (second main theorem as `d^x_{χφ} ≠ 0 → χ ∈ b^G`; local third main theorem for `P·C_G(P) ≤ H ≤ N_G(P)`, lines 313–331), M8 (kernel intersection `= O_{p'}(G)`; principal-block simple modules trivial on `O_{p'}`, lines 348–359); OOT F2 §2.2 (Dade datum: `L`-invariant `A`, fusion controlled by `L`, complements), §2.4 (trivial complements ⇔ T.I. set with normalizer `L`; Dade map = induction; isometry; `(Ind f) a = f a`, lines 473–478); CharacterTheory §1.1 (class sums, `TauCeti.structureConstant`, `classSum_mul`), §4.3 (`ω_χ(K_j) = |C_j| χ(g_j)/χ(1)`, integrality), §4.4 (`(σ·χ)(g) = χ(g^j)`); InductionRestriction Layer 2 (induced characters, Frobenius reciprocity, line 268). The only drift is R03.

**Library declarations opened at the pins** (file and line in the worktree's `.lake/packages`): `TauCeti.irreducibleCharacters` (`RepresentationTheory/CharacterTable/Table.lean` 119); `TauCeti.ClassFunction.characterPairing` (`CharacterTable/Pairing.lean` 58); `TauCeti.virtualCharacters` (`VirtualCharacter.lean` 132) and `conj_apply_of_mem_virtualCharacters` (270); `TauCeti.Representation.centralCharacter` (`CentralCharacter.lean` 91), `centralCharacter_classSumCenter_mul_character_one` (165), `isIntegral_centralCharacter_classSumCenter` (183); `TauCeti.classSum_mul` (`ClassSum/StructureConstants.lean` 87), `TauCeti.structureConstant` (64); `Representation.char_eq_finrank_iff` (`Kernel.lean` 101, hypothesis `IsOfFinOrder g`); `TauCeti.IsTISet` (`GroupTheory/TrivialIntersection.lean` 194: fields `subset`, `conj_mem`, `disjoint_conj`, as the README's contract says), `TauCeti.IsTISubgroup` (115). Mathlib: `orderOf_eq_prime_iff` (`OrderOfElement.lean` 533, form `x ^ p = 1 ∧ x ≠ 1`), `commutatorElement` (`Algebra/Group/Commutator.lean` 28), `Sylow.normalizer_sup_eq_top` (`Sylow.lean` 530), `IsPGroup.center_nontrivial` (`PGroup.lean` 324), `MonoidHom.transferSylow` (`Transfer.lean` 246), `ker_transferSylow_isComplement'` (279), `QuaternionGroup.card` (`Quaternion.lean` 174, `4 * n`), `orderOf_xa` (203), `orderOf_a` (244), the multiplication table (64–67), `Subgroup.card_mul_index` (`Index.lean` 293), `Subgroup.commutator` (`Commutator/Basic.lean` 146).

**Ownership.** `roadmaps grep` over the 440 open heads and main for Brauer–Suzuki, isolated involutions, `Z*(G)`, `glauberman_zStar`, `InPrincipalTwoBlock`: hits only in this roadmap and in the three suppliers' exclusion sentences. No other owner; the board's package index lists none of these topics. Nothing at the pins states Z*, Brauer–Suzuki, `O_{p'}` cores or the principal block.

**Sources at their locators.** `waldecker2013` (author's page copy): Chapter 1 p. 1 (lines 60–95: the theorem, the Sylow form, the simple-group corollary); Theorem 2.19 (506–509), Theorem 2.20 (510–512); Lemma 3.1 (1)–(5), (7) (652–683); Hypothesis 4.1 (902–911); Lemma 4.2 (1)–(2) (916–927); Lemma 4.4 (1)–(2) (961–985): each supports the statement it is cited for, at the generality used. `guralnick_tongviet_tracey2024`: Theorem 5.1 (789–799) with (i) ⇔ (ii) (801–811), (vi) ⇔ (vii) (827–830), (vii) ⇒ (iv) (831–834): the README's §0.4 equivalence and §1.1 (c) ⇒ (d) match; see R05 for the attribution. Brauer–Suzuki p. 1757 and Glauberman Theorem 1: see Not verifiable.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `orderOf t = 2 ↔ t ≠ 1 ∧ t² = 1` (§0.1) | pin | `orderOf_eq_prime_iff`: `x ^ p = 1 ∧ x ≠ 1` | holds |
| isolation (§0.1) | `S₃`, `(12)` | conjugates `(13)`, `(23)` do not commute | isolated |
| | `A₅`, `(12)(34)` | `(234)` sends it to `(13)(24)`, commuting | not isolated, as the Check says |
| | `D₈`, `s` | `r s r⁻¹ = s r²`, commutes, `≠ s` | not isolated; `r²` central |
| | `S₄`, `(12)(34)` in `⟨(1324), (12)⟩` | `(1324)² = (12)(34)` central in `D₈`; `(13)(24)` conjugate and commuting | wrong model excluded |
| dihedral formula (§0.3) | `r = ab`, `a r a = r⁻¹` | `r^(-j) a r^j = a (a r^(-j) a) r^j = a r^(2j)` | holds; `D₈`, `j = 1`: `s r²` |
| `k` even ⇒ not isolated | `D₈`, `k = 2` | `a r² = s r²`, commutes with `s` (`r² = r⁻²`), conjugate via `j = 1` | holds |
| `k` odd, `b ∼ a` ⇒ not isolated | `D₁₂`, `k = 3` | `a r³` conjugate to `b` (odd class), commutes with `a` | holds, but not in §0.3 (R02) |
| Lemma 3.1 (5) | `w ≁ t` | `m` odd ⇒ conjugate (contradiction); `k` even ⇒ not isolated | `m = 2k`, `k` odd |
| fusion in overgroups (§0.2) | `S₄`, `t = (12)`, `H = ⟨(12),(34)⟩` | `(34) ∈ H`, not `H`-conjugate; `t` not isolated | negative control holds |
| descent (§0.2) | `M = ⟨x, t⟩N`, `M/N` elementary abelian of order `≤ 4` | `M = NS`, `x ∈ nSn⁻¹`, `n⁻¹xn ∈ S ≤ S_G`, weak closure gives `x = ntn⁻¹` | holds; `C_{G/N}(t̄) = image` follows |
| lifting through odd `N` (§0.2) | `x = t^g`, `[x,t] = 1`, `x̄ = t̄` | `xt ∈ N` of order `≤ 2` in odd order | `x = t` |
| product conjugacy (§0.2) | `S₃ × C₂`, `t = (1,c)`, `a = ((12),1)`, `b = ((13),1)` | `(23)(12)(23) = (13)` | `ta ∼ tb` by `((23),1)` |
| | `S₄`, `t = (12)`, `a = (34)`, `b = (12)` | `ta = (12)(34)`, `tb = 1` | fails, `t` not isolated |
| §0.4 (i) ⇔ (ii) | `S₄`, `S = ⟨(1234),(13)⟩`, `t = (12)(34)` | `(1234)(12)(34)(1234)⁻¹ = (14)(23) ∈ S` | neither; `Z*(S₄) = 1` |
| | `S₃`, `S = ⟨(12)⟩` | `t^G ∩ S = {t}` | both |
| §1.1 (a)–(d) | `F₂₀ = C₅ ⋊ C₄`, `t = c²` | `t` inverts `C₅`, `O = C₅`, `G/O ≅ C₄` abelian | `t ∈ Z*`, `t ∉ Z`, `N = C₅` |
| | `D₈` | `O = 1`, `Z* = ⟨r²⟩`, `⁅r, s⁆ = r s r⁻¹ s = r²` | `s ∉ Z*` |
| (c) ⇒ (d) | `g = nc` | `⁅nc, t⁆ = n(ctc⁻¹)n⁻¹t⁻¹ = ⁅n, t⁆ ∈ O(G)` | holds (GTT (vii) ⇒ (iv)) |
| (d) ⇒ (c) | `O(G)⟨t⟩` | Sylow `2`-subgroups of order `2`, conjugate by `n ∈ O(G)`, `n⁻¹g ∈ C_G(t)` | holds |
| §1.2 lifting | `D₈`, `N = ⟨r²⟩`, `t = s` | `s̄` central in `V₄`, `s ∉ Z*(D₈)` | odd order needed, as the Check says |
| §1.2 last bullet | `S₄`, `H = V₄`, `t = (12)(34)` | `t ∈ Z*(V₄)`, `t ∉ Z*(S₄) = 1`, `t` not isolated | isolation needed |
| | `S₃ × C₂`, `H = G` | `⟨t^G⟩ = S₃ × 1 ≠ H` | route sentence false (R04), statement holds |
| §1.3 reductions 1–5 | Waldecker Lemma 4.4 (1)–(2), Lemma 4.2 (1)–(2) | `O(G) = 1`, `G = ⟨t^G⟩`, `X = ⟨w⟩ × O(X)`, `O(X) ≤ O(G) = 1`, `⁅G,t⁆ ≤ ⟨w⟩` | holds, matches lines 963–985 |
| §2.1 conventions | `QuaternionGroup (2^(n-2))` | order `4·2^(n-2) = 2^n`; `a 1` of order `2·2^(n-2) = 2^(n-1)`; `xa i` of order `4`; `(xa 0)⁻¹ (a 1)(xa 0) = xa(n')·xa 1 = a(n' + 1 − n') … = (a 1)⁻¹` (by `decide` for `n' = 2`) | holds |
| | `n = 2` | `QuaternionGroup 1`: `xa 0` of order `4` in a group of order `4`, cyclic | excluded by `3 ≤ n` |
| | `DihedralGroup (2^(n-1))` | `2^(n-1) + 1` involutions | wrong model excluded |
| §2.2 | `F₂₀`, `C₆`, `A₅` | complements `C₅`, `C₃`; `A₅` has Sylow `V₄` | holds |
| §2.3 `C_S(U) = X` Sylow in `C` | `T ≥ X` Sylow of `C`, `T ≤ S'` | `T = S'` puts `U ≤ Z(S')` of order `2` | holds |
| §2.3 `K` T.I., `N_G(K) = H` | `k ∈ K ∩ gKg⁻¹` | `U, gUg⁻¹ ≤ ⟨k₂⟩` cyclic, unique order-`4` subgroup | `g ∈ H` |
| §2.3 `C_G(k) ≤ H` | `k ∈ K` | `C_G(k) ≤ C_G(k₂) ≤ C_G(U) = C` | every `H_a = 1` |
| §2.3 Checks | `Q₈`, `SL(2,3)`, `𝔽₃² ⋊ Q₈` | `C_G(i) = ⟨i⟩` (class of size `6`; `i − 1` invertible on `𝔽₃²` since `(i−1)(i+1) = 1`), `K = {i, −i}`, `O(C) = 1` | holds |
| | `K' = C ∖ {1}` in `SL(2,3)` | `{i, −1, −i} ∩ {j, −1, −j} = {−1}` | wrong model excluded |
| §2.4 vanishing set and dimension | `m` | `(S ∖ X) ∪ {1, z}` ↔ off `K`; classes `{a i, a(−i)}` of order `≥ 4`: `2^(m-1) − 1` | holds |
| `β_j`, `j` even | `Q₁₆`, `j = 2` | `β₂(1) = 0`, `β₂(z) = 1 + 1 − 2 = 0` (`χ_j(z) = 2(−1)^j`), `β₂(xa i) = 0`, `β₂(a 1) = 2 − (ζ² + ζ⁻²) = 2`, `‖β₂‖² = 3`; `β₁(z) = 4` | holds |
| `f` for `Q₈` | `X = ⟨i⟩` | `f(1) = 0`, `f(−1) = 0`, `f(i) = 4`, `f(j) = f(k) = 0`, `‖f‖² = 4` | holds |
| signed decompositions | norms `2`, `3`, `4`; `⟨·, 1⟩ = 0, 1, 1`; degree `0` | `±(ψ − ψ')`, `1 ± ψ₁ ± ψ₂`, `1 ± ψ₁ ± ψ₂ ± ψ₃` | holds |
| `Ind f` on `SL(2,3)` | `1 + λ + λ̄ − ψ₃` | at `1`: `0`; at `−1`: `0` (`ψ₃(−1) = 3`); order `3`: `1 + ω + ω² = 0`; at `i`: `1+1+1+1 = 4 = f(i)` (`ψ₃(i) = −1`); direct: `(1/8)·8·4 = 4` | holds |
| `‖Ind 1_H‖²` | `H = Q₈ ⊴ SL(2,3)` | number of double cosets `= 3` | wrong model excluded |
| §2.5 arithmetic | two constituents | values at `1`, `z` give `d₂ = d₁ + 1`, `e₂ = e₁ + 1`, satisfiable; with `1 + ∑ ε_i e_i²/d_i = 0`: `(d₁ − e₁)² = 0` | inputs incomplete (R01) |
| `InPrincipalTwoBlock` | trivial | `z = |Cl g|`, difference `0` | in block |
| | `C₂` sign, `g = s` | `z = −1`, `−2 ∈ m` | in block |
| | `S₃` degree `2`, transposition | `z = 3·0/2 = 0`, `−3 ∉ m` (`m ∩ ℤ = 2ℤ`) | not in block (defect zero), agrees with M8 |
| | `S₃` sign | `3`-cycle: `z = 2`, diff `0`; transposition: `z = −3`, `−6 ∈ m` | in block |
| | `3 ∈ m` | `−3 ∈ m` puts the degree-`2` character in | the ideal discriminates the prime |
| | `m = ⊤` | everything in | excluded by `IsMaximal` |
| constancy (§3.2) route | `P = ⟨s⟩`, `H = C_G(s)` | `P·C_G(P) = H ≤ N_G(P)`; `b^G = B₀(G)` ⇒ `b = B₀(H)` (M7); `N ≤ O(H)`; `φ(v) = φ(1)` (M8); `χ(sv) = ∑ d^s φ(1) = χ(s)` | holds |
| constancy Checks | `C₆`, `S₃ × C₂` | `sgn ⊗ ε`: `−1 = −1`; `std ⊗ ε`: `−2 ≠ 1` | block hypothesis needed |
| §4.1 package | `d = th`, `ord 2k`, `k` odd | `(th)² = ⁅t,h⁆ ∈ N`; `v = (th)^(k+1) ∈ N`; `μ = tw`, `t ∉ ⟨th⟩` so `μ` involution; `μh = (th)^(1−k) ∈ N` odd; `μ ∼ h`; `tμ = w` | holds |
| | `k = 1` | `w = th`, `v = 1`, `μ = h` | identities |
| | `S₄`, `t = (12)`, `s = (34)`, `χ₃` | `χ((12)(34)) = −1`, `χ((132)) = 0` | fails, `t` not isolated |
| §4.2 identity | `S₃`, `C` = `3`-cycles | `C² = 2·1 + C`; `ω = −1`: `1 = 2 − 1`; wrong normalisation `1/4 ≠ 3/2` | holds |
| | `S₃ × C₂`, `std ⊗ 1` | `χ(ts)χ(1) = 0`, `χ(t)χ(s) = 2·0` | `0 = 0` |
| | `S₄`, `χ₃` | `−1·3 = −3 ≠ 1·1` | fails, `t` not isolated |
| §4.3 alternative | general | `χ(s)χ(1)² = χ(t)χ(ts)χ(1) = χ(t)²χ(s)` | `χ(s) = 0 ∨ χ(t) = ±χ(1)` |
| | `S₃ × C₂`, `sgn ⊗ 1`, `t = (1,c)` | `χ(t) = χ(1) = 1`, `⟨t^G⟩ = 1 × C₂` | `⟨t^G⟩ = G` needed |
| §4.4 contradiction | `(s,t)`, `(s,1)` | `∑ χ(s)(χ(t) + χ(1))`: nontrivial terms `0`, trivial `2` | contradiction holds |
| | `S₃ × C₂`, `g = (1,c)`, `h = ((12),1)` | `1 − 1 − 1 + 1 = 0` | holds |
| | `S₃`, `g = h = (12)` | `1 + 1 = 2 ≠ 0` | conjugate `2`-parts, as the Check says |
| `glauberman_zStar` | `C₂`, `S₃`, `Q₈`, `V₄`, `A₅` | `N = ⊥, A₃, ⊥, ⊥`; `A₅`: hypothesis fails, conclusion fails | holds; negative control |
| `brauer_suzuki` | `Q₈`, `SL(2,3)`, `SL(2,5)`, `𝔽₃² ⋊ Q₈` | `N = ⊥` thrice; `N = 𝔽₃²`, `−1 ∉ Z` | holds |
| §5.2 | `S₃`, `sgn`, `t = (12)` | `χ(t) = −1 = −χ(1)` | holds |

**Hypothesis audit.** `hm` and `h2` on the constancy theorem are both needed (rows "`3 ∈ m`", "`m = ⊤`"). `hn : 3 ≤ n` on `brauer_suzuki` is needed (row `n = 2`). `hs : orderOf s = 2` is not needed for the truth of the constancy theorem (`s = 1` reduces it to M8 on `O(G)`), but every consumer uses an involution; no change.

## Not verifiable

- Glauberman 1966, *Central elements in core-free groups*: settled `uncertified` (paywalled). Theorem 1 and the principal-block lemma are cited by locator only; their content was checked against Waldecker's statement (lines 60–76, "the result that is closest … is Theorem 1") and by the adversarial rows.
- Suzuki, *Group Theory II*, Chapter VI §2.2 Example 3: settled `uncertified`. The route of §2.4–§2.5 was checked by computation and against the formalization the README cites; see R01.
- Brauer–Suzuki 1959, p. 1757: the cache entry `brauer_suzuki1959` is still the PMC "Preparing to download" placeholder (9 lines), as the previous review reported; the statement was checked against Waldecker Theorem 2.20 (line 510–511) and Chapter 1 line 79–82 instead. The worker should refetch the PMC copy (the pages are scanned and will need OCR).
- Glauberman, *On groups with a quaternion Sylow 2-subgroup*, Illinois J. Math. 18 (1974) 60–65, DOI 10.1215/ijm/1256051349 (open access on Project Euclid, the proof Waldecker's Theorem 2.20 points to): the sources service got an Incapsula block page from projecteuclid.org, and the direct PDF read returned empty. Named in R01 as an option, not checked; no manifest was edited (a scratch copy was used).
- Ownership against open pull requests was checked through `roadmaps grep` over all 440 heads and the board's package index; the AxiomMath files' contents were read only for `example_3.lean` (first two thirds), under its Apache-2.0 licence.

## Source issues

- none
