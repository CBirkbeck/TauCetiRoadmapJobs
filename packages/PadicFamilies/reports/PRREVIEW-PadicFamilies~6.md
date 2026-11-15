# Review of PadicFamilies (pull request #1019 at d797632)

**Verdict:** accepted

Incremental re-review of the 92 changed lines since `dd500bf` (38 insertions, 54 deletions, all in `TauCetiRoadmap/PadicFamilies/README.md`), and a first check of the pull request's title and description against this head. No findings.

## Previous findings

- none: the previous report (`PRREVIEW-PadicFamilies~5`, at `dd500bf`) was accepted with no findings.

## Verified sound

### What changed, and what was checked in it

- Two proof passages were reworded (§0a.18 at README:485, §1.5 at README:1128). No statement, hypothesis, locator or dependency line changed.
- Layers 2 and 3 were regrouped. Seven `###` headings were retitled and given a one-paragraph introduction (§§2.1, 2.4, 3.0, 3.4, 3.7, 3.9, 3.13). Fifteen targets (§§2.2, 2.3, 2.5–2.7, 3.1–3.3, 3.4a, 3.5, 3.8, 3.10–3.12, 3.14) lost their `###` heading and now open with a bold run-in title under the preceding heading; each keeps its number, statement, Checks, locator and "This uses" line. No layer was added, removed or reordered.
- Section numbers are unchanged, so every in-README citation of these sections still resolves, and so do the citations from other roadmaps: `CompletedCohomologyAndLocalGlobalCompatibility` README:1235, :1246, :1253, :1268, :1420 and :2216 cite "PadicFamilies §§2.4–2.10" by number. The README has no heading-anchor link other than its reference keys, and `grep` finds none of the seven former titles left in the text.
- Each new introduction names the sections that consume its group. I compared every such list with the "This uses" lines and in-body citations:

| Introduction | Consumers it names | Consumers found (dependency line or body) | Result |
|---|---|---|---|
| §2.1 (README:1730) | 2.4, 2.5, 2.7, 2.7a | 2.4 (§2.3, :1843), 2.5 (§2.3, :1855), 2.7 (§2.3, :1905), 2.7a (§§2.1–2.7, :1917) | agree |
| §2.4 (README:1815) | 2.7a–2.10, 3.1, 3.5, 3.7, 3.8, 3.13, 4.9 | 2.7a :1917, 2.8 :1939, 2.9 :1955, 2.10 :1983, 3.1 :2044, 3.5 :2157, 3.7 :2205, 3.8 :2219, 3.13 :2310, 4.9 :2619 | agree; no other section cites §§2.4–2.7 |
| §3.0 (README:2001) | 3.4, 3.5, 3.9 | 3.4 (§3.1, :2121), 3.5 (§3.2, :2157), 3.9 (§3.1, :2237) | agree |
| §3.4 (README:2096) | 3.7–3.10, 3.13, 3.14 | 3.7 (§3.5, :2205), 3.14 (§3.5, :2332); 3.7–3.10, 3.13, 3.14 each invoke "the decency identification of §3.4" in their opening paragraph | agree |
| §3.7 (README:2185) | 3.9, 3.13, 3.14; cited by 2.7, 2.9 | 3.9 (§3.8, :2237), 3.13 (§3.7, :2310), 3.14 (§3.8, :2332); 2.7 at :1889 and 2.9 at :1951 cite §3.7's rank-one freeness | agree |
| §3.9 (README:2223) | 3.13, 3.14 | 3.13 (§3.10, :2310), 3.14 (§§3.10–3.11, :2314, :2322) | agree |

- Each introduction's summary of what its group proves was read against the statements: §3.7/§3.8 (rank one over the local Hecke algebra; `Symb±_Γ(D_k)(f_β)` free of rank one over `ℚ̄_p[t]/(t^e)`, README:2189, :2209), §3.9–§3.12 (README:2227, :2265, :2277), §3.13/§3.14 (README:2298, :2314). They agree.

### Seeded sample in the changed passages

