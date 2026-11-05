# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at dfb2bb6)
**Verdict:** accepted

**Previous findings (round 2 at 6364600), checked passage by passage.** R01 (Deligne–Langlands local constants and the Artin functional equation cited to targets that do not exist): repaired. `README.md:235–258` now declares “What ArithmeticGaloisRepresentations must provide (gap:weil-local-constants): … the Deligne–Langlands local constant `ε(V,ψ,dx)` … (Deligne 1973, Theorem 4.1, §§5.6, 5.11 and 8.12)” and “(gap:artin-functional-equation): … `Λ(s,ρ⊗χ) = W(ρ⊗χ)·Λ(1−s,ρ^∨⊗χ⁻¹)` … by Brauer induction”; the dead link `hecke-zeta-integral-comparison` is gone (0 hits), the scalar comparison is repointed to AL.1.5.3 (`:231–233`), and R16.0.1 (`:429, 454`), R16.3.5 (`:947–948`, rank-one constants only), R17.4.17 (`:2173–2176, 2184, 2190`) and R17.5.5 (`:2269, 2277`) cite the two gaps by slug. The two gaps are precise (each is one named theorem with its hypotheses), minimal (AGR at #856 lines 146–153 disclaims exactly these; AL at #924 states only rank-one constants; ArtinRepresentations at #1711 consumes R17.5.1 and R17.5.6–R17.5.10, so it cannot supply them) and owned by a named roadmap. Where the intake reads them is R03 below. R02 (second local Langlands correspondence): repaired. `:402–411`: “define the correspondence `rec` … as SmoothRepresentationsOfLocalGroups SR.5.2's classical correspondence … composed with the convention inversion … No second construction of the bijection is made here”; `:432` “its inverse is SR.5.2's inverse transported by the same inversion”; `:448` “For n=3 define the correspondence in the same way from SR.5.2's rec at n=3”; `:909` now says [bh06] Theorems 50.3 and 52.1 are “cited for background only”. The transport is checked below (rec here = SR.5.2's rec dualized; rank one inverts the uniformizer value). R03 (121 anchors): repaired; `grep -c '<a id='` is 0 and the worker's gate has `residue=0`. R04 (AL slugs, `satake_power_sum`): repaired; every AL citation is now by number (AL.0.3.1, AL.1.3.2–3, AL.1.4.2–3, AL.1.5.3, AL.1.6.2, AL.2.1.4, AL.2.2.1–5, AL.2.3.2, AL.3.2.1–3, AL.3.3.1–2, AL.3.4.1–3, AL.3.6.1–3, AL.3.7.1–2, AL.3.9.5–6, AL.4.2.1, AL.R.1–5), each resolved to a heading of #924 (its lines 239–279, 623, 1166–1427, 1554–1721, 1908–2281, 2670); `:1764–1766` cites AST §7.0b's power-sum identity in words. R05 (EDPS paragraph): repaired; `:2845–2852` now matches EtaleDualityAndPerverseSheaves at its head (its lines 6563–6571: “the named maps are adapters to its supplied interface … the construction below supplies the general extension”). R06 (docstring heading): repaired; `Suggested.lean:7` reads “GL₂ automorphic representations and transfer: target signatures”.

## R01 (P3) — Ten AlgebraicModularFormsAndSerreWeights fragment names do not exist at its head

**Location:** `README.md:329` “R15.5 `deligne-serre-eigenvalue-lifting-lemma` and `reduction-to-weight-at-least-two-and-to-a-true-eigenform`”, `:331` “R15.6 `residual-modularity-witness`”, `:2646`, `:2721` (`R15.1/hodge-bundle-with-tate-curve-normalization`, `R15.1/cusp-ideal-section-forms`, `R15.2/q-expansion-principle-and-its-vanishing-theorem`, `R15.2/integral-hecke-operators-from-q-expansions`, `R15.6/modularity-formulations-and-determinant`), `:2736`, `:2746` (`R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`).

**Claim:** These fragments name targets of AlgebraicModularFormsAndSerreWeights.

**Witness:** AlgebraicModularFormsAndSerreWeights at #928 numbers its targets §1.1–§7.7 and says at its line 18 that the aliases R15.1–R15.5, R15.5A, R15.6 and R15.5A.1–3 denote Layers 1–5, 6, 7 and §§6.1–6.4; each of the ten slugs has 0 hits in its README. The content exists: §5.10 (Deligne–Serre lifting), §5.14 (controlled eigenform lifting and weight shifts, with the `E_n≡1` shift), §7.4 (a residual modularity witness, `ArisesFrom` in §7.5), §1.1–1.2 (forms and the cusp ideal), §2.1 (q-expansion principle), §2.5 (integral geometric Hecke operators), §2.3 (holomorphic base change), §3.1 (elliptic Hasse invariant), §7.7 (modularity formulations). The layer aliases R15.5A.1–R15.5A.3 and R15.1–R15.6 resolve.

**Repair:** Cite by the supplier's numbers: §5.10, §5.14, §7.4–§7.5, §1.1–§1.2, §2.1, §2.5, §2.3, §3.1, §7.7, keeping the R15 alias in front (“AlgebraicModularFormsAndSerreWeights R15.5 (§5.10)”). No mathematics changes.

## R02 (P3) — AL.2.2 is cited for a lower-right quotient and integral-scalar decomposition it does not state

**Location:** `README.md:275–281` “AL.2.2 … supplies the local K₀/K₁ subgroups, … lower-right quotient properties, the integral-scalar fixed-space comparison”; `:523` “The lower-right quotient and integral-scalar decomposition are supplied by that same section”; `:759`.

**Claim:** AL.2.2 proves `K₀(pⁿ)/K₁(pⁿ) ≅ (O/pⁿ)ˣ` through the lower-right entry and `K₀(pⁿ) = K₁(pⁿ)·Z(O)`.

**Witness:** AL.2.2.1 at #924 (line 1628) defines `K₀`, `K₁`, proves `K₁⊆K₀`, the unit ideal and depth zero cases, the unipotent memberships and the coset decomposition; neither quotient statement appears in AL.2.2.1–AL.2.2.5. AL.2.2.4 uses the `ω_π(d)`-isotypic line of `K₀`, which presupposes the quotient but does not state it. Instance: for g = (a b; c d) ∈ K₀(pⁿ), g·diag(d⁻¹,d⁻¹) ∈ K₁(pⁿ), so the decomposition holds with the scalar `d`; nothing in AL.2.2 records it.

**Repair:** State the two one-line facts as part of R16.1.3 (or R16.2.7's “Fixed-space comparison”), with the Check that over residue field 𝔽₂ the quotient is trivial, and cite AL.2.2.1 only for the subgroups and cosets.

## R03 (P3) — The two declared gaps are not recorded anywhere the intake reads them

**Location:** `README.md:235` and `:250` (the two `What ArithmeticGaloisRepresentations must provide (gap:…)` contracts).

**Claim:** The gaps are declared supplier contracts.

**Witness:** The board has no package for this roadmap: `packages/GL2AutomorphicRepresentationsAndTransfer/` contains only `reports/`, and the brief records “none declared (no readable design/plan.json)”. The intake announces gaps from `plan.json`, so ArithmeticGaloisRepresentations' open job (#856) is not told that `weil-local-constants` and `artin-functional-equation` are expected of it; AGR itself assigns them to a “Part II” that no pull request opens.

**Repair:** Nothing in this folder. The worker or operator should post the two contracts (slug, supplier, the `needs` sentence) on ArithmeticGaloisRepresentations' job or on this roadmap's issue so the supplier sees them; the README text is already in the required form.

## R04 (P3) — Mutual citation with QuaternionicModularForms

**Location:** `README.md:333–339` and `:1699` (R17.3.9 consumes QuaternionicModularForms §§1.3, 2.1–2.2, 3.1); `README.md:2837–2852` (QuaternionicModularForms is not listed among the downstream consumers).

**Claim:** Supply between the two roadmaps runs in one direction.

**Witness:** QuaternionicModularForms at #934, line 612: “For D=M₂(F) this is GL2AutomorphicRepresentationsAndTransfer R16.1.6's adapter, consumed”; line 733: “Consume AutomorphicFormsOnReductiveGroups §2.6 and GL2AutomorphicRepresentationsAndTransfer R16.2.13 for the principal series of GL₂(ℂ)”; its lines 59–69 name R17.1–R17.3 and R16.1.6 by pull-request number. QuaternionicModularForms is not in the merge order (0 hits in ORDER.txt), its supplier table (its lines 28–42) does not list this roadmap, so the dependency check sees only this roadmap's downward edge and reports 0 problems; the prose edge from #934 to R16.1.6/R16.2.13 is upward once #934 is placed after its table's last supplier (AutomorphicFormsOnReductiveGroups, order 62, before this roadmap at 85). At the target level there is no cycle (R16.1, R16.2 → QMF Layer 2 → R17.3), but the two roadmaps cite each other.

**Repair:** The upward edge is in #934, not in this folder: R16.1.6 and R16.2.13 are adapters of AutomorphicFormsOnReductiveGroups §7.2 and §2.6 (`README.md:32–37, 607–615, 861`), which QuaternionicModularForms can cite directly. In this folder, add QuaternionicModularForms §§2.4 and 2.6 to “Downstream consumers” as consumers of R16.1.6 and R16.2.13 so the direction is visible, and keep R17.3.9's consumption unchanged.

## R05 (P3) — Garbled sentences

**Location:** `README.md:705–706` “The character the norm character with exponent zero is trivial”; `:771` “Coefficient descent is additional to complex multiplicity one; This comparison concerns”; `:1528` “The API includes Label every term and its measure; change local factors”; `:1560` “The API includes Joint bounds before summing derivatives”; `:2374` “The API includes The integral rank equals the residual rank”.

**Claim:** The API lists are prose.

**Witness:** Each sentence is a list fragment pasted after “The API includes”; `:705` repeats “The character”.

**Repair:** Rewrite as sentences (“The API gives: …”) and delete the duplicated words.

## Verified sound

**Scope.** Both files at dfb2bb6 read in full (README 2915 lines, Suggested.lean 270 lines, metadata.toml one line); `git diff --stat origin/main...HEAD` outside the folder is empty; the folder adds a new roadmap and re-plans none on main (the closest objects, ModularForms Layers 0–8W, are cited as suppliers at `:23–24`). No copied passage, computational algorithm, sorry'd data, `set_option`, admitted `example`, LaTeX delimiter, pull-request number, round label or process word was found (grep for “so far|to be checked|current|removed|checkpoint|handoff|packet|deferred|optional|for later|round n|review”: 0 hits); every `### R16.n`/`### R17.n` block has a `*Needs:*` line and a `*Source:*` locator (awk over the 102 headings: 0 missing).

**Gate and dependency check.** Worker's gate at this head: every scanner 0, `build=0`, `OK`. I ran the direction check:

```text
depcheck: 201 roadmaps, 1328 edges, 0 problem(s)
```

No UPWARD or CYCLE line for this roadmap (the prose edge of R04 is in #934, outside what the check parses). Every supplier cited is on main or earlier in the order (merge order 85): AutomorphicFormsOnReductiveGroups 62, AlgebraicModularFormsAndSerreWeights 84, and the others as listed in the brief; EtaleDualityAndPerverseSheaves (91), ArtinRepresentations, QuaternionArithmetic, ModularityAndLanglandsExtensions and AutomorphicGaloisRepresentationsPartII are cited only as consumers.

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all ten declarations: exit 0, exactly ten `declaration uses sorry` warnings, and every elaborated type keeps its binders: `supercuspidalProjective` keeps `[Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]`; `chevalley_power_congruence` keeps `[NumberField K] [Group.FG ↥E]` and `0 < n`; `solvable_finite_image_integral_lift` keeps `[Finite Γ]`, `Group.IsSolvable Γ`, `[Fact (Nat.Prime p)] [CharP k p] [IsAlgClosed k]`; `solvable_characteristicTwo_projective_dihedral` keeps `[CharP k 2] [IsAlgClosed k]` and the finite-range hypothesis; the two newform statements keep `[IsGalois ℚ E]`, `Fact (Nat.Prime p)`, `p.Coprime N` (resp. `p.Coprime (2*N)`), `Q.IsPrime`, `Q.LiesOver`, `Algebra.IsUnramifiedAt ℤ Q` and `IsArithFrobAt ℤ σ Q`. Each elaborated type was compared with its README statement (`:629, 647, 796, 1441, 2259, 2368, 2616–2619, 2332–2337, 2729–2734`): same generality in each case; nothing changed. One-tactic probe (`first | rfl | simp | infer_instance | exact trivial` in place of each `sorry`, same scratch directory): all ten fail (unsolved goals or type mismatch); no padding.

**Headline inventory.** README headlines: the finite-place correspondence with conductor, twisted-factor and pair-factor comparisons (R16.0, R16.3); Iwahori oldforms and centre (R16.2.7, R16.2.12); Chevalley congruence and full-local character prescription (R16.1.7–8); supercuspidal projectivity (R16.2.10); the classical and Hilbert dictionaries (R16.4–R16.6); quaternion ramification and local–global isomorphism (R17.1.5); local and global Jacquet–Langlands with the trace comparison (R17.1–R17.3); cyclic, solvable and non-normal cubic base change, the adjoint lift and automorphic induction (R17.4); projective lifting, Fong–Swan, Langlands–Tunnell and weight one (R17.5); the characteristic-two dihedral classification, Rohrlich–Tunnell, Katz weight one and residual modularity (R17.6). The ten statable at the pins are in `Suggested.lean`; the module docstring (`Suggested.lean:26–49`) names what the others lack (Weil–Deligne parameters, smooth classifications, cuspidal adelic classes, Whittaker models, quaternionic spectra, modular-curve coefficient cohomology, Katz forms, Galois attachments). I found no further headline statable at the pins and no stand-in.

**Seeded sample.** Texts read through the sources service this round (cache line numbers):

| Target | Text and locator | Outcome |
|---|---|---|
| Fixed-space comparison (R16.2.7) | cg20 lines 182–191 (§1.3, printed pp.805–806) | dim π^Iw = 2 = 2·dim π^Sph and the characteristic-zero doubling by U_p; the source's hypothesis “not trivial” is weaker than the README's “infinite-dimensional” (source issue below); the K₀/K₁ scalar claim is R02. |
| Ramification realization (R17.1.5) | prr23 not readable (below); GlobalQuadraticForms `Suggested.lean:350` `exists_hilbertSymbol_eq_neg_one_iff_pair`, README §4.4 (`:443`); ClassFieldTheory Layer 10 (`:1552`, `eq_zero_of_localInv_eq_zero` at `:566`), Layer 14 (`:1872`); QuadraticFormInvariants Layer 2 (`:1097`) | All main-branch inputs exist; parity and sign instances in the table. |
| Quaternion proof (R17.2.6) | jl70-ubc lines 15819–15832 (Theorem 16.1, printed p.260), 16816–16841 ((16.1.7), printed p.275) | (16.1.7) at ≥2 places kills terms (iv)–(viii); the source calls its proof a formal sketch (source issue); the README assigns convergence to AutomorphicSpectralTheory. README page numbers are of other editions (Not verifiable). |
| Classical coefficient and Hecke adapter to Pan's spaces (R17.3.9) | pan26 lines 3075–3086 (Definition 5.4.11, p.71), 3231–3288 (§5.5.5, pp.75–76), 2954 (§5.4.1, p.68) | Law f(dh^p h_p) = h_p⁻¹f(d); (h_p·f)(d) = h_p·f(dh_p); A¹ nonzero only for n₁=n₂; T_S = ℤ_p[T_l,S_l]; spectrum σ_{k+2,1} with π_p special or supercuspidal and infinitesimal character of highest weight (0,−k); k=0 gives σ_{2,1}∪σ_0; W(k,0) is the dual of the type of highest weight (0,−k). As stated. |
| Whittaker-type-module bridge (R17.4.13b) | gj78 lines 2051–2076 (§9.1, p.531), 2088–2130 (§9.2, pp.532–533), 2209–2227 (§9.5, p.536) | Attached module (9.1.2.2) for the nongeneric quotient (9.1.2.1); the single exception (9.5.1) at t=1/4; T=S or a singleton; (9.5.5) ε=ε(χ)³ and L=1 on T; the constant-term alternatives (ii)–(v). As stated. |
| Cubic monomial input (R17.4.17) | jpss79 (OCR) lines 1519–1531 (Theorem 14.2, pp.253–254), 1587–1595 (p.255) | Theorem (unique π_v with all GL₁-twisted factors, cuspidal π) and the non-normal remark (irreducible, or a character plus a degree-two monomial). As stated. |
| All-place comparison (R17.4.17) | henniart02 lines 126–131 (théorème of §1.5, printed p.590); deligne73 lines 1282–1289 ((5.6.2), p.549), 1335–1341 (5.11, p.551), 898–901 (Théorème 4.1, p.535), 1972–1984 (8.12, p.572) | Pair-factor family and its uniqueness; inductivity in degree zero and the global product; the WD conductor (8.12.1). Locators correct; ownership is the declared gap. |
| Oddness API (R17.5.13) | bcgp21 lines 12593–12624 (Proposition 10.1.3 and the solvable case of its proof, pp.473–474) | Tate lift totally odd with finite solvable image, then Langlands–Tunnell; the determinant lemma is the README's own deduction, tested below. |
| Domain test, Order test (R17.5.15) | tunnell78 (OCR) lines 193–197 (Theorem 1.3, pp.182–183) | Global field F, place with F_v ≅ K, ρ_v ≅ σ, types preserved, F=ℚ with det ρ(c) = −1 for S₄ over ℚ₂. The two tests are finite calculations below. |
| Construction and local finiteness (R17.5.16) | patrikis lines 1374–1386 (Lemma 2.3.1, p.28); carayol86 lines 1558–1575 (§11.2 (a)–(c), p.450) | Unitary ψ₀ with angular infinity type on a CM field; (a) completion at 𝔭, (c) nonsplit at v with ξ_v not a norm. As stated. |
| Parabolic comparison (R17.6.4) | carayol86 lines 1808–1860 (§12.2.1–12.2.3, pp.457–458); varshavsky05 lines 169–176 (§0.2, p.5), 287–299 (§1.2.2, p.8), 360–380 (Proposition 1.2.5, Corollary 1.2.6, p.10), 605–611 (§1.5.7, p.16), 629–652 (Definition 2.1.1, Theorem 2.1.3, pp.17–18) | Coefficient setting, trace map on Hom(c₂!c₁*F,F), proper pushforward, Lefschetz–Verdier for proper c, quasi-finite stalk term, stabilizing/contracting definitions and the contraction theorem match R17.6.3a–b; the reordered-branch calculation is in the table. |

**Adversarial pass.** Values computed on each side; “retain” means no change needed.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions: δ_B, reciprocity | q=4, diag(ϖ,1); χ(Frob_arith)=2 | δ_B=1/4, δ^{1/2}=1/2; χ(Φ_geom)=1/2 | Retain. |
| R16.0.1 transport rec = (SR.5.2 rec)^∨ | rank one χ(ϖ)=2; unramified I(χ₁,χ₂) with α₁,α₂ | SR.5.2 (line 4676): Frob_arith ↦ 2; here Φ_geom ↦ 2, Frob_arith ↦ 1/2, i.e. the dual; rank two Φ_geom ↦ diag(α₁,α₂) = (Frob_arith ↦ diag(α₁,α₂))^∨; det, twist and dual commute (det(r^∨)=det(r)⁻¹ = rec(ω)^∨) | Retain; matches `:402–411, 461–468`. |
| R16.0.1 conductor vs Deligne (8.12.1) | Steinberg q=4; N=0 | a(r)=0, dim V^I=2, dim(ker N)^I=1 ⇒ a=1; N=0 ⇒ 0 | Retain. |
| R16.1.3 K₀/K₁ at depth one | upper and lower unipotent; diag(u,1); scalar u with u−1∉p; residue 𝔽₂ | in both / in neither; K₁ yes; K₀ yes, K₁ no; over 𝔽₂ g₂₂ ∈ Oˣ forces g₂₂ ≡ 1 so K₀=K₁ | Retain; the decomposition K₀=K₁·Z(O) is R02. |
| R16.1.3 cosets | q=2 | q+1=3 | Retain. |
| R16.1.5 central L² | ω(z)=−1 constant; measure ×2 | fails equivariance, |f|² descends; squared norm ×2 | Retain. |
| R16.1.6 diamond convention | level character value i | right translation i⁻¹=−i, classical i | Retain. |
| R16.1.7 `chevalley_power_congruence` | E=⟨2⟩⊂ℚˣ, n=2, T={2}; n=3; n=1; E trivial | 2^j mod 3 = 1,2,1,2,…: ≡1 iff j even; mod 7 = 1,2,4,1,…: iff 3∣j; n=1 unit modulus; E=1 vacuous | Retain; `IsCongrOne` is `Modulus.lean:314`. |
| R16.1.7 saturation | E=⟨4⟩ | E₀/E ≅ (ℤ/2)², exponent 2 | Retain. |
| R16.1.8 `finite_hecke_full_local_prescription` | ℚ, S={2}, χ₂=(−1)^{v₂} | Ψ = quadratic character mod 5: χ₅(2)=−1, χ₅(−1)=χ₅(4)=+1 (even, trivial on ℝˣ), unramified at 2 | Retain. |
| R16.1.8 extension criterion | G=ℤ/4, H={0,2}, χ(2)=−1; N=0 / N=H | a ↦ i^a extends (values 1,i,−1,−i); H∩N=H and −1≠1 blocks | Retain. |
| R16.2.1 sub/quotient | I(χν^{1/2},χν^{−1/2}) | χ∘det needs χ₁=χν^{−1/2}: it is the quotient; St⊗χ the sub | Retain; agrees with R16.2.10's third Check. |
| R16.2.1 Steinberg twist conductor | a(χ)=2 | 2a=4 ≠ 1+a=3 | Retain (AL.2.2.3's Check agrees). |
| R16.2.6 h_m | α=2,β=3; α=β=1 | h₁=5, h₂=19; h₂(1,1)=3 = [Y²](1−Y)^{−2} | Retain. |
| R16.2.7 Iwahori oldforms | basis (v, π(s)v), s=diag(1,ϖ) | g_a s = ϖ·(1 a;0 1) so Uπ(s)v = qc v; Uv = λv − π(s)v; matrix [[λ,qc],[−1,0]], polynomial X²−λX+qc; (2 1;−1 0): U−1 ≠ 0, (U−1)²=0; (5 6;−1 0): X²−5X+6 | Retain. |
| R16.2.7 hypothesis | unramified χ∘det | both invariant spaces the whole line: “not trivial” insufficient | Retain (source issue on cg20). |
| R16.2.9 unicity Checks | Steinberg component; ramified χ twist | two typical reps (trivial, inflated St); type twists with χ∘det | Retain. |
| R16.2.10 `supercuspidalProjective` | F=𝔽_q((t)), ℝ; block of π with fixed ω | instance holds / fails (`IsNonarchimedeanLocalField`); fixed-ω block ≅ Mod(ℂ[X]/(X²−c)), c=ω(ϖ)/ω_π(ϖ)≠0, semisimple; π⊗ρ with ρ(g)=(1 v(det g);0 1): ϖI ↦ ω(ϖ)(1 2;0 1) nonsemisimple, outside the fixed-ω category | Retain. |
| R16.2.11 vexing Check | x=5, ℓ=3, θ₀ order 8, λ∘N conductor 2 | 5≡−1 (3); θ₀^σ=θ₀⁵, θ₀/θ₀^σ=θ₀^{−4} order 2 conductor 1; N(1+5O_E)=1+5ℤ₅ so a(θ)=2 ≠ 1 ⇒ excluded | Retain. |
| R16.2.12 Iwahori centre | q=4 roots 2,3; roots 1,1; q=2 over ℤ[1/2] | U₁∈{4,6}, U₀=6, z₁=4+24/4=6+24/6=10=√4·5; without q: 5.5, 7; roots 1,1: U₁=2, z₁=2+4/2=4=√4·2; [K:I]=3 not a unit | Retain. |
| R16.2.13 archimedean | ratio |·|, sgn; z z̄, z/z̄; t=1/2 | D₂ sub + 1-dim quotient; irreducible limit; 1-dim quotient / irreducible; determinant-character quotient, nongeneric | Retain. |
| R16.3.1 principal series | α=2,β=3 | det 6; (1−2T)(1−3T)=1−5T+6T² | Retain. |
| R16.3.2 Steinberg | q=4, α=1, Ne₂=e₁ | r(Φ)=diag(1/2,2); rNr⁻¹ = (1/2)/2·N = N/4 = ν_W(Φ)N; L=(1−T/2)⁻¹ = (1−q^{−1/2}T)⁻¹; det 1 | Retain. |
| R16.3.3 primitive dyadic | α=((0,−1/2),(1,0)) | α²=−1/2·I; E=ℚ₂(√−2) ramified; level 1/2 ⇒ a=2+2·(1/2)=3; Swan=3−2=1, break 1/2; d(E/ℚ₂)−1 ≥ 1 so 1≥3d fails ⇒ primitive | Retain. |
| R16.3.5 ψ_a and stability | a=ϖ, ω(a)=1, s=1; s=1/2; χ highly ramified | |ϖ|^{2s−1}=1/4; 1; ε(s,χω)=ω(c_χ)ε(s,χ) gives ω(c_χ)ε(s,χ)² | Retain. |
| R16.3.6 gamma factors | s=1,2; D₂ | Γ_ℂ(1)=1/π=0.3183; Γ_ℝ(1)Γ_ℝ(2)=0.3183; Γ_ℂ(2)=1/(2π²)=0.05066; ε(D₂)=i²=−1 | Retain (values recomputed). |
| R16.3.7–8 tamely dihedral | q=2, ℓ=3; ℓ=2 | θ^q=θ⁻¹≠θ; θ⁻¹=θ; a(Ind θ)=2, L=1 | Retain. |
| R16.3.9 CDT character sum | Ind θ₀ (dim 480/24=20) against the cuspidal rep of GL₂(𝔽₅) | central 4·4=16; noncentral −20 − Σθ₀⁴ = −20+4; (16−20+4)/24=0 | Retain (recomputed). |
| R16.4.4 eigensystems | weight k, k=1; (1,−1) vs (2,−2); inert Ind ψ; trivial rank 2 | s_p=χ(p)p^{k−2}, χ(p)/p; det −1 vs −4; [[0,ψ(Φ_w)],[1,0]] trace 0 det −ψ(Φ_w); (2,q⁻¹), raw 2√q | Retain. |
| R16.4.4 Galois adapter | ρ_f with tr ρ_f(Frob)=a_p, det=χ(p)p^{k−1} | Eig(ρ_f^∨)=(a_p, χ(p)p^{k−2}) = Eig(f); Eig(ρ_f) would be (a_p/(χ(p)p^{k−1}), …) | Retain the dual rule. |
| R16.4.6 self-twist | ω=ωχ² | χ²=1 | Retain. |
| R16.5.1–4 | e^{−2πy}, s=1; k=2 | (2π)^{−1}; t=s+1/2, 1−s ↦ 2−t | Retain. |
| R16.6.1–2 dictionary | k=2; n=1,c=0 | α+β=a_p/√p, αβ=χ(p); a_p²=χ^{(p)}(p)p^{k−2} | Retain. |
| R16.6.3 Hilbert weights | (k,m)=(3,1); (2,3); (2,−1); k=(2,4), m=(1,0); empty Σ | dim 2, z³ (w=5); parity 2+2m₁ even vs 3+2m₂ odd; z⁻²; w=4, dim 3, z₁²z₂²; trivial line | Retain. |
| R16.6.6 weight one | parameter 1⊕sgn | det = sgn ⇒ χ(−1)=−1 | Retain. |
| R17.1.1 JL sign | d=2 | (−1)^{d−1}=−1 = PLL §6.9's (−1)^{n−m} at (2,1) (its line 2417) | Retain. |
| R17.1.3 real coefficients | k=2,3 | dim 1; dim 2, character 2cosθ | Retain. |
| R17.1.5 `existsQuaternionRamification_iff` | ℚ: ∅, {∞}, {2,∞}; complex place | M₂(ℚ) (a=b=1); odd, none; (−1,−1)_2=(−1)^{1·1}=−1, (−1,−1)_∞=−1, odd p +1: Hamilton; complex always split | Retain. |
| R17.1.5 `quaternionAlgEquivOfLocalSplitting` | (−1,−1) vs (1,1) | differ at ∞ and 2 ⇒ hypothesis false; identical data ⇒ identity | Retain. |
| R17.2.1 projector traces | St⊗χ; χ∘det; unramified PS | e_H^ξ−e_K^χ: 1−0; 0−1; w on the I-line of PS has eigenvalues ±χ(ϖ), ξ(det w)=−χ(ϖ) selects one: 1−1=0 | Retain. |
| R17.2.3 cyclic matching | diag(2,3), f=2 | diag(4,9), trace 13, det 36 | Retain. |
| R17.2.4–6 ledger | d odd; d=2; (16.1.7) at two places | no exceptional summand; weight ½; (iv)–(viii) vanish (jl70-ubc line 16823); product of two −1 is +1 | Retain. |
| R17.3.1–4 | M₂(ℚ); {p,∞} with π_p=St⊗χ_p; |S| even | identity; χ_p∘Nrd; (−1)^{|S|}=1 | Retain. |
| R17.3.9 Pan adapter | (n₁,n₂)=(−k,0) | W(k,0) dual of highest weight (0,−k); scalar z_p^k on coefficients | Retain (pan26 lines 3073–3078). |
| R17.3.12 Euler–Poincaré | (sl₂,O(2)) on D₂ | cochain dims 0,1,0 ⇒ EP −1 | Retain. |
| R17.4.1 power sums | A=diag(2,3): f=2,3; f=2 then 3; q=5, (t,s)=(5,6/5); char 2 | p₂(5,6)=13, p₃=35; p₃(13,36)=793=2⁶+3⁶; (13,36/25), q_w s_w=36; p₀=0, p₂=s² | Retain (script). |
| R17.4.2–7 cyclic BC | ℓ=3; ℓ=2 | block rank 2/3 non-integral ⇒ cuspidal; θ⊞θ^σ | Retain. |
| R17.4.12 filling | I(1,1,1)⊗χ₀χ at T | ε=ε(χ₀χ)³, L=1 (gj78 (9.5.5), jpss79 (14.2.3)) | Retain. |
| R17.4.12a outside-S converse | Eig(1,1); ratio q | not cuspidal; reducible | Retain; AL.3.9.6 says n≥3, so n=2 is owned here. |
| R17.4.13b Whittaker bridge | q=4, t=1/4, χ=1, s=2 | full L=(32/31)(16/15)(8/7)=1.25837; constituent (32/31)(16/15)=1.10108; ratio 8/7 | Retain (script). |
| R17.4.13 adjoint | diag(2,3); diag(a,a); scale u | (4,6,9)/6=(2/3,1,3/2); identity; unchanged | Retain. |
| R17.4.14/16 inductions | θ=1 inert cubic; θ(Φ_w)=2 inert quadratic | eigenvalues 1,ζ₃,ζ₃², trace 0, det 1; [[0,2],[1,0]], trace 0, det −2 | Retain. |
| R17.4.17 cubic BC | A=diag(2,3): type (1,2), degree 3; Std(S₃)|C₂; Ind 1 | A,A²; diag(8,27); 1⊕sgn; 3-cycle 1,ζ,ζ², transposition 1,1,−1 | Retain. |
| R17.4.17 λ-constants | ℝ³, ℝ×ℂ | (d,−1)_∞=+1, −1 | Retain; ownership is the gap. |
| R17.4.17 norm phase | K=ℚ(∛2) | M(a,b,c)=(a 2c 2b; b a 2c; c b a) (checked by multiplication of (1,t,t²)); det=N on −3..3³ (script: True); M(0,1,0)³=2I; (3,2) entry b; N(0,1,0)=2, N(0,0,1)=4, N(1,1,1)=1; Q=3a²−6bc: −3,0,3; identity for C=±1 on −3..3³ (True); disc −108, /4=−27; −3≡5 (8) nonsquare | Retain (script). |
| R17.5.4 `finite_projective_lift` | trivial r; open kernel | lifts; open kernel in a profinite group ⇒ finite image (the `Set.Finite` clause is implied, harmless) | Retain. |
| R17.5.5 Check | Std(S₃) of x³−2 at p=31, cubic χ mod 7 | roots 4,7,20 mod 31 (script); 31≡3 (7), χ(31)=χ(3)=ζ₃; twisted trace 2ζ₃ | Retain. |
| R17.5.7 octahedral comparison | A=diag(e^{iπ/6},e^{−iπ/6}), B=−A | tr A=1.732, tr B=−1.732, tr A²=tr B²=1, tr A³=tr B³=0, projective order of A = 6; s²=3e | Retain (script). |
| R17.5.9 `odd_solvable_artin_weight_one` | Std(S₃) of ℚ(∛2,ζ₃): p=5,7,31 | 3³≡2 (5) and x²+3x+4 irreducible mod 5 ⇒ transposition, trace 0, det −1; 2 not a cube mod 7 ⇒ 3-cycle, trace −1; split, trace 2 | Retain. |
| R17.5.11 Brauer character | a,a² with τ(a)=ζ₃; rank-p identity | −1 also in char 2; p≠0 in ℂ | Retain. |
| R17.5.12 `solvable_finite_image_integral_lift` | GL₂(𝔽₂)≅S₃ natural rep; n=0; Γ=1 | reflection lattice, det −1≡1; zero module not irreducible; trivial lift | Retain. |
| R17.5.13 oddness | diag(1,−1) at 3 and 2; R=ℤ×ℤ | −1≠1; −1=1; A=diag((1,1),(−1,1)) has det (−1,1)≠(−1,−1) | Retain; domain needed. |
| R17.5.15 domain and order tests | x=2,−1,5; a=1,2,3 in ℤ/4 | −1,1,1; i,−1,−i, χ(1)²=χ(2)=−1 | Retain. |
| R17.5.16 CM construction | L=ℚ(i), a=1+i | a/ā=i, phase of order 8 | Retain. |
| R17.5.17 mod-3 section | the two generator matrices over ℤ[√−2] | closure under right multiplication has 48 elements (script); reductions √−2↦−1 give (1 1;0 1) and (0 1;1 0) | Retain (recomputed). |
| R17.6.1 Δ at p=2 | k=12 | τ(2)=−24; unitary raw −24·2^{−5}=−3/4; central 2¹⁰ on π_alg, 1 on π_unit | Retain. |
| R17.6.3a ℙ² | identity | trace 1+1+1=3=χ(ℙ²) | Retain. |
| R17.6.3b ℙ¹×ℙ¹ | c₁(t,s)=(t²,s), Z={0}×ℙ¹ | (t²)⊂(t), (t²)⊂(t)²: n=1; H⁰,H²,H⁴ traces 1, 2+1, 2 = 6 = 3·χ(ℙ¹) | Retain. |
| R17.6.4 branches | (a,d)=(2,3),(3,2),(1,pᵐ),(1,1) | reordered: dn ≥ a(n+1) at n=a iff d ≥ a+1: 6≥6; dual; pᵐ≥2; equal orders never | Retain (Definition 2.1.1(b)). |
| R17.6.5 untwist | d of odd order n; a²=1 in char 2 | ξ=d^{(n+1)/2}, ξ²=d; a=1 | Retain. |
| R17.6.6 `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); projective image with a central involution; V₄, A₄; S₄; cyclic | ≅D₃; a lift u has u²=c, u/√c unipotent with a unique fixed line that r(G) preserves ⇒ reducible; Sylow-2 of S₄ nonabelian vs elementary abelian 2-subgroups of SL₂(F̄₂); abelian preimage ⇒ reducible; D_n with n even has a central involution | Retain. |
| R17.6.7 dyadic cases | D≡1,5,4,0 (8) | ν=0,2,2,3; −5≡3 (8) not a discriminant | Retain (rt97 misprints below). |
| R17.6.9 oddness of Ind(φ̃ξ) | ξ ramified at ∞₁ only | det at c: φ̃ξ(c₁)φ̃ξ(c₂)=(−1)(+1)=−1 | Retain. |
| R17.6.11a Katz descent | level 11 mod 5 | S₂(SL₂(ℤ))=0 | Retain. |
| R17.6.13 `characteristicTwo_solvable_weight_one` | GL₂(𝔽₂) rep via x³−2 | traces 0,0,1, det 1 by class; Std(S₃) lift gives a_p reducing to them | Retain. |
| R17.6.17–19 | roots 2,3, f=2; tower (2,3) | 1−13T+36T²; 1−793T+46656T² | Retain. |

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean:45`); `IdeleClassGroup.ofCompletion`, `.ofAdicCompletion` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:102–130`); `MonoidHom.domRestrict_surjective` (`Mathlib/GroupTheory/FiniteAbelian/Duality.lean:107`); `NumberField.Units.mem_torsion` (`.../NumberField/Units/Basic.lean:151`); `Matrix.charpoly_fin_two` (`.../Charpoly/Coeff.lean:228`); `Matrix.GeneralLinearGroup.map_det` (`.../GeneralLinearGroup/Defs.lean:219`); `Matrix.det_smul` (`.../Determinant/Basic.lean:275`); `Complex.Gammaℝ_def`, `Gammaℂ_def`, `Gammaℝ_mul_Gammaℝ_add_one` (`.../Gamma/Deligne.lean:47, 55, 124`); `haarMeasure_self` (`.../Haar/Basic.lean:540`); `Zsqrtd.lift` (`.../Zsqrtd/Basic.lean:862`); `Representation.ind` (`.../RepresentationTheory/Induced.lean:77`); `Matrix.ProjGenLinGroup` (`.../GeneralLinearGroup/Projective.lean`); `Algebra.IsUnramifiedAt` (`Mathlib/RingTheory/Unramified/Locus.lean:45`); `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean`); `Modulus`, `IsCongrOne`, `congruenceSubgroup` (`TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:96, 314, 365`); `HeckeRing.GL2.Newform`, `dirichletLift`, `qExpansion_coeff_one` (`.../Newforms/Newform.lean:104, 134, 164`); `satakeParameters`, `satakeParameters_eq_pair_iff` (`.../Newforms/Satake.lean:91, 108`); `Newform.eq_of_forall_notMem_eigenvalue_eq` (`.../StrongMultiplicityOne.lean:120`); `CuspForm.LSeries_qExpansion_coeff_eq` (`.../LFunction/Basic.lean:96`); `symPowerRep` (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean`); `Representation.charTwist` (`.../CharacterTwist.lean`); `simple_indFDRep_ofLinearCharacter_iff` (`.../Induction/Mackey/LinearCharacter.lean`); `IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` (`.../SchurMultiplier.lean:249`); `Matrix.GeneralLinearGroup.not_isSolvable_fin_two` (`.../GeneralLinearGroup/Solvable.lean:36`, hypothesis `∃ a, a ≠ 0 ∧ a^2 ≠ 1` as the README says); `QuaternionAlgebra.oneEquivMatrix` (`TauCeti/Algebra/Quaternion/Split.lean`); `HeckeCharacter` (`.../HeckeCharacter/Basic.lean`). The README's statements of what each provides and does not provide match.

**Cross-roadmap citations resolved** (open heads via `roadmaps show`, or main): SmoothRepresentationsOfLocalGroups SR.0 (line 553), SR.2.3 `whittaker-functionals` (2189, with the GL₂ dimension-one statement), SR.3a.1 (2257), SR.3.2 (2628), SR.4 (3102), SR.5.2 `classical-llc-normalization` (4586–4600: owns rec, uniformizer ↦ arithmetic Frobenius, “transport by inversion”) at #1688; PadicLocalLanglandsForGL2Qp §4.4 (1515: any nonarchimedean F, dimension-one Hom, unramified twists, coefficient extension) and §6.9 (2415–2417: `DrinfeldComparison.localJacquetLanglands`, its m=1 restriction `DivisionAlgebraTypes.jacquetLanglands` from D× to GL_d(F), sign (−1)^{n−m}) at #1312, whose lines 2534–2555 name R16.2.9 and R17.1.1 as consumers; ArithmeticGaloisRepresentations §2.4 (1807), §2.5 (1903), §2.7 with its three subsections (2086–2240) and Finite-order character globalisation (2307), §3.3 with `a(r,N)=a(r)+dim V^I−dim(ker N)^I` (2652–2657), Layers 1, 4 (2830, Dickson at 2915), 5 (3134), §§7.1–7.2 (4102, 4205), §7.6 with its three bold targets (4508–4619) at #856; AutomorphicLFunctionsAndLocalFactors by number as listed above (AL.3.9.5 at n=2 takes all quasicharacters; AL.3.9.6 states n≥3 and no highly ramified variant) at #924; AutomorphicSpectralTheory §§0.9, 0.48–0.50, 1.15c, 3.6a, 6.9, 6.17, 6.19, 7.0a–c, 7.1 (lines 252, 815–851, 1250, 2013, 3078, 3217, 3254, 3674–3754) at #925; AutomorphicFormsOnReductiveGroups §§0.5, 2.6 (`archimedeanUnitaryDual`), 5.8, 7.2, 7.3 (173, 435, 869, 1124, 1163) at #1037; ArithmeticLocallySymmetricSpaces ALS.F.6 with `LocallySymmetric.AutomorphicForm`, `.cuspForm`, `.cuspidalRepresentation` (987–1032), ALS.F.7, 5b.4, 5b.5 at #871; AdelicAlgebraicGroups AA.0 `restricted-haar-product` (681), §§1.1, 1.2, 1.5, 2.2, 2.3, 3.4, 4.4, 5.2 at #792 (its line 5485 lists R16.1.3 as a consumer); AlgebraicModularFormsAndSerreWeights by alias (R01 for the fragments) at #928; QuaternionicModularForms §§1.3, 2.1, 2.2, 3.1 (441, 493, 511, 793) at #934; LefschetzPencilsAndVanishingCycles LPV.0, LPV.2 at #873; ComplexComparisonPartII C6.3–C6.6 at #848; ClassicalAdicEtaleCohomology Layers 8–9 at #875; EtaleDualityAndPerverseSheaves §§6.3–6.5 at its head (consumer); on main: ReductiveGroupsPartII RG2.0, RG2.4 (`:438, 5510`), ClassFieldTheory Layers 1, 2, 5, 7, 9, 10, 11, 12, 13, 14 (`:739–1872`), QuadraticFormInvariants Layers 2, 5, 6 (`:1097, 1412, 1552`), GlobalQuadraticForms §4.4 (`:443`), HeightsAndUnits §4.2 `Set.unit_fg` (`:422`), GlobalNumberFields Layers 1, 2, 7–10 (`:253–525`), ProfiniteCohomology Layer 10 (`:1549`), LocalFieldsRamification Layer 1 (`:267`), ModularForms Layers 0–4, 6, 7, 8, 8G (`:259–935`), RepresentationTheory/InductionRestriction Layers 3, 4, 6, 7 (`:460–721`), SemisimpleAlgebras Layer 6 (`:293`), EtaleCohomologyFoundations §§0.6, 0.8, F.0, F.4.0 `exists_stable_lattice_iff` (`:13, 175–565`), ModularCurves 0E, 5B, 9A (`:386, 1313, 1808`), SchemeAndStackFoundations §1.1 (`:2071`), Completed/Chebotarev Layer 10 (`:410`), Completed/NumberFieldArithmetic Layer 5 (`:1290`); downstream ModularityAndLanglandsExtensions §1.2 (its line 504) and AutomorphicGaloisRepresentationsPartII `semisimpleParameter` (its line 2624) exist. The resolver's three Lean-name leads (`jacquetLanglands`, `localJacquetLanglands`, `AutomorphicForm`) are planned names of PLL §6.9 and ALS.F.6, not pinned declarations; its two R15.2/R15.3 leads are R01.

**Ownership by object.** The global Weil group (R17.5.0), Chevalley's congruence theorem (R16.1.7; cited as this roadmap's by ShimuraVarieties #933 and PotentialModularityAndCompatibleSystems #1075), Brauer characters and Fong–Swan (R17.5.11–12; RepresentationTheory on main `README.md:111–117` excludes them, ModularInduction avoids them), the n=2 ramification-restricted converse (R17.4.12a; AL.3.9.6 disclaims rank two) and the general Varshavsky interfaces (R17.6.3a–b; EDPS consumes) have no other owner among main, the five board packages and the open roadmap pull requests searched with `roadmaps grep`. QuaternionArithmetic (#1722) consumes R17.1.5's two theorems; ArtinRepresentations (#1711) consumes R17.5.1, R17.5.6–R17.5.10. Ownership against open pull requests whose files the brief does not supply was checked only through the `roadmaps grep` index.

## Not verifiable

- **prr23**, Theorem 1.33, pp.42–43: the sources service resolves the book only to its Cambridge landing page; cited by locator alone. The ramification realization was checked through GlobalQuadraticForms §4.4, ClassFieldTheory Layers 10 and 14 and the instances in the table.
- **jl70** paginations: the README cites an IAS retypeset (Theorem 16.1 “pp.269–270”, (16.1.7) “p.277”) and the IAS author scan (“p.261”); the UBC retypeset I read has Theorem 16.1 on printed p.260 and (16.1.7) on p.275, and the Springer DOI is paywalled. Content verified, those page numbers not.
- **bh06** (uncertified), **bz76**, **casselman73**, **converse**, **cogdell-fields**, **getz15**, **ddt**, **wiese04**, **langlands80**, **ac89**, **cdt99**, **cg18**, **hkp10**, **dlb17**, **nt26**, **artin-tate**, **tate-global**, **clozel90**, **rt83**: not read this round; their locators are cited by number only.
- **jpss79** and **tunnell78** were read from OCR of image-only scans; the quoted statements were legible.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says a smooth admissible irreducible unramified representation that is not trivial has a two-dimensional Iwahori-fixed space; it should say infinite-dimensional, since a nontrivial unramified determinant character has a one-dimensional one; affects a stated result.
- **Gap** in jl70 at Theorem 16.1 and the paragraph after it, printed p.260 of the UBC retypeset: the source says its proof is a formal sketch whose analytic facts are not verified; it should supply the convergence and trace identities; affects the proof.
- **Misprint** in rt97 at §2, case (ii), printed p.306: the source says the discriminant is congruent to plus or minus five modulo eight; it should say five, since three is not a discriminant residue; affects nothing.
- **Misprint** in rt97 at §2, sentence after the list (i)–(iv), printed p.307: the source assigns the dyadic exponent three to case (iii); it belongs to case (iv); affects nothing.
