<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7645#issuecomment-6702000975 -->
Review (claude) of 0ed8a23

Verdict: needs_changes

1. **F01** (P2) 8.3 (c) and (d): "flat morphism" of prestacks is undefined in the classical context, and the stated route does not apply there

   Location: `design/README.md` line 755, "(c) … in the classical context so does every flat morphism; (d) … in the classical context so is `X₁ ×_Y X₂` when `X₁ → Y` is flat", and the proof route "(c) and (d) reduce to (a) through the affine diagonal of the base".

   Claim: the classical clauses of (c) and (d) hold for "flat" morphisms between perfect prestacks.

   Witness: the README defines flatness only for maps of test rings (Conventions), flat affine maps (4.1) and maps representable by qcqs schemes (5.4(b)); a map between non-representable prestacks with affine diagonal (`BG → BH`) is "flat" in no stated sense. The route reduces (d) to (a) applied to `X₁ ×_Y X₂ → X₁ × X₂`, a base change of `Δ_Y`; classically (a) needs *flat* affine (4.2), and `Δ_Y` is not flat in general: for `Y = Spec k[ε]/(ε²)`, `Tor₁^{A⊗_k A}(A, A) = Ω¹_{A/k} ≠ 0`. So the classical (d) is unsupported as stated even when `X₁ → Y` is flat in any of the defined senses.

   Repair (tested on the instance above): state the classical clauses with a defined hypothesis and a route that uses it. For (d): "in the classical context, if `X₁ → Y` is flat affine (4.1), or flat and representable by qcqs schemes with an invertible object ample on every affine base change (as in (b)), then `X₁ ×_Y X₂` is perfect", with the route "`X₁ ×_Y X₂ → X₂` is a base change of `X₁ → Y`, hence of the same kind, and X₂ is perfect; apply (a), respectively (b)". For (c): "in the classical context a flat affine morphism, or one of the kind in (b), has perfect base change along every point", the base change being an affine, respectively a qcqs scheme with an ample invertible object over an affine (8.1 with 6.3). For `Y = Spec k[ε]/(ε²)` and `X₁ = X₂ = Y` the repaired (d) gives `Y` itself through the identity, which is flat affine. Mirror the change in `plan.json` target 8.3 (statement and api).

2. **F02** (P3) 4.1 Check: `BG → Spec k` is affine for the trivial group

   Location: `design/README.md` line 477, "For an affine group scheme G over k, `Spec k → BG` is affine with fibre G, whereas `BG → Spec k` is not, its fibre being BG."

   Claim: for every affine group scheme G over k the map `BG → Spec k` is not affine.

   Witness: for `G = 1`, `BG = Spec k` and `BG → Spec k` is the identity, which 4.1's own API lists as affine. For `G ≠ 1` the Check holds: `BG(A)` has `π₁ = G(A) ≠ 0` for some A, so `BG` is not representable.

   Repair: write "For a nontrivial affine group scheme G over k …" (and in `plan.json` 4.1, test 3).

3. **F03** (P3) HTT page locators: Proposition 1.2.5.1 is on PDF p. 53, Theorem 6.1.0.6 on PDF p. 547

   Location: `design/README.md` line 354 ("HTT Proposition 1.2.5.1, PDF p. 54") and line 656 ("HTT Theorem 6.1.0.6, PDF p. 12").

   Witness: HTT line 2081 (PDF p. 53) is the statement of Proposition 1.2.5.1; the p. 54 hit (HTT line 2122) is a later use. HTT line 24717 (PDF p. 547) is the statement of Theorem 6.1.0.6; p. 12 (HTT line 326) is the introduction's mention of it.

   Repair: replace "PDF p. 54" by "PDF p. 53" at line 354 and "PDF p. 12" by "PDF pp. 547–548" at line 656; same in `plan.json` 2.5 and 7.1 locators.

