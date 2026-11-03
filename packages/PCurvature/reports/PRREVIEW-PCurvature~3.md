# Review of PCurvature (pull request #1747 at f7a3b9e)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/PCurvature/README.md` and `TauCetiRoadmap/PCurvature/Suggested.lean` at f7a3b9e; the gate at this head fails (`set_option`, 13 pull-request numbers, one residue word, 4 README identifiers not declared, the Lake module-system build warning); the dependency check reports no problem, but only because the README has no `*Needs:*` line (see R07). The pull request changes nothing outside the folder. Ownership against the open pull requests was checked with the roadmap grep (p-curvature, restricted Lie algebras, Jacobson's formula, Cartier descent, Honda): no other roadmap owns these objects; PCurvature is the owner.

## R01 (P2) — `set_option` in `Suggested.lean`

Location: `TauCetiRoadmap/PCurvature/Suggested.lean` line 5, `set_option autoImplicit false`.

Claim: the file has a file-level `set_option`; the principles make any `set_option` blocking and the gate fails on it.

Witness: gate rule `set_option (1)`; elaborating a copy of the file with line 5 deleted gives `declaration uses sorry` as the only warnings (every binder in the file is already explicit).

Repair: delete line 5.

## R02 (P2) — the connection headlines are stated through a stand-in carrier

Location: `TauCetiRoadmap/PCurvature/Suggested.lean` lines 15–21 and 158–166 (`DerivationConnection`, docstring "Stand-in for FormalConnectionsOpers F2.1 … only so that this file compiles"); `README.md` line 56 ("no second carrier is introduced").

Claim: the roadmap's carrier is CrystallineCohomology CR.1.3's ordinary connection with FormalConnectionsOpers F2.1's evaluation on derivations. Neither exists at the pins (checked: no connection declaration in CrystallineCohomology's or FormalConnectionsOpers's `Suggested.lean` at their heads, none in Mathlib f6090c70 or Tau Ceti 358314d4). The file then declares its own structure for F2.1's object and states Katz's structure theorem (`pCurvature_smul_apply`, `pCurvature_smul`, `pCurvature_add`, `commute_pCurvature`, `commute_pCurvature_of_basis`), functoriality (`pCurvature_comp_of_horizontal`, `pCurvature_eq_zero_of_basis`) and Cartier descent (`cartier_descent`, `horizontalFrob`) on it. The file's own docstring calls it a stand-in, and the README's ownership table says the roadmap introduces no second carrier, so README and Lean disagree about the carrier. The rules for `Suggested.lean` exclude a stand-in: a headline whose carrier is missing at the pins is named in the module docstring as not statable, and nothing is stated in its place. The docstring also omits Layer 3's easy direction and 4.4's Kummer trivialisation, which are not statable either (schemes over a finitely generated ℤ-base, spreading out) and must be named with what they lack.

Witness: FormalConnectionsOpers §2.1 (F2.1) at its head: "Construct evaluation on vector fields as an `A`-linear map `Derivation k A A → Module.End k M` obeying `∇_ξ(am) = a∇_ξ m + ξ(a) m`", the exact data of `DerivationConnection`; CrystallineCohomology line 128 "CR.1.3 owns the ordinary connection carrier over arbitrary commutative base rings".

Repair: delete `DerivationConnection`, `IsFlat`, `horizontal`, `horizontalFrob`, `pCurvature`, `IsNilpotentPCurvature`, `ofForm` and the eight theorems on them from `Suggested.lean`; keep Layer 0 (on `Derivation R A A`, native), `frobeniusImage`, `apply_eq_zero_of_mem_frobeniusImage`, `kaehlerD_eq_zero_iff`, `exists_unit_horizontal_iff` (stated on a bare local ring, no carrier needed), `exists_intCast_eq_of_forall_pow_sub_mem` and `honda` (on `RatFunc`, native); the module docstring names Katz's structure theorem (1.2), Cartier descent (2.1), the easy direction (3.2) and the Kummer trivialisation (4.4) as not statable, each with the missing carrier (CR.1.3's connection and F2.1's evaluation; schemes of finite presentation over a finitely generated ℤ-domain with their reductions). If the rank-one formula of 1.4 is wanted as a headline it is statable without a carrier, as an identity in `Module.End R A`: `((D : Module.End R A) + LinearMap.mulLeft R (ω D)) ^ p − ((pPow p D : Module.End R A) + LinearMap.mulLeft R (ω (pPow p D))) = LinearMap.mulLeft R (ω D ^ p + D^[p−1] (ω D) − ω (pPow p D))`. The README's ownership sentence then stays true. (If the author instead holds that a bare vector-field connection is an object this roadmap should own, that is an ownership change against FormalConnectionsOpers F2.1, to be argued in `## Scope and ownership`, not made silently in the Lean file.)

## R03 (P2) — `commute_pCurvature_of_basis` drops the finiteness of the coordinate system