| Target | Locator checked | Result |
|---|---|---|
| 3.13 Family and secondary critical `p`-adic L-functions at a decent point (heading and introduction changed) | Bellaïche09 §1.4.4, Theorem 3, p. 10 (bellaiche09 lines 375–382); §4.3, Proposition 4.11 (line 1537, p. 39), Lemmas 4.12–4.13 (lines 1577, 1597, p. 40), Proposition 4.14 (line 1618, p. 41) | present at the stated pages. Theorem 3 gives an affinoid `V`, a function for each sign, joint analyticity, the unit ambiguity in `y`, decency of refined newform points and `L(y,σ)=c·L(f′_{β′},σ)`, `c≠0`: the README statement. The new introduction's "secondary functions and their flag from its derivatives" is §1.4.5 (lines 383–400) and §4.4, Definition 4.16 (line 1645) |
| 1.6 Specialisation to one-variable `p`-adic L-functions (cites the reworded §1.5) | EPW §4.1, Proposition 4.1.4, p. 30 (epw line 1404); §1.5's Definition 4.1.2 and Proposition 4.1.3, p. 29 (epw lines 1382–1384) | present. The reworded sentence of §1.5 states the map `P¹(ℚ) → M_m` of epw lines 1372–1380: classes of `[∞,a]` in relative homology at each level, compatible in `r`, then ordinary part, localisation at `m`, limit |
| 0a.18 (reworded proof; not in the seed) | KT Proposition 2.15, statement pp. 12–13 (kt lines 548–584), proof pp. 13–14 (lines 585–626); Lemma 2.13 (line 498) | the reworded route is the source's: minimal replacement, `F_c` the ordinary summand for a representative `T_c`, `i_c p_c = t_c^{N_c!}` in `D(R_c)`, `a_{c+1}` an isomorphism, gluing by Lemma 2.13, uniqueness by its third part |

The other seeded targets (0.4, 0.13, 1.3, 1.7, 1.8a, 1.9, 2.7a, 4.0, 4.2, 5.2, 5.6, 5.10, 5.11) lie in passages this change does not touch; 2.7a's dependency `§§2.1–2.7` still resolves by number. The README flags no locator as unverified.

### Adversarial pass

The diff changes no statement; the rows are the statements the changed text argues for or cites.

| Statement | Instance | Left / constructed | Right / competing | Result |
|---|---|---|---|---|
| §0a.18, reworded proof: `g′_c g_c = 1`, `g_c g′_c` the ordinary idempotent | `R=ℤ_p`, `I_c=(p^c)`, `M_c=(ℤ/p^c)²` in degree 0, `T_c=diag(1,p)` | `F_c=ℤ/p^c·e₁`; `T_c^{N!}=diag(1,p^{N!})=diag(1,0)=i_c p_c` once `N!≥c`; `F_∞=ℤ_p`, `p_c i_c=1` | `T_c^{N}` for `N<c`: `diag(1,p^N)≠` idempotent | holds; the factorial exponent with `N_c` depending on `c` is needed |
| §0a.18, "because its source and its target are both minimal it is in fact an isomorphism" | `F=(R_c →id R_c)`, `G=0` | `F→G` is a quasi-isomorphism | not an isomorphism: `F≠0`; `F` is not minimal (`d⊗k=1≠0`) | minimality of both sides is used and stated |
| §0a.18, Mittag-Leffler for `H*(F_∞)=lim H*(F_c)` | `R_c=R/I_c`, `I_c` open, residue field finite | `R_c` is a finite ring, so finite `R_c`-modules are finite sets; images in a tower of finite sets stabilise | over an infinite residue field a tower of finite-length modules still stabilises; over non-open `I_c` it need not | holds under the section's standing hypotheses |
| §1.5, reworded sentence and additivity of `μ` | `p=3`, `a=1`, `r=1` | `U_3{∞,1/3}={∞,1/9}+{∞,4/9}+{∞,7/9}`, so `μ(1+3ℤ₃)=U_3^{−2}(…)=μ(1+9ℤ₃)+μ(4+9ℤ₃)+μ(7+9ℤ₃)` | without `U_p^{−r}`: `{∞,1/3} ≠ Σ_b{∞,(1+3b)/9}` (they differ by `U_3`) | additive; cosets `1,4,7 mod 9` partition `1+3ℤ₃` |
| §3.13, `(t⊗1−1⊗t)Ψ=0` for `Ψ=Σ t^iφ⊗t^{e−1−i}` | `e=2`: `Ψ=φ⊗t+tφ⊗1` | `tφ⊗t+t²φ⊗1−φ⊗t²−tφ⊗t=uφ⊗1−φ⊗u=0` since `u∈R` | arbitrary generator: `(t⊗1−1⊗t)(φ⊗1)=tφ⊗1−φ⊗t≠0` | holds; the diagonal sum, not `φ⊗1`, specialises to eigenvectors |
| §3.13, normal form `T≅R[t]/(t^e−u)` with `u(k)=0`, `t(x)=0` | `e=2`, fibre at `k` | `u(k)=0`: fibre `ℚ̄_p[t]/(t²)`, length 2, `sp_xΨ=tφ_k` a nonzero socle generator | `u(k)≠0`: fibre `ℚ̄_p[t]/(t²−u(k))` is étale with two points, contradicting ramification index `e` at `x` | the README's `u(k)=0`, `t(x)=0` is the right form (see *Source issues*) |
| §3.7 introduction, "free of rank one over `ℚ̄_p[t]/(t^e)`" against §3.8 and §3.14 | `e=1` versus `e=2` | `e=1`: one-dimensional eigenspace, only `L₀` | `e=2`: dimension 2, eigenline `t·φ_k` of dimension 1 (§3.9) | consistent with §3.8, §3.9 and the first Check of §3.14 |