4. **F04** (P3) HigherToposTheory section for Giraud's theorem: the statement and the effective-groupoid half are in L10.1 and L10.3, not L10.5

   Location: `design/README.md` line 122 ("L10.5: Giraud's theorem (HTT Theorem 6.1.0.6); groupoid objects in the presheaf ∞-topos `PreStk_T` are effective (7.1)"), line 666 (7.1 *Needs:* "HigherToposTheory L6.8 and L10.5"), line 718 (Layer 7 Dependencies), `plan.json` lines 1533 and 2065.

   Witness: at the head of HigherToposTheory, `### L10.5 Giraud's theorem` (its line 8607) holds HTT 6.1.5.1–6.1.5.3 and the part `HTT.6.1.0.6/3⇒1`; the statement `HTT.6.1.0.6/stmt` is in L10.1 (its line 8397, inside `### L10.1` at 8274–8411), and the direction used by 7.1 (an ∞-topos has effective groupoid objects: `HTT.6.1.0.6/1⇒2`, `/2⇒3`, HTT 6.1.3.10 and 6.1.3.19) is in L10.3 (its lines 8495, 8547).

   Repair: cite "HigherToposTheory L10.1 (`HTT.6.1.0.6/stmt`) and L10.3 (HTT Propositions 6.1.3.10 and 6.1.3.19: groupoid objects of a presheaf ∞-topos are effective)" in the supplier contract, in 7.1's *Needs:* line, in Layer 7's Dependencies and in `plan.json` (supplier sections and 7.1 prerequisites); L10.5 may be dropped.

5. **F05** (P3) Process residue in the roadmap text

   Location: `design/README.md` line 7, "No roadmap on the content repository's main branch, in an open roadmap pull request or on the board defines …"; lines 75 and 87, "The pin is `1b1ccf4b…`. Each declaration below was read at the pin." and "The pin is `2fd255d9…`."

   Claim: house style is timeless; pull-request, board and pin references are process narrative (the pins live in `plan.json` `baseline`; no roadmap on main carries them).

   Witness: `grep -l "The pin is" content/TauCetiRoadmap/*/README.md` is empty; the merge-order and pull-request vocabulary at line 7 names the review process.

   Repair: at line 7 write "No other roadmap defines the limit of module categories over the affine points of a prestack in this generality; the classical-context and animated special cases planned locally by PrismaticCohomologyPartII §4.0, HabiroCohomologyFoundations §1.27 and LanglandsParameterStacks §1.7 are the restrictions of 2.2–2.3, 3.2–3.3, 4.2 and 7.3 and import them (Downstream consumers)." Delete the two "The pin is …" sentences (keep "Mathlib/AlgebraicTopology/… .lean:41"-style file references, which are stable at the baseline recorded in the plan).

6. **F06** (P3) 8.3 (b) is stated below the generality of its source

   Location: `design/README.md` line 755, "(b) … Y carries an invertible object L whose restriction to every base change `Y_η` along a point is ample".

   Claim: BZFN Proposition 3.21 (BZFN line 1189, p. 24) allows a relatively ample *family* of line bundles; the design states the single-bundle case.

   Witness: BZFN line 1189–1191: "a relatively ample family of line bundles (for example, p quasi-projective, or in particular affine)"; the design's generation step cites Stacks 0BQR, which is for a single ample invertible sheaf.

   Repair: either state (b) for a family `{L_i}` of invertible objects whose restrictions to each `Y_η` form an ample family, with the generation step "an object N with `f_*(L_i^{⊗n} ⊗ N) = 0` for all i, n ≥ 0 vanishes on every `Y_η`" cited to BZFN's argument (BZFN line 1195–1199) and a Check for a family that is ample but no member of which is, or say in one clause that only the single-bundle case is stated because 8.4 uses it and Stacks 0BQR covers it. Either keeps 8.4 unchanged.

