# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #3027 at 7c341e7)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 27 changed lines since `74a09b7`. Accepted, with three small corrections and one format note, none blocking. The change is the new §10.26a (the Deligne–Henniart twist formula `ε(V⊗χ,ψ)=ε(χ,ψ)^{dim V}·det V(c_χ)`), its citation from §10.27, and the new supplier ClassicalArithmeticCompletion §7.12b. I recomputed the formula in rank one from the Gauss-sum definition and read Proposition 1.1, Theorem 4.6 and Lemma 4.7 of the source: the sign of `c_χ`, its valuation `a(χ)+n(ψ)`, its uniqueness modulo `1+𝔭^{⌊a(χ)/2⌋}`, the threshold and the three Checks all hold. The folder has not changed since the previous review, so its three small corrections stand: the unstated merge order with #3036, and two citations in untouched text. One licence question is left for the human reviewers.

## C01 — #3036 also rewrites the *Needs:* line of §10.27 (line 4075), and neither pull request says which merges first

Whichever of the two merges second meets a conflict on that line and could lose either #3036's section-level citations or this pull request's `§10.26a`. At #3036's head the line (its line 4058) replaces "AL.1 — Tate zeta distributions and Hecke `L`-functions" by "§§AL.1.3.1–AL.1.3.5 (local Tate `ε`-factors, Gauss sums and explicit local constants)" and further section-level items; this head inserts `§10.26a` into the same line. In §§10.26–10.27 that is the only line #3036 changes, and it leaves the Layer 10 dependency line as on `main`, so the conflict is confined to this one line. The description does not mention #3036. One sentence there would settle it: name the pull request that merges first, and say that the other rebases and keeps both changes.

## C02 — Untouched text: §10.1 (line 3482, *Needs:* line 3504) takes "the imported Deligne local constant" of a Weil–Deligne object from ArithmeticGaloisRepresentations §2.7, which constructs only the rank-one constant

§10.26a and the supplier contracts (line 5504) now say that the constant in every dimension is ClassicalArithmeticCompletion §7.12b's and only the rank-one one is §2.7's, which leaves §10.1 as the one place that sends the higher-rank constant to §2.7. On `main`, §2.7 defines the constant of a quasi-character by Gauss sums (ArithmeticGaloisRepresentations README lines 1688–1699) and says that the constants of non-abelian Weil representations are a downstream roadmap's (lines 1895–1897). A separate change would add ClassicalArithmeticCompletion §7.12b to the *Needs:* line of §10.1 for the Weil part, and either define the monodromy factor in §10.1 or name its supplier.

## C03 — Untouched text: §7.10a (line 2861) calls `TauCeti.EtaleDuality.CohCorr` supplied API (and line 2949 `CohCorr.comp`), but `CohCorr` occurs nowhere in the pinned Tau Ceti

A search of the pinned Tau Ceti sources for `CohCorr` and `rgammac` finds no file. A separate change would name the declaration that exists, or state the correspondence operator as a target in prose.

## N01 — In §10.26a (line 4037), "the constituents of `V−(dim V)·1`" has no constituents when `V` is a sum of trivial characters

Read as a virtual representation, `V−(dim V)·1` is then zero, so "the largest break" is a maximum over nothing; with `V=1` and `χ` unramified the conclusion `(V⊗χ)^{I_F}=0` would fail. The *Hypotheses* paragraph ("the hypothesis forces `a(χ)≥2`") and the first Check fix the intended reading. Wording such as "the largest break of the constituents of `V` and of the trivial character" would say it in the statement.

## Previous findings

The previous review (of `cd123f8`) had no finding; the folder is unchanged since, and so is the description as it concerns this folder.