The rows of the previous review for untouched statements stand as in the previous review, of `dd500bf`.

### Pull request text

Title and description read against the head; every sentence is supported.

| Sentence of the description | At this head | Result |
|---|---|---|
| projector "on finite, profinite and locally finite complete modules and complexes" | §§0a.2, 0a.11, 0a.22, 0a.16–0a.17, 0a.24–0a.25 | present |
| "over any complete noetherian local ring with finite residue field, including equal characteristic", "matches Mathlib's Fitting decomposition", "no averaging or division" | README:21, :229 (`LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`), :191 | present |
| "The eigenvariety machine takes any (Pr) module with commuting Hecke operators, so the quaternionic eigenvariety is a special case" | README:17 | present |
| "assumes p ≥ 5 and is extended to p = 3 for cusp forms" | README:21, :113, §0.17 (:1012) | present |
| "Bellaïche's theorem that the critical eigensymbol space is a line at decent refinements" | §3.9, README:2227 | present; unaffected by the retitling |
| the *Why* paragraph (family normalisations, annihilator congruence module, projector on complete coefficient complexes, finite-slope Hecke image, ordinary Hilbert tower, eigensymbol line and regulator comparison) | *Downstream consumers*, README:2979 | present |
| "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | the folder holds exactly these three files; the pull request adds the roadmap (3223 insertions, 0 deletions against the base) | agrees |
| "the targeted Lake build succeeds with `sorry` as the only warning … no `set_option` overrides; the dependency gate shows no upward edge" | gate and elaboration below | agrees |
| every roadmap the README names that is not on main | 18 of them, all in the description's *Depends on* list; the nineteenth, `AutomorphicGaloisRepresentations` (README:17), is named as an earlier instance, not consumed | agrees |

The regrouping since `dd500bf` removes no section number and no `Suggested.lean` declaration and adds or drops no supplier, so the description leaves nothing unstated.

### Counts

- Gate on this head (`gate … PadicFamilies --base origin/main`): every counter 0, `OK`; the worker's `gate.md` adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. `PadicFamilies` is at position 175 of the merge order, after all its suppliers.
- `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean`: three `declaration uses sorry` warnings (lines 57, 93, 119), no error. `Suggested.lean` and `metadata.toml` are unchanged since `dd500bf`, so the `#check @` signatures and the one-tactic probe of the previous review stand.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Source locators checked against the text: 9 (bellaiche09: Theorem 3, Proposition 4.11, Lemmas 4.12–4.13, Proposition 4.14; epw: Definition 4.1.2, Propositions 4.1.3 and 4.1.4; kt: Proposition 2.15 and Lemma 2.13).
- Cross-roadmap citations resolved: the six citations of `PadicFamilies §§2.4–2.10` from `CompletedCohomologyAndLocalGlobalCompatibility`; `citations.md` and `overlaps.md` list nothing unresolved, dropped or shared.
- Overlap check: read ModularSymbolsPadicLFunctions, AutomorphicGaloisRepresentations, ModularForms; nothing shared. The cuspidal local critical suite is owned by `ModularSymbolsPadicLFunctions` §3.0 and the new introduction of §3.13 says so; the quaternionic eigenvariety instance stays with `AutomorphicGaloisRepresentations` §0.3 (README:17); the change moves no ownership.
- Source independence: changed passages only; 3 passages compared with 3 sources (README:485 with kt lines 585–600, README:1128 with epw lines 1372–1380, README:2296 with bellaiche09 lines 375–400), none shared beyond formulas and four-word runs; largest share bellaiche09, 39 of 225 linked locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again. The seven new headings share no title with the sections of bellaiche09's table of contents (lines 13–32).

## Not verifiable

- The seeded targets outside the changed passages (0.4, 0.13, 1.3, 1.7, 1.8a, 1.9, 2.7a, 4.0, 4.2, 5.2, 5.6, 5.10, 5.11) were not re-read against their sources in this incremental round.
- The description's sentence on AI assistance describes how the text was produced; nothing in the folder can confirm or refute it.
- The *Not verifiable* items of the earlier reports stand (Dasgupta–Darmon–Pollack Definition 3.1 and Proposition 3.2; Bellaïche's 2011 author version; Diamond; Wiles 1995; the Hida primaries; Kisin Proposition 8.7; Coleman–Mazur).

## Source issues

- **Misprint** in bellaiche09 at Proposition 4.11, p. 39 (arXiv v1): the source says the element `u` is nonzero at `k` and `t` is nonzero at `x`, while also saying `k` is the only zero of `u`; it should be `u(k) = 0` and `t(x) = 0`, as §4.4 uses (`t` a uniformizer at `x`); affects nothing.

## For the human reviewers

- none