Reviewed read-only: `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `design/plan.json`, `sources.toml`. No previous review. Elaboration: not available (this lane does not elaborate); the design stage has no `Suggested.lean`, so the one-tactic probe and the headline-absence check do not apply yet and are recorded as such.

Gate output (no UPWARD or CYCLE line):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

## Verified sound

**Principles.** No route-specific shortcut (the three contexts are built once and compared by 2.4; flat hyperdescent is proved for arbitrary connective test rings without descendability, 3.2). No re-planned roadmap: schemes, stacks in groupoids, quotient stacks, abelian `QCoh` on stacks and `DQCoh` are imported from SchemeAndStackFoundations §§1.1, 1.13, 1.18, 1.21, 1.22, 2.18, all present on main (its lines 2071, 2418, 2745, 2951, 2989, 3959); the enhanced derived categories, modules, presentability, descent and animation from EnhancedDerivedSheaves (29 section ids and 66 backticked names, all found on main, e.g. `moduleObjects` line 1472, `categoricalModuleBaseChange` 1676, `presentable_limit` 1638, `homotopyFixedPoints` 1720 (finite groups, as the design says in 7.3), `animatedToCAlg_equiv_of_rational` 1998, `tot_filteredColimit_of_bounded` 1980, `hypercoverPullback_unit` 2331, `derivedTowerLimit` 1296, `enhancement_compatibility` 2930). No copied passages, no algorithms, no sorry'd data, no `set_option` (no Lean at this stage). Single supply direction: gate 0 problems; all five suppliers are on main except HigherToposTheory, an open pull request adding a new roadmap folder by another author, which the rules allow; its nine cited sections exist at its head (L2.1 line 2516 with HTT 2.1.1.3 at 2548; L2.2 2573 with 1.2.5.1 at 2583; L6.3 5053 with 5.1.5.6 at 5084; L6.8 5655 with 6.1.2.7 at 5681; L7.6 6250 with 5.5.4.20 at 6354; L9.4 7443 with HA 1.3.3.2 at 7653; L9.6 7989 with HA 1.4.4.11 at 8217; L11.3 9448 with 6.5.2.9 at 9570; L10.5 see R04).

**Declared gap.** `gap:chevalley-quasiprojective-quotient` is precise (field, finite-type affine group scheme, closed immersion into `GL_n`, quasi-projective quotient with equivariant immersion into a projectivized representation), minimal (ReductiveGroups Layer 3, its lines 234–247, records representability of `G/H` as "a theorem with hypotheses" and states no quasi-projectivity; Layer 3A treats orbits in projective space, not `G/H`; SchemeAndStackFoundations, Mathlib and Tau Ceti have no quasi-projective quotient of `GL_n` by a subgroup), and declared under the same slug in `plan.json` `gaps[0]` (supplier ReductiveGroups, section "Layer 3 (subgroups, quotients, components)", the heading at ReductiveGroups line 234) and in the README's supplier contract. BZFN line 1205 is exactly the use.

**Sources, seeded sample** (every locator opened in the cached text; pages are the file's page markers):

| Target | Locator | Found at | Supports the statement |
| --- | --- | --- | --- |
| 1.2 | HA 4.5.3.1, 4.5.3.2 p. 601; 4.8.5.21 p. 754; 4.8.4.6 p. 737; SAG 6.2.2.1 pp. 490–491 | HA lines 22977, 22981, 28674, 28032; SAG 17835 | yes: coCartesian fibration of module categories under geometric-realization hypotheses, `M ⊗_C RMod_A(C) ≃ RMod_A(M)` |
| 1.4 | HA 7.2.4.1 p. 1260, 7.2.4.2/4 pp. 1261–1263, 7.2.4.10 p. 1265, 7.2.4.11/17 pp. 1265–1268; SAG 2.9.1.1/2 p. 277, 2.9.1.5 p. 278, 6.2.5.2 pp. 494–495, proof of 6.2.6.2 p. 497; BZFN 3.1 p. 17 | HA 48274, 48281, 48357, 48428, 48432, 48556; SAG 10004, 10007, 10022, 17974, 18077; BZFN 830 | yes; 7.2.4.17's "left coherent" is the design's "π₀ coherent and π_n finitely presented" |
| 1.5 | HA 4.7.4.18 p. 699, 4.6.1.11 p. 620, 4.7.5.2/3 pp. 704–705, 5.2.2.36 p. 835; SAG 6.3.4.1 p. 506 | HA 26640, 23655, 26834, 26863, 31630; SAG 18368 | yes; 4.7.5.3 is the left-adjointable/monadic form, the design states its dual and says so |
| 2.2 | SAG 6.2.2.1, 6.2.2.5, 6.2.2.7 p. 491, §6.2.6 and 6.2.6.1 pp. 496–497; GR-I I.3 §1.1 p. 143 | SAG 17835, 17859, 17867, 18068; GR-I 7322 (printed 143–144) | yes |
| 2.3 | SAG 6.2.3.4 pp. 492–493, 6.2.1.12 p. 488; GR-I §§1.1, 3.2 pp. 143–145, 159; HTT 5.1.5.6 | SAG 17905, 17758; GR-I 7322, 8013 (printed 159); HTT 15522 | yes; SAG 6.2.3.4(3) is the presentability clause in 3.4(b), 2.3's u-small-colimit clause is its special case |
| 3.3 | SAG 6.2.3.1 and 6.2.3.2–3 p. 492; GR-I 1.3.7, 1.3.8, 1.3.11 p. 147 | SAG 17889, 17898, 17901; GR-I 7458, 7463, 7474 | yes; 6.2.3.3 gives the hypercompletion clause |
| 3.4 | GR-I 1.4.4 p. 149; SAG 6.2.3.4(3) p. 493 | GR-I 7572; SAG 17912 | yes |
| 5.2 | Stacks 0A0J, 08D3 | Stacks lines 86, 102 | yes: `H^q(R lim K_n) = lim H^q`, `E ≃ R lim τ^{≥−n} E` on `D_QCoh` |
| 6.2 | SAG 6.2.5.8 pp. 495–496, 6.2.5.9 p. 496, 9.1.3.1/9.1.3.2 pp. 733–734; GR-I §1.5.1 p. 149, 1.5.4 p. 150; HA 1.4.4.11 p. 160 | SAG 18017, 18025, 26667, 26690; GR-I 7581, 7600; HA 6013 | yes; SAG needs quasi-geometric (quasi-affine diagonal), the design assumes affine diagonal in general and quasi-affine only classically through 5.3, which is weaker |
| 6.3 | SAG 6.2.6.2/3 p. 497; HA 4.6.1.11 p. 620; GR-I 3.6.4/5 p. 163 | SAG 18072, 18088; HA 23655; GR-I 8201, 8209 | yes |
| 7.2 | SAG 6.2.3.1 p. 492; GR-I 1.3.8, 1.3.11 p. 147 | as above | yes |
| 7.4 | Stacks 06WG, 06WT; GR-I 2.4.3, 2.4.5 p. 156; SAG 10.4.6.8/9 p. 930; HNR C.1 p. 16; HA 1.3.3.2 p. 97 | stacks-sheaves lines 721, 953; GR-I 7872, 7883 (2.4.2: qcqs classical algebraic stack, the proof uses the affine diagonal); SAG 33959, 33965; HNR 807; HA 3703 | yes; GR-I 2.4.4 and SAG 10.4.6.9 both say the unbounded statement needs completion, as the design's last Check records |
| 8.1 | Stacks 09IS, 09M1; SAG 9.6.1.1 p. 807 | Stacks 1806, 1969; SAG 29408 | yes |
| 8.2 | BZFN 3.2 p. 17, 3.9 p. 20 | BZFN 834, 970 | yes |
| 8.4 | BZFN 3.22 p. 24, line 1205 | BZFN 1200–1208 | yes; the design's route mirrors BZFN's with the Chevalley step declared as the gap |

Also opened: SAG 1.3.1.7 p. 117 (line 4184), 2.2.3.3 p. 202 (7269), 2.1.2.3 p. 193 (6951), 2.2.6.2 p. 208 (7461), 2.8.4.2 p. 275 (9916, lists perfect and almost perfect as flat-local), 6.3.4.3 p. 506 (18458), 9.1.5.1 p. 736 (26798), D.6.1.1 pp. 2173–2174 (79377), D.6.1.3 (79395), D.6.1.4 p. 2174 (79403), D.6.2.3 (79462), D.6.3.1 p. 2177 (79502), D.6.3.3–4 pp. 2177–2178 (79518, 79526); HA 7.1.1.13 p. 1202 (46134), 7.1.3.18 p. 1219 (46757), 7.2.1.19 p. 1236 (47387), 7.2.2.10/12/13 p. 1240 (47511–47519), 7.2.2.15 pp. 1240–1241 (47532); GR-I 1.3.4 and 1.3.5 pp. 146–147 (7446, 7452), 2.2.2 p. 153 (7740), §1.2 pp. 145–146 (7379); BZFN 3.20 p. 23 (1149), 3.21 p. 24 (1189), 3.23 p. 24 (1209), 3.24 p. 25 (1216); HNR 1.1 p. 1 (45); HR-perf introduction p. 1 (line 29, "not tame, then the structure sheaf is perfect but not compact"); Stacks 06Z0 (145), 08DZ (311), 08EU (2312), 08IB (2351), 08E8 (1059), 0BQR (1897); HTT 2.1.1.3 p. 75 (3037), 6.1.2.7 p. 559 (25224), 6.5.2.9 p. 687 (31182), 5.5.4.20 p. 502 (22747). No locator flagged unverified in `plan.json`. The manifest records every cited work (8 entries); the `Stacks` entry's cached file is the chapter *Derived Categories of Schemes*, and the chapter *Sheaves on Algebraic Stacks* was fetched through the sources service for 06WG/06WT (the entry was kept unchanged, as its `version_note` already says).

**Adversarial pass** (sampled targets, headline statements and the targets of the findings; values computed by hand):

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions, indexing witness | `𝔽_p ⊗ᴸ_ℤ 𝔽_p` | `Tor₀ = Tor₁ = 𝔽_p`, `Tor_{≥2} = 0`; cohomology in Mathlib degrees 0, −1 | sound |
| Conventions, flatness | `ℤ→ℤ[x]`, `ℤ→ℚ`, `ℤ→𝔽_p`, `𝔽_p → 𝔽_p⊗ᴸ_ℤ𝔽_p` | free; flat with `ℚ⊗ℤ/p = 0`; `Tor₁(𝔽_p,𝔽_p)≠0`; `π₁(source)=0 ≠ π₁(target)=𝔽_p` | sound |
| Conventions, covers | empty family; `{ℤ[1/2], ℤ[1/3]}` | `A → 0` faithfully flat iff `A = 0`; `Spec` covered since `(2,3)=ℤ` | sound |
| Conventions, Beck–Chevalley witness | `Spec 𝔽_p → Spec ℤ ← Spec 𝔽_p`, `F = 𝔽_p` | classical fibre product `Spec 𝔽_p`; `g^*f_*F = 𝔽_p⊗ᴸ𝔽_p` (`π₁=𝔽_p`), `f'_*g'^*F = 𝔽_p` | not an equivalence, as claimed |
| 1.1 θ not an equivalence | free objects on one generator over ℤ | `θ(ℤ[x])` discrete; `Sym²_{E∞}(ℤ) = ℤ_{hΣ₂}`, `H₁(BΣ₂;ℤ)=ℤ/2` | sound |
| 1.2 base change, products | pushout of `ℤ→𝔽_p` with itself; `A × B`; `0` | both sides `𝔽_p⊗ᴸ𝔽_p` with `π₁=𝔽_p`; ordinary `𝔽_p` fails; `Mod_0 = 0` | sound |
| 1.2 projection formula | `R→R[t]`, `M=R[1]`, `N=R[t]` | LHS `f_*(R[t][1]) = R[t][1]`, RHS `R[1]⊗_R R[t] = R[t][1]` | sound |
| 1.3 faithful flatness, t-exactness | `ℤ→ℤ[1/p]×ℤ_p`; `ℤ→ℚ`; `ℤ→𝔽_p` on `𝔽_p` | all primes hit (`(p)` under `pℤ_p`); `ℚ⊗ℤ/p=0`; `𝔽_p⊗ᴸ𝔽_p` not discrete | sound |
| 1.4 perfect / almost perfect / locally free | `ℤ⊕ℤ[3]`, `⊕_ℕ ℤ`, `k` over `k[ε]`, `k` over `k[x₁,x₂,…]`, `ℤ/p` | dual `ℤ⊕ℤ[−3]`; identity of `⊕_ℕ ℤ` not through a finite subsum; `Tor_i^{k[ε]}(k,k)=k` all i; maximal ideal not finitely generated; dual `ℤ/p[−1]` not connective | sound |
| 1.5 limits | empty diagram; `D(ℤ)²` with `(ℤ,ℚ)`, `(ℤ,ℤ[1])`; ordinary `𝔽_p⊗_ℤ𝔽_p` square | terminal = zero category; ℚ not perfect, `ℤ[1]` invertible; square not right adjointable (1.2 witness) | sound |
| 2.1 points, `Spec 0` | `Spec 0`, `∅`; `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p` | `Spec 0(A) = pt` iff `A = 0`; sheafification identifies both with the initial sheaf; classical `Spec 𝔽_p` vs animated `Spec(𝔽_p⊗ᴸ𝔽_p)` | sound |
| 2.2 `QCoh(∅)`, constant prestack | `∅`; `BΓ × Spec 𝔽₂`, `Γ = ℤ/2` | limit over empty = `Δ⁰` = zero category; `QCoh = Fun(BΓ, Mod_k)`, `π₀Map(O,O[1]) = H¹(ℤ/2;𝔽₂) = 𝔽₂`, pulled back to `Spec k`: `Ext¹_k(k,k)=0` | sound; joint conservativity needs all points |
| 2.3 tensor, Ext | `ℤ/p ⊗ ℤ/p` on `Spec ℤ`; `Hom(ℤ/p, ℤ/p[1])` | `π₀=π₁=ℤ/p`; `Ext¹_ℤ(ℤ/p,ℤ/p) = ℤ/p` | sound |
| 2.4 restriction vs `u_!` | `Y = Spec(𝔽_p⊗ᴸ𝔽_p)` | `ι^*Y(R) = Map(π₀(𝔽_p⊗ᴸ𝔽_p), R) = Map(𝔽_p, R)` since `π₀ ⊣ ι`; `QCoh(Y)` has unit with `π₁ = 𝔽_p` | sound |
| 2.5 classical prestacks | `(Bℤ/2)^♮(ℝ)`, `(ℝ×ℝ)`; strictly henselian R | `H¹(ℝ,ℤ/2) = ℝ^×/ℝ^{×2} = ℤ/2` (trivial, `Spec ℂ`), `π₁ = ℤ/2`; `(ℤ/2)²`; torsors trivial, `π₁ = G(R) ≠ 0` | sound |
| 3.1 covers | `ℤ→𝔽_p`, `ℤ→ℚ`, `ℝ→ℂ` | not flat; not faithfully flat; finite étale | sound; Mathlib `fpqcPrecoverage` = `propQCPrecoverage @Flat` (Fpqc.lean:61), finite flat jointly surjective families on affines |
| 3.2 hyperdescent | `A→A`; Zariski `A→A_f×A_g`; `ℤ→ℤ[1/p]×ℤ_p`; `ℤ→𝔽_p`; `𝔽_p→𝔽_p[ε]` | constant nerve; fibre product of module categories; `ℤ_p⊗ℤ_p` rationally `ℚ_p⊗_ℚℚ_p` (uncountable), fracture sequence `0→ℤ→ℤ[1/p]⊕ℤ_p→ℚ_p→0` exact so descendable; ℚ killed; free of rank 2 | sound |
| 3.3 invariance | `∅→Spec 0`, `Spec A⊔Spec B→Spec(A×B)`; `Spec 𝔽_p→Spec ℤ` | both fpqc-local equivalences, `QCoh` 0 and `Mod_A×Mod_B`; not a surjection, totalization kills ℚ | sound |
| 3.4 Zariski gluing | `ℙ¹_k`, `O(−2)[1]`; `⨿_ℕ Spec ℤ`; `∅` | cokernel of `(a,b) ↦ a − t⁻²b` on `k[t]⊕k[t⁻¹] → k[t,t⁻¹]`: image spans `t^n (n≥0)` and `t^{−2−m}`, cokernel `k·t⁻¹`, equals `H¹(ℙ¹,O(−2)) = k`; `∏_ℕ D(ℤ)` presentable; zero category | sound |
| 4.1 affine maps | `id`; `h_{𝔸²∖0}→h_{𝔸²}`; `Spec k → BG`, `BG → Spec k` | affine; base change along `id` is `𝔸²∖0`, not affine; fibre `G` affine; for `G = 1` the second map is the identity, affine | Check 3 false at `G = 1` (R02) |
| 4.2 pushforward | `id`; `R→R[t]`; `Spec 𝔽_p→Spec ℤ` classical; `M=R[1], N=B` | identities; `R[t]` free of infinite rank, base change `R'[t]`; pointwise formula would give `𝔽_p`, true value `𝔽_p⊗ᴸ𝔽_p`; `B[1]` both sides | sound; the flat hypothesis in the classical clause is necessary (the non-flat witness) |
| 5.1 affine comparison | `ℤ→𝔽_p` on `ℤ/p`; `(ℤ/2)~⊗ᴸ(ℤ/2)~` | cohomology `𝔽_p` in degrees 0, −1; `(ℤ/2)~` in degrees 0, −1 | sound |
| 5.2 Zariski descent of `Dqc` | `ℙ¹_k`; `⨿_ℕ ℙ¹_k`; DVR with `j_!O_U` | class `t⁻¹` recovered; `∏_ℕ Dqc(ℙ¹)`; `j_!O_U[0] ∉ Dqc` (SchemeAndStackFoundations §2.18 Check `test_DQCoh_extension_by_zero_not_qc`, its line 4005) | sound |
| 5.3 / 5.4 schemes | `ℙ¹_k → Spec k` on `O(−2)`; `ℙ¹_ℤ`, `g: Spec ℚ → Spec ℤ` | `f_*O(−2) = k[−1]`; `ℤ[−1]⊗ℚ = ℚ[−1]` | sound |
| 6.1 pointwise properties | `⊕_ℕ O`, `ℤ[x]` on `Spec ℤ`; n-truncatedness | flat, not perfect; `𝔽_p` 0-truncated over ℤ, base change has `π₁ ≠ 0` so not a pointwise property | sound |
| 6.2 t-structure | `Spec(𝔽_p⊗ᴸ𝔽_p)`; `BG_m`; `Bℤ/2 × Spec 𝔽₂` | heart `ModuleCat 𝔽_p` (`π₀`); comodules over `ℤ[t,t⁻¹]` = graded abelian groups; heart `k[Γ]`-mod with `Ext¹(k,k) = H¹ = 𝔽₂`; coconnectivity not pointwise (SAG 6.2.5.9 witness) | sound; for geometric X the limit of t-structures along t-exact flat transitions is levelwise, so `≤0` is detected by the faithfully flat atlas |
| 6.3 / 6.4 | `ℤ⊕ℤ[3]`, ℚ, `O[1]`, `O⊕O`, `ℤ/p`; `⊕_ℕ O`; `ℤ/p` over ℤ | as in 1.4; `O[1]` invertible, `O⊕O` rank 2 not invertible; `π₀(⊕_ℕ ℤ)` not finitely generated; `ℤ/p ∈ D⁻_coh` | sound |
| 7.1 quotients | `G = 1`; `G` on itself; discrete Γ | constant bar construction, `[X/1]=X`; realization final (`X ×_{|…|} X = G × X` effectivity); constant `BΓ` | sound; "G affine, X affine ⇒ affine diagonal": `G × X → X × X` is a map of affines |
| 7.2 / 7.3 | `[G/G]`; `Bℤ/2` over `𝔽₂`; `BG_m`; `Γ = ℤ` on `Spec C`; `d = 0` | `QCoh(∗) = D(ℤ)`; `H¹ = 𝔽₂` vs invariants `H⁰`; `ℤ[t,t⁻¹]`-comodules; `Fun(Bℤ, D(C))`, `H¹(ℤ;C) = C`, coarse quotient 0; `D(C)` | sound; `homotopyFixedPoints` is for finite groups at EnhancedDerivedSheaves line 1720, matching 7.3's clause |
| 7.4 classical quotient stacks | `G = 1`; `G_m` on `Spec ℤ`; `ℤ/p` over `𝔽_p`; `G_a` over `𝔽_p` | 5.3; graded abelian groups; `Ext^i_{heart}(k,k) = H^i(ℤ/p;𝔽_p) = 𝔽_p` all `i ≥ 0`; `D(QCoh(BG_a)^♥)` not left complete (SAG 10.4.6.9) | sound; affine diagonal for `X` affine: `G×X → X×X` is a map of affines |
| 8.1 compact generation | `Spec A`; `ℙ¹_k`; `⨿_ℕ Spec ℤ` | `O`; `O⊕O(−1)`; in `∏_ℕ D(ℤ)`, `⊕_i O_i = O`, `Hom(O, ⊕_i O_i) = ∏_ℕ ℤ ≠ ⊕_ℕ ℤ` | sound; quasi-compactness necessary |
| 8.2 perfect stacks | `Spec A`; `BG_m`; `⨿_ℕ Spec ℤ` | `Mod_A = Ind(Perf)`; graded objects, compact = dualizable = finitely many weights each perfect; compactly generated with `O` dualizable not compact | sound |
| 8.3 permanence | `id`, `Spec B → Spec A`; `B(G_m²)`; `Spec 𝔽_p → Spec ℤ`; `Y = Spec k[ε]`, `X₁ = X₂ = Y` classical | affine; characters of `G_m²`; non-flat classical base change fails 4.2; `X₁×_Y X₂ → X₁×X₂` is `Δ_Y`, affine, `Tor₁^{A⊗A}(A,A) = Ω¹_{A/k} ≠ 0`, not flat, so (a)-classical does not apply | R01 |
| 8.4 characteristic zero | `Bℤ/p` over ℚ; `BG_a` over ℚ; `Bℤ/p` over `𝔽_p` | Maschke: invariants exact, `O` compact; `G_a ⊂ GL₂`, `GL₂/G_a` quasi-projective; not perfect (8.5) | sound |
| 8.5 non-compact unit | Γ trivial; `ℤ/p` over `𝔽_p`; `ℤ/p` over ℚ | `H^i = 0` for `i>0`; `H^i(ℤ/p;𝔽_p) = 𝔽_p` all i, `⊕_i k[i] = ∏_i k[i]` in `D(k)`, `π₀Map(O,⊕O[i]) = ∏_i 𝔽_p ⊋ ⊕_i 𝔽_p`; `H^{>0} = 0` | sound; for general Γ with `p ∣ |Γ|`, restriction to a Sylow p-subgroup is injective, so infinitely many `H^i ≠ 0` |