Location: `TauCetiRoadmap/PCurvature/Suggested.lean` line 218, `{ι : Type*} (s : ι → A) (b : Module.Basis ι A (Ω[A⁄R]))`; `README.md` line 212, "if `Ω¹_{A/R}` is free on `ds_1, …, ds_r`".

Claim: the README and Katz (5.4.3)–(5.4.4) state (5.2.2)–(5.2.3) for finitely many coordinates: the proof writes `D = Σ_i D(s_i) ∂_i`, a finite sum, and uses additivity and p-linearity. The Lean statement allows any index type. For infinite `ι`, `Der_R(A) ≅ Hom_A(Ω, A) ≅ A^ι` is a product, a derivation is not a finite combination of the `∂_i`, and an `A`-linear `∇` on `Der_R(A)` is not determined by its values on the `∂_i` (over a field `κ = 𝔽_p(x_0, x_1, …)` with its p-basis, `Der_{𝔽_p}(κ) ≅ κ^ℕ` has κ-linear functionals vanishing on every unit vector), so the cited route does not apply, and no cited source proves the infinite case. README generality ≠ Lean generality.

Witness: Katz 1970, line 709–711 of the Numdam text (printed p. 193): "S is affine, and is étale over A^r, so that Ω is free, with base {ds_1, …, ds_r}"; the Lean binder has no `[Finite ι]`.

Repair: add `[Finite ι]` to `commute_pCurvature_of_basis` (if the declaration survives R02; otherwise state the finiteness in the README target, which already does).

## R04 (P2) — "ψ_M = 0 iff ψ_{B⊗M} = 0 for B faithfully flat" is false without étaleness

Location: `README.md` lines 236–238: "For `B` faithfully flat over `A` (in particular a finite étale cover with `Spec B → Spec A` surjective), `ψ_M = 0` if and only if `ψ_{B⊗M} = 0`"; repeated at 3.1 (line 338) for finite étale covers.

