# Review of UniformWildKernelBounds (pull request #2892 at 4706cbc)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** needs changes

**Summary.** One finding carried over from the previous review still blocks. The statements that rest only on [FormalProof] (3.15(c), 3.20(d), (e), 4.5 (model), and (i), (ii) of 4.3 for `𝒟_G`) still have no locator into it, and every headline route goes through them. The other previous points are repaired, except one format note. The new 3.20(f) and the new trace argument in 3.16(b) hold up when computed. The route of 3.20(f), however, cites a Jacquet–Shalika bound that is stated only for unramified components, and the component above `ℓ` can be ramified. There are two small corrections and three format notes, none blocking. The scope and licence questions about [FormalProof] are still for the human reviewers to decide.

## R01 (P2) — The statements resting only on [FormalProof] still have no locator into it, so they are unsupported as written

All three headline theorems route their plus part in Cases I, II, III and V large through statements that the README gives without a route, as theorems of [FormalProof]:

- (K1′) and (K2′) of 3.15(c) (line 945);
- the seeds of 3.20(d) (line 1508);
- the maps and the clauses (P1₄), (pur) and (aut) of 3.20(e) (line 1520);
- 4.5 (model) (line 2339);
- (i) and (ii) of 4.3 for `𝒟_G` (line 2345).

The citation is their only support, and it still names nothing narrower than the whole development. The References entry (line 3182) is a repository URL. The pull-request description now says that the README cites [FormalProof] "as a whole, without naming its declarations". So a referee or an implementer cannot check that the development proves these statements with the hypotheses written here, for instance the host data of 4.5, or the level and the Taylor–Wiles set of (K1′). The copy the operator holds is a kernel export of the development: an audit file, checksums and compressed constant tables. It has no prose and no theorem numbers.

The repair is the one the previous review proposed. After each statement listed above, add one line that:

- names the declaration or declarations of [FormalProof] that state it, by fully qualified name and module;
- gives the version they are read from (a commit, or the SHA-256 of the archive);
- says in one clause where the Lean hypotheses differ from the README's.

The same line at 7.6, the form the family consumes, would let the consumers check their input too.

## C01 — The route of 3.20(f) rules out ratios of finite order with the Jacquet–Shalika bound of AL.3.3.8, which covers only unramified components, while the component above `ℓ` can be ramified

When `π_v` is ramified, an implementer following the route (line 1661) has no supplier for this step.

AL.3.3.8 of AutomorphicLFunctionsAndLocalFactors on main (its README, line 1411) is about an irreducible unitary generic unramified representation. It gives the bound only at the unramified places, and the contract here (line 3090) says the same. But the hypotheses of 3.20(f) fix the flag characters only through their cyclotomic exponents, that is, up to a character of finite order on inertia (Conventions, line 107). The use in (seed) of (e) also twists by `κ`, which is only locally algebraic above `ℓ` (line 1523).

For instance, take a flag character equal to `χ_ℓ^6·ω` on inertia, at a place where `ω` is ramified; the definition of a tower field allows this (line 2136). Then the Weil–Deligne representation contains a ramified character, so `π_v` is a ramified principal series and has no Satake parameters.

The statement itself is not in doubt. The smallest repair would be to cite, with its locator, a form of the bound that covers ramified generic unitary components. If a purity input is acceptable despite the remark at line 3010, an alternative is the target "Temperedness of regular unitary-type cuspidal forms" in Layer AG2.5 of AutomorphicGaloisRepresentationsPartII (main, its README line 1797), whose hypotheses are those of 3.20(f). The same sentence in the route of 4.4 (free ratios at characteristic zero, line 2275) would take the same citation.

## C02 — The lists of where AG2.6 and §2.43 are used still stop at 4.2(d), 4.4 and 4.8, but 3.20(f) now uses both

The route of 3.20(f) (lines 1661–1662) uses AutomorphicGaloisRepresentationsPartII AG2.6 together with ModularityAndLanglandsExtensions §2.43. Four lists of where these are used do not name it:

- the Scope paragraph ("in 4.2(d), 4.4 and 4.8", lines 3015–3016);
- the contract with ModularityAndLanglandsExtensions (line 3082);
- the contract with AutomorphicGaloisRepresentationsPartII ("in 4.8(0) and 4.4", line 3086);
- the reference for Theorem 5.5.2 (line 3235).

A reader looking for the consumers of the comparison at `ℓ` therefore misses Layer 3. Adding 3.20(f) to each list would fix it.

## N01 — Layer 3 numbering still jumps from 3.6 (line 647) to 3.11 (line 698).

## N02 — The *Needs:* line of 3.20 now ends the route of (f) (line 1666), so it reads as what (f) needs, although (f) uses only AG2.6, §2.43, AL.3.3.8 and the definition of a tower field. A paragraph break before it, or a short *Needs:* line of its own for (f), would separate the two.

## N03 — The Dependencies of Layer 3 (line 1847) name the settings of 4.4 and 4.5 as the only later material it uses, but the route of 3.20(a) (line 1558) also takes the exponent `a` from 5.6. Defining `a` in place, or adding 5.6 to that sentence, would make it exact.