**Duplication audit, by object.** Mathlib and Tau Ceti at the pins have no ∞-categorical prestacks, animated rings or `QCoh` of a prestack (Tau Ceti's `Prestack` in `AlgebraicGeometry/Stack/Basic.lean` names Mathlib's `Pseudofunctor.IsPrestack`); the 1-categorical notions used are cited, not restated (`Module.Flat` Flat/Basic.lean:114, `Module.FaithfullyFlat` FaithfullyFlat/Basic.lean:64, `fpqcPrecoverage` Fpqc.lean:61, `DerivedCategory` Basic.lean:87, `TStructure.t` TStructure.lean:33, `Pseudofunctor.IsStack` IsStack.lean:49, `DescentData` DescentData.lean:59, `CoGrothendieck` Grothendieck.lean:235, `groupCohomology` GroupCohomology/Basic.lean:183, `SSet.Quasicategory` Basic.lean:41, `SSet.KanComplex` KanComplex.lean:40, `nerve` Nerve.lean:37 with its quasicategory instance at Quasicategory/Nerve.lean:32, `Spec` and `Scheme.Spec` Scheme.lean:466 and 494: all opened at the pin, which matches `lake-manifest.json`, Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). The claim "Mathlib has no Kan-complex instance for the nerve of a groupoid" is true at the pin (no `KanComplex` declaration mentioning `nerve` or a groupoid). Against open roadmaps: the local constructions named in the target brief exist at their heads (PrismaticCohomologyPartII #1065 §4.0, its line 722, `QCohPrestack(X) = lim D(R)` with `flatDescent`, `cechDescent`, `affinePushforward`; LanglandsParameterStacks #1202 §1.7, line 378, flat descent for animated modules; HabiroCohomologyFoundations #1428 §1.27, line 807, the prestack right Kan extension and the lattice quotient; AnalyticStacks #1687 §§1.1–1.2, lines 393, 414). These are the special cases the target brief moves here; the design claims ownership in Scope and records the hand-off under Downstream consumers, and the consumers' repointing is their own revision, so this is not raised as a second-owner finding; R05 asks the Scope paragraph to name them without process vocabulary. The intake should note that these consumers sit at merge-order lines 32 (AlgebraicModuliForArithmeticGeometry), 56, 61, 195 and 316 while this roadmap's suppliers are all on main, so inserting it before line 32 keeps their citations downward. `scratch/overlaps.md` lists no dropped ids, no id defined only by an open revision and no other pull request changing this roadmap; the three EnhancedDerivedSheaves pull requests (#1187, #1330, #1630) revise an existing roadmap and are correctly cited as main.

**Supplier order.** Every `*Needs:*` line and Dependencies line names Layers at or below the target, a supplier on main, HigherToposTheory sections (R04 for one), Mathlib names, or the declared gap; no citation of a later roadmap, no cycle (gate above). The five names the resolve tool flagged in SchemeAndStackFoundations (`Action.constantEquiv` line 2425, `StackInGroupoids.ofSheaf` 2750, `QCoh.presentationEquiv` 2994, `DQCoh.restrict` and `DQCoh.tStructure` 3977) exist there as italicised API items; `enhancedDerived.homotopyCategory` (EnhancedDerivedSheaves line 555) and `DerivedDeRham.derivedTensor` (DerivedModuleAlgebra line 633), `DerivedDeRham.IsPerfect` (2051), `IsPseudoCoherent` (2064), `HasTorAmplitude` (2066) exist; `Coherent.DQCoh` and `PseudoCoherence.IsPseudoCoherentComplex` are at SchemeAndStackFoundations lines 4030 and 3961. The five downstream consumer sections exist at their heads (above; AlgebraicModuliForArithmeticGeometry #853 §7.7 at its line 9748 defines `spaceDQCoh` at 9759).

**Shape and completeness.** Summary, Scope and ownership, Conventions (with computed witnesses), Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. 33 targets with locators, 114 Checks (every definition has at least three: 1.1, 1.2, 1.4, 2.1, 2.2, 2.5, 3.1, 4.1, 6.1, 7.1, 8.2), every theorem with its hypotheses in the sentence; `plan.json` agrees with the README (layers, ids, prerequisites, gap). No LaTeX delimiters, no `lemma`, no target-numbering tables; the only process residue is R05.

## Not verifiable

- Elaboration and the one-tactic probe: not available in this lane, and the design stage has no `Suggested.lean`; the headline list (3.2, 3.3, 4.2, 5.3, 6.2, 6.3, 7.2–7.4, 8.1–8.5) is checked for statability at the package stage.
- Stacks tag 06WG/06WT numbering (Definition 96.11.1, Proposition 96.14.3): the fetched chapter text carries section-local numbers (Definition 11.1, Proposition 14.3) and tags; the chapter number 96 is the online numbering as of the fetch and was not independently confirmed.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0ed8a23ca60e6aa025163e63dbc0765b191ca1c8", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks", "model": "fable", "worker": "chris-x10"} -->
