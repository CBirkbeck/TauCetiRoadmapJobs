# Review of K2SymbolsBrauer (pull request #1302 at 607bfa8)

**Verdict:** needs changes

## R01 (P3) — The description places AlgebraicKTheory's contract in "Layer 0"

**Location:** Pull request description, dependency paragraph: "AlgebraicKTheory (A1–A3 and A5, the classical foundations of Layer 0), StableHomotopyKTheory (Layers 1–4: …) and the other roadmaps the README cites as suppliers are on main."

**Claim:** Every other parenthesis in the paragraph gives the supplier's own layers. AlgebraicKTheory's Layer 0 is A0, which the README does not consume; A1–A3 and A5 are its Layers 1–3 and 5. Read as this roadmap's Layer 0, the clause is also wrong: A1–A3 and A5 are consumed throughout.

**Witness:** AlgebraicKTheory on main, `README.md:90`: "Layer 0: Finite projectives and matrix K₀ (A0)"; 235, 316, 379, 550 are A1, A2, A3, A5. Here, `README.md:103` (Layer 0) cites only §§1.1, 5.1–5.2; `README.md:203` (Layer 2) cites A1–A3 and A5.

**Repair:** "AlgebraicKTheory (A1–A3 and A5, its Layers 1–3 and 5: finite and stable GL and E, classical K₁ and relative K₁, Steinberg groups, classical K₂ and Matsumoto's presentation), StableHomotopyKTheory (Layers 1–4: …) and the other roadmaps the README cites as suppliers are on main."

## Previous findings

- R01 — repaired: §11.8 (`README.md:2632`) opens "Write `T_v:K^M_2(F)→kˣ` for the tame symbol homomorphism of §9.5 and `T^St_v:K₂^St(F)→kˣ` for its transport through Matsumoto's isomorphism (§9.5)"; `tameSymbolHom` occurs nowhere.
- R02 — repaired: `README.md:1847` reads "the prime-degree statements of §§10.11, 10.12 and 10.14, Kato's theorem (§10.24), §10.32, §§10.32b–10.32c and §11.7 consume it."
- R03 — repaired: the title is "Roadmap: explicit K₂: symbols, residues and reciprocity", which is `README.md:1`; the description adds "Its only Brauer-group targets are the function-field adapters of §§10.32a–10.32b".
- R04 — repaired: "Three suppliers are still open pull requests: GeneralAlgebraicKTheory (…), KTheoryLowDegrees (…) and SchemeKTheoryOperations (§3.6, the scheme DVR boundary)"; the repair's AlgebraicKTheory clause is R01 above.
- R05 — repaired: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the `Suggested.lean` statements; Claude (Fable 5.1 and Opus 5.5) for later repairs." The commit trailers agree (607bfa8b: Opus 5.5).

## Verified sound

| Statement (changed or touched) | Instances tried | Values on one side | Values on the other side | Result |
|---|---|---|---|---|
| §11.8 (sample; `T_v`, `T^St_v`) | `{2,5}`, `{5,5}` at 5 | `T_v{2,5}=(−1)^0·2¹·5⁰=2`; `T_v{5,5}=−1=4` | `T^St_v∘μ_F`: same values on Steinberg symbols (§9.5, fourth API bullet); `inv(3)=2` | agrees; both names resolve to §9.5 API bullets 1 and 4 |
| §9.14 `ρ_t` = `ρ-part` of §9.9 after `d_t` | `u·t^m` with `u=2`, `m=1`, `k=𝔽₅`; `m=0` | `d_t=({2}+Π)↦{2}+{−1}={3}`; `{2}` | `{(−1)^1·2}={3}`; `{2}` | agrees with §9.9 (`README.md:1559`): `a+bΠ↦a+b{−1}` |
| §10.6 introduction | Needs of 10.11, 10.12, 10.13, 10.14 | 1945: §10.6, §10.9; 1970: §10.6; 1998: §§10.6–10.9 | 1984 (10.13): "§5.10; §10.2", no longer listed | agrees |
| §5.15 `D′₂⊂Q₂(ℝ)` | `(−1,−1)`, `(2,−1)`, `(−1,2)`; `n=0` | sign `1, 0, 0`; `(−1,−1)∉D′₂` | `K⁽M⁾₀(ℝ)=ℤ≠(ℤ/2)⊕D₀` | agrees; `MilnorK.realPositive` (degree `n`, in `MilnorK.degree ℝ n`) is the only backticked name kept |
| §5.6 degree-two equivalence | `{a,b}` with `a+b=1`: `{2,−1}` | `symbol(2,−1)=0` in `Q₂` | `{2,−1}=0` in `K⁽M⁾₂` | agrees; `symbol` is declared in `Suggested.lean` |
| §12.1 `⨅ i∉S, ker(∂_{v i})` | `S=∅`, `S=I`, empty family | `S=∅`: `U`; `S=I`: empty infimum `=K₂(F)` | empty family: `U=K₂(F)` | agrees |
| §10.31 code span | disjoint-divisor form | `(Divisor.principal hF g).eval f = (Divisor.principal hF f).eval g` | `weil_reciprocity_of_disjoint`: `eval (principal hF g) f = eval (principal hF f) g` | same statement |
| `Suggested.lean` module docstring | pinned Tau Ceti | "stable general linear group and algebraic `K₁` stop in degree one" | `StableGeneralLinearGroup` (Stable.lean:155), `AlgebraicK1` (Stable.lean:313); no Steinberg group, `K₂` or Quillen K-group | agrees; `Algebra/Quaternion/Steinberg.lean` is the quaternion symbol relation, not a Steinberg group |
| Description, supplier paragraph | sections the README cites | GeneralAlgebraicKTheory §§3.2–3.14, 4.6–4.14, 7.2–7.8, 8.1–8.13, 10.12; KTheoryLowDegrees §§6.1–6.2, 8.1, 9.1, Layers 10–11, §§13.1–13.5 | description: "Layers 3, 4, 7 and 8, and §10.12"; "Layers 6, 8–11 and 13" | agrees; AlgebraicKTheory clause fails (R01) |
| Description, summary block | head | ten sorried theorems; `Steinberg.centralExtension_splits`, `MilnorK` declared; consumers of `README.md:3442`–3453 | "ten headline theorems"; same names; same consumers | agrees |