Claim: for a merely faithfully flat `B` the direction `ψ_{B⊗M} = 0 ⇒ ψ_M = 0` fails: the base-changed connection (CR.1.3's base change along `A → B`, `Ω¹_{A/R} → Ω¹_{B/R}`) can kill the connection form.

Witness: `R = 𝔽_p`, `A = 𝔽_p[x] ⊂ B = 𝔽_p[s]` with `s^p = x` (`B` is free over `A` on `1, s, …, s^{p−1}`, so faithfully flat), `M = A`, `∇ = d + dx`. By Check 1.4, `ψ_M(d/dx) = 1 ≠ 0`. In `Ω¹_{B/𝔽_p} = B ds` one has `dx = d(s^p) = 0`, so the base-changed connection on `B ⊗_A M = B` is `b ↦ db + b·(1 ⊗ dx) = db`, the trivial connection, whose p-curvature is `0`. Both directions hold for `B` étale over `A` (then `Ω¹_{B/R} = B ⊗_A Ω¹_{A/R}` and every derivation of `A` extends), and the direction `ψ_M = 0 ⇒ ψ_{B⊗M} = 0` on all of `Der_R(B)` additionally uses additivity of `ψ`, hence flatness of `∇`, together with `Der_R(B) = B ⊗_A Der_R(A)` (`Ω¹_{A/R}` finitely presented, as for `A` smooth).

Repair: state the target as: for `A → B` étale and faithfully flat and `∇` flat, `ψ_M = 0` if and only if `ψ_{B⊗M} = 0`; keep the one-directional statement `ψ_M = 0 ⇒ ψ_{B⊗M}(D_B) = 0` on extended derivations for every étale `B`; add the instance above as a negative-control Check. Layer 3.2 is unaffected (its cover is finite étale and the connection flat), so the Needs line of 3.1 should say so.

## R05 (P3) — supplier declaration names that do not exist where they are cited

Location: `README.md` line 56: "CR.1.3, `Crystalline.Connection` with `.extend`, `.curvature`, `.tensor`, `.hom`"; line 111 "a `Crystalline.Connection` (CR.1.3)"; `Suggested.lean` line 16.

Claim: CrystallineCohomology at its head (#857, 6ab379a) states CR.1.3's carrier in prose only ("the ordinary connection carrier … its extension, curvature, horizontal maps, tensor and Hom/dual"); its README contains no backticked `Crystalline.Connection` and its `Suggested.lean` (90 lines) declares no connection. FormalConnectionsOpers cites the same material "by section; they are prose contracts" (its supplier section, line 270). The other supplier names resolve: `DerivedDeRham.smoothCartier` (DerivedDeRhamCohomology §3.6, "Lean:" line), `SchemeFrobenius.schemeFrobeniusTwist`, `SchemeFrobenius.relativeFrobenius`, `relativeFrobenius_smooth_rank` (SchemeAndStackFoundations §0.29 on main), `finite_presentation_limits`, `spreading_out_models` (§0.9), `etale_coordinates` (§0.8), `Derivation.lie_mulLeft`, `Derivation.mulLeft_mul_mul_mulLeft_inv` (GrothendieckNotesLemmas §3.2, an open pull request not yet in the merge order), and all six Tau Ceti and Mathlib declarations at the pins.

Repair: cite CR.1.3 by section and prose name ("CrystallineCohomology CR.1.3, *Ordinary algebraic connections*: the connection carrier, its extension, curvature, tensor, Hom/dual and base change"), drop the four invented identifiers.

## R06 (P3) — gate failures: pull-request numbers, residue word, undeclared identifiers, module warning

Location: `README.md` lines 56–62, 68, 75–76, 415–416, 439–440 (13 occurrences of `#857`, `#868`, `#1056`, `#1431`, `#1002`, `#887`, `#848`); line 497 ("catalogue dates"); lines 502–506 (`horizontal_span`, `horizontal_unit_iff`, `pCurvature_apply`, `pCurvature_eq_zero`, and the other external names `curvMat`, `proj`, `taylor`, `jacobson`, … presented in backticks); `Suggested.lean` line 1 (Lake's module-system warning on `import Mathlib`).

Claim: policy rules, each failed by the gate.

Witness: `gate.md` for this head: `prnum=13 residue=1 readme-ids-missing=4 build=1`.

Repair: cite roadmaps by name and section only; reword "catalogue dates" (e.g. "dated [1972]–1981 by the archive"); in `## Provenance` describe the external file's content in prose without backticked declaration names (the gate reads every backticked identifier as a claim about this roadmap's `Suggested.lean`); write the Lean file in module form (`module`, blank line, `public import Mathlib`, `public import TauCeti.Algebra.Lie.AdjointAction.Frobenius`, `public import TauCeti.RingTheory.Derivation.Localization`, docstring, `@[expose] public section`, then the namespace), which the gate's import rule accepts and which removes the warning; declarations need no change.

## R07 (P3) — README shape: no supplier-contract section, no `*Needs:*` lines, no layer Examples/Dependencies, no Downstream consumers, Checks missing

Location: `README.md` throughout: headings are `## What Mathlib and Tau Ceti already have`, `## Ordering`, `## Research context`, `## Provenance`; no `## Exact supplier contracts`, no `## How to read the build`, no `### Examples` or `### Dependencies` in any layer, no `## Downstream consumers`; no target carries a `*Needs:*` line (the supplier citations live in the table of lines 54–66 and in prose), so the dependency check (`depcheck: 205 roadmaps, 1654 edges, 0 problem(s)`) checks nothing for this roadmap; 1.1 (`pCurvature`), 2.0 (`frobeniusImage`, `horizontalFrob`) have no Checks, 0.2 (`RestrictedLieAlgebra`) and 1.5 (`IsNilpotentPCurvature`) have two; 2.1, 2.2, 3.1, 4.1, 4.2, 4.3 carry no Checks (4.1 has two).

Claim: the README does not have the TauCetiRoadmap shape; the missing `*Needs:*` lines also hide the supply direction from the tooling.

Witness: compare FormalConnectionsOpers at its head (headings `## Exact supplier contracts` … `### From TauCetiRoadmap.CrystallineCohomology`, `*Needs:*` after every target, `### Examples`, `### Dependencies` per layer).

Repair: add the standard sections; give every target a `*Needs:*` line (e.g. 1.1: "*Needs:* CrystallineCohomology CR.1.3; FormalConnectionsOpers §2.1; GrothendieckNotesLemmas §3.2; Layer 0 `pPow`"; 2.0: "SchemeAndStackFoundations §0.29; DerivedDeRhamCohomology §3.6"; 3.2: "SchemeAndStackFoundations §0.9; 3.1"; 4.1: "Tau Ceti `NumberField.Chebotarev.infinite_frobeniusPrimeSet`"); rerun the depcheck; add at least three discriminating Checks to each definition (for `pCurvature`: the rank-one value `ψ = 1` for `d + dx`; `ψ = 0` for the trivial connection; the non-flat 𝔽_2[x, y] example already in 1.2; for `frobeniusImage`: `𝔽_p[x]` gives `𝔽_p[x^p]`; a perfect field `κ` gives all of `κ`; `A = R[t]` over `R = 𝔽_p[ε]/ε²` gives `R[t^p]`, and `ker d = R[t^p]` too, as 2.0 claims for smooth `A`; and, for `horizontalFrob`, that `horizontal` is not an `A`-submodule: on `𝔽_p[x]` with `d`, the horizontal sections are `𝔽_p[x^p]`, closed under `x^p` but not under `x`).

## R08 (P3) — padding and definitions no headline needs

Location: `Suggested.lean` lines 117 (`pPow_apply`, proved by `simp`), 121 (`pPow_smul_const`), 82 (`RestrictedLieAlgebra.ofAssociative`), 94 (`RestrictedLieHom`), 258 (`IsNilpotentPCurvature`).

Claim: `pPow_apply` restates the definition; `pPow_smul_const` follows from the library (`smul_pow`, a scalar of `R` being central in `Module.End R A`); `ofAssociative`, `RestrictedLieHom` and `IsNilpotentPCurvature` are definitions used by no statement in the file (the restricted instance on derivations does not go through `ofAssociative`).

Witness: on a scratch copy, the one-tactic probe (`first | rfl | simp | simp [smul_pow] | (ext; simp [smul_pow])`) closes none of the 20 sorried theorems, but an `example` with the statement of `pPow_smul_const` closes with `ext a; simp [pPow, smul_pow]` against the pins.

Repair: delete the five declarations from `Suggested.lean`; the README keeps the facts as prose (then drop the backticks on `pPow_apply`, `pPow_smul_const`, `RestrictedLieHom`, `RestrictedLieAlgebra.ofAssociative`, `IsNilpotentPCurvature` in the README, since a backticked name of this roadmap's own is a claim that the file declares it).

## R09 (P3) — timelessness and a research-context attribution

Location: `README.md` line 133 ("`Suggested.lean` writes it as a sum over words …"); lines 440–441 ("the restricted Lie algebra of an algebraic group used by ReductiveGroups Layer 9B").

Claim: the README is the roadmap and defines its own objects; the definition of `Λ_p` by words (the coefficient of the word with `i − 1` letters `x` is the representative of `i^{−1}` modulo `p`) belongs in 0.1's prose, not deferred to the Lean file. ReductiveGroups on main (929496d) contains no "restricted Lie algebra"; the phrase occurs only in the open revision of that roadmap (#1332, near its §9C distribution algebras), and a revision pull request is not citable.

Repair: state the word-sum definition in 0.1 and drop the sentence about the Lean file; either cite ReductiveGroups by a section that exists on main or drop the clause.

## R10 (P3) — hypotheses left implicit in prose targets

Location: `README.md` 2.2 (lines 308–312): "`ψ = 0` if and only if `M` is spanned by horizontal sections; for `M` finite projective of rank `n` over a local `A`, if and only if `M` has a basis of `n` horizontal sections".

Claim: the direction `⇒` needs 2.1's hypotheses (`A` smooth over `R` of characteristic `p`, `∇` flat); `⇐` holds for every connection (1.3). As written the target has no hypotheses of its own.

Witness: Check 1.2's non-flat connection `d + x dy` on `𝔽_2[x, y]` has `ψ(∂_x) = 0`, `ψ(∂_y) = x^2 ≠ 0`; for flatness-free statements the two directions have different scope.

Repair: begin 2.2 with "Under the hypotheses of 2.1" and say which clause holds without them.

## Verified sound

**Gate and build.** `lake env lean` on `Suggested.lean` at f7a3b9e: 20 `declaration uses sorry` warnings, no error (the Lake module-system warning is the gate's). Elaborated types of all 38 declarations compared with their README statements (the worker's signature file; `ratFuncOfInt`/`ratFuncMod` lose `[NumberField K]`, harmless since they need only `Field K`). Out-of-folder diff against `origin/main`: empty. Folder contents: `README.md`, `Suggested.lean`, `metadata.toml`; no stray file. Pins: Mathlib f6090c70, Tau Ceti 358314d4, as the README states.

**Dependency check** (output): `depcheck: 205 roadmaps, 1654 edges, 0 problem(s)` — vacuous, see R07. Direction by hand: CrystallineCohomology (merge order line 20), DerivedDeRhamCohomology (19), FormalConnectionsOpers (40) precede PCurvature (374); SchemeAndStackFoundations, DiophantineApproximationAndTranscendence, SmoothBundlesConnections, ReductiveGroups are on main; GrothendieckNotesLemmas (#1431, new folder, not in the merge order, needs only Mathlib) is placed after its last supplier: no upward edge, no cycle. PadicDifferentialEquationsAndRigidCohomology (107) and ComplexComparisonPartII (39) are named only as not used.

**Library declarations opened at the pins.** Tau Ceti: `TauCeti.LieAlgebra.ad_pow_expChar_pow` (`TauCeti/Algebra/Lie/AdjointAction/Frobenius.lean:76`, `[ExpChar A p]`, `ad R A (a ^ p ^ n) = (ad R A a) ^ p ^ n`), `Derivation.extendOfIsLocalization` and `_algebraMap` (`TauCeti/RingTheory/Derivation/Localization.lean:65,76`), `TauCeti.kaehlerBasisOfFormallyEtale` (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean`), `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:74`), `NumberField.Chebotarev.frobeniusPrimeSet` (`…/FrobeniusPrimeSet.lean:93`). Mathlib: `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` (`Mathlib/RingTheory/Etale/Kaehler.lean:36`), `Derivation.leibniz_pow` (`Derivation/Basic.lean:139`), `LieRing.ofAssociativeRing` (`Algebra/Lie/OfAssociative.lean:47`, local instance as used), `Polynomial.derivative'`, `KaehlerDifferential.linearMapEquivDerivation`, `Algebra.Smooth`, `Algebra.Etale`; no restricted Lie algebra, Jacobson formula or p-curvature at either pin (grep).

**Cross-roadmap citations resolved** (10): CR.1.3 (prose carrier; its quasi-nilpotence definition at lines 1404–1419 of the head README, and its Check that `∇_∂ = ∂ + 1` on `𝔽_p[t]` is not quasi-nilpotent, line 2993, agrees with Check 1.5); F2.1, F2.3 (vector-field evaluation; bracket flatness equals zero curvature when `Ω¹` is finite projective, with the negative control `k[x, y]/(x, y)²`); DerivedDeRham §3.6 (any `𝔽_p`-algebra `A`, smooth `B`: `∧^i Ω¹_{B^(1)/A} ≃ H^i(Ω•_{B/A})`, degree 0 gives `ker d = B^(1)`); SSF §0.29 (twist `B ⊗_{A,F_A} A`, relative map `b ⊗ a ↦ b^p a`, finite locally free of rank `p^d` for smooth of pure relative dimension `d`), §0.8 `etale_coordinates`, §0.9 `finite_presentation_limits`, `spreading_out_models`; GNL §3.2; CrystallineCohomology line 193 (Cartier transforms of periodic connections deferred to CrystallineCohomologyPartII, as the README says); DerivedDeRham §3.6.1 (uses the Frobenius-descent connection, as the README says).

**Sources, seeded sample** (katz1970 = Numdam PMIHES_1970__39__175_0, scan page = printed − 173; bcr2024 = arXiv:2304.05061v2; furnsinn-pannier = arXiv:2510.00892v2, OCR; groechenig2016 = arXiv:1201.0741v3; jacobson1937, jacobson1941 AMS open PDFs):
- 0.1: Jacobson's formula is Katz (5.2.4)–(5.2.5), katz1970 lines 653–658 (p. 192): `(a+b)^p = a^p + b^p + Σ s_i(a,b)` with `(ad(ta+b))^{p−1}(a) = Σ i s_i t^{i−1}`; Jacobson 1937 §4, lines 164–172, defines restricted Lie algebras from the identity (14a). The Lean `jacobsonLie` (words of length `p − 1`, innermost `x`, coefficient the representative of `i^{−1}` with `i = #x + 1`) matches: for `p = 3`, `(ad(ta+b))²(a) = t[a,[b,a]] + [b,[b,a]]`, so `s_1 = [b,[b,a]]`, `s_2 = ½[a,[b,a]]`, as the Check says.
- 0.3: `D^p` a derivation is (5.0.1)–(5.0.3), lines 566–574 (p. 189); Deligne's identity is Proposition (5.3), lines 668–671 (p. 192), applied in (5.4.0), line 698 (p. 193), with hypothesis that the `(ad D)^n(g)` commute (automatic for `g ∈ A`).
- 1.1: (5.0.4) line 589, (5.0.6)–(5.0.9) lines 593–600 (p. 190).
- 1.2: Proposition (5.2), lines 640–652 (pp. 190–191): (5.2.0) additive and `ψ(gD) = g^p ψ(D)`, (5.2.1) `∇(D), ∇(D^p), ψ(D)` commute, (5.2.2)–(5.2.3) commutation and horizontality; proof of additivity via (5.2.6)–(5.2.8) uses integrability (line 662), proof of p-linearity (5.4) does not; (5.4.3)–(5.4.4) use a finite basis `ds_1, …, ds_r` (R03).
- 1.3: functoriality is CR.1.3's operations (tensor, Hom for `M` finite projective, base change along a square) plus Mathlib's étale extension; R04 for the faithfully flat claim.
- 1.5: Corollary (5.5), lines 720–736 (p. 194), (5.5.0)–(5.5.2) as stated; Definition (5.6), Proposition (5.7) with exponent `n + m − 1` for `⊗` and `Hom` (line 752), Proposition (5.8), Theorem (5.9) (squares), lines 737–773 (pp. 194–195).
- 2.1: Theorem (5.1), lines 603–638 (pp. 190–191): `S` smooth over `T` of characteristic `p`, quasi-coherent sheaves on `S^{(p)}` vs. MIC objects (quasi-coherent, (1.0) line 156) with `ψ = 0`; proof local, `S` étale over `A^r`, projector (5.1.2)–(5.1.6) and Taylor's formula. Groechenig arXiv:1201.0741v3 Theorem 3.11 "(Cartier descent)", line 438, Azumaya/Morita route.
- 2.2: consequences of (5.1) (rank one by Katz's projector); no separate locator needed.
- 2.4: bcr2024 Proposition 3.3, lines 1059–1062 (p. 23): over `𝔽_p`, simple poles with residues in `𝔽_p`, vanishing at ∞; Remark 3.13, lines 1266–1295 (p. 28), explicit `b_p` and the same criterion; Theorem 3.12 `b_p = b^{(p−1)} + b^p`, line 1242.
- 3.1: from 1.3; 3.2: bcr2024 Theorem 3.5, lines 1087–1120 (pp. 24–25), proof over a number field `K` via primes `P` above `p`.
- 4.1: bcr2024 Theorem 3.7 (Kronecker), lines 1161–1162; furnsinn-pannier Theorem 1.1, lines 73–75; both are the polynomial form (irreducible `R` with a root mod almost every `p` is linear); the README's form (`c` with `c^p ≡ c` mod almost every prime of `𝓞_L` is in `ℤ`) is its restatement for the minimal polynomial of `c`, proved from Chebotarev as described (lines 1159–1160, 1613).
- 4.2: bcr2024 proof of Theorem 3.6, lines 1139–1156 (p. 25): `a_i`, `α_{i,j}`, coefficients of `P` integral at almost all `P`, reduction of the decomposition.
- 4.3: Theorem 3.6 (Honda), lines 1127–1158; Honda 1981 is cited through it (bcr2024 line 1571: "proved by Honda in [53, §1]"); furnsinn-pannier Propositions 2.2–2.3, lines 193–220 (and line 222 citing Honda Lemma 1).
- 4.4: the Kummer cover is the `(x − a_i)^{n_i}` solution of Proposition 3.1, lines 984–999 (p. 22), raised to a common denominator; the four equivalences are Theorem 3.16, lines 1322–1327 (p. 29), over ℚ.
- Research context: Katz 1982 (Numdam BSMF_1982__110__203_0) abstract, lines 28–31: the Lie algebra of the differential Galois group as the smallest algebraic Lie algebra whose reduction contains the p-curvatures; bcr2024 §3.3.2, lines 1568–1571: Chudnovsky Theorem 8.1 for rank one over curves; Chambert-Loir (Numdam SB_2000-2001__43__175_0), Christol (GAU_1986-1987__14__A4_0), Bost 2001 (PMIHES_2001__93__161_0), Ogus–Vologodsky (PMIHES_2007__106__1_0), Berthelot 2000 (MSMF_2000_2_81), Brunella 1994 (AIF_1994__44_4_1237_0) all fetched and exist as cited.

**Adversarial table** (values computed by hand; `D = d/dx` unless said).

| Statement | Instances | Values each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `add_pow_eq_jacobson`, `p = 2` | words of length 1 | `Λ_2 = 0·[x,x] + 1·[y,x] = [y,x]`; `(a+b)² − a² − b² = ab + ba = ba − ab` in char 2 | holds | none |
| 0.1, `p = 3` | `(a+b)³ − a³ − b³` vs `[b,[b,a]] + 2[a,[b,a]]` | both `= a²b + aba + ba² + ab² + bab + b²a` (mod 3: `−2bab ≡ bab`) | holds | none |
| 0.1, `E₁₂, E₂₁`, `p` odd | `(a+b)² = I` | `(a+b)^p = a+b`, `a^p = b^p = 0`, `Λ_p = a + b ≠ 0` | Check holds | none |
| 0.1 coefficient for `i = p` | word `xx…x` | `ad(x)^{p−1}(x) = 0`; `(p : ZMod p)⁻¹ = 0` | consistent | none |
| 0.2 two structures on abelian `R` | `pMap = 0`, `pMap c = c^p` | `0 = c^p·0`; `(cx)^p = c^p x^p`; `Λ_p = 0`; `ad = 0 = 0^p` | both restricted, differ at `1` | none |
| 0.3 `pPow` on `𝔽_p[x]` | `D`, `xD` | `D^p(x^n) = n(n−1)⋯(n−p+1)x^{n−p} = 0`; `(xD)^p x^n = n^p x^n = n x^n` | `pPow D = 0`, `pPow(xD) = xD` | none |
| 0.3 `pPow_smul` (Hochschild) | `a = x`, `D` | LHS `xD`; RHS `x^p·0 + (xD)^{p−1}(x)·D = xD` | holds | none |
| 0.3 Katz's displayed form | `a = x` | `x·D^{p−1}(x^{p−1})·D = (p−1)!·xD = −xD ≠ xD` for `p` odd | README's erratum consistent (sign not legible in OCR) | Source issues |
| 0.3 `pPow_smul_const` | `c ∈ R` | `(c•D)^p = c^p D^p` by `smul_pow` | closes by `ext; simp [pPow, smul_pow]` | R08 |
| 1.1 `pCurvature_smul_apply` | any `∇`, `a, m` | `∇_D^p(am) = a∇_D^p m + D^p(a)m`; `∇_{D^p}(am) = a∇_{D^p}m + D^p(a)m` | difference `A`-linear, no flatness | none |
| 1.2 additivity needs flatness | `𝔽_2[x,y]`, `d + x dy` | `[∂_x, ∂_y + x] = 1 ≠ 0`; `ψ(∂_x) = 0`, `ψ(∂_y) = x²`, `ψ(∂_x+∂_y) = 1 + x²` | Check holds; `p` odd gives `x^p = 0 + x^p` | none |
| 1.2 p-linearity without flatness | same connection, `a∂_y` | `ψ(a∂_y) = (a∂_y + ax)² = a²x²` (char 2, `∂_y(a)` terms cancel) `= a²ψ(∂_y)` | holds | none |
| 1.2 `commute_pCurvature_of_basis` | `ι` infinite | `Der ≅ A^ι` product; `D = Σ D(s_i)∂_i` undefined | route fails | R03 |
| 1.3 faithfully flat iff | `𝔽_p[x] ⊂ 𝔽_p[s]`, `s^p = x`, `d + dx` | `ψ_M = 1`; `dx = 0` in `Ω¹_B`, `ψ_{B⊗M} = 0` | false | R04 |
| 1.3 `pCurvature_eq_zero_of_basis` | any `ι` | `ψ(D)` `A`-linear, kills a spanning set | holds for every `ι` | none |
| 1.4 `pCurvature_ofForm` | `p = 2`: `(D+a)² = D² + a² + D(a)`; `p = 3`: `D³ + a³ + D²(a)` (terms `3aD²`, `3a²D`, `3D(a)D`, `3aD(a)` vanish) | matches `a^p + D^{p−1}(a) − ω(D^p)` | holds | none |
| 1.4 Check `c/x` | `𝔽_p[x,x⁻¹]` | `(c/x)^p + D^{p−1}(c/x) = (c^p + c(p−1)!)/x^p = (c^p − c)/x^p` | zero iff `c ∈ 𝔽_p` | none |
| 1.4 unipotent `Γ = [[0,x^{p−1}],[0,0]]` | recursion `Γ_{k+1} = D(Γ_k) + ΓΓ_k` | `Γ_k = D^{k−1}(Γ)` (products of strictly upper matrices vanish); `Γ_p = [[0,(p−1)!],[0,0]] = [[0,−1],[0,0]]` | Check holds; `ψ² = 0` | none |
| 1.4 Airy `p = 3` | `Γ_2 = [[x,0],[1,x]]`, `Γ_3 = I + [[1,x],[x²,0]]` | `[[2,x],[x²,1]] = [[−1,x],[x²,1]]` | Check holds | none |
| 1.4 Airy `p = 5` | `Γ_4 = [[x²,2],[4x,x²]]`, `Γ_5 = [[6x,x²],[x³+4,4x]]` | `[[x,x²],[x³−1,−x]]` | Check holds | none |
| 1.5 comparison with CR.1.3 | `P = R[x_1..x_r]`, `M` f.g., `p = 0` in `R` | top. quasi-nilpotent ⇔ ∀m ∃N θ_K m = 0 for |K| ≥ N; ψ nilpotent ⇔ uniform N via (5.5.2), uniform on generators since `ψ` is `P`-linear | equivalent for f.g. `M` | none |
| 2.0 `frobeniusImage` | `𝔽_p[x]`; `R[ε]/ε²` base, `A = R[t]` | `𝔽_p[x^p]`; `ker d = ⊕ c_k t^{pk} = R[t^p]` | matches image of twist | none |
| 2.0 injectivity of relative Frobenius | `A` smooth, pure dim `d` | rank `p^d ≥ 1`, faithfully flat ⇒ injective | holds | none |
| 2.1 `cartier_descent` | `A = R`, any `M` | `Der = 0`, horizontal `= M`, `A′ = R`, `R ⊗_R M → M` | bijective | none |
| 2.1 `cartier_descent`, `M = 0`; `M` not finite | quasi-coherent in (1.0) | Katz's projector needs no finiteness | holds | none |
| 2.3 `exists_unit_horizontal_iff` ⇒ | unit `y`, `D y + a y = 0` | `(D+a)^p y = 0 = (a^p + D^{p−1}a) y` | `a^p + D^{p−1}a = 0` | none |
| 2.3 ⇐ | `P = Σ_{k<p} (−x)^k/k! (D+a)^k` | `(D+a)P` telescopes to `(−x)^{p−1}/(p−1)!·(D+a)^p = 0`; `Σ_j x^j/j! P(D+a)^j = Σ_m (x−x)^m/m! ∇^m = 1`; in a local ring one summand of `1 = Σ (x^j/j!) h_j` is a unit | horizontal unit exists | none |
| 2.3 vacuous instance | `A = 𝔽_2` | no `x` with `D x = 1` | vacuous, harmless | none |
| 2.4 Checks | `1/x + 1/(x−1)`; `1/(2x)`; `1/x²` | `ψ = 0`, `y = 1/(x(x−1))`; `ψ = (½ − ½)/x^p = 0`, `y = x^{(p−1)/2}`; `ψ = x^{−2p} + (−1)^{p−1}p!·x^{−p−1} = x^{−2p} ≠ 0` | Checks hold | none |
| 3.2 Check `d + ½ dx/x` | `B = A[t]/(t² − x)` | `(t⁻¹)′ = −t⁻²·t/(2x) = −t⁻¹/(2x)` | horizontal unit | none |
| 4.1 `c = i` | `p ≡ 3 (4)` | `i^p = −i`, `2i ∉ 𝔓` | `c^p ≢ c` | none |
| 4.1 `L = ℚ` | any `c ∈ ℤ` | conclusion trivial | holds | none |
| 4.3 `honda` ⇐ | `n a = f′/f`, `1/n ≡ m` mod `p` | `ā = m f̄′/f̄ = (f̄^m)′/f̄^m`; horizontal section `f̄^{−m}` | `ψ = 0` by 1.4 | none |
| 4.3 `honda` ⇒ over `K` | residues `c_{α,1}` reduce into `𝔽_p` at almost all `𝔓` of `L` | Kronecker gives `c_{α,1} ∈ ℚ` (not merely `K`); `σ ∈ Gal(L/K)` fixes `a`, permutes `α`, fixes residues ⇒ `f ∈ K(x)` | holds | none |
| 4.3 junk reduction | `Q̄ = 0` at `v` | `ratFuncMod = 0` at finitely many `v` | cofinite filter unaffected | none |
| 4.3 `P = 0` | `a = 0` | LHS `ψ = 0`; RHS `n = 1`, `f = 1` | holds | none |
| 4.4 Checks | `i/(x²+1)`; `1/(x²+1)` | `= ½(1/(x−i) − 1/(x+i))`, residues `±½`, `f = (x−i)/(x+i)`; `= (−i/2)/(x−i) + (i/2)/(x+i)`, residues `∓i/2` | Checks hold; `ψ ≠ 0` at `p ≡ 3 (4)` (bcr2024 Ex. 3.4, line 1084) | none |

**Headline theorems** (from the README): Jacobson's formula (0.1, stated), Hochschild's formula and the restricted structure on `Der_R(A)` (0.3, stated), Katz's structure theorem (1.2, stated through the stand-in: R02), Cartier descent (2.1, stand-in: R02), rank one in one variable (2.3, stated), the easy direction (3.2, not stated, not named in the docstring: R02), Kronecker (4.1, stated), Honda (4.3, stated), the Kummer trivialisation (4.4, not stated, not named: R02). One-tactic probe: none of the 20 sorried theorems closes; `pPow_smul_const` closes with two tactics from the library (R08).

**Definitions depending on sorried theorems through proof fields** (`pPow` via `iterate_leibniz`, `ofAssociative` via `add_pow_eq_jacobson`, the restricted instance on derivations, `horizontalFrob` via `apply_eq_zero_of_mem_frobeniusImage`): the data is real and only `Prop` fields use the theorems; no sorried data (gate `sorry-data=0`).

**Declared gaps:** none declared, none needed.

## Not verifiable

- The printed sign in Katz (5.3.0)/(5.4.0): the Numdam text layer (lines 671, 694–699) shows no minus sign, but it is OCR of a 1970 typescript and the PDF could not be rendered here; the README's claim that the display carries the wrong sign is consistent with the text layer and with the computation above.
- Honda 1981 (Symposia Mathematica XXIV): no legal copy found by the sources service (citation search); cited here only through bcr2024 Theorem 3.6 and furnsinn-pannier Proposition 2.3, both read.
- Chudnovsky–Chudnovsky 1985 (LNM 1135, DOI 10.1007/BFb0074600), Katz 1972 (DOI 10.1007/BF01389714), André 1989 (Vieweg) and André 2004 (de Gruyter): paywalled; cited by locator only, research context (and Chudnovsky Theorem 8.1 through bcr2024 line 1570).
- Beukers–Peters 1984 (de Gruyter, DOI 10.1515/crll.1984.351.42): paywalled, research context only.
- Kronecker 1880 (Monatsberichte Berlin): no legal copy found; the theorem is read in bcr2024 Theorem 3.7 and furnsinn-pannier Theorem 1.1.
- Jacobson 1941: the README's reference is correct (Trans. AMS 50 (1941), 15–25, read at the AMS open PDF, article S0002-9947-1941-0005118-0); the definition cited for 0.2 is already in Jacobson 1937 §4 (lines 164–172).

## Source issues

- **Error** in katz1970 at (5.3.0) and (5.4.0), printed pp. 192–193: the source writes the correction term of `(gD)^p` as `g·D^{p−1}(g^{p−1})·D` (as far as the text layer shows); it should be `−g·D^{p−1}(g^{p−1})·D = (gD)^{p−1}(g)·D`, since for `g = x`, `D = d/dx` on `𝔽_p[x]` the left side is `xD` and the printed term gives `(p−1)!·xD = −xD`; affects nothing (the p-linearity (5.2.0) uses only the shape of the term).