- C01 (merge order with #3036) — not repaired: the description still names no order, and #3036's head still rewrites the *Needs:* line of §10.27; raised again as C01.
- C02 (§10.1 cites only §2.7 for the Deligne local constant) — not repaired, untouched text; raised again as C02.
- C03 (§7.10a names `TauCeti.EtaleDuality.CohCorr.rgammac`) — not repaired, untouched text; raised again as C03.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / source or computation) | Result | Change |
|---|---|---|---|---|
| 10.26a, rank one, `V=β` with `a(β)≤⌊a(χ)/2⌋` | `ε=∫_{c⁻¹O^×}χ⁻¹β⁻¹(x)ψ(x)dx`, `x=x₀(1+z)`, `v(z)≥⌈a/2⌉` | Inner sum `Σψ((x₀−c_χ⁻¹)z)` vanishes unless `x₀∈c_χ⁻¹(1+𝔭^{⌊a/2⌋})`; ratio `β⁻¹(c_χ⁻¹)=β(c_χ)`. Roadmap: `det V(c_χ)` | holds; `c_χ`, not `c_χ⁻¹` | none |
| 10.26a, threshold in rank one | `β` ramified, break `a(β)−1` | `a(χ)−1>2(a(β)−1)` gives `a(χ)≥2a(β)`, so `a(β)≤⌊a(χ)/2⌋`, as the computation needs | holds | none |
| 10.26a, valuation of `c_χ` | `χ(1+x)` trivial exactly on `v(x)≥a`; `ψ(c⁻¹x)` trivial exactly on `v(x)≥v(c)−n(ψ)` | `v(c)=a(χ)+n(ψ)`; needs `a−1≥⌈a/2⌉`, true for `a≥2`. Source Prop. 1.1: `v(a)=−(n(ψ)+1+α(χ))`, `α=a(χ)−1` | agree | none |
| 10.26a, uniqueness and existence of `c_χ` | two solutions `c,c′` | `v(c⁻¹−c′⁻¹)≥−n−⌈a/2⌉` gives `c/c′∈1+𝔭^{⌊a/2⌋}`. Source: unique mod `U(α/2)`, `⌈(a−1)/2⌉=⌊a/2⌋`. Existence: `2⌈a/2⌉≥a` makes `x↦χ(1+x)` additive | agree | none |
| 10.26a, `det V(c_χ)` well defined | break of `det V` below `(a−1)/2` | `a(det V)<(a+1)/2`, so `a(det V)≤⌊a/2⌋`: trivial on the ambiguity `1+𝔭^{⌊a/2⌋}` | well defined | none |
| 10.26a, `V=\|·\|^s` | `\|x\|=q^{a+n}` on `c⁻¹O^×` | Integral scales by `q^{−s(a+n)}`; `det V(c_χ)=\|c_χ\|^s=q^{−s(a+n)}`. §7.12b twist law: `q^{−t(a+n)}` | agree | none |
| 10.26a, `(V⊗χ)^{I_F}=0` | constituent `U` of `V` with break below that of `χ` | `U⊗χ` has every break equal to that of `χ`, positive; no inertia invariants. Tame `χ`, `V=χ⁻¹`: invariants, hypothesis `0>0` fails | holds; Check 2 true | none |
| 10.26a, route through Lemma 4.7 | `E(y)=Σ_{i<p}yⁱ/i!`, `v(y)>(a−1)/2` | `E(y)−(1+y)` has valuation `≥2v(y)≥a` (zero for `p=2`); `v(y)>(a−1)/2 ⟺ v(y)≥⌈a/2⌉` for both parities; source: `γ=a⁻¹` | `γ=c_χ` | none |
| 10.26a, Check on `ℚ_3` | `n(ψ)=0`, `a=2`, `c=1,9`, `V=\|·\|` | On `9ℤ_3` both sides are 1 for both `c`; `\|1\|=1`, `\|9\|=1/9`; on `3ℤ_3`, `ψ(x)` trivial, `ψ(ux/9)` nontrivial; `v(9)=2=a+n` | Check true and discriminating | none |
| 10.26a, `V` a sum of trivial characters | `V=1`, `χ` unramified | Virtual `V−1=0` has no constituents; literal reading gives no threshold; Hypotheses paragraph and Check 1 give `a(χ)≥2` | wording | N01 |
| Reciprocity of the two suppliers | §10.1, §7.12b, §2.7, source | §10.1: `ϖ↦Φ` geometric. §7.12b: inverse of arithmetic Artin map. §2.7: `artinMap(x)⁻¹`. Source (introduction): Deligne's normalization | all geometric | none |
| Rank-one constants of the two suppliers | §7.12a, §2.7 | Both `χ(c)q^ν vol(O)Σχ⁻¹(u)ψ(u/c)`, `v(c)=a+ν`; §7.12b equals §7.12a in dimension one | same constant | none |
| Contract line 5504 against §7.12b on `main` | each clause | Unique nonzero constant, multiplicative, `r^{dim V}` scaling, dimension one through `Art_F`, degree-zero induction, twist `q^{−t(a_F(V)+n(ψ)dim V)}`: all at lines 13873–13886 | every clause stated there | none |
| §10.27 after the change | sentence replaced | "The corresponding Weil assertion is §10.26a … with `c_χ` as there": same formula, `§10.26a` in the *Needs:* line | consistent | none |
| New supplier edge | cycle, order | ClassicalArithmeticCompletion on `main` mentions this roadmap 0 times; dependency check: 0 problems | no cycle | none |
| Merge order with #3036 | §10.27 *Needs:* line | #3036 rewrites it (its line 4058); this head inserts `§10.26a`; no order stated | conflict unstated | C01 |
| §10.1 local constant (untouched) | *Needs:* line 3504 | Cites §2.7 only; §2.7 is rank one and hands non-abelian constants downstream (lines 1895–1897) | citation too narrow | C02 |

