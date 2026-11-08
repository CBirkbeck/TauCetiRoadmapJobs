<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2264#issuecomment-6656454963 -->
Review (claude) of 19f0318

Verdict: needs_changes

1. **F01** (P2) Supplier drift: `§RD.3.50` does not exist at the parent's open head

   Location: `README.md` lines 74, 224, 940, 1070, 1589, 1909, 1988, 2163 (eight citations of
   PadicDifferentialEquationsAndRigidCohomology `§RD.3.50`, the supplier-contract bullet reading
   "§RD.3.41, §RD.3.50: finite étale pushforward … ; étale descent").

   Claim: the parent's section RD.3.50 states étale descent for overconvergent F-isocrystals.

   Witness: the parent README at its open head has 525 `### RD.*` headings; Layer RD.3 jumps from
   `### RD.3.48 Katz–Crew` to `### RD.3.51 Kummer isocrystals`. Étale descent is
   `### RD.5.8c Étesse: étale descent for overconvergent F-isocrystals` (parent line 8847), for `X`
   smooth separated of finite type with Frobenius structures. `roadmaps resolve` lists RD.3.50 as
   found nowhere.

   Repair: replace every `RD.3.50` by `RD.5.8c`; in the supplier-contracts list give RD.5.8c its own
   bullet ("étale descent along étale surjective morphisms of smooth `X`, with Frobenius structures;
   and the 2-fibre-product description along étale dominant maps") and move it out of the RD.3 group
   in the Scope paragraph (line 74) and the layer Dependencies (lines 1070, 1589, 2163). Every use
   (MS.2.3 on a smooth curve, MS.5.3 on smooth `X`, MS.6.5 and MS.6.7 on smooth connected `X`) meets
   the smoothness hypothesis, so no statement changes.

2. **F02** (P2) The twist notation `O(1)`, `E(1)`, `E†(1)` is used with two opposite slopes

   Location: `README.md` Convention 4 (line 121: "`O(1)` has Frobenius multiplied by `q⁻¹`, hence
   slope `−1`"), line 1502 and line 2190 (same reading), against lines 442–443, 501, 595, 617, 723,
   1099, 1140, 1164, 1187, 1208–1209, 1280, 1313, 1368–1369, 1389, 1411, 1481, where
   `E(1) ⊕ E(0)`, `E†(1) ⊕ E†(0)` and `O(1) ⊕ O(0)` are computed with `E(1)` of slope `1`.

   Claim: the Checks on the split sum are correct under the roadmap's conventions.

   Witness (computed under Convention 4, slope of `E(1)` = `−1`):
   - MS.3.1 Check (line 1099): "`E†(1) ⊕ E†(0)` is not saturated: the slope-zero line lies in the
     kernel." Slopes are `−1, 0`, so `Top(M) = E(0)` and the kernel of `M† → Top(M)` is the slope
     `−1` line `E†(1)`, not the slope-zero line.
   - MS.0.10 Check (line 595): "the quotient `E(0)` has maximal slope `0 < 1`". Under Convention 4
     `λmax(M) = 0 = λmax(E(0))`, so this quotient does not detect the failure of PBQ; the quotient
     `E(1)` (maximal slope `−1 < 0`) does.
   - MS.0.6 Check (line 501): "`E(1) ⊕ E(0)` … `b − a = −1 < 0` for the sub `E(1)`, quotient `E(0)`".
     Under Convention 4, `a = −1`, `b = 0`, `b − a = 1`: the third case (boundedness required), not
     the first.
   - MS.3.4 Check (line 1164): `Sat(E†(1) ⊕ E†(0)) = E†(1)`; under Convention 4 the saturation is the
     image in `Top = E(0)`, i.e. `E†(0)`.
   - MS.4.2 Check (line 1368): "the projection kills `O(1)` and `λmax(N) = 1 ≠ 0`"; under Convention 4
     `λmax(N) = 0 = slope(O(0))`, and the Check no longer separates the hypotheses.

   The seventeen passages are consistent with each other only if `O(1)` has slope `1`, which
   contradicts Convention 4, the MS.4.8 Check and the worked example, both of which the logarithmic
   module (`φ(e_1) = q⁻¹ e_1`, slope `−1`) pins to the `q⁻¹` convention.

   Repair: keep Convention 4 and rename the split-sum objects in the seventeen passages to
   `E(−1) ⊕ E(0)`, `E†(−1) ⊕ E†(0)`, `O(−1) ⊕ O(0)` (slopes `1` and `0`), with `Sat(E†(−1) ⊕ E†(0)) =
   E†(−1)`, `P_1 = E†(−1)`, "kills `O(−1)`", "quotient `O(0)` has maximal slope `0 < 1`"; or use
   the `L_1 ⊕ L_0` names of the MS.0 Examples throughout. Tested on the instance that refuted the
   original: with `E†(−1)` of slope `1`, `Top = E(−1)`, the kernel of `M† → Top` is the slope-zero
   line `E†(0)` (MS.3.1 Check now true), and in MS.0.6 `a = 1`, `b = 0`, `b − a = −1 < 0` (first case).

3. **F03** (P2) MS.5.8 is stated as a theorem without a complete proof route

   Location: `README.md` lines 1689–1710 (MS.5.8 "The affine–generic hull comparison"), line 1743
   ("The generic route … is a second proof once MS.5.8 is established"), lines 2206–2207 (worked
   example "Integral models"), line 2270 (Corrections to the sources).

   Claim: "prove that the scalar extension of `Hull†_M(N)` to `E` … equals `Hull†_(E⊗M)(E ⊗ N)`
   (D'Addezio, Proposition 4.2.12)", while the same section says D'Addezio's compactness step fails
   and "a proof must use the Frobenius structure of the image `Q†` to obtain the bound".

   Witness: I confirmed the refutation at DAD lines 648–655. The proof asserts
   `inf{‖f_n(m)‖ : m ∈ Q_{W,n} ∖ pQ_{W,n}} = p^{−s_n}` from compactness. For `Q_{W,1} = A_1 ⊂ W⟨u⟩`
   (the unit object), `ū_1^j = p^j u^j ∉ pA_1` (elements of `A_1` have `u^a`-coefficient divisible by
   `p^a`) with `‖ū_1^j‖ = p^{−j} → 0`, so the infimum is `0`; and the torsion claim
   `p^{s+i}P_W ∩ f(Q) ⊆ p^i f(Q)` fails for every `s`: `p^{s+i}u^{s+i} ∈ p^{s+i}W⟨u⟩ ∩ A_1` but
   `p^{s+i}u^{s+i} ∉ p^iA_1` (that would need `p^{2i+s} ∣ p^{s+i}`). `A_n ≅ W⟨u_1,…,u_n⟩` modulo its
   kernel has infinite residue ring, so it is not compact in its own topology either. No layer of this
   roadmap, no parent section and no pinned declaration supplies the missing bound; MS.5.8 has no
   consumer (MS.5.10 is proved through MS.4.2; Downstream consumers import MS.5.1–MS.5.3, MS.5.10,
   MS.5.11 only).

   Repair: delete MS.5.8; delete the sentence at line 1743 and the MS.5 Examples sentence on
   integral models and the worked example at lines 2206–2207; keep the D'Addezio entry in
   *Corrections to the sources* (it is correct) and add "D'Addezio's Proposition 4.2.12 (affine–generic
   hull comparison), whose published proof has a gap" to **Not in this roadmap**. MS.5.6 and MS.5.7
   then have no consumer: delete them too unless the fix worker names one (MS.5.9 keeps its own value
   as the reduction of `MS(C)` to `A¹` and may stay). Renumber MS.5.9–MS.5.11 only after grepping
   consumers (Downstream consumers cites MS.5.10 and MS.5.11; the gap `docile-curve-restriction` cites
   MS.5.11 in `plan.json`; the Lean docstring cites MS.5.10 and MS.5.11), or keep the numbers by
   leaving the deleted subsections' numbers unused — the house rule prefers renumbering with the
   consumer grep.

4. **F04** (P2) The gap `legendre-kummer-extension` asks for a zero space

   Location: `README.md` line 259 (the gap sentence: "extensions of the constant line `O(π_p²)` by
   `L†(χ)` in F-`Isoc†(C)` are classified by the Frobenius-equivariant part of this `H¹`"), line 1046
   (MS.2.8 route: "its Frobenius-equivariant part classifies the extensions"), and the same `needs`
   text in `design/plan.json`.

   Claim: the extension group is the Frobenius-fixed part of `H¹_rig(C, L†(χ))`.

   Witness: TSU lines 1126–1146. The Frobenius eigenvalues on `H¹_rig(C, L†(χ))` for `p ≡ 1 mod 4` are
   `π_p²` (slope `0`) and `p²/π_p²` (slope `2`); neither is `1`, so the Frobenius invariants of this
   `H¹` vanish. The extensions of `O(π_p²)` by `L†(χ)` are `Ext¹ = H¹_rig(C, L†(χ) ⊗ O(π_p²)^∨)^{F=1}`,
   the `π_p²`-eigenspace of `F` on `H¹_rig(C, L†(χ))`, which is one-dimensional.

   Repair: in both places write "classified by the `π_p²`-eigenspace of Frobenius on
   `H¹_rig(C, L†(χ))`, equivalently by `H¹_rig(C, L†(χ)(π_p^{−2}))^{F=1}`, which is one-dimensional".
   Update the `needs` string of the gap in `plan.json` identically (the gap list is the one plan field
   the package may edit). Tested: the eigenspace for `π_p²` is nonzero by Tsuzuki's (a), so a nonsplit
   extension exists, as MS.2.8 asserts.

5. **F05** (P3) Stale pin hashes in the supplier contracts

   Location: `README.md` line 153 ("From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)")
   and line 179 ("From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)").

   Claim: these are the pins of the content checkout.

   Witness: `lake-manifest.json` pins Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti
   `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. All eight cited Mathlib declarations exist at that pin
   (see *Verified sound*), so the mathematics is unaffected.

   Repair: replace the two hashes by the manifest pins (roadmaps on main carry such hashes, so updating
   rather than deleting matches the house shape).

6. **F06** (P3) `S_(λ−λmax)` overloads the step-indexed `S_i` of Convention 4

   Location: `README.md` lines 799–800 (MS.1.8: "`Sol_λ(M_0) = S_(λ − λmax)(Sol(M_0))` … where `S` is
   the increasing Frobenius slope filtration"), line 818 ("`Sol_0 = S_0 = K·f_1` and
   `Sol_1 = S_1 = Sol`"), line 823 (MS.1.9).

   Claim: `S_•` indexed by a real slope is the same symbol as `S_i` indexed by the step number in
   Convention 4 (`0 = S_0 ⊊ S_1 ⊊ ⋯`, `S_min = S_1`).

   Witness: on the logarithmic module `S_1(Sol)` means the slope-`≤ 1` part (all of `Sol`) in MS.1.8
   but the first step (`K·f_1`) in Convention 4.

   Repair: write the slope-indexed filtration as `S_{≤μ}(Sol(M))` ("the part of slopes at most `μ`")
   in MS.1.7–MS.1.9 and the MS.1 Examples, and say in Convention 4 that `S_{≤μ}` is slope-indexed
   while `S_i` is step-indexed.

Files reviewed: `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md` (2292 lines,
seven layers MS.0–MS.6, 71 targets), `Suggested.lean` (module docstring and an empty namespace),
`metadata.toml`, `sources.toml`, `design/plan.json` (the eight-entry `gaps` list and the design
review). No previous review of the package exists. Six findings, four of them blocking (P2); no P1.

## Verified sound

**Elaboration.** `lake env lean <Suggested.lean>` from the content checkout: exit 0, no output
(no `sorry`, no warning). The file states nothing; its docstring names seven headline groups
(MS.4.6, MS.4.8, MS.5.10, MS.2.5/MS.4.2, MS.0.7/MS.1.1/MS.1.8/MS.3.7, MS.6.13/MS.6.14, MS.5.11)
and the carrier each lacks. I confirmed the carriers are absent: Tau Ceti at `358314d4` has no
file mentioning Robba, Amice or isocrystals; Mathlib at `f6090c70` has only
`WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, a module over the Witt
fraction field with a semilinear equivalence, no connection, classified in rank one at line 180).
No headline is statable, so the empty file is the correct form; there is no `#check @name` to run
and no binder to lose. The one-tactic padding probe has no declaration to run on. Imports: the
single line `import Mathlib`. No `set_option`, `lemma`, `#eval` or process comment.

**Depcheck.** Output of the gate command:

    depcheck: 235 roadmaps, 2251 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Suppliers: PadicDifferentialEquationsAndRigidCohomology
(merge order line 133; this roadmap line 135), RigidAnalyticGeometry Layer 5 (*Čech comparison and
acyclicity*, on main line 434) and AlgebraicCurves Layers 2 (*affine models — the Dedekind bridge*,
line 478) and 12 (*the dictionary*, line 1468), both on main.

**Parent citations.** All 69 distinct `RD.x.y` sections cited in the README were matched against
the `### RD.x.y` headings of the parent at its open head: 68 exist with titles matching the use
(RD.0.9 analytic rings with trivially valued `ℓ` giving `Γ[π⁻¹]`; RD.0.54 Fargues–Fontaine rings
compared with RD.0.34; RD.1.41 generic HN filtration with (c) the reverse filtration over
`Γ_con[π⁻¹]`; RD.1.72 de Jong reverse filtration with the corrected grade indices; RD.3.45
dense-open slope filtration; RD.3.48 Katz–Crew with `ℚ_q`-coefficients; RD.5.4 local full
faithfulness; RD.5.7 dense affine finite étale over `A^n` with pure dimension; RD.5.8 Kedlaya's full
faithfulness for any `k`; RD.5.103 logarithmic extension; RD.5.112 dense-open restriction closed
under subquotients; RD.6.2, RD.6.23 trace formula with the printed sign convention
`∏ det(1 − tF)^{(−1)^{i+1}}`; RD.6.28 real `ι`-weights; RD.6.47 Kummer; RD.6.61, RD.6.77, RD.6.85
as the statements the gaps extend). The parent has no Legendre-family `H¹` beyond RD.5.34 (van der
Put's affine Legendre curve), consistent with declaring `legendre-kummer-extension` as a gap.

**Mathlib at the pin** (`f6090c70`): `LinearMap.quotKerEquivRange`
(`Mathlib/LinearAlgebra/Isomorphisms.lean:39`); `Representation.averageMap`, `averageMap_invariant`,
`averageMap_id` (`Mathlib/RepresentationTheory/Invariants.lean:126,131,137`, under
`[Fintype G] [Invertible (Fintype.card G : k)]` at line 121); `LinearMap.trace` and `trace_one`
(`Mathlib/LinearAlgebra/Trace.lean:75,190`, `trace R M 1 = finrank R M` for a finite free module);
`Padic.norm_p_pow` (`Mathlib/NumberTheory/Padics/PadicNumbers.lean:867`); `FixedPoints.subfield`
(`Mathlib/FieldTheory/Fixed.lean:102`); `WittVector.Isocrystal`, `isocrystal_classification` (as
above). The README's descriptions of their hypotheses are accurate.

**Sources.** Seeded sample "Lefschetz condition": TSU lines 1456–1463 (p. 28) define (LC) for
`(X, α, M†)`: a smooth curve `C_α` over `k`, a morphism `C_α → X`, a `k_α`-rational point of `C_α`
over `α`, and irreducibility of the restriction; MS.6.1 states exactly this (adding "connected",
harmless since irreducibility forces support on one component). Other locators opened and found to
support the statement as written (with page): TSU Theorem 1.3 (p. 2), Theorem 1.4 (p. 3),
Theorems 2.13–2.14 (p. 10; 2.14 needs `k` perfect and the generating hypothesis, as MS.0.4 says),
Lemma 3.1 (p. 11), Lemma 3.2 (p. 12), Definition 3.5 (p. 13), Theorem 3.10 and Lemma 3.11 (p. 14),
Theorem 3.12, Definition 3.13, Proposition 3.14 (p. 15), Corollary 3.15, Definition 3.16,
Lemma 3.17, Proposition 3.18, Theorem 3.19 (p. 16), Theorem 3.21, Definition 3.22, Theorem 3.23
(p. 17), Proposition 3.24, Definition 3.26, Theorem 3.27, Corollary 3.28 (p. 18), Proposition 3.29,
Lemmas 3.30–3.32 (p. 19), Lemma 3.33 (p. 20), §3.9 (pp. 21–22), Definition 4.1, Theorem 4.2,
Definition 4.3, Propositions 4.4–4.7, Definition 4.8 (p. 22), Proposition 4.9, Corollary 4.10,
Theorem 4.11 (p. 23), Proposition 5.2 (p. 24), Corollaries 5.4–5.5, Propositions 5.6, 5.8 (p. 25),
Proposition 6.1 (p. 26), Proposition 6.2, Example 6.3, Theorem 6.4 (p. 27), Corollary 6.5,
Remark 6.6, Proposition 6.7 (p. 28), Corollaries 6.8–6.9 (p. 29), Lemma 7.7, Proposition 7.9,
Proposition 7.10, Lemma 7.11, Proposition 7.12, Corollary 7.13, Definition 7.14, Proposition 7.15
(pp. 35–36), Corollary 7.16, Lemma 7.17 (p. 36), Theorems 7.18–7.20 (p. 37), Lemma A.1 (pp. 37–38),
Lemma B.1 (p. 40). DAD Definition 4.1.1, Notation 4.1.2 (p. 11), Theorem 4.1.3, Lemmas 4.1.4–4.1.7
(p. 12), Lemma 4.1.8 (p. 13; directions as in MS.5.3), §4.2.1, Proposition 4.2.2,
Construction 4.2.3, Lemma 4.2.4 (p. 14), Lemma 4.2.7 (p. 15; `φ`-modules, inequality of ranks, as
MS.0.4 says), §4.2.9, Lemmas 4.2.10–4.2.11 (p. 16), Proposition 4.2.12 (pp. 16–17), Theorem 4.2.13
(p. 17), Theorem 4.4.2 (p. 19). CT11 Theorem 2.2 (p. 41), Theorem 4.1, Proposition 4.2 (p. 46;
three cases exactly as MS.0.6), Proposition 4.3 (pp. 46–47), Definition 5.1, Example 5.2 (p. 55),
Proposition 5.4, Corollary 5.5, Theorem 5.6 (p. 56), Lemma 5.7 (pp. 56–57), Corollary 5.10,
Example 5.11 (p. 59). OHK Definition 5.3, Lemma 5.6, Proposition 5.9 (p. 26), Definition 5.10,
Lemma 5.11 (p. 27), Theorem 7.6(ii) (pp. 36–37: `Sol_λ(M) = S_{λ−λmax}(Sol(M))` for PBQ `M` over
`R^bd` solvable in `R_log`), Proposition 7.7, Lemma 7.10 (p. 37), Proposition 8.1 (p. 39),
Lemma 8.2, Theorem 8.3 (p. 40), Proposition 10.1 (p. 41; `k` algebraically closed, `μ ≤ λ − λmax`),
Proposition 12.4 (p. 45), Definition 12.5, Theorem 12.7 (p. 46). AE Corollary 2.4, Remark 2.5
(p. 12), Theorem 2.7 (p. 13), Theorem 3.10 (pp. 17–18). KED05 Theorem 1 (p. 1). The
`sources.toml` manifest records every cited work with the service's fields; the two paywalled
works are `uncertified` with locators, as settled.

**Declared gaps.** The eight slugs in `design/plan.json` `gaps` and the eight "What … must provide
(gap:…)" paragraphs agree word for word. Each has a named supplier, a section, and a single
statement with its hypotheses; none asks for what the parent already states (RD.3.48 is
`ℚ_q`-only, RD.6.61 is for finite fields, RD.6.77 is for `ι`-real objects on curves, RD.6.85 is
`K`-linear, RD.2.28 has `R_log` only, RD.5.4 has no submodule comparison, RD.5.103 has no `H⁰`
Lefschetz statement). The only defect is the clause in `legendre-kummer-extension` (R04). The
acceptance, once the findings are repaired, is conditional on all eight.

**Ownership.** `roadmaps grep` over main and the 454 open pull requests for "PBQ", "pure of
bounded quotient", "maximally bounded quotient", "dagger hull", "quasi-saturat": no match outside
this package. "minimal slope": only the parent's de Jong/Kedlaya slope sections (RD.1) and
NewtonPolygons' polygon construction, both different objects. "Lefschetz condition": only
SatoTateGroups (an axiom on Sato–Tate groups, a different notion). The board index lists no package
on isocrystals or rigid cohomology. This roadmap is the owner of what it claims.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, seven layers each ending with `### Examples` and `### Dependencies`, Downstream
consumers, Worked examples, Corrections to the sources, References. Every target has a `*Needs:*`
line and a locator; every definition (MS.0.1, MS.0.2, MS.0.5, MS.0.9, MS.1.6, MS.2.1, MS.3.1,
MS.3.2, MS.3.4, MS.3.8, MS.3.10, MS.5.1, MS.5.2, MS.5.4, MS.5.6, MS.6.1, MS.6.5, MS.6.7) has an API
list and at least three Checks. No LaTeX delimiters, no pull-request numbers, dates, paths, round
labels or "optional/deferred". `metadata.toml`: `topic = "math.AG"`. `roadmaps resolve`: no Lean
name of this roadmap's own is claimed in the README (the file declares none).

**Adversarial table.** Values computed on each side; rows cover the headline theorems, the
sampled target and every target a finding touches.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention 4 slope sign | `O(1)`; dual | Frobenius `q⁻¹`: `v(q⁻¹)/v(q) = −1`; dual `q`: `+1` | consistent with MS.4.8 Check and worked example | — |
| Split-sum Checks (R02) | `E(1) ⊕ E(0)` under Convention 4 | slopes `−1, 0`; `Top = E(0)`; kernel of `M† → Top` is `E†(1)` (slope `−1`); MS.0.6: `b − a = 1` | five Checks false under the stated convention | R02 |
| MS.0.2 log module horizontality | `φ(t) = t^q`, `∇e_2 = e_1 dt/t`, `φ(e_1) = q⁻¹e_1` | `φ(∇e_2) = q⁻¹e_1 ⊗ q·dt/t = e_1 dt/t = ∇(φe_2)` | horizontal; sub slope `−1`, quotient `0` | — |
| MS.0.2 solutions | same module | `f_1: e_1 ↦ 0, e_2 ↦ 1`; `f_2: e_1 ↦ 1, e_2 ↦ log(1+u/t)`; coefficient at `n = p^r` has norm `p^r` | `Sol` dim 2, `Sol_0` dim 1 | — |
| Convention 6 solution Frobenius | rank one, Frobenius `a`; `f_2` above | `(φ·f)(e) = φ(f(a⁻¹e)) = a⁻¹`; `(φf_2)(e_1) = φ(f_2(qe_1)) = q` | eigenvalue `a⁻¹`; `f_2` slope `1` | — |
| MS.0.3 | `ℚ_p(√p)`, `σ = id` | `a ≡ a^p mod √p` holds (residue `𝔽_p`); slope of `√p` is `v(√p)/v(p) = 1/2`; `b = √p` | `K^σ = K`, twist works, `|p|^ℤ` insufficient | — |
| MS.0.4 (Tsuzuki 2.14, DAD 4.2.7) | `(a,b) ↦ a + αb`, `α ∈ E∖E†` | injective on `(E†)²`; `E`-linearisation has kernel `E·(α, −1)`, dim 1 | rank claim is about `Top` | — |
| MS.0.6 cases | log module | `a = −1`, `b = 0`, `b − a = 1`, unbounded, `log t ∉ E` | nonsplit; boundedness needed in case 3 | — |
| MS.0.7 (headline) | rank one; `L_1 ⊕ L_0` | isoclinic ⇒ bounded; split ⇒ bounded | both directions on the instances | — |
| MS.1.1 (headline) | `L_1 ⊕ L_0` | grades `L_1`, `L_0`, slopes `1 > 0`; `P_2 = M` has `λmax = 1` | grade form correct; Tsuzuki prints nested terms | source issue |
| MS.1.6 growth | `log(1+u)`; constant | `|1/p^r| = p^r ≤ (p^r + 1)^1`, not `≤ C` | growth `≤ 1`, not `0` | — |
| MS.1.7 at `λ = 0` | bounded eigen-solution | `μ ≤ −λmax` and `μ ≥ −λmax` (slopes of `Sol` lie in `[−λmax, −λmin]`) | `μ = −λmax` | — |
| MS.1.8 (headline) | log module over `E†`, `λmax = 0` | `f_1`: slope 0, growth 0; `f_2`: slope 1 (`φ(log t) = q log t`), exact growth 1 | `Sol_λ = S_{≤λ}` for `λ = 0, 1` | R06 (notation) |
| MS.2.2 | `Σ p^n x^{p^n}` on `G_m` | at `∞`: `p^{−n} ρ^{−p^n} → ∞` for `ρ < 1` | not in `E†_∞` | — |
| MS.2.5 (headline) | `L_1 ⊕ L_0`; irreducible | two steps; one step | — | — |
| MS.2.8 | `p ≡ 1 mod 4` | eigenvalues `π_p²` (slope 0), `p²/π_p²` (slope 2); `F`-invariants of `H¹` = 0; `π_p²`-eigenspace dim 1 | extension exists; gap text wrong | R04 |
| MS.3.5 Check | `[[1,1],[0,1]]`, `k = 𝔽_q`, `σ = id` | splitting needs `c − σ(c) = 1`, `c ∈ K`: `0 = 1`; mod `π`: `c^q − c = 1` in `𝔽_q((t))`: constants give `0 = 1`, nonconstant `c` leaves `−c_v t^v` uncancelled | nonsplit | — |
| MS.3.7 (headline) | log module vs its saturation | tops both unit, `h = id`, ranks `2 ≠ 1` | saturation needed | — |
| MS.4.2 (headline) | log object, `P = Top = unit` | ranks `1 = 1` but kernel on sections is the slope `−1` line | implication only | — |
| MS.4.5 | log object; Legendre–Kummer | `a = −1 < 0`: PBQ, not saturated; `a = 1 > 0`, rank 3: saturated, not PBQ | matches Tsuzuki Ex. 6.3 | — |
| MS.4.6 (headline) | `h = c·id`, `c ∈ K^σ` | `g† = c·id` | unique | — |
| MS.4.8 (headline) | rank one | `S_min = Top = M`; dual of `O(1)` has slope `1` | — | — |
| MS.5.6 | `n = 2` | `ū_1² = p²u² = p·ū_2`; `p(ū_2t² − p) = (ū_1t − p)(ū_1t + p)` | relations hold | — |
| MS.5.8 (DAD 4.2.12) | `A_1 ⊂ W⟨u⟩` | `ū_1^j ∉ pA_1`, norm `p^{−j}`; `p^{s+i}u^{s+i} ∈ p^{s+i}W⟨u⟩ ∩ A_1 ∖ p^iA_1` | compactness and torsion steps fail | R03 |
| MS.5.10 (headline) | proper `C`; ordinary rank 2 on ordinary locus | hull `= N`; hull whole, `S_min = N` | — | — |
| MS.5.11 (headline) Check | Dwork pullback on `A²`, `C = {x = 0}` | `H⁰(A², E) = 0`; `E|_C` = unit, `H⁰ = K` | docility needed | — |
| MS.6.1 (sample) | `X` a curve, `i = id` | `Spec k(α) → X` is a `k(α)`-point over `α` | witness exists | — |
| MS.6.6 trace | `Spec 𝔽_q`, `L(λ)`, `n = 2` | both sides `λ²`; `λ` would be wrong | `λ^n` | — |
| MS.6.6 duality twist | `E = M^∨`, `i = 0` in RD.5.89 | `H^{2d}_c(M) ≅ H⁰(M^∨)^∨(−d)`; fixed vector ↦ eigenvalue `q^d` (`O(−d)` has Frobenius `q^d`) | consistent with MS.6.10 | — |
| MS.6.7 | `m = 2`; Lemma B.1 | `Tr∘ad = n·[L:K] = 2·2 = 4` unprojected; projected `2`; `Av = (f + Tf)/2` | divide by `m` after projection | — |
| MS.6.9 | `Spec 𝔽_3`, Frobenius 2 | `3^{w/2} = 2`, `w = 2 log_3 2 ∉ ℤ` | real weights | — |
| MS.6.10 pole | `L(U, E, t) = ∏ det(1 − tF|H^i_c)^{(−1)^{i+1}}` | `i = 2d`: exponent `−1`, eigenvalue `q^d` ⇒ pole at `q^{−d}`; `j < 2d`: `|eigenvalues| ≤ q^{j/2} < q^d` | pole uncancelled | — |
| MS.6.11 composition | Tsuzuki's `π^*((g′)⁻¹)∘τ_m` | target `N†`, induced map `Top(g′)⁻¹∘Top(g′)⁻¹∘h ≠ h`; corrected `g′∘τ` induces `Top(g′)∘Top(g′)⁻¹∘h = h` | README's correction right | — |
| MS.6.13, MS.6.14 (headlines) | `X` a curve, `m = 1`, `C = X` | reduce to MS.4.6(i) | — | — |

**Context and generality.** No Lean `variable` block exists. In the README, `k` perfect is
stated where CT11, Ohkubo and Tsuzuki assume it (MS.0.6, MS.0.7, MS.1.1, MS.1.4, MS.1.5, MS.3),
not in MS.0.3(1) (Lemma A.1(1) allows imperfect `k`), and the finite-field layer fixes
`k = 𝔽_q`, `σ = id`.

## Not verifiable

- de Jong 1998, Proposition 6.4 (`DEJONG98`) and Tsuzuki 1998, Theorems 4.2.6 and 7.2.3 (`TSU98`):
  paywalled, settled as `uncertified`; cited only inside the gaps `dejong-disc-robba-submodules` and
  `unit-root-correspondence-perfect-base`, whose statements I checked against the quotations in
  CT11 line 1098 and TSU lines 1046–1048.
- The Annals version of D'Addezio (DOI recorded): not opened; locators checked on arXiv v4, which
  the manifest names as the version read.
- Ownership against open pull requests was checked through `roadmaps grep` at the index of
  2026-11-05; pull requests not in that index were not examined.

## Source issues

- **Misprint** in TSU at Theorem 3.19, printed page 16: the decreasing-slope condition and the
  bounded-quotient sum are written for the nested terms `P_i`; it should be the grades
  `P_i/P_{i−1}` (for `L_1 ⊕ L_0` both nested terms have maximal slope 1); affects a stated result.
- **Error** in TSU at Lemma 3.31 and its proof, printed page 19: the objects are placed on the
  wrong curves and the proof of (1) ends by deriving its own hypothesis while (2) invokes (1); it
  should place `f_*M†` on `C`, `f^*N†` on `C′`, and prove (1) by base change of the generic fields;
  affects the proof.
- **Misprint** in TSU at Theorem 3.12, printed page 15: the bounded quotient is said to be nonzero
  for every solvable module; it should assume `M ≠ 0`; affects a stated result.
- **Misprint** in TSU at Proposition 3.24, printed page 18: a rank is equated with a vector space;
  it should be the dimension of that space; affects nothing.
- **Misprint** in TSU at proof of Corollary 6.8, printed page 29: the isomorphism is given target
  the restriction of `N†`; it should be the restriction of `M†`; affects nothing.
- **Misprint** in TSU at proof of Proposition 7.15(2), printed page 35: the lift is given target
  `π^*M†` and composed with `π^*((g′)⁻¹)`; it should be an endomorphism of `π^*N†` composed with
  `π^*g′`; affects the proof.
- **Gap** in DAD at proof of Proposition 4.2.12, printed page 17: a positive lower bound for the
  norms of `f_n` outside `pQ_{W,n}` is derived from compactness; it fails for `A_1 ⊂ W⟨u⟩`
  (`ū_1^j` has norm `p^{−j}` outside `pA_1`) and `A_n` is not compact; affects the proof.
- **Misprint** in OHK at Proposition 5.9, printed page 26: boundedness is written `M^0 = M`; with
  Ohkubo's Definitions 5.3 and 5.5 (`M/M^0` the bounded quotient) it should be `M^0 = 0`; affects
  nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "19f03182a1f149059add774b8736fb627051f9a4", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII", "model": "fable", "worker": "chris-x19"} -->
