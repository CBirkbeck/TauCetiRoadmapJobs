# Review of PCurvature (pull request #1747 at 12a50f4)

**Verdict:** needs changes

This is an incremental re-review of the 78 lines the folder changed since 13eb63f (README: new target 0.4 "Commutators with multiplications", the GrothendieckNotesLemmas supplier contract and its three citations removed, 1.1 and 1.4 repointed to 0.4; `Suggested.lean`: two new theorems and a docstring bullet). The mathematics of the new section is correct and the ownership move is consistent on both sides. Two P3 findings remain: the two new Lean declarations are API lemmas, not headlines, and the pull request description still names the supplier the head dropped.

## R01 (P3) — the two 0.4 declarations in `Suggested.lean` are padding

**Location.** `TauCetiRoadmap/PCurvature/Suggested.lean` lines 135–146 (`lie_mulLeft`, `mulLeft_mul_mul_mulLeft_inv`) and the docstring bullet at lines 21–22: "0.4, `lie_mulLeft` and `mulLeft_mul_mul_mulLeft_inv` (commutators of a derivation with multiplications, used in 1.1 and 1.4)", under "Headline theorems stated here".

**Claim.** They are listed as headline theorems of the roadmap.

**Witness.** Neither statement mentions an object this roadmap defines (no `pPow`, no `p`, no `CharP`; README line 241 says "Both hold in every characteristic"). On a scratch copy, `lie_mulLeft` closes with `ext b; simp [Ring.lie_def, mul_comm]`: it is `Derivation.leibniz` read in `Module.End R A`, as README lines 235–237 say themselves. The second is the same rule plus `Derivation.leibniz_of_mul_eq_one` (Mathlib `RingTheory/Derivation/Basic.lean:480`). Both are helper lemmas for the proofs of 1.1 and 1.4.