- Source locators checked against the text (DeligneHenniart1981): contents (lines 12–18: §1 p. 93, §2 p. 101, §3 p. 102, §4 p. 108); 0.2 truncated exponential (lines 96–99); 0.3 `n(ψ)` (lines 110–111); 0.6–0.7 breaks (lines 150–173); Proposition 1.1 (lines 180–190, pp. 93–94); Corollary 1.3 (lines 221–228); 4.5 using 2.3 (line 861); Theorem 4.6 (lines 872–877, p. 110); Lemma 4.7 (lines 882–885) and its proof using Corollaries 1.3(ii) and 3.7 (lines 897–902, p. 111); 4.8 (lines 903–908). Every locator of §10.26a holds.
- Supplier text read on `main`: ClassicalArithmeticCompletion §§7.12a–7.12b (lines 13829–13900); ArithmeticGaloisRepresentations §2.7 (lines 1682–1720, 1893–1897) and the heading of Layer 3 (line 1945); ClassFieldTheory Layers 7 and 9 (lines 805, 1177). None of these folders is changed by this pull request.
- Cross-roadmap citations resolved: the 6 of the *Needs:* line of §10.26a, the 2 added to the Layer 10 dependencies, the contract line; the citations of §10.26a from BaseChangeAndGaloisRepresentationsForUnitaryGroups at this head resolve to the new heading.
- Roadmap as record: against the merge base, no heading is removed or retitled; the one added heading is §10.26a; no layer changes. `Suggested.lean` is unchanged.
- Changes outside the folder: every other folder changed against `main` is one of the pull request's own roadmap folders or family index files.
- Overlap check: read AutomorphicSpectralTheory, IgusaVarietiesAndTorsionConcentration (and Part II), AutomorphicGaloisRepresentationsPartII, GlobalShtukasAndFunctionFieldLanglands, ModularityAndLanglandsExtensions; nothing shared by the change. The twist formula is stated nowhere else (the only other mention, in BaseChangeAndGaloisRepresentationsForUnitaryGroups, cites this roadmap). The higher-rank Weil constant is ClassicalArithmeticCompletion §7.12b's on `main`, cited here; the open ArtinRepresentations §2.4 also plans it, and the citation of the owner on `main` is the right one.
- Automatic checks: the worker's run passed every check. Dependency check output: `depcheck: 132 roadmaps, 1491 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` exits 0 with no output; the file declares nothing (its docstring names every headline as not statable, by layer), so there is nothing to `#check` or probe. None of the 15 seeded targets lies in the changed or affected text.

Source independence: changed passages only; 5 passages compared (the statement, the hypotheses paragraph, the route paragraph and the Checks of §10.26a, and the new contract line) with 1 source (DeligneHenniart1981, in French: lines 180–190 and 872–888) and with the wording of ClassicalArithmeticCompletion §7.12b; none shared beyond formulas and names of results. Largest share of the linked locators: Shin, *Galois representations arising from some compact Shimura varieties*, 29 of 455; contents not compared, since the change adds, removes and reorders no layer.

Research link: §10.26a is Deligne–Henniart's twist formula for local constants (1981). §10.27 uses it in Henniart's highly ramified argument, by which the trace-defined local Langlands correspondence for `GL_n` (Scholze, cited in §10.1) is shown to match pair `ε`-factors. Rests on README §§10.1 and 10.27 and on DeligneHenniart1981 lines 19–30.

## Not verifiable

- Jacquet–Shalika 1985, cited in an untouched paragraph of §10.27 (line 4065): the linked copy is on a personal web space whose owner the link does not establish as an author, so it was not opened.

## Source issues

- none

## For the human reviewers

- Licence: the README links Jacquet–Shalika, *A lemma on highly ramified ε-factors* (§10.27, line 4065; References, line 5633), to a Columbia mathematics web space under `~hj`; whether that is an author's page was not settled, and the copy was not read.
