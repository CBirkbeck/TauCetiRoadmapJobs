# Review of PCurvature (pull request #1747 at 43fe6b5)

**Verdict:** accepted

Scope: `TauCetiRoadmap/PCurvature/README.md` (737 lines) and `TauCetiRoadmap/PCurvature/Suggested.lean` (230 lines) at 43fe6b5, a full review (1048 changed lines since f7a3b9e). The gate passes on this head (every check 0, build OK with `sorry` the only warning). The dependency check with `--movable` prints `depcheck: 204 roadmaps, 1656 edges, 0 problem(s)`; the merge order lists PCurvature at line 41, after DerivedDeRhamCohomology (19), CrystallineCohomology (20) and FormalConnectionsOpers (40); no UPWARD or CYCLE line. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty); the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. Ownership against the 441 open pull requests was checked with the roadmap grep for p-curvature, restricted Lie algebras, Jacobson's formula, Cartier descent, Honda's theorem and the Frobenius image: no other roadmap builds these objects (the "Cartier descent" hits are the Fargues–Fontaine roadmaps' untilt Cartier divisors; ReductiveGroups mentions "restricted Lie algebra" once in a revision pull request, which owns nothing of it); PCurvature is the owner.

**Repairs of the previous review (f7a3b9e), finding by finding.**

- R01 (`set_option`): repaired; the file has none (lines 1–5 are `module`, `public import Mathlib` and the two Tau Ceti modules).
- R02 (stand-in connection carrier): repaired; `DerivationConnection`, `IsFlat`, `horizontal`, `horizontalFrob`, `pCurvature`, `IsNilpotentPCurvature`, `ofForm` and the eight theorems on them are gone; the docstring (lines 29–37) names 1.1–1.3, 1.5, 2.1–2.2 as lacking "the ordinary connection carrier of CrystallineCohomology CR.1.3 and the evaluation on derivations of FormalConnectionsOpers §2.1", and 3.1–3.2 and 4.4 as lacking "schemes of finite presentation over a finitely generated `ℤ`-domain with their reductions"; the rank-one formula is stated carrier-free as `rankOne_pCurvature_eq` (line 135).
- R03 (finiteness of coordinates): repaired in the README, 1.2 "free on finitely many `ds_1, …, ds_r`… a finite sum (Katz 1970, (5.4.3)–(5.4.4))" and the new Check on `𝔽_p(x_0, x_1, …)`; the Lean declaration no longer exists.
- R04 (faithfully flat "iff"): repaired; 1.3 now states the equivalence "for `A → B` étale and faithfully flat and `∇` flat" with the one-directional statement on extended derivations for every étale `B`, and carries the `𝔽_p[x] ⊂ 𝔽_p[s]`, `s^p = x` negative control; 3.1's `*Needs:*` names "the étale and faithfully flat case, for a flat connection".
- R05 (invented supplier names): repaired; CR.1.3 is cited by section and prose name (lines 110–112), `Crystalline.Connection` is gone.
- R06 (gate failures): repaired; `prnum=0 residue=0 readme-ids-missing=0 build=0`, the file is in module form.
- R07 (shape): repaired; `## Exact supplier contracts`, `## How to read the build`, `*Needs:*` on every target, `### Examples` and `### Dependencies` in every layer, `## Downstream consumers`; 1.1, 2.0, 2.1, 2.2, 3.1, 4.1, 4.2, 4.3 have three or four Checks each.
- R08 (padding): repaired; `pPow_apply`, `pPow_smul_const`, `RestrictedLieAlgebra.ofAssociative`, `RestrictedLieHom`, `IsNilpotentPCurvature` deleted; the README keeps the facts in prose without backticks.
- R09 (timelessness, ReductiveGroups): repaired; 0.1 defines `Λ_p` by words (lines 150–154), no sentence about the Lean file, no ReductiveGroups citation.
- R10 (2.2 hypotheses): repaired; 2.2 opens "Under the hypotheses of 2.1 (`A` smooth over `R` of characteristic `p`, `∇` flat)" and says "The direction `⇐` of both holds for every connection, by 1.3".

## R01 (P3) — 3.2 attributes "surjective" to SchemeAndStackFoundations §0.9, which does not list it

Location: `README.md` lines 530–532, "spread out `B_F` and the isomorphism over some `S_f` (SchemeAndStackFoundations §0.9, `spreading_out_models` and `finite_presentation_limits`, with the properties finite, étale and surjective)".

Claim: SchemeAndStackFoundations §0.9 on main (README lines 859–866) inherits from a finite stage the properties "flat, smooth, étale, proper, finite, closed immersion, open immersion, isomorphism"; surjectivity is not among them, and 3.1 needs the spread-out cover faithfully flat.

Witness: SchemeAndStackFoundations §0.9 on main, `finite_presentation_limits`, lines 861–864: the eight listed properties with their Stacks lemmas; no surjectivity.

Repair: derive it in the proof: `Spec B → Spec A_f` is finite étale, so its image is open and closed; it contains the generic fibre `Spec A_F`, which is dense in `Spec A_f` because `A` is flat over the domain `S` (going-down puts every minimal prime of `A` over `(0)`); a clopen set containing a dense set is everything. State these two steps in 3.2 and drop "surjective" from the list of properties taken from §0.9.

## R02 (P3) — 3.2's third Check is not an instance of the theorem

Location: `README.md` lines 543–544, "The dense open is needed: `∇ = d + (1/2) dx/x` over `S = ℤ` is not defined modulo `2`; the conclusion 'at all closed points of `Spec S`' would be false or meaningless there."

Claim: `d + (1/2) dx/x` is not a connection on an `ℤ[x, x^{−1}]`-module, so the data do not satisfy 3.2's hypotheses over `S = ℤ`; the Check shows nothing about the conclusion.

Witness: a connection that meets every hypothesis over `S = ℤ` and still has nonzero `p`-curvature at a closed point: `A = ℤ[x, 1/(x^2 + 1)]`, `M = A`, `∇ = d + x dx/(x^2 + 1)`, trivialised over `ℚ(x)` by `t^2 = x^2 + 1` (`t^{−1}` is horizontal, `t′ = x t/(x^2 + 1)`); modulo `2`, `a = x/(x + 1)^2` has a double pole and `ψ = a^2 + a′ = 1/(x + 1)^4 ≠ 0`; for odd `p`, `a = (1/2)/(x − i) + (1/2)/(x + i)` has residues in `𝔽_p` and `ψ = 0`.

Repair: replace the Check by this instance (the open is `D(2)`, where `t^2 − x^2 − 1` becomes separable).

## R03 (P3) — 1.2's second Check states a false operator identity

Location: `README.md` lines 294–296, "`ψ(a ∂_y) = (a ∂_y + a x)^2 = a^2 x^2 = a^2 ψ(∂_y)` in characteristic `2`".

Claim: as an identity of operators on `𝔽_2[x, y]`, `(a ∂_y + a x)^2 = a ∂_y(a) ∂_y + a ∂_y(a) x + a^2 x^2`, not `a^2 x^2`, when `∂_y(a) ≠ 0`; the value `ψ(a ∂_y) = a^2 x^2` is right only after subtracting `∇_{(a ∂_y)^[2]}` with `(a ∂_y)^[2] = a ∂_y(a) ∂_y` (since `∂_y^2 = 0` in characteristic `2`).

Witness: `a = y`: `(y ∂_y + x y)^2 = y ∂_y + x y + x^2 y^2`, and `∇_{(y ∂_y)^[2]} = ∇_{y ∂_y} = y ∂_y + x y`; the difference is `x^2 y^2 = a^2 x^2`.

Repair: write "`ψ(a ∂_y) = (a ∂_y + a x)^2 − ∇_{(a ∂_y)^[2]} = a^2 x^2`, with `(a ∂_y)^[2] = a ∂_y(a) ∂_y`".

## R04 (P3) — the module docstring is silent on 2.4

Location: `Suggested.lean` lines 15–37 (the lists of stated and not-statable headlines); `README.md` 2.4 (lines 477–484).

Claim: 2.4 (over `κ(x)`: `ψ = 0` iff `a = −y′/y` iff simple poles, vanishing at `∞`, residues in `𝔽_p` over `κ̄`) is statable at the pins with the file's own `ratFuncPCurvature`, `ratFuncD` and `AlgebraicClosure κ`, and its first equivalence is the instance `A = κ(x)`, `D = d/dx` of `exists_unit_horizontal_iff`; the docstring neither states it nor says why it is omitted, while it accounts for every other target of Layers 1–4.

Witness: the docstring's two lists name 0.1–0.3, 1.1–1.5, 2.0–2.3, 3.1–3.2, 4.1, 4.3, 4.4; 2.4 and 4.2 are absent.

Repair: one line in the docstring, either "2.4 is the instance `A = κ(x)` of `exists_unit_horizontal_iff`; its residue form is a Check of the README" or a statement of the residue criterion on `RatFunc (AlgebraicClosure κ)`.

## Verified sound

**Gate, build, elaboration.** `gate.md`: every check 0, OK. `lake env lean TauCetiRoadmap/PCurvature/Suggested.lean` from the worktree: exit 0, 11 `declaration uses sorry` warnings (the eleven sorried theorems), nothing else. Elaborated types of all 19 declarations (the worker's signature file) compared with the README statements: each theorem carries `[Fact p.Prime]`, `[CharP A p]` and, for `kaehlerD_eq_zero_iff`, `[CharP R p] [Algebra.Smooth R A]`; `exists_unit_horizontal_iff` carries `[IsLocalRing A]`, `hD`, `hx`; `honda` carries `[NumberField K]` and `hQ`; no binder lost (`ratFuncOfInt`, `ratFuncMod` need only `Field K`, as their types say). One-tactic probe on a scratch copy (`first | rfl | simp | infer_instance | (ext; simp) | (ext; simp [pPow]) | (ext; simp [frobeniusImage]) | (intro; simp) | sorry`, with `#check @name` for all 19 names): none of the 11 sorried theorems closes; no padding. `pPow` and the restricted instance depend on sorried theorems only through `Prop` fields (`iterate_leibniz`, `ad_pPow`, `pPow_add`); `pMap_smul` is proved in place (`ext a; simp [pPow, smul_pow]`); no sorried data, no `set_option`, no `lemma`, imports as the rules require.

**Dependency check** (output): `depcheck: 204 roadmaps, 1656 edges, 0 problem(s)`. Suppliers: CrystallineCohomology, DerivedDeRhamCohomology, FormalConnectionsOpers are earlier in the merge order; SchemeAndStackFoundations is on main; GrothendieckNotesLemmas (new folder, open pull request by the same author, needs only Mathlib) is not in the merge order and is placed after its last supplier; PadicDifferentialEquationsAndRigidCohomology, DiophantineApproximationAndTranscendence, SmoothBundlesConnections, ComplexComparisonPartII are named only as not used. No cycle: none of the suppliers cites PCurvature except GrothendieckNotesLemmas' `## Downstream consumers` line, which is not a dependency.

**Cross-roadmap citations resolved** (12): CrystallineCohomology CR.1.3 at 6ab379a (README line 128–130: "CR.1.3 owns the ordinary connection carrier over arbitrary commutative base rings and its extension, curvature, horizontal maps, coefficient de Rham complexes, base change, tensor and Hom/dual operations", prose only; the quasi-nilpotence definition at lines 1404–1419 and the Check "∇e = e dt … not quasi-nilpotent" at line 1462 agree with 1.5); FormalConnectionsOpers §2.1 and §2.3 at 1aab7da (lines 539–576, 650–658: `Derivation k A A → Module.End k M` with the Leibniz identity; bracket flatness equals zero curvature when `Ω¹` is finite projective, with the `k[x, y]/(x, y)²` negative control); DerivedDeRhamCohomology §3.6 at e0b83c0 (lines 3896–3909: any `𝔽_p`-algebra `A`, smooth `B`, `∧^i Ω¹_{B^(1)/A} ≃ H^i(Ω•_{B/A})`, `Lean: DerivedDeRham.smoothCartier`, Check `H⁰ = 𝔽_p[t^p]`) and §3.6.1 (line 3925, the Frobenius-descent connection); SchemeAndStackFoundations on main §0.8 `etale_coordinates` (line 818), §0.9 `finite_presentation_limits` and `spreading_out_models` (lines 859–869; R01 for "surjective"), §0.29 `schemeFrobeniusTwist`, `relativeFrobenius`, `relativeFrobenius_smooth_rank` (lines 1874–1910, relative map `b ⊗ a ↦ b^p a`, rank `p^d`); GrothendieckNotesLemmas §3.2 at 30d3e77 (lines 465–470: `Derivation.lie_mulLeft`, `Derivation.mulLeft_mul_mul_mulLeft_inv`, exactly as cited). The four "Lean names found nowhere" of the worker's citation check are these supplier names, all resolved at the heads above.

**Library declarations opened at the pins** (Mathlib f6090c70, Tau Ceti 358314d4): `TauCeti.LieAlgebra.ad_pow_expChar_pow` (`TauCeti/Algebra/Lie/AdjointAction/Frobenius.lean:76`, `[ExpChar A p]`, `ad R A (a ^ p ^ n) = (ad R A a) ^ p ^ n`); `Derivation.extendOfIsLocalization` and `_algebraMap` (`TauCeti/RingTheory/Derivation/Localization.lean:65, 76`, extension of `D : A → N` to `IsLocalization S T`, agreeing with `D` on `A`, so `ratFuncD` is `d/dx` on `RatFunc K`); `TauCeti.kaehlerBasisOfFormallyEtale` (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`); `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:74`), `frobeniusPrimeSet` (`…/FrobeniusPrimeSet.lean:93`); `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` (`Mathlib/RingTheory/Etale/Kaehler.lean:36`); `Derivation.leibniz_pow` (`Mathlib/RingTheory/Derivation/Basic.lean:139`); `Algebra.Smooth` (`Mathlib/RingTheory/Smooth/Basic.lean:539`), `Algebra.Etale` (`Mathlib/RingTheory/Etale/Basic.lean:205`). Duplication by object: no restricted Lie algebra, `p`-map, Jacobson polynomial, `p`-curvature or subalgebra of `p`-th powers at either pin (grep of `Mathlib/Algebra/Lie`, `Mathlib/RingTheory/Derivation`, `TauCeti/Algebra/Lie`; the only "restricted Lie" hit is a comment in `TauCeti/Algebra/Lie/UniversalEnveloping/LieIdeal.lean:46`); no commutator lemma `[D, mulLeft a] = mulLeft (D a)` in `Mathlib/RingTheory/Derivation`, so citing GrothendieckNotesLemmas §3.2 duplicates nothing.

**Sources, seeded sample** (katz1970 = cache c982f327, Numdam PMIHES_1970__39__175_0, printed page = PDF page + 173, the PDF itself read for the signs of (5.3.0)–(5.4.0); bcr2024 = 6acff62a, arXiv:2304.05061v2; furnsinn-pannier = cac8df9f, arXiv:2510.00892v2, OCR; groechenig2016 = 6b232220, arXiv:1201.0741v3; jacobson1937 = 69b62655, jacobson1941 = 5fcfc700, AMS open PDFs; katz1982 = e00900b1, Numdam):

- 0.1: Katz (5.2.4)–(5.2.5), katz1970 lines 655–658 (p. 192): `(a + b)^p = a^p + b^p + Σ_{i=1}^{p−1} s_i(a, b)`, `(ad(ta + b))^{p−1}(a) = Σ i s_i(a, b) t^{i−1}`; Jacobson 1937 §4, lines 164–172, defines restricted Lie algebras by `[…[[x, y], y] … y] = [x, y^p]`; Jacobson 1941 lines 54–57 states the formula with `(p − i) s_i` the coefficient of `λ^{p−i−1}` in right-nested brackets, the same after `i ↦ p − i`. `jacobsonLie` (words of length `p − 1`, innermost `x`, coefficient the representative of `i^{−1}` with `i − 1` the number of `x`) matches.
- 0.2: Jacobson 1941 lines 58–66, axioms (4) `(a + b)^{[p]} = a^{[p]} + b^{[p]} + s(a, b)`, (5) `(αa)^{[p]} = α^p a^{[p]}`, (6) `ad(b^{[p]}) = (ad b)^p`: the three fields of `RestrictedLieAlgebra`.
- 0.3: (5.0.1)–(5.0.3), lines 566–574 (p. 189): `D^p` is a derivation, `Der(S/T)` a sheaf of restricted `p`-Lie algebras; Proposition (5.3) (Deligne), PDF p. 19 (printed 192), with the hypothesis that the `g^{(n)}` commute; applied in (5.4.0), printed p. 193. See Source issues for the sign.
- 1.1: (5.0.4) line 589, `ψ(D) = (∇(D))^p − ∇(D^p)`; (5.0.6)–(5.0.9) lines 593–600 (p. 190), `S`-linearity from the Leibniz rule with `m = p`.
- 1.2: Proposition (5.2), lines 640–652 (pp. 190–192): (5.2.0) additive and `ψ(gD) = g^p ψ(D)`, (5.2.1)–(5.2.3); additivity proof (5.2.6)–(5.2.8) uses integrability (line 662, "as the connection ∇ is integrable and the `s_i` are Lie polynomials"); `p`-linearity (5.4) does not; (5.4.3)–(5.4.4), lines 708–719 (p. 193–194), use a finite base `{ds_1, …, ds_r}`.
- 1.3: CR.1.3's operations (above) and Mathlib's `tensorKaehlerEquivOfFormallyEtale`; the étale "iff" with the faithful-flatness direction is this roadmap's statement, checked below.
- 1.4: (5.0.4) and (5.2.4) in rank one; checked by computation below.
- 2.0: DerivedDeRhamCohomology §3.6 degree `0`; SchemeAndStackFoundations §0.29 (above).
- 2.1: Theorem (5.1), lines 603–638 (pp. 190–191): `S` smooth over `T` of characteristic `p`, quasi-coherent sheaves on `S^{(p)}` against MIC objects with `ψ = 0`; proof local, `S` étale over `𝔸^r`, projector (5.1.2)–(5.1.6) over `0 ≤ w_i ≤ p − 1`, inverse by Taylor's formula. Groechenig arXiv:1201.0741v3 Theorem 3.11 "(Cartier descent)", line 438, Azumaya route (lines 435–450).
- 2.2: consequences of (5.1); the local-ring clause is the projector of (5.1) in rank `n`.
- 3.1: from 1.3 (étale, faithfully flat, flat connection).
- 3.2: bcr2024 Theorem 3.5, lines 1087–1120 (pp. 24–25), proved over a number field `K` through primes `P` above `p`; the general statement is the roadmap's.
- 4.2: bcr2024 proof of Theorem 3.6, lines 1139–1156 (p. 25): the `a_i`, `α_{i,j}` and the coefficients of `P` are `P`-integral for almost all `P`, and the reduction of the decomposition is the decomposition of the reduction.
- 4.3: Theorem 3.6 (Honda), lines 1127–1158; Honda [53, §1] cited at line 1571 and line 1127; Theorem 3.7 (Kronecker), lines 1161–1162; furnsinn-pannier Theorem 1.1, lines 73–75, Propositions 2.2–2.3, lines 193–226, "[Hon81, Lem. 1]" at line 222; Example 3.4, lines 1065–1086 (`p ≡ 3 (mod 4)`: residues not in `𝔽_p`, no rational solution).
- 4.4: bcr2024 Proposition 3.1, lines 984–999 (the `(x − a_i)^{n_i}` solution), Theorem 3.16, lines 1322–1327 (the four equivalent conditions over `ℚ`).
- Also opened: Proposition 3.3, lines 1059–1062; Theorem 3.12 and Remark 3.13, lines 1242, 1266–1295 (`b_p = b^{(p−1)} + b^p`, the residue criterion); §3.3.2, lines 1568–1571 (Chudnovsky Theorem 8.1, Honda §1); Proposition 1.8 (line 224), Proposition 3.9 (1198), Remark 3.11 (1229), Theorem 3.19 (Cartier's lemma, line 1397, cited in the reference list only); Katz 1982 abstract, lines 28–31 (the Lie algebra of the differential Galois group as the smallest algebraic Lie algebra whose reductions contain the `p`-curvatures); Katz (5.5)–(5.9), lines 720–773 (Corollary 5.5 with (5.5.0)–(5.5.2), Definition 5.6, Proposition 5.7 with exponent `n + m − 1`, Proposition 5.8, Theorem 5.9); (5.10.0)–(5.10.2) at lines 808–811 for the out-of-scope Theorem 5.10.

**Adversarial table** (values computed by hand; `D = d/dx` unless said; `ψ` as in Convention 4).

| Statement | Instances | Values each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `jacobsonLie`, `p = 2` | words `x`, `y` | `x`: `i = 2`, `(2 : ZMod 2)⁻¹ = 0`; `y`: `i = 1`, coefficient `1` → `Λ_2 = [y, x]`; `(a+b)² − a² − b² = ab + ba = ba − ab` in char `2` | holds | none |
| 0.1 `p = 3` | words `xx, xy, yx, yy` | `0·[x,[x,x]] + 2[x,[y,x]] + 2[y,[x,x]] + [y,[y,x]] = [y,[y,x]] + 2[x,[y,x]]`; expanded: `y²x − 2yxy + xy² + 4xyx − 2x²y − 2yx² ≡ y²x + yxy + xy² + xyx + x²y + yx²` mod `3`; `(a+b)³ − a³ − b³` has the same six words | holds | none |
| 0.1 `E₁₂, E₂₁`, `p` odd | `(a+b)² = I` | `(a+b)^p = a + b`; `a^p = b^p = 0`; `Λ_p(a,b) = a + b ≠ 0` | Check holds | none |
| 0.1 `i = p` coefficient | word `x…x` | `ad(x)^{p−1}(x) = 0`; `(p : ZMod p)⁻¹.val = 0` | consistent | none |
| 0.2 two structures on abelian `R` | `pMap = 0`; `pMap c = c^p` | `pMap_smul`: `0 = c^p·0`, `(cx)^p = c^p x^p`; `ad_pMap`: `0 = 0^p`; `pMap_add`: `Λ_p = 0` (every word has a bracket), `(x+y)^p = x^p + y^p` | both restricted, differ at `1` | none |
| 0.3 `iterate_leibniz`, char `0` control | `ℚ[x]`, `D²(x·x)` | `2 ≠ x·0 + x·0` | hypothesis needed, Check holds | none |
| 0.3 `pPow` on `𝔽_p[x]` | `D`, `xD` | `D^p(x^n) = n(n−1)⋯(n−p+1)x^{n−p} = 0`; `(xD)^p x^n = n^p x^n = n x^n` | `pPow D = 0`, `pPow (xD) = xD` | none |
| 0.3 `pPow_smul`, `p = 2` | `a = x`, `a = x²`, `D` | `(xD)² f = x f′ + x² f″`, RHS `x² D² + (xD)(x)·D = x²D² + xD`; `(x²D)² f = x⁴ f″`, RHS `x⁴D² + x²·2x·D = x⁴D²` | holds | none |
| 0.3 `pPow_smul`, `p` odd | `a = x` | LHS `xD`; RHS `x^p·0 + (xD)^{p−1}(x)·D = xD`; Katz's printed term `x·D^{p−1}(x^{p−1})·D = (p−1)!·xD = −xD` | holds; print wrong | Source issues |
| 0.3 `ad_pPow`, `pPow_add` | `Der ⊂ End` | inclusion is a Lie morphism; `ad(D^p) = (ad D)^p` in `End` (`ad_pow_expChar_pow`, `n = 1`); `Λ_p` computed in `Der` maps to `Λ_p` in `End` | holds | none |
| 0.3 instance `pMap_smul` | `c ∈ R` | `(c•D)^p = c^p D^p` by `smul_pow`, proved in the file | holds | none |
| 1.1 `A`-linearity | any `∇`, `a`, `m` | `(∇_D)^p(am) = a∇_D^p m + D^p(a) m`; `∇_{D^p}(am) = a∇_{D^p} m + D^p(a) m`; difference `A`-linear | no flatness needed | none |
| 1.1 Check 2 | `d`, `D = xD` | `(xD)^p − pPow(xD) = xD − xD = 0`; `(∇_D)^p` alone `= xD ≠ 0` | Check holds | none |
| 1.2 additivity needs flatness | `𝔽_2[x,y]`, `d + x dy` | `ψ(∂_x) = ∂_x² = 0`; `ψ(∂_y) = (∂_y + x)² = x²`; `ψ(∂_x+∂_y) = (E+x)² = E(x) + x² = 1 + x²` | `≠ x²`; odd `p`: `x^p = 0 + x^p` | none |
| 1.2 `p`-linearity, Check 2 | `a = y`, `p = 2` | `(y∂_y + xy)² = y∂_y + xy + x²y²`; `∇_{(y∂_y)^[2]} = y∂_y + xy`; `ψ(y∂_y) = x²y² = a²ψ(∂_y)` | value right, displayed identity wrong | R03 |
| 1.2 infinite coordinates | `κ = 𝔽_p(x_0, x_1, …)` | `Der ≅ κ^ℕ` product; `D = Σ D(s_i)∂_i` undefined | Check holds | none |
| 1.3 étale pull-back, any `∇` | `B ⊗ M`, `D_B` | `(∇^B_{D_B})^p(b ⊗ m) = D_B^p b ⊗ m + b ⊗ ∇_D^p m` (commuting pieces); `(D_B)^p = (D^p)_B` (derivations of étale `B` determined on `A`); difference `b ⊗ ψ_M(D) m` | holds | none |
| 1.3 "iff" needs étale | `𝔽_p[x] ⊂ 𝔽_p[s]`, `s^p = x`, `d + dx` | `ψ_M = 1`; `dx = d(s^p) = 0` in `Ω¹_B`, `ψ_{B⊗M} = 0` | Check holds | none |
| 1.3 `⇒` on all of `Der_R(B)` | `Σ b_i (D_i)_B` | `ψ(Σ b_i (D_i)_B) = Σ b_i^p ψ((D_i)_B)` by additivity (flat) and `p`-linearity; `Der_R(B) = B ⊗_A Der_R(A)` for `Ω¹_A` finitely presented and `B` flat | holds | none |
| 1.3 tensor, dual Checks | `d ± dx` | `ψ = 1`, `−1`; `(A, d+dx) ⊗ (A, d−dx) = (A, d)`, `1 + (−1) = 0`; dual `ψ_N∘φ − φ∘ψ_M = −1` | Checks hold | none |
| 1.4 `rankOne_pCurvature_eq`, `p = 2` | `a = ω D` | `(D + a)² = D² + a² + D(a)` (`Da = aD + D(a)`, `2aD = 0`); minus `D² + ω(D^p)` gives `mulLeft(a² + D(a) − ω(D^p))` | holds | none |
| 1.4 `p = 3` | `a = ω D` | `(D+a)³ = D³ + 3aD² + (3D(a) + 3a²)D + D²(a) + 3aD(a) + a³ = D³ + a³ + D²(a)` | holds | none |
| 1.4 `ω` not used beyond values | any `ω`, `b = ω(D^p)` | `b` cancels on both sides | holds for every `ω` | none |
| 1.4 Check `c/x` | `𝔽̄_p[x, x⁻¹]` | `D^{p−1}(x⁻¹) = (−1)^{p−1}(p−1)!·x^{−p} = −x^{−p}` (also for `p = 2`); `ψ = (c^p − c)/x^p` | zero iff `c ∈ 𝔽_p` | none |
| 1.4 recursion | `(D+Γ)^k = Σ_j C_{k,j} D^j` | `C_{k+1,0} = D(C_{k,0}) + Γ C_{k,0}`; rank one `C_{3,0} = D²(a) + 3aD(a) + a³` matches the direct expansion; `ψ(D) = C_{p,0} − Γ(D^p) + L` with `L` an `A`-linear operator vanishing on `R^n`, so `L = 0` | holds | none |
| 1.4 unipotent `Γ = [[0,x^{p−1}],[0,0]]` | `Γ_k` | `Γ² = 0` and `Γ·D^j(Γ) = 0` give `Γ_k = D^{k−1}(Γ)`; `Γ_p = [[0,(p−1)!],[0,0]] = [[0,−1],[0,0]]`; `ψ² = 0` | Check holds | none |
| 1.4 Airy `p = 3` | `Γ = [[0,1],[x,0]]` | `Γ_2 = [[x,0],[1,x]]`; `Γ_3 = I + ΓΓ_2 = [[2,x],[x²,1]] = [[−1,x],[x²,1]]`; right order `I + Γ_2Γ = [[1,x],[x²,−1]]` | both Checks hold | none |
| 1.4 Airy `p = 5` | same | `Γ_3 = [[2,x],[x²,1]]`, `Γ_4 = [[x²,2],[4x,x²]]`, `Γ_5 = [[6x,x²],[x³+4,4x]] = [[x,x²],[x³−1,−x]]` | Check holds | none |
| 1.5 tensor exponent | `N ⊗ 1 + 1 ⊗ N`, `p` odd | `ψ² = 2N⊗N ≠ 0`, `ψ³ = 3N²⊗N + 3N⊗N² = 0` | exponent `3 = 2+2−1` | none |
| 1.5 comparison with CR.1.3 | `P = R[x_1..x_r]`, `R` an `𝔽_p`-algebra, `M` f.g. | `pM = 0`, so quasi-nilpotent ⇔ ∀m ∀i, `θ_i^k m = 0` for `k ≫ 0`; nilpotent ⇒ `θ_i^{pn} = 0`; conversely `θ_i^{pw}` for `pw ≥ N` kills generators and is `P`-linear (`ψ(∂_i) = θ_i^p`, `∂_i^p = 0`), so `ψ(∂_i)^w = 0`, products with `Σ w_i = r⌈N/p⌉` vanish | equivalent | none |
| 2.0 `frobeniusImage` | `𝔽_p[x]`; `R = 𝔽_p[ε]/ε²`, `A = R[t]`; perfect `κ` | `𝔽_p[x^p]`; `R[t^p]` (contains `ε = ε·1^p`), `ker d`: `Σ k c_k t^{k−1} dt = 0` iff `c_k = 0` for `p ∤ k`, so `R[t^p]`; `κ` | Checks hold | none |
| 2.0 image = adjoin | `a ⊗ r ↦ r a^p` | image is the `R`-span of `p`-th powers, closed under products, contains `1` = `Algebra.adjoin R {a^p}` | holds | none |
| 2.0 injectivity for smooth `A` | `A` étale over `P = R[t]` | `A = A^{(1)} ⊗_{P^{(1)}} P` (relative Frobenius of étale is an isomorphism), `P^{(1)} → P` injective, `A^{(1)}` flat over `P^{(1)}` | injective; also from rank `p^d` faithful flatness | none |
| 2.0 `apply_eq_zero_of_mem_frobeniusImage` | `a = Σ r_i b_i^p` | `D(b^p) = p b^{p−1} D b = 0`, `D(r) = 0`, Leibniz on products | holds | none |
| 2.1 `A = R`; `M = 0`; `M` not finite | `Der = 0` | `M^∇ = M`, `R ⊗_R M → M` bijective; `0`; Katz's projector needs no finiteness ((1.0) quasi-coherent) | holds | none |
| 2.1 Check 3 | `d + dx` on `𝔽_p[x]` | `y′ = −y` forces `deg y′ = deg y`, so `y = 0`; `A ⊗_{A′} 0 → A` not surjective | Check holds | none |
| 2.1 Zariski locality | invert `f` | `A_f = A ⊗_{A′} A′_{f^p}`, `(M_f)^∇ = (M^∇)_{f^p}` | holds | none |
| 2.3 `⇒` | unit `y`, `Dy + ay = 0` | `(D+a)^p y = 0 = (D^p + a^p + D^{p−1}a) y = (a^p + D^{p−1}a) y` | `a^p + D^{p−1}a = 0` | none |
| 2.3 `⇐` | `P = Σ_{k<p} (−x)^k/k! (D+a)^k` | `(D+a)P` telescopes to `(−x)^{p−1}/(p−1)!·(D+a)^p = 0` (`D x = 1`, `k!` units); `Σ_j x^j/j! P(D+a)^j = Σ_m (x−x)^m/m! (D+a)^m = 1`; `1 = Σ_j (x^j/j!) h_j` with `h_j` horizontal; in a local ring one summand is a unit, so some `h_j` is | horizontal unit exists | none |
| 2.3 Checks | `a = 0`; `a = 1`; `a = −1/(1+x)` | `1`; `1 + 0 ≠ 0`; `D^{p−1}((1+x)^{−1}) = (p−1)!(1+x)^{−p} = −(1+x)^{−p}` so `a^p + D^{p−1}a = −(1+x)^{−p} + (1+x)^{−p} = 0`, `y = 1+x` (`p = 2` too: `2(1+x)^{−2} = 0`) | Checks hold | none |
| 2.3 `κ[[x]]`, `κ[x]_{(x)}` | `D^p` | `D^p(x^n) = n(n−1)⋯(n−p+1) x^{n−p} = 0` (`p` consecutive integers) | `hD` holds | none |
| 2.4 Checks | `1/x + 1/(x−1)`; `1/(2x)`; `1/x²` | `ψ = 0`, `y = 1/(x(x−1))`; `(1/2)^p x^{−p} + (1/2)(p−1)! x^{−p} = 0`, `y = x^{(p−1)/2}`; `x^{−2p} + (−1)^{p−1}p!·x^{−p−1} = x^{−2p} ≠ 0` | Checks hold | none |
| 3.1 Check 2 | `B = A[t]/(t² − x)`, `d + ½ dx/x` | `t′ = t/(2x)`, `(t⁻¹)′ + (1/(2x)) t⁻¹ = −t⁻¹/(2x) + t⁻¹/(2x) = 0` | horizontal unit | none |
| 3.2 spreading out, surjectivity | `Spec B → Spec A_f` finite étale | image clopen ⊇ `Spec A_F`, dense since minimal primes of flat `A` lie over `(0)` | holds, not from §0.9 | R01 |
| 3.2 Check 3 | `d + ½ dx/x` over `ℤ` | not a connection over `ℤ[x, x⁻¹]` | not an instance | R02 |
| 3.2 replacement | `ℤ[x, 1/(x²+1)]`, `d + x dx/(x²+1)` | `p = 2`: `a = x/(x+1)²`, `a′ ≡ 1/(x+1)²`, `ψ = (x² + (x+1)²)/(x+1)⁴ = 1/(x+1)⁴ ≠ 0`; `p` odd: residues `½, ½ ∈ 𝔽_p`, `ψ = 0`; `t² = x² + 1` trivialises over `ℚ(x)` | witness for R02 | R02 |
| 4.1 Checks | `c = i`, `p ≡ 3 (4)`; `c = 3`; `c = ½` | `i^p = −i`, `2i ∉ 𝔓`; `3^p ≡ 3`; `(½)^p − ½ = (1 − 2^{p−1})/2^p ≡ 0` at odd `p` | Checks hold | none |
| 4.1 `L = ℚ` | any `c ∈ ℤ` | conclusion trivial | holds | none |
| 4.2 Checks | `1/(x²−1)`; `1/(x²+1)`; `x + 1/x` | `½[(x+1) − (x−1)]/(x²−1)`, poles merge mod `2`; residues `∓i/2`; `R = x` | Checks hold | none |
| 4.3 `honda` `⇐` | `n a = f′/f`, `m ≡ 1/n` | `ā = m f̄′/f̄ = (f̄^m)′/f̄^m`, horizontal `f̄^{−m}`; `ψ = 0` by 2.3 `⇒` | holds | none |
| 4.3 `⇒` over `K` | residues `c_{α,1}` | `m c ∈ 𝓞_L` for `m ∈ ℤ`: `(mc)^p − mc ≡ m(c^p − c)` at almost all `𝔓`, so 4.1 gives `mc ∈ ℤ`, `c ∈ ℚ`; `Gal(L/K)` permutes `α`, fixes rational residues, `f ∈ K(x)`; `f′/f = Σ n c_{α,1}/(x−α) = n a` | holds | none |
| 4.3 junk reduction | `Q̄ = 0` | `ratFuncMod = 0`, `ψ(0) = 0`, finitely many `v` | cofinite filter unaffected | none |
| 4.3 Checks | `a = 0`; `1/(2x)`; `1/(x²+1)` | `n = 1, f = 1`; `n = 2, f = x`; residues `∓i/2`, `ψ ≠ 0` iff `p ≡ 3 (4)` (bcr2024 Example 3.4) | Checks hold | none |
| 4.4 Kummer cover | `B = O(U)[t]/(t^n − f)` | `t^n = f` unit, `n` invertible: étale, free of rank `n`; `t′ = f′t/(nf) = at`, `(t⁻¹)′ + a t⁻¹ = 0` | horizontal unit | none |
| 4.4 Checks | `i/(x²+1)`; `1/(2x)`; `a = 1` | `½/(x−i) − ½/(x+i)`, `f = (x−i)/(x+i)`, `f′/f = 2i/(x²+1) = 2a`; `t² = x`; `ψ = 1` | Checks hold | none |
| Conventions 1, 5, 6 | `d(x^p)/dx = 0`; `a = 1/x`; `1/(2x)` at `2` | `p x^{p−1} = 0`; `x^{−p} + (p−1)! x^{−p} = 0`, `y = 1/x` (`p = 2`: `x^{−2} + x^{−2} = 0`); `Q̄ = 0` | witnesses hold | none |

**Headline theorems** (from the README's summary): Jacobson's formula (0.1, stated), the restricted structure on `Der_R(A)` with Hochschild's formula (0.3, stated), Katz's structure theorem (1.2, not statable, named), the rank-one formula (1.4, stated), nilpotence (1.5, named), Cartier descent (2.1, named), rank one in one variable (2.3, stated), the easy direction (3.2, named), Kronecker (4.1, stated), Honda (4.3, stated), the Kummer trivialisation (4.4, named); 2.4 is the subject of R04. The `honda` statement names the roadmap's objects (`ratFuncPCurvature`, `ratFuncMod`, `ratFuncD`); `exists_intCast_eq_of_forall_pow_sub_mem` is on `𝓞 L` and `HeightOneSpectrum`, `exists_unit_horizontal_iff` on a bare local ring, each a theorem in its own right.

**Declared gaps:** none declared; none needed (every supplier section cited exists at the head or on main; R01 is a mis-attribution inside an existing section, not a missing one).

## Not verifiable

- Honda 1981 (Symposia Mathematica XXIV, Academic Press): no legal copy found by the sources service; read through bcr2024 Theorem 3.6 (line 1127, "Honda [53]") and furnsinn-pannier line 222 ("[Hon81, Lem. 1]").
- Katz 1972 (Invent. Math. 18, Springer), Chudnovsky–Chudnovsky 1985 (LNM 1135), André 1989 (Vieweg), André 2004 (de Gruyter), Beukers–Peters 1984 (Crelle 351): paywalled, research context only; Chudnovsky Theorem 8.1 is cited through bcr2024 line 1570.
- Kronecker 1880 (Monatsberichte): no legal copy found; the theorem is read in bcr2024 Theorem 3.7 and furnsinn-pannier Theorem 1.1.
- The Montpellier Grothendieck archive, folder 93, pp. 193–197 (research context): not opened.
- Ogus–Vologodsky 2007, Berthelot 2000, Brunella 1994, Christol 1986–87, Bost 2001, Chambert-Loir 2002 (research context): Numdam copies exist (chambert-loir cache 72a577ce opened to its title page); their contents were not re-read for this review since no target cites them.

## Source issues

- **Error** in katz1970 at Proposition (5.3), display (5.3.0), and (5.4.0), printed pp. 192–193: the source writes the correction term of `(gD)^p` as `+ g·D^{p−1}(g^{p−1})·D` (read in the PDF, not only the text layer); it should be `− g·D^{p−1}(g^{p−1})·D`, equivalently `+ (gD)^{p−1}(g)·D`, since `g = x`, `D = d/dx`, `p = 3` on `𝔽_3[x]` gives `xD` on the left and `−xD` on the right; affects nothing (the `p`-linearity (5.2.0) uses only the shape of the term, and the two forms agree for `p = 2`).