The rows for untouched statements, including the ten sorried headline theorems, stand as in the previous review, of `902ff2b`. The diff changes only the module docstring of `Suggested.lean`; no statement changed.

- **Gate:** a re-run at this head gives every count 0 and `OK`; the worker's run adds `build=0`. `git diff origin/main...HEAD` outside the folder is empty (the files listed as changed since `902ff2b` come from the merge of main).
- **Dependency check:** `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives ten `declaration uses sorry` warnings (lines 74, 131, 137, 150, 160, 190, 199, 212, 220, 256) and nothing else.
- **Undeclared names:** `realSign`, `realDecomposition`, `rhoHom`, `unramifiedOutside`, `unramifiedSubgroup`, `steinbergSymbol`, `degreeTwoEquiv`, `tameSymbolHom` occur nowhere in the README at this head.
- **Cross-roadmap citations resolved:** GeneralAlgebraicKTheory §§3.12, 8.11–8.13, 10.12, KTheoryLowDegrees §§6.1–6.2, 8.1, 9.1, 13.1–13.5 and Layers 10–11, SchemeKTheoryOperations §3.6 at their open heads; AlgebraicKTheory Layers 0–5 on main. The three are not on main (3cf7342); the twelve other suppliers the README names are (LocalFieldsRamification under Completed).
- **Library declarations opened:** `TauCeti.StableGeneralLinearGroup` and `TauCeti.AlgebraicK1` in `LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:155`, 313, at the pin.
- Overlap check: read K2SymbolsBrauerPartII, EllipticKTheory, KTheoryFiniteLocalFields, K3BlochGroups, HomologicalStabilityOfGeneralLinearGroups (open), AlgebraicKTheory, StableHomotopyKTheory, ClassicalArithmeticCompletion (main); the overlap lists are unchanged and the diff moves no object, so the owners stand as in the review of `902ff2b`: Steinberg groups and Matsumoto (AlgebraicKTheory A5), the plus-construction π₂ equivalence (StableHomotopyKTheory §3.29), the local `normResidueSymbol` (ClassicalArithmeticCompletion §1.14), native `MilnorK`, residues and norms (this roadmap). No dropped id, no other open pull request changes this roadmap.
- Source independence: 0 passages compared with 0 sources this round (changed passages only): the nine changed README passages replace names by notation or prose and change no locator, and `weibel` could not be read (below). Largest share `weibel`, 171 of 246 locators, as counted at `902ff2b`; contents not re-compared: the diff adds, removes or reorders no layer.

## Not verifiable

- `weibel` (sample target §11.8: V.6.1.2, V.6.6–6.6.1, III.6.3, III.7.1, III.7.3): the sources service answered "network trouble: try again later" and the cache records no text. The diff changes none of these locators.

## Source issues

- none

## For the human reviewers

- Not tested: `weibel`, the source with the largest share of the locators, could not be read this round (sources service: network trouble). The review of `902ff2b` compared it; this head's 51 changed lines change notation and no locator.