**Repair.** Delete both theorems and the docstring bullet from `Suggested.lean`. The README keeps 0.4 as a target with its Checks, stated in prose without backticked names of its own: at lines 234, 237, 266, 279, 282 and 367 write "the commutator identity of 0.4" and "the conjugation identity of 0.4" in place of `lie_mulLeft` and `mulLeft_mul_mul_mulLeft_inv` (a backticked own name is a claim that `Suggested.lean` declares it, and the gate's `readme-ids` check would fail otherwise). The file then returns to the 19 declarations and 11 admitted theorems of 13eb63f, which elaborated cleanly.

## R02 (P3) — the pull request description still consumes GrothendieckNotesLemmas

**Location.** The pull request description, "It consumes: … GrothendieckNotesLemmas §3.2;" and, under "Depends on", "#1431 GrothendieckNotesLemmas".

**Claim.** PCurvature consumes GrothendieckNotesLemmas §3.2 and waits for its pull request.

**Witness.** The README at this head does not mention GrothendieckNotesLemmas (0 matches; the contract paragraph and the three citations are removed by this commit). GrothendieckNotesLemmas at its head hands the two identities to "PCurvature, §0.4" (its README lines 57–59; `Suggested.lean` line 58), so with the description as it stands each pull request waits for the other.

**Repair.** Remove the "GrothendieckNotesLemmas §3.2" bullet and the "#1431 GrothendieckNotesLemmas" line from the description. (The description's "no one-tactic theorems" sentence stays true once R01 is applied.)

## Previous findings

The previous report (on 13eb63f) had no findings: nothing to carry.

## Verified sound

**Gate, build, elaboration.**
- `gate … --base origin/main --order <candidate>`: every check 0, `OK`; the worker's gate record for this head has every check at 0 including `build=0`.
- `lake env lean TauCetiRoadmap/PCurvature/Suggested.lean` exits 0 with 13 `sorry` warnings (lines 73, 99, 111, 116, 121, 137, 143, 153, 175, 182, 189, 215, 239) and nothing else: the 11 of the previous head, shifted by the docstring bullet, plus the two new theorems.
- A scratch copy with `#check @` for all 21 declarations elaborates. The two new types read `∀ {R A} [CommRing R] [CommRing A] [Algebra R A] (D : Derivation R A A) (a : A), ⁅↑D, LinearMap.mulLeft R a⁆ = LinearMap.mulLeft R (D a)` and `… (u : Aˣ), LinearMap.mulLeft R ↑u * ↑D * LinearMap.mulLeft R ↑u⁻¹ = ↑D - LinearMap.mulLeft R (↑u⁻¹ * D ↑u)`, identical to the worker's `signatures.md`; no section binder is lost (neither needs `p` or `CharP`, and neither has them). The other 19 are unchanged text.
- One-tactic probe of the two new theorems on scratch copies: `simp` alone makes no progress on the first and leaves the second open; `aesop` fails on both; `ext b; simp [Ring.lie_def, mul_comm]` closes the first (R01); `ext b; simp [mul_add, mul_comm, mul_left_comm, sub_eq_add_neg]` leaves `b * (u * D u⁻¹) + D b = D b + -(b * (u⁻¹ * D u))` for the second, which is `Derivation.leibniz_of_mul_eq_one`.

**Dependency check** (`gate --depcheck … --order <candidate> --movable --content <main>`): `depcheck: 236 roadmaps, 2267 edges, 0 problem(s)`. No UPWARD, no CYCLE, no `moved:` line. The candidate lists PCurvature at line 41, after FormalConnectionsOpers. The change removes one supplier edge (GrothendieckNotesLemmas, which the candidate order never listed) and adds none.

**Ownership of 0.4.**
- Pinned Mathlib and Tau Ceti: no declaration states `⁅D, mulLeft a⁆ = mulLeft (D a)` or the conjugation by a unit. The nearest are Tau Ceti `lie_mulLeft_mulLeft_mem_derivationLieAlgebra` (`TauCeti/Algebra/Jordan/Derivation.lean:69`, a bracket of two multiplications in a Jordan algebra) and `leibniz_iff_exists_matrix_eq_mulLeft_sub_mulRight` (`TauCeti/LinearAlgebra/Matrix/Derivation.lean:43`); neither is the statement. Mathlib has the ingredients the *Needs:* line names: `Derivation.leibniz` (`RingTheory/Derivation/Basic.lean:119`), `Derivation.leibniz_of_mul_eq_one` (line 480: `a * b = 1 → D a = -a ^ 2 • D b`), `LinearMap.mulLeft` (`Algebra/Module/LinearMap/Defs.lean:1018`).
- Open roadmaps (`roadmaps grep` for the two names and for the object): the only other mention is GrothendieckNotesLemmas, whose head now lists both identities under what it leaves to "PCurvature, §0.4" and whose §3.2 no longer states them. One owner, no cycle, and no two `Suggested.lean` files declare the same name.
- The overlap listing: no other pull request changes this roadmap, no cited id is dropped, no id this pull request drops is cited elsewhere (K3Surfaces cites §§0.1–0.3 and §0.2, unchanged; GroupSchemesOverABase cites restricted Lie algebras; GrothendieckNotesLemmas cites §0.4, which exists at README line 232).
- The citation listing's two Lean leads (`DerivedDeRham.smoothCartier`, `SchemeFrobenius.schemeFrobeniusTwist`) are in the untouched supplier contracts and were resolved in the previous report.
- Nothing changes outside the folder: `git diff --stat origin/main...HEAD` excluding the folder is empty.

**Sources.** The seeded target "0.4 Commutators with multiplications" is an own statement with no source locator; its inputs are the Mathlib declarations above, opened at the pin. Target 1.1's locator (Katz 1970, (5.0.6)–(5.0.9)) and 1.4's are unchanged text, verified in the reviews the previous report carries. No locator is flagged as unverified.

**Adversarial table.** Changed statements, computed by hand:

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 0.4 `⁅D, a⁆ = D(a)` (README 234–237, Lean 137) | general `b`; `k[x]`, `D = d/dx`, `a = x`, `b = 1`; `a = 0`; `a = 1`; `D = 0`; zero ring | `D(ab) − aD(b) = D(a)b` by Leibniz; `D(x·1) − x·0 = 1 = D(x)·1`; `0 = 0`; `D(b) − D(b) = 0 = D(1)b`; `0 = 0`; trivial | holds; no characteristic or unit hypothesis needed |
| 0.4 `u ∘ D ∘ u⁻¹ = D − u⁻¹D(u)` (README 237–241, Lean 143) | general `b`; `u = 1`; `u ∈ k^×`; `k[x, x⁻¹]`, `u = x`, `b = 1` and `b = x` | `uD(u⁻¹b) = D(b) + uD(u⁻¹)b`, `uD(u⁻¹) = u·(−u⁻²D(u)) = −u⁻¹D(u)`; `D = D`; `D(u) = 0`, both sides `D`; `x·D(x⁻¹) = −x⁻¹` vs `0 − x⁻¹·1`; `x·D(1) = 0` vs `1 − x⁻¹·x = 0` | holds |
| 0.4 route's use of `leibniz_of_mul_eq_one` | `a = u⁻¹`, `b = u` | Mathlib gives `D(u⁻¹) = −(u⁻¹)²D(u)`, so `uD(u⁻¹) = −u⁻¹D(u)` | as the README says |
| 0.4 Check 1 (Weyl relation) | `D∘x − x∘D` on `x^n` | `(n+1)x^n − n x^n = x^n`; reversed bracket `−x^n` | correct, discriminates the order |
| 0.4 Check 2 (`u ∈ k^×`) | `D(u) = 0` | both `D − u⁻¹D(u)` and the wrong `D − D(u)` equal `D` | correct, and rightly called non-discriminating |
| 0.4 Check 3 (sign and `u⁻¹`) | `u = x`, `b = 1` | true `−x⁻¹`; opposite sign `+x⁻¹`; without `u⁻¹`: `0 − D(x) = −1` | correct, discriminates both |
| 0.4 Check 4 (`𝔽_p[x, x⁻¹]`, `a = −1/x`) | `p = 2, 3, 5` | `D^{p−1}(x⁻¹) = (−1)^{p−1}(p−1)!·x^{−p} = −x^{−p}` (`(p−1)! ≡ −1`, `(−1)^{p−1} ≡ 1` mod `p`, also at `p = 2`); `(−1/x)^p = −x^{−p}`; sum `−x^{−p} + x^{−p} = 0`; and `(x∘D∘x⁻¹)^p = x∘D^p∘x⁻¹ = 0` since `D^p = 0` on `𝔽_p[x, x⁻¹]` | agrees with `rankOne_pCurvature_eq` at `ω(D) = −1/x`, `ω(D^p) = 0` |
| 1.1 route, "from `[∇_D, a] = D(a)` (the module analogue of 0.4)" (README 278–282) | `M = A`, `∇_D = D` | reduces to 0.4's first identity | consistent; the *Needs:* line now names 0.4 |
| 1.4 gauge sentence (README 364–368) | `ω(D) = −D(u)/u` for all `D`; `u = x` on `𝔽_p[x, x⁻¹]` | `D + ω(D) = u∘D∘u⁻¹` by 0.4; `(u∘D∘u⁻¹)^p = u∘D^p∘u⁻¹ = D^p + ω(D^p)` since `D^p` is a derivation (0.3) and `ω(D^p) = −D^p(u)/u`; `ψ(D) = 0`; horizontal section: `D(u) − (D(u)/u)·u = 0` | holds; consistent with Check 4 of 0.4 |
| Layer 0 and Layer 1 Dependencies (README 270–271, 411–414) | every *Needs:* line of the two layers | Layer 0: Mathlib and Tau Ceti only, 0.4 Mathlib only; Layer 1: no GrothendieckNotesLemmas edge left | agree with the targets |
| Scope paragraph (README 27–34) | "the commutators of a derivation with multiplications (0.4)" | matches §0.4 and the other roadmap's deferral | consistent |

Carried rows, unchanged text, from the previous report (review of 13eb63f and those it carries): the effective-Honda paragraph after 4.3 and its witnesses (`1/(4x)`, `1/(9x)`, `1/(4x²+4)`, `1/(x³−x)`, `1/(3x²+x+5)`, `σ = 139` for `R = w + 1`, Witness 2, the `c`-free counterexample); the `u = c/x` example; `pPow` body; 0.1–0.3, 1.1–1.5, 2.0–2.4, 3.1, 3.2, 4.1–4.4, Conventions 1, 5, 6: hold as recorded there.

**Headline theorems** (the diff touches only the list's 0.4 bullet). Stated: Jacobson's formula (0.1), the restricted structure on `Der_R(A)` and Hochschild's formula (0.3), the rank-one formula (1.4), rank one in one variable (2.3), Kronecker (4.1), Honda (4.3). Named as not statable in the module docstring, each with its missing carrier: 1.1–1.3, 1.5, 2.1–2.2, 3.1–3.2, 4.4. No statable headline is absent and none is forced through a stand-in; the 0.4 pair is not a headline (R01).

**Declared gaps:** none declared, none needed.

## Not verifiable

- Nothing in the changed passages. Honda 1981, Kronecker 1880, Katz 1972 and 1982, Chudnovsky–Chudnovsky 1985, André 1989 and 2004, Beukers–Peters 1984 remain unread as in the previous report; the diff cites none of them.

## Source issues

- none
