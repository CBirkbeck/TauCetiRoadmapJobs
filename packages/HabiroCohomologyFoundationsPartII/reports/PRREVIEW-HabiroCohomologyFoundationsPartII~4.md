# Review of HabiroCohomologyFoundationsPartII (pull request #1466 at 61e97fe)

**Verdict:** accepted

Incremental re-review of the 32 lines changed since 729dbcb (16 insertions, 16 deletions, all in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md`; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder). The change set replaces the layer shorthand "HabiroRings HR.2 / HR.5 / HR.7" with section numbers at eleven places and adds section numbers to three Checks that cited HabiroRings without one. No finding.

## Previous findings

The previous report (at 729dbcb) was an acceptance with no finding, so there is nothing to account for. Its "Verified sound" table had noted that "HR.n" denoted HabiroRings Layer n, a label that HabiroRings' own README never uses; the two commits since then remove every such label (`grep 'HR\.[0-9]'` on the README at this head: 0 hits).

## Verified sound

**Gate and build.** The worker's gate at 61e97fe passed every check; my own run of the gate at this head (`gate HabiroCohomologyFoundationsPartII … --base origin/main`) printed every counter at 0 and `OK`, exit 0. `lake env lean` on `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` exited 0 in 12 s with no diagnostics; the file is unchanged since 729dbcb (36 lines: `import Mathlib`, the module docstring naming the nine headlines and their missing carriers, an empty namespace), so there is no declaration to `#check`, no section variable to lose, no one-tactic probe and no `sorry`. The dependency check returned

```text
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The merge order lists HabiroCyclotomicCompletions (line 70), HabiroCohomologyFoundations (193), HabiroNumberFields (309), HabiroRings (310) and RefinedTraceMethods (311) before this roadmap (315), and HabiroNahmSeries after it (318). The outside-folder diff against `origin/main` is empty; the worktree is clean.

**Every changed citation resolved at the HabiroRings open head (40eb896), by heading line in its README.** HabiroRings uses only `## Layer n` and `### n.m` headings; each section the diff now names exists and states what it is cited for.

| Cited here (README line) | HabiroRings section at its head (line) | What that section states, and whether it carries the cited contract |
| --- | --- | --- |
| Supplier table row 28: §§2.1, 2.4–2.5, 5.1–5.9, 7.3 | §2.1:392, §2.4:476, §2.5:505, §§5.1–5.9:902–1069, §7.3:1290 | Each item of the row has a section: ordinary/derived comparison (§2.4, for every commutative ring B and B-module M, no flatness), coefficient base change (§2.5 for complete modules, §5.6 for the ring), relative ring (§5.1), compatible roots and Taylor maps (§5.2), Taylor equalizer (§5.4), number-field coefficient rings (§§5.8–5.9), constant families that do not glue (§7.3). |
| Check traceHabiro_etale, line 279: "static relative Habiro ring `H_{R/A}` of HabiroRings §5.1" and "finite-quotient theorem of HabiroRings §5.1" | §5.1:902–932 | Defines `H_{R/A}` = π₀E(R/A) as a static ring; API bullet: q^m − 1 is a non-zero-divisor and `H_{R/A}/(q^m−1)` = qW_m(R/A) (Q Theorem 2.9); Check `H_{0/A}` = 0. Both cited statements are there. |
| §1.3 *Needs:* and Layer 1 Dependencies, lines 286 and 294: §§2.1, 2.4–2.5 and 5.1–5.7 | as above, plus §5.3:968, §5.5:997, §5.6:1007, §5.7:1034 | Narrower than the former "Layers 2 and 5": Layer 1 uses no number field (its Checks are ℤ, ℤ[x], 𝔽₂ and 0), so dropping §§5.8–5.9 is right; §5.7 (classical ring for A = R = ℤ) is what the unit-input Check uses. |
| Layer 4 preamble, line 454: "identified with the relative Habiro ring of HabiroRings §5.1 (the identification is HabiroRings §5.9)" | §5.9:1069 | κ: `H_{R/ℤ}` ≃ H_R (the GSWZ ring) for positive Δ with disc(F) ∣ Δ, as a ℤ[q]-algebra comparison; §5.9 says 6 ∣ Δ is not needed for κ, which agrees with this README keeping 6 ∣ Δ as the trace hypothesis only. |
| Check TraceInversion.cubic, line 483: "(HabiroRings §7.3)" | §7.3:1290 | F = ℚ(∛2), disc −108, R = ℤ[∛2][1/6]: the same ring. |
| §4.1 *Needs:*, line 488: §§5.8–5.9 (number-field coefficients) | §5.8:1048, §5.9:1069 | §5.8: for nonzero Δ with disc(F) ∣ Δ, 𝒪_F[1/Δ] is étale over ℤ; TraceInversion gives Δ > 0, hence nonzero. §4.1's finiteEtale is base change of §5.8 along ℤ → ℤ[1/Δ], as stated. |
| §4.2 paragraph, line 499: "Frobenius-twisted Taylor equalizer of HabiroRings §5.4" | §5.4:978 | `H_{R/A}` ≅ Eq(∏_m T_m ⇉ ∏_{p,m} T_{p,m}) with components `can_{p,m}(f_m)` and `φ_{p,m}(f_{pm})`: the same orientation as this README's `can_{p,m}(τ_m z) = φ_{p,m}(τ_{pm} z)`. |
| Laws _transition and _equalizer, lines 507–508: §§5.2 and 5.4; §5.4 | §5.2:934, §5.4:978 | The maps can and φ are defined in §5.2 (coefficient extension; completed Frobenius then re-expansion by ζ_m − ζ_{pm}); the relation is §5.4's. |
| Check _rational, line 515: "HabiroRings §5.5, the untwisted description for ℤ[1/N] with identity Adams operations" | §5.5:997 | §5.5 names R = ℤ[1/N] with identity Adams operations as a case with the untwisted (naive Habiro completion of R[q]) description. |
| Check _mOne, line 516: "component decomposition of HabiroCyclotomicCompletions §5.3, transported to the Taylor equalizer as in HabiroRings §7.2" | HabiroRings §7.2:1280; HabiroCyclotomicCompletions §5.3 (open head ff6a775, read with the roadmaps tool) | §7.2 states, for ℤ[1/p], the splitting ∏_{a≥0} S_a by v_p of the root order and that the q = 1 Taylor map is injective on S₀ and kills the other factors; HabiroCyclotomicCompletions §5.3 states the decomposition for ℤ[1/Δ] with classes indexed by (v_p)_{p ∣ Δ} and the same Taylor statement at roots of order prime to Δ. The ℤ[1/6] case here has two primes, so "as in §7.2" is the right word. |
| Check _nonabelian, line 521: "(HabiroRings §7.3)" | §7.3:1290 | Same factorisation at p = 5, same conclusion (quadratic component moved, no global automorphism). |
| Check _inversion, line 523: "HabiroRings §5.7 constructs `H_{ℤ/ℤ}` and identifies it with the classical Habiro ring" | §5.7:1034 | For A = R = ℤ the relative ring is canonically lim_n ℤ[q]/P_n with projections and Taylor maps of HabiroCyclotomicCompletions Layers 1, 3, 4. |
| Layer 4 Dependencies and Downstream consumers, lines 533 and 537: §§5.1–5.9 and 7.3 | as above | Equal to the union of the §4.1 and §4.2 *Needs:* lines. |

Unchanged citations on the same lines (HabiroCohomologyFoundations §4.21, RefinedTraceMethods §§6.1, 6.11–6.14, HabiroNumberFields §§2.1–2.4, QWittVectors §§2.1–2.5) were resolved by the previous report at the same heads and are unchanged in the diff.

**Source locators that sit inside changed lines.** QH Corollary 3.13 (QH line 1174, page marker 27 at line 1170): for R étale over A the q-Hodge complex is the relative Habiro ring `H_{R/A}`, as the traceHabiro_etale Check states. GSWZ Remark 1.2 (GSWZ line 311, printed page 7, marker at line 270): H_R is not a domain for Δ ≠ 1 but a product of domains indexed by the classes of ℕ under m ∼ pm for p ∤ Δ, which is exactly the (v₂, v₃)-indexing the _mOne Check uses for Δ = 6; GSWZ line 280 records φ_p = id for R = ℤ[1/Δ], used by the _rational Check. GSWZ Definition 1.1 with (12)–(13) (lines 255–276, pages 6–7) and KU Corollary 6.15 (page 86) are unchanged locators on changed lines and were verified by the previous report. The seeded sample's other targets (§§0.1, 1.1, 1.2, 2.1–2.3, 3.1) are untouched by the diff and are carried from the previous report.

**Adversarial pass.** Rows for the changed statements, with values computed on each side; the untouched rows are carried forward below.

| Statement (changed) | Instances | Values computed | Result |
| --- | --- | --- | --- |
| traceHabiro_etale cites §5.1 for `H_{R/A}` and its finite quotients | R = ℤ[i][1/2] over ℤ, m = 1, 4 | §5.1's Checks: H/(q−1) ≅ R, H/Φ₄ ≅ R[q]/(q²+1) ≅ R × R since (q−i) − (q+i) = −2i is a unit; étale R has L_{R/A} = 0 so qW_m dR^n = 0 for n ≥ 1 | "No classes in positive q-Witt degree" holds; the cited section states the quotient theorem. |
| §1.3 *Needs:* narrowed to §§5.1–5.7 | Layer 1 Checks: A = ℤ, R ∈ {ℤ, ℤ[x], 0}, B = M = 𝔽₂ | unit input uses §5.7 (A = R = ℤ) and §5.1's d = 1 completion ℤ[[q−1]]; 𝔽₂ Check uses §2.4 (quotients of dimension 1 and 3 = 1 + 2); no 𝒪_F appears in Layer 1 | §§5.8–5.9 correctly dropped from Layer 1. |
| Layer 4 preamble: identification is §5.9 | F = ℚ, Δ = 6; F = ℚ(i), Δ = 12 | §5.9 hypotheses: Δ > 0 and disc ∣ Δ; TraceInversion gives both (1 ∣ 6; −4 ∣ 12) plus 6 ∣ Δ | κ available whenever TraceInversion holds. |
| TraceInversion.cubic cites §7.3 | F = ℚ(∛2), Δ = 108 | 2²·3³ = 4·27 = 108; 6 ∣ 108 (quotient 18); 108 ∣ 108; 108 > 0; primes of 108 are {2, 3}, so ℤ[∛2][1/108] = ℤ[∛2][1/6] = §7.3's R | Admissible; same ring as the cited section. |
| §4.1 *Needs:* §§5.8–5.9 | Δ = 0 (excluded), Δ = 108 | §5.8 needs Δ ≠ 0 and disc ∣ Δ; TraceInversion forces 0 < Δ | Hypotheses of the supplier implied by the consumer's. |
| T_{p,m} and the prime-edge relation (§4.2, §5.4) | A = ℤ, ψ = id, R = ℤ[i][1/6], (p, m) = (7, 1) | §5.2's `T_{p,m}` = (R̂_p ⊗_{ℤ,ψ^m} ℤ)^∧_p[ζ_{pm}][[q−ζ_m]] = R̂_p[ζ_{pm}][[q−ζ_m]] for identity ψ, equal to this README's; relation can_{7,1}(f₁) = φ_{7,1}(f₇): constant i gives i against i⁷ = −i, fails | Same carrier and same orientation as the cited section; the twisted Check still refutes the constant family. |
| _rational cites §5.5 | R = ℤ[1/6] | R̂₂ = R̂₃ = 0; for p ∤ 6, φ_p = id on ℤ[1/6] (GSWZ line 280), extending the identity Adams operations of ℤ; §5.5 lists ℤ[1/N] with identity Adams operations | Untwisted description applies; m = 1 completion ℤ[1/6][[q−1]] by §5.1. |
| _mOne cites HabiroCyclotomicCompletions §5.3 and HabiroRings §7.2 | Δ = 6, orders 1, 2, 3, 5, 6, 10 | classes by (v₂, v₃): 1 ↦ (0,0), 2 ↦ (1,0), 3 ↦ (0,1), 5 ↦ (0,0), 6 ↦ (1,1), 10 ↦ (1,0); the Taylor map at ζ₁ = 1 (order prime to 6) is injective on S_{(0,0)} and zero on the idempotent of every other class; GSWZ line 312–314 gives the same classes as m ∼ pm, p ∤ 6 | τ₁ not injective, as stated; §7.2's one-prime splitting ∏_{a≥0} S_a is the Δ = p case of the same decomposition. |
| _nonabelian cites §7.3 | p = 5 | (x−3)(x²+3x+4) = x³ − 5x − 12 ≡ x³ − 2 (mod 5); disc(x²+3x+4) = 9 − 16 = −7 ≡ 3, not in {0, 1, 4} | Irreducible quadratic factor; agrees with §7.3. |
| _inversion cites §5.7 | F = ℚ, Δ = 1 | 6 ∤ 1 so TraceInversion ℚ 1 is false; ℤ → ℤ is the identity, étale (§5.8's own Check); §5.7 gives `H_{ℤ/ℤ}` = lim_n ℤ[q]/P_n | The Check's two halves are each stated by the cited sections. |
| Dependencies and Downstream lines | union of *Needs:* | Layer 1: {2.1, 2.4, 2.5, 5.1–5.7} = §1.3's list; Layer 4: {5.8, 5.9} ∪ {5.1–5.9, 7.3} = {5.1–5.9, 7.3} | Consistent. |

Carried forward from the previous report (at 729dbcb), whose statements the diff leaves untouched; each row's values are as computed there:

| Statement (untouched; previous report) | Values computed there | Result there |
| --- | --- | --- |
| Rees sign and grading; filtered quotient convention; q-integers | βt = h; cofib(h) = ℤ, 0, 0 versus degreewise ℤ, ℤ, ℤ; [2]_q ↦ 2 | conventions consistent with QH 3.1 and 3.9. |
| Ordinary étale lift of ℤ[1/6]; lift of ℤ₂ over S₂ | π₁ = (ℤ/2)[1/6] = 0; π₁(S₂) = ℤ/2 ≠ 0 | spherical carrier necessary. |
| Perfect free δ-ring specialisations; sphericalPerfection on ℤ_p⟨x⟩; completed localisation f = Σ p^{n²}x^{−n}; relative root tower; markings and base change; nonflat scalar extension | cofibres S_p/p² versus S_p ⊕ ΣS_p; can⁻¹∘φ reduces to x ↦ x^p; exponents −1, −4, −9; t^{1/(N+1)!} ∉ 𝔽_p[x, t^{1/N!}]; automorphism components 2 versus 1; π₀ = π₁ = ℤ_p | §0.1 laws and Checks correct. |
| TraceInput: rationalAmplitude, condition at 2, invertTwo, ofEtale semiperfectness | R = ℚ[u,v]/(u,v)² not lci; 4.8 proved for p > 2 only; R̂₂ = 0 at ℤ[1/2]; relative Frobenius iso for étale R | §1.1 as cited. |
| tracePair_unit, _zero, _etaleUncompleted, _polynomial, _multiplicative | F/β = ℤ in degrees ≤ 0; dR_{0/ℤ} = ℚ, qdR = ℚ[[h]], completion 0; H¹(F^k) = (R/ℚ)[[h]]/h^k; dx coefficient (q−1)^{i−1}; E₁ from E₂ | §1.2 clauses (a), (b) hold on each instance. |
| traceHabiro_hCompletion, _qWittGraded/mOne, _zero, h-completion for étale R, _cyclonic hypotheses | differentials 0, h, q²−1 against 0, 1, 1+q; H¹ = ℤ[x]dx versus ⊕(ℤ/r)x^{r−1}dx; (q^m−1)-completion of ℚ((h)) = 0; colimit R[[h]]; needs 2 ∈ R^× and (A₂) | §1.3 as stated. |
| E1/E2QuotientExponent tables; E₂ ⇒ E₁; quotientLift at odd p and at p = 2; Moore towers S/9, S/16, S/64; S/8; high-powered integers; quotientLift_perfected versus §2.2; identityCover example | p = 2 rows 0,0,0,0,1,0,1,0 and 0,0,0,0,0,0,1,0; 6 ≥ 4, 3 ≥ 2; Q₁(y) = 0 at odd p, v = y² at 2; E₁, E₁, E₂; 8 fails the predicate; 1, 9, 16, 64 true, 8, 32, 12 false; 3·3 = 0 in ℤ/9; x^r basis, α = 4 passes | §2.1 as cited (Bu, KU 6.8–6.9, TC 3.3–3.4). |
| perfectedLiftNaive hypotheses; toric divided powers; exponent one; p = 2, α = 2; tracePair_quasiRegular clause 1; toric base; branch dependence | p-quasi-lci includes p-complete; (x−1)(x−q)/(1+q) ↦ (x−1)²/2; ku-lift exists, spherical lift excluded; QH 4.22(a) applies; base change reduces to QH 4.22(b)'s hypothesis; relative Frobenius surjective; Ω¹/p ≠ 0 for ℤ[x] | §§2.2–2.3 as cited. |
| Canonical domain d = 0, 1, 2; counit; Jackson operator; derived reduction; Laurent framed; tensor domain | primes inverted ∅, ∅, {2}; zero map excluded; (q²−1)x(x−y) identity; Bockstein x^r ↦ [r]_q x^{r−1}dx; dR_{ℚ[x^±]/ℚ} = ℚ; d = 2 | §3.1 as cited. |
| TraceInversion (ℚ: 6, 1, 0, −6); Gaussian Δ; Gaussian étaleness at Δ = 1; isUnit_two_three; finite étale rank; divisibility diagram; zero datum; Δ a unit in H_R; full coefficients; twisted family at 7; Frobenius direction at 11; equalizer strictness; τ₁ non-injectivity | true, false, false, false; 4 ∤ 6, 4 ∣ 12; 𝔽₂[i]di ≠ 0; 2·(3/6) = 1; ranks 1, 2; C₁ = {1}; all terms 0; φ_p(1/Δ) = 1/Δ; e² = e; i⁷ = −i; 4³ ≡ 1 mod 7 and a⁸ = a; (1, 0, 0, …) fails at (5, 1); classes by (v₂, v₃) | §§4.1–4.2 as cited. |
| TC finite-coefficient corner; KU Lemma 6.11 sign | dR_{0/ℚ} = ℚ ≠ 0; (q−1)^d γ̃^d = (−1)^d δ^{(d)} | the two source issues recorded below. |

**Headline audit.** Unchanged: the nine headlines named in the module docstring (relativeFormalEtaleLift, sphericalPerfection, tracePair, traceHabiro, quotientLift, perfectedLiftNaive, tracePair_quasiRegular, canonicalFramedTrace, numberFieldTraceExports) each need a carrier absent at the pins (connective E∞-ring spectra, enhanced filtered modules, relative THH over ku, cyclonic spectra, genuine fixed points), so stating nothing is correct; the diff touches no headline statement.

**Duplication and ownership.** The diff adds no construction, definition or theorem: it renames citations. The previous report's ownership search by object over main and the open heads stands; the sibling checkouts the brief names were available, so ownership against open pull requests without files did not arise.

**Shape and policy on the changed lines.** No process word, pull-request number, round label, LaTeX delimiter, local path or `lemma`; every cross-roadmap citation names roadmap and section. The three `Prismatic.Trace.graded*` leads of the citation resolver are unchanged README targets of PrismaticCohomologyPartIII §7.0, as the previous report recorded.

## Not verifiable

- Nothing was unreadable: QH and GSWZ were read at the cited lines from the cache; HabiroRings and HabiroCyclotomicCompletions were read at their open heads (40eb896 and ff6a775). No manifest change and no missing-text request.
- As in the previous report, relativeFormalEtaleLift (§0.1), the global identification in tracePair_quasiRegular and the naturality of ε_R in numberFieldTraceExports_naturality are assembly targets the sources do not state; the diff does not touch them.

## Source issues

- none new in this round. The six issues of the previous report (GSWZ footnote 1 Frobenius direction, KU proof of Corollary 6.15 citing QH 3.12 for 3.13, TC 3.5 and Lemma 3.7 rational corner, KU Lemma 6.11 sign, KU proof of Theorem 6.10 normalisation, KU Remark 3.10 gap) stand as recorded there.
