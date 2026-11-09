# Review of CategoricalOperatorAlgebras (pull request #888 at 3e67101)

**Verdict:** needs changes

This is an incremental re-review of the 27 lines of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` that changed since `7362bb7`. The changes are: the scope clause and the Downstream consumers bullet naming QuantumGroups as a consumer of CA1a/CA2a (restored, as on main), a σ-finiteness hypothesis on Kosaki's basic extension, a separable-predual hypothesis on the `σ=id⊕id` Check, and a split Burns locator in the Kosaki reference. `Suggested.lean` and `metadata.toml` are unchanged. The three edits other than the ownership one are correct, and the ownership edit is the right text for this folder. What remains is the one carried P2: the QuantumGroups revision at #1705 still claims the same objects, and nothing in this folder can settle that. It is written again below so that a human places QuantumGroups in the merge order rather than another repair round starting here.

## R01 (P2) — The CA1a/CA2a objects still have two open owners: this folder and the QuantumGroups revision #1705

**Location.** `README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion and the finite-Hilbert and Hilbert-module examples (CA1a), and C*-tensor categories … signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a for these tensor-category inputs." Lines 2145–2151 repeat it under Downstream consumers.

**Claim.** These objects have one owner, this roadmap, and QuantumGroups consumes them.

**Witness.**
- QuantumGroups #1705 at `a9eaeef`, `TauCetiRoadmap/QuantumGroups/README.md` lines 33–41: "Section 0.2 is the single home of C*-categories … conjugate solutions, standard solutions, intrinsic dimension and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … come later in the build and consume these objects from §§0.2–0.3". Lines 1789–1791 list this roadmap as a consumer of its §0.2. Line 300 defines the sign in `bar(r) r=ε φ_X`.
- QuantumGroups #1649 at `79e1cb6`, lines 29–36, agrees with this folder ("owned later in the build by CategoricalOperatorAlgebras"), but its §0.1 still restates the instances (line 201).
- On main, `TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier, and lines 61, 252–253, 260 and 411–420 use CA2a's balanced unitary dual functor and signed self-duality. The merge order has no QuantumGroups line, so the dependency check run on main's QuantumGroups README prints `UPWARD: QuantumGroups (on main) -> CategoricalOperatorAlgebras (#227) at README lines [42]` and the same for TemperleyLiebOperatorAlgebras (#243); run on the #1705 head it prints 0 problems. Each side passes the check with itself as the owner, so the check cannot decide.
- Neither pull request's description states an order between #888 and #1705.

**What this head settles.** The previous report asked, under the resolution that main's own citation implies (QuantumGroups after this roadmap), for the two deleted statements to be restored and lines 40–45 kept. That is done. The restored bullet is longer than the `363a7e3` wording, and every addition (the balanced unitary dual functor, the pivotal structure of representation categories, the free orthogonal signed self-duality, Tannaka–Krein reconstruction) is what main's QuantumGroups consumes at the lines above. A revision of a roadmap on main is never a dependency, so this folder cannot cite #1705's §0.2, and there is no further edit to make here. The double ownership stands only because #1705's head says the opposite, and the review of #1705 at `a9eaeef` kept ownership there pending a merge-order statement in its description. The two open reviews disagree, and only the placement of QuantumGroups decides both.

**Repair.** A human places QuantumGroups in the merge order.
- After this roadmap (the direction main's line 42 already assumes): this folder is correct as written; #1705 deletes its §0.2 restatements and #1649 its §0.1 restatements, and both cite CA1a/CA2a as main does. No edit here.
- Before this roadmap: once a QuantumGroups revision with Layer 0 has merged, replace "single home here" at lines 40–46 for the overlapping objects (C*-category axioms, Karoubi completion, `Hilb_f` and the Hilbert-module category, standard solutions and `d(X)`, the signed self-duality `r̄r=εφ_x`) by a citation of that layer, delete the QuantumGroups bullet at 2145–2151, and keep here what QuantumGroups does not build: W*-categories and W*-Cauchy completion, unitary dual functors and Penneys's Theorem A, the grading groupoid, and the braided sign law.

**Tested.** The sign ε of a simple self-dual object is defined at this folder's line 394, at #1705 line 300 and at #1649 line 201. After either resolution exactly one roadmap defines it. The dependency check on this README at this head prints 0 problems, so the restored statements add no supplier edge.

## Previous findings

- R01 — partly repaired: lines 45–46 now read "have their single home here; QuantumGroups consumes CA1a and CA2a for these tensor-category inputs", and lines 2145–2151 restore the consumer bullet, as main's QuantumGroups line 42 records. #1705 at `a9eaeef` (lines 33–41, 1789–1791) still claims §0.2 as the single home. Carried as R01: the folder-side repair is complete, the conflict is on #1705's side and in the merge order.
- R02 — repaired (unchanged since `7362bb7`): line 1703 reads "(Izumi 2003, Definition 3.1, p. 7, for a type III factor; Masuda–Tomatsu 2009, §4.2, p. 33, for a factor of any type)"; lines 1712–1714 cite Lemma 4.10(2), p. 34, for type II∞ and Izumi 2003, Theorem 3.3 with Remark 3.8, pp. 9 and 17, for III_λ.
- R03 — repaired (unchanged since `7362bb7`, locator refined at this head): line 1569 reads "(Kosaki 1986, §3, Lemma 3.2, as recalled in Burns, … Proposition 2.1.21, pp. 12–13; over a II₁ base N …)"; line 1578 cites "Kosaki 1986, §3; Burns, p. 13" for the dual expectation; the References entry at 2252–2263 now gives Proposition 2.1.21 (pp. 12–13) for the basic extension and the paragraph after it (p. 13) for the dual expectation and its index.

## Verified sound

**Gate, build and form.**
- My run of `gate … --base origin/main` at `3e67101` exits 0 and ends `OK`, with every counter 0: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's run at this head adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CategoricalOperatorAlgebras'` is empty: no change outside the folder. The folder holds `README.md` (2285 lines), `Suggested.lean` (51 lines) and `metadata.toml`.
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 10 s with no diagnostic. The file is unchanged since `363a7e3`: `import Mathlib`, a module docstring "target signatures" naming every CA2a–CA10 headline with its missing carrier, and an empty namespace. With no declaration there is nothing to `#check`, nothing for the one-tactic probe, and nothing is padding. The headline list and the carriers missing at the pins are as in the previous reports.
- `git diff --stat 7362bb7..HEAD -- TauCetiRoadmap/CategoricalOperatorAlgebras/` lists only `README.md` (19 insertions, 8 deletions).

**Dependency check.** `gate --depcheck … --movable --content …` on this README prints `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. This roadmap is at position 227. No gaps are declared (no readable `design/plan.json`). `overlaps.md` lists no dropped id, no id only an open revision defines, and no other pull request changing this roadmap; its closest roadmaps are QuantumGroups #1705 and #1649 (R01), TemperleyLiebOperatorAlgebras #867, OperatorAlgebraDynamics #1137 and OperatorKTheory #866. `citations.md` lists no cross-roadmap citation or Lean name found nowhere.

**The four changed passages, each read at the text.**
- Line 1566, "N⊂M of σ-finite factors": `Burns2011` line 452 sets up "(σ-finite) factors with a normal conditional expectation", and the paragraph's Jones projection needs ψ∘E to be a faithful normal state on M (lines 1572–1574), which needs M σ-finite (then N is σ-finite by restriction). Subfactors 2.5 on main (lines 536–550) constructs `E⁻¹` and `Ind(E)` for any faithful normal E with no σ-finiteness, so the hypothesis narrows only the standard-form step, and CA9 applies the construction to factors with separable predual (line 1581), which are σ-finite.
- Lines 1928–1931, the Check now on "an infinite factor M with separable predual": the two isometries of `id⊕id` exist on any properly infinite factor; the added hypothesis is the standing one of the paragraph it tests (line 1581). Values recomputed in the table.
- Lines 2252–2263, the Kosaki reference: `Burns2011` Proposition 2.1.21 is attributed to "Kosaki [21] Lemma 3.2" at line 481; items (i)–(iv) at lines 482–485 sit after the page marker whose printed number is 12 (line 459); item (v) at line 488 and the paragraph with `E_M(x)=J₀E′(J₀xJ₀)J₀`, `Ind(E_M)=Ind(E)=τ⁻¹`, `E_M(e₁)=τ` at lines 489–491 sit after the marker whose printed number is 13 (line 487). [21] is J. Funct. Anal. 66(1), 123–140, 1986 (lines 6460–6461). The split locator is exact.
- Lines 45–46 and 2145–2151, the consumer statements: main's `TauCetiRoadmap/QuantumGroups/README.md` line 42 (supplier row for CA1a,CA2a: finite Hilbert dagger category, unitary rigid tensor categories, chosen conjugates, signed self-duality, standard solutions, intrinsic dimension), lines 252–253 and 260 (CA2a's balanced unitary dual functor for the pivotal structure), line 411–420 (free orthogonal quantum groups' self-duality map identified with CA2a's signed self-duality). Every item of the bullet is consumed there. The ownership conflict with the open heads is R01.

**Seeded sample.** I drew 15 of the 109 lines of CA1–CA10 that carry a page locator, using `shuf` seeded with the head SHA followed by `-13`: 423, 424, 486, 525, 712, 725, 736, 1269, 1304, 1356, 1387, 1694, 1848, 2066, 2088. None falls in a changed passage, so the sample is covered by the previous reports' checks of the untouched text. I spot-checked two anyway: lines 423–424, `Penneys2018` Theorem A at line 122 (after the page-3 marker, line 90), §3.3 "The universal grading groupoid" at line 616 (p. 13, marker at line 588), Lemma 3.20 at line 665 (p. 14, marker at line 624); line 1694, `MasudaTomatsu2008` Definition 4.1 at line 1364 (p. 30, marker at line 1334), "M a factor and ρ∈End(M)₀", as stated.

**Ownership.** The changed passages add no object and no supplier citation. The grep of the previous report over the open heads and main for Kosaki's basic extension, modular endomorphisms and canonical extensions stands (no other owner). Ownership of the CA1a/CA2a objects against #1705 and #1649 is R01.

**Remarks on untouched text (not findings).** None new; the previous report's remark that the basic-extension paragraph presupposes σ-finite factors is now stated in the text.

### Adversarial table

Rows for changed statements (new values):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Basic extension on σ-finite factors, line 1566 | `ℂ⊂M₂` with `E=tr` (σ-finite, finite); `N=M`, `E=id`; a non-σ-finite M, e.g. `B(ℓ²(I))` with I uncountable | `L²(M₂,tr)=ℂ⁴`, `e=\|1̂⟩⟨1̂\|`, `xe=ex⇒x∈ℂ=N`, `JeJ=e`, `JN′J=B(ℂ⁴)` of dim 16 `=span(M₂eM₂)`; `N=M`: `e=1`, `M₁=M`; non-σ-finite M: no faithful normal state ψ∘E exists, so the vector ξ of lines 1572–1574 does not, and the paragraph's construction needs the new hypothesis | the hypothesis is needed for the route as written and matches `Burns2011` line 452 | none |
| `σ=id⊕id` Check, lines 1928–1931, with separable predual | the hyperfinite II∞ factor; `R_λ`; `v₁,v₂` with `v₁v₁*+v₂v₂*=1` | `σ(M)⊂M≅M⊗1⊂M⊗M₂`, `d_σ=2`, `Ind(E_σ)=4=d_σ²`, `E₁=id⊗tr`, `E₁(e)=¼`; non-minimal `E=id⊗Tr(diag(⅕,⅘)·)`: `Ind(E)=5+5/4=25/4`, `E₁(e_E)=4/25`, `(25/4)⁻¹=4/25` | as stated; the hypothesis is the standing one of line 1581 | none |
| Kosaki reference locator, lines 2252–2263 | printed pages of `Burns2011` | (i)–(iv) lines 482–485 after marker "12" (line 459); (v) and the expectation paragraph lines 488–491 after marker "13" (line 487) | exact | none |
| QuantumGroups consumer bullet, lines 2145–2151 | each listed item against main's QuantumGroups | line 42 (six items), lines 252–253/260 (balanced unitary dual functor, pivotal structure), lines 411–420 (free orthogonal signed self-duality), line 42 "Reconstruction here" (Tannaka–Krein) | every item consumed on main | none |
| Single owner of ε, lines 40–46 | this README; #1705 `a9eaeef`; #1649 `79e1cb6`; main QuantumGroups | line 394; line 300; line 201; main line 42 cites CA1a,CA2a | two single-home claims at the open heads | R01 |

Rows carried from the previous report (PRREVIEW-CategoricalOperatorAlgebras~12) for statements the diff leaves untouched:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Dual expectation `E₁(e_E)=Ind(E)⁻¹`, `Ind(E₁)=Ind(E)` | `ℂ⊂M₂`; `σ=id⊕id` | `Ind(tr)=4`; `E₁(\|Ω⟩⟨Ω\|)=¼`; `Ind(E₁)=4` | matches `Burns2011` lines 489–491 (~12) | none |
| Canonical extension locator (lines 1656–1658) | II∞ inner amplification n=2; type III | `ρ̃(u_t)=2^(it)·2^(-it)u_t=u_t`; Izumi Thm 2.4 needs type III (line 208), MT §3.1 "M a factor" (line 682) | both locators needed (~12) | none |
| Modular endomorphism definition (line 1703) | `ρ=Σv_i·v_i*`, type III; α with `mod(α)≠id` | implementing system n=d(ρ)=2; `ρ̃\|Z=mod(α)≠id` | discriminates (~12) | none |
| Irreducible modular endomorphisms of III_λ (lines 1710–1714) | `R_½`; III₀ | `H¹(F,U(1))≅ℝ/(2π/log 2)ℤ`; III₀ has higher-dimensional ones | as stated (~12) | none |
| II∞ case (Lemma 4.10(2)) | modular irreducible ρ on II∞ | `Hom(id,ρ)≠0`, ρ inner | as stated (~12) | none |
| 486 Penneys Theorem C | `P_(0,±)` | connected ⇔ `1_±` simple | supported (~11) | none |
| 541 bipartite Check | `u₁—w—u₂` | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ` | as stated (~11) | none |
| 627 CHJP 3.36/3.37 | `Q=1⊕g` in `Hilb(ℤ/2)` | `n₀²+n₁²=1=2n₀n₁` no solution | splits only in QSys(C) (~11) | none |
| 711 JP Theorem 3.20 | `A(a)=Hom(a,1)` | cyclic module C, basepoint 1 | supported (~11) | none |
| 721 Stinespring Check | `A=M₂`, `θ=½Tr` | dim K=4; `½·1` rank 2 | discriminating (~11) | none |
| 1269 HP II Theorem 6.13 | TL(δ), `δ²=2,3,4` | `N=3,4,5`; depths 2, 4, ∞ | valid (~11) | none |
| 1304 Remark 5.17 | TL(√2) | `Tr f(0)=Tr f(2)=1`, `[f(0)]≠[f(2)]` | as stated (~11) | none |
| 1355 HNP 7.4 | handedness | source left, README right with note | consistent (~11) | none |
| 1387 HP2015 Lemma 3.4 | `M_n`; `R_λ` | `M_n⊗̄R₁≅R₁`; `R_λ⊗̄R₁≅R_λ` | type I excluded (~11) | none |
| 1398/1409 HP2020 | `Hilb(ℤ/2)` in `R_λ` | one centrally free, one centrally trivial | restriction needed (~11) | none |
| 1586 ultrapower | `M_n`, `L(F₂)`, R | `(M_n)_ω=ℂ`, `L(F₂)_ω=ℂ`, `R_ω≠ℂ` | supported (~11) | none |
| 2063 HPT Corollary 3.9 | `Hilb_fd` | `E⊠M≃M` | agrees (~11) | none |
| CA2a Theorem A | `Hilb(ℤ/2)`; t=4 | `χ²=1⇒χ=1`; `2/5=2/5`, `1≠¼` | as stated (~11) | none |
| CA2a sign law | `J(a,b)=(−b̄,ā)` | `J²=−1`, `(J⊗J)²=+1` | as stated (~11) | none |
| CA3 normalization | `M_n` | `m′m′†=1`, `i′†i′=n²` | as stated (~11) | none |
| CA4 Theorem A | trivial object | `d_Q=1`, `A(1)=ℂ` | as stated (~11) | none |
| CA5 | `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2`; ℤ not compact | as stated (~11) | none |
| CA6 | `Hilb_fd`, `x=ℂ^k`; `Hilb(ℤ)` | `k^n` vs `k^(2n)`; infinite support | discriminating (~11) | none |
| CA7 Katsura 8.6 | `ℂⁿ`, n=1,2,3; `ℓ²(I)` | `(ℤ,ℤ)`, `(0,0)`, `(ℤ/2,0)`; `K₀=ℤ`, `K₁=0` | as stated (~11) | none |
| CA7 HP I 5.25 | `μ=(16,1)`; loop | `4=4`; `¼` vs `64`; `C([−2,2])` | as stated (~11) | none |
| CA8 Watatani Check | `ℂ⊂ℂ²` | `(3,3/2)`; `2·1` | as stated (~11) | none |
| CA9 HNP 7.4 | `HS(ℂ²,ℂ³)` | 6 vs 1 | discriminating (~11) | none |
| CA9 Theorem D | factor | invariant state automatic | as stated (~11) | none |
| Definition 4.1 ⇔ V12 `Ct(M)` | ω-centralizing vs predual-centralizing | subsequence extraction both ways | equivalent (~11) | none |
| Lemma 4.11 | `Ad u∘σ_t^φ` on `R_λ` | `ρ̃=Ad(u·λ_t)` inner | sound (~11) | none |
| Theorem 4.12 II∞ / III₁ | `ρ⊗id`, flip; `σ_t⊂ρρ̄` | `Hom(id⊗id,ρ⊗ρ̄)≠0`; `σ_(nt)` pairwise outer | as stated (~11) | none |
| `T(M)={0}` for III₁ | `σ_T^φ=Ad u` | `Γ⊆(2π/T)ℤ≠ℝ` | sound (~11) | none |
| Definition 4.13 | `M⊗1⊂M⊗M₂` | `‖φ−φ‖=0` | centrally non-trivial (~11) | none |
| Lemma 4.15 Check | `R_½`, `σ_(t₀)`, `t₀=π/log 2` | `λ^(it₀)=−1`, `t₀∉(2π/log 2)ℤ` | hypothesis necessary (~11) | none |
| `M⊂M₁≅σ̄(M)⊂M` | common cyclic separating vector | Dixmier–Maréchal; `σ⁻¹γ=σ̄` | route valid (~11) | none |
| Theorem 4.16 vs Izumi 1993 3.5 | III₁, k=1 | first-stage form | attribution correct (~11) | none |
| Theorem 4.18 | k≤n | `(σσ̄)^k≺(σσ̄)^n` | as stated (~11) | none |
| Corollary 4.19 | `σ=id⊕ρ` | `[σσ̄]=[id]⊕[ρ]⊕[ρ̄]⊕[ρρ̄]` | as stated (~11) | none |
| HP Corollary 3.8 | II∞; III₁ | inner ⇒ `α_X≅α_1`; t=0 | sound (~11) | none |
| `L(F₂)⊗̄B(ℓ²)` Check | `b⁻ⁿhaⁿ` | distinct; `M_ω=ℂ` | not centrally free (~11) | none |
| CA10 tube algebras | ℤ/2, ℤ/3, S₃ | 4, 9, 36 | as stated (~11) | none |

## Not verifiable

- **Kosaki 1986**, §3 and Lemma 3.2 (J. Funct. Anal. 66): the DOI resolves only to a paywalled page, and the manifest records it as `uncertified`. The README cites it through Burns's restatement, which I checked at the lines above. That Lemma 3.2 sits in §3 of the paper is not checked.
- **Izumi 2003**, published numbering (Amer. J. Math. 125): unchanged since the previous report; the arXiv text and Masuda–Tomatsu's citations agree on the theorem numbers.
- **Popa 1995**, Theorem 3.5(ii) and Corollary 4.4: no legal open copy (`uncertified`). Unchanged since the previous report.

## Source issues

- **Misprint** in `Burns2011` at Lemma 2.1.22 (pull-down lemma), printed p. 13: the source gives the element as `τ⁻¹E_M(xe₁)`, defined through itself; it should be `τ⁻¹E_M(ze₁)` for the given z∈M₁; affects nothing.