## Questions for the author

- Which artefact and version of [FormalProof] are Layers 1–7 read from: the repository in the References, or the archive named in the announcement's footnote? The repair of R01 needs one of them, with a commit or a checksum. What stopped me: the sources service refuses the repository's host, and the operator's copy has no theorem numbers.
- Does [FormalProof] state the window bound in the budget form 7.6, with the hypotheses written there (`0 < ε ≤ 2`, `v₂(q + 1) ≤ a`, `q > 2X^κ + 1 + P(χ)`)? I could not find it by name in the export.

## Previous findings

- R01 — not repaired: "(K1′) and (K2′) are theorems of [FormalProof] whose route is not given here" (line 945). The References (line 3182) still give only a repository URL.
- C01 — repaired: the description's opening paragraph now continues "a sum over all primes `ℓ`, including `2`, over the dyadic host fields … uniformly in the layer `n`, the prime and the twist", and the out-of-date sentence on validation is gone.
- C02 — repaired: "7.1 for the plus part and (a) for the minus part" (line 2875).
- C03 — repaired: "the published K-theoretic bound, compared with BernoulliBoundsForClassGroupEigenspaces Layer 9" (line 3186).
- C04 — repaired: "`length Ш¹ ≤ length H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))` under the same hypothesis (in general up to `r₁(F)`)" (line 3030).
- C05 — repaired: "there is a nonzero common eigenvector over a discrete valuation ring of a finite extension of the fraction field, dominating the given one, whose eigenvalues reduce to the residual ones" (line 3142).
- C06 — repaired: the statement is now 3.20(f) (line 1535), and (seed) uses "(f) for `ρ`" (line 1656). Layer 3's Dependencies list only the settings of 4.4 and 4.5 (line 1847). The move brings in C01, C02 and N02.
- N01 — not repaired: "### 3.6 Framed graded presentations of deformation rings" is still followed by "### 3.11 Ordinary deformation spaces…" (lines 647, 698).
- N02 — repaired: "### From TauCetiRoadmap.PadicFamilies", with the sections in the body (lines 3124–3126).
- N03 — repaired: "… `ψ(−1) = (−1)^e`. *Needs:* FrobeniusRestrictedRieszSums §0.4." (line 148), and the same at every other place the previous review listed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.16(b), new trace argument | `n = 2`, `w = (1, −1)`; `n = 3`, `w = (1, 0, −1)` | `χ̄_i(s)/χ̄_j(s) = Ψ̄(s)^{±2}`, resp. `Ψ̄(s)^{±1}, Ψ̄(s)^{±2}`, all `≠ 1` under (F2); Vandermonde det `≠ 0` forces `χ̄_i(g) = 0` | holds |
| 3.16(b), negative control | `n = 2`, `Ψ̄(s) = −1` | `χ̄₁(s) = χ̄₂(s)`, Vandermonde det `0`: the square in (F2) is needed | holds as stated |
| 3.16(b), trace | `g` an `n`-cycle on the lines, `s` fixing each | `tr ρ_p(gsᵏ) = 0`; mod `T`: `Σ χ̄_i(g)χ̄_i(s)ᵏ`; `U` open in `G′`, normal in `G₀` (Clifford), so `G_v` acts | holds |
| 3.20(f), unramified `π_v` | exponents `(6, 4, 2, 0)` at `v` | finite-order ratio ⇒ `|α₁/α₂| = q_v^{−2}`; AL.3.3.8 gives `(q_v^{−1}, q_v)` | excluded, holds |
| 3.20(f), ramified `π_v` | flag character `χ_ℓ^6·ω` on `I_v`, `ω` ramified at `v` (line 2136) | WD contains a ramified character; AL.3.3.8 states unramified only (AL README 1411) | supplier scope (C01) |
| 3.20(f) at its use in (seed) | seed gaps `h_i − h_{i+1} ≥ 4`; twist `κβ^n` | exponents `h_i/2 + c_v`, gaps `≥ 2`; residual `(θ̄, Ψ̄, ᾱ, 1)κ̄`: ratios unchanged, tower conditions kept | holds |
| 3.20(f) against its consumer | HeckeIdealsAndTaylorWilesRelations §9.9(d), (i)–(iii), open head | (f) gives (i) and (iii); (ii) from the seed; §9.9 allows `ε^{m}` up to finite order, so the ramified case occurs | matches |
| 4.4 (irreducibility), trimmed (sampled) | consumers 4.6 (line 2415), 4.7 (line 2447), 5.7 (line 2686) | each uses point-level clauses or free ratios at characteristic zero, none the moved sentence | holds |
| §6.17 contract (C04 repair) | `ℓ = 2`, real place, `e` odd and even | `H¹(ℝ, ℚ₂/ℤ₂(−e)) = M/2M = 0` (`e` odd), `M[2] = ℤ/2` (`e` even); supplier (b), (c): `Ш¹ = Ш¹_str ≤ H²` under the hypothesis | matches |
| §5.10 contract (C05 repair) | `T = [[0, ϖ], [0, 0]]` on `O²` (§5.11, main) | `e₂` residual eigenvector (eigenvalue 0) has no lift; eigenvalue 0 lifts on `e₁`; DeligneSerre1974 line 582 | matches |
| 7.3(b) (C02 repair) | `ℓ ∉ B(χ)` | `ℓ ∤ [E : ℚ]` (0.3(b)); (a) bounds `Ш⁻` over all odd `ℓ` | holds |
| 3.15(c), 3.20(d), (e), 4.5 (model), 4.3(i), (ii) for `𝒟_G` | locator into [FormalProof] | lines 945, 1508, 1520, 2339, 2345: "theorem of [FormalProof]", no declaration; line 3182 a URL | unsupported (R01) |
| Layer 3 Dependencies | route of 3.20(a), line 1558 | uses `a = c₂(ψ) + 1 + v₂(o_χ)` "(5.6)" | pointer (N03) |

The rows of the previous review for the untouched statements stand as in that review, of `b4b63e8`, including the sampled 1.1, 2.1, 2.3, 2.4, 3.3, 3.6, 3.11, 3.13, 3.19, 3.23, 4.3, 5.3, 6.3 and 7.5, whose text changed by at most one space.

- Source locators checked against the text: Deligne–Serre 1974, Lemme 6.11 and its closing remark (DeligneSerre1974 lines 574–583), for the reworded §5.10 contract.
- Roadmap targets opened: AutomorphicLFunctionsAndLocalFactors AL.3.3.8 (main, README line 1411); AutomorphicGaloisRepresentationsPartII, AG2.6 (table, line 30) and the AG2.5 temperedness target (main, line 1797); AlgebraicModularFormsAndSerreWeights §§5.10, 5.11 (main, line 1249); BernoulliBoundsForClassGroupEigenspaces §6.17(b), (c) and its Layer 9 at the open head; ModularityAndLanglandsExtensions §2.43 at its open head (line 1111); HeckeIdealsAndTaylorWilesRelations §9.9(d) at its open head. No library declaration is involved: `Suggested.lean` did not change and declares nothing.
- Cross-roadmap citations in the changed text resolved: 7 (AG2.6, §2.43, AL.3.3.8, BernoulliBoundsForClassGroupEigenspaces §6.17 and Layer 9, AlgebraicModularFormsAndSerreWeights §5.10, PadicFamilies §§1.7–4.1). None dangles. The change removes the upward pointer "the trace argument of 4.1" from 3.16(b).
- Automatic checks: the worker's run passed all of them; my own run passed every check except two I set aside (below). Dependency check: `depcheck: 171 roadmaps, 2016 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file is unchanged and declares nothing, so there is no `#check @` comparison to make.
- Overlap check: the previous review read HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, PotentialAutomorphyInfrastructurePartII, CongruenceModulesOfThetaLifts and ModularityAndLanglandsExtensionsPartII (open), and ClassicalSerreModularity, AutomorphicGaloisRepresentationsPartII and GlobalGaloisDeformations (main); nothing is shared. The one object the change adds is the free-ratio and regular-element statement 3.20(f). A search of every roadmap finds it only as hypotheses (i)–(iii) of HeckeIdealsAndTaylorWilesRelations §9.9(d), so this roadmap owns it.
- Source independence: changed passages only. Two passages were compared with one source: the §5.10 contract and its remark that eigenvectors need not lift, against DeligneSerre1974 lines 574–583. The source is in French, the roadmap in English, and they share no wording. The other changed passages (3.16(b), 3.20(f) and its route, the §6.17 contract) rest on roadmaps or on [FormalProof], whose copy is a kernel export with no prose. No layer was added, removed or reordered, so the arrangement stands as compared in the previous review: independent of [FormalProof]'s module tree.
- Research link: the headline bounds are an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}`, refining the torsion bounds of Soulé (1979, 2003). The routes use Ferrero–Washington (1979) and residually reducible automorphy lifting (Skinner–Wiles 1999; Thorne 2015; Allen–Newton–Thorne 2020). This line rests on the README's Summary and References.

## Not verifiable

- [FormalProof], for the statements of R01 and for 3.16(b) and 3.20(f) as statements of it: the README names no declaration, and the operator's copy is a kernel export with no prose or theorem numbers. The changed statements were checked instead against their routes, their suppliers and computed instances (table above).

Automatic checks set aside as false positives: my own run of the checks flagged two things that are not defects. It reported this roadmap as missing from the merge order, but it is a new roadmap, placed after its last supplier. It reported the three files of the family index as changes outside the folder, but they belong to this pull request. Separately, the extraction of elaborated signatures took a word of the module docstring for a declaration name and failed, although the file declares nothing.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed AI-assisted Lean development announced on 20 November 2026. The four-page announcement has no mathematical statement of these bounds, and no refereed source states the headline bounds (README References, lines 3182–3183).
- Licence: no licence for [FormalProof] could be read. The sources service refused the cited repository's host, and the operator's copy is a kernel export with no licence file. The announcement points to an archive on the author's page, not to the cited repository.
- Not tested: [FormalProof] holds the largest share of locators. Its prose and table of contents could not be compared with the README beyond its module tree.
