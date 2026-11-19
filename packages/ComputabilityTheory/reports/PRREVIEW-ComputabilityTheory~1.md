# Review of ComputabilityTheory (pull request #2554 at 8b454b1)

**Verdict:** needs changes

**Summary.** There is one finding. `Suggested.lean` states its headline theorems on its own copies of Tau Ceti's carriers instead of Tau Ceti's. One of these copies is a Sacks stage machine that differs, stage by stage, from the one an implementation builds on `evalStage`. The file also restates, with `sorry`, 64 theorems that Tau Ceti proves at the pin. The mathematics of the README held up under the adversarial pass: every Check and worked example that was recomputed agreed with its section. There are also four small corrections and two format notes, none of them blocking. Two things are left to the human reviewers: a licence question about the cited external formalisations, and the main source. That source is Soare's 1987 book, which is paywalled, so none of its 31 locators could be checked against the text.

## R01 (P2) — `Suggested.lean` states its headlines on private copies of Tau Ceti's carriers and restates 64 theorems the pin already proves, so it does not test what an implementation proves

Why it matters: an implementation builds on `Set.oracle`, `Set.jump`, `Set.Low`, `Set.Simple`, `TauCeti.Oracle.Single.Code.evalStage` and the `TauCeti.Priority` injury objects. Proving the acceptance file therefore proves nothing about the objects that are actually implemented. In addition, 62 of its 103 sorried statements are already theorems at the pin.

How I know: the file imports only Mathlib (line 1) and defines 43 prototypes that duplicate pinned declarations:

- `oracle` (line 45) is `Set.oracle` (`TauCeti/Computability/TuringDegree.lean:83`);
- `jump` (line 448) is `Set.jump` (`Jump/Basic.lean:62`);
- `Low` (line 459) is `Set.Low` (`Jump/Low.lean:44`);
- `Immune` and `Simple` (lines 551–555) are `Set.Immune` and `Set.Simple`;
- the injury objects (lines 604–631) are `TauCeti.Priority.injuriesAt` and its companions (`Priority/Injury/Basic.lean:85–98`);
- `Code`, `run` and `stage` (lines 58–190) re-implement `TauCeti.Oracle.Single.Code` with its `evaln` and `evalStage`.

The numbering is the same (I compared `encode` with `encodeCode`, `SingleOracle/Code.lean:100`), but Convention 16 (lines 175–179) concedes that the evaluators "agree with Tau Ceti's `evaln` and `evalStage` in their limit semantics and in the stage conventions, not stage by stage. An implementation states the theorems on Tau Ceti's carriers."

The Layer 8 definitions `agreementLength`, `sacksRestraint` and `sacksSplit` (lines 1092–1262) are built on `Code.stage`. They are therefore a different stage machine from the one built on `evalStage`, which runs Tau Ceti's `evaln` (`SingleOracle/Stage.lean:41`). So `sacksSplit_spec`, `leastThreat_sacks`, `sacksRestraint_of_le` and `sacks_splitting_uniform_indices` are theorems about that other machine.

The 64 statements listed at README lines 1163–1188 carry `sorry` although the pin proves them. For example, `exists_low_simple` (line 591) is `TauCeti.simple_lowSimpleSet` together with `TauCeti.low_lowSimpleSet` (`Simple/Low.lean:570`, `Simple/Lowness.lean:117`).

I restated `post_sigma`, `limitLemma`, `friedberg_muchnik`, `sacks_splitting`, `exists_simple_avoiding` and `low_incomparable_split` on `Set.oracle`, `Set.jump^[n]`, `Set.Low`, `Set.Simple`, `Set.join` and `TauCeti.Approximation.Converges`, importing eight Tau Ceti modules. All six elaborate, so every headline is statable on Tau Ceti's carriers at the pin.

Smallest repair:

- Import the Tau Ceti modules the statements use: `TauCeti.Computability.TuringDegree`, `.Join`, `.Jump.Basic`, `.Jump.Iterate`, `.Jump.Low`, `.Simple.Basic`, `.Enumeration.Stage`, `.SingleOracle.Stage`, `.Priority.Injury.Basic` and `.Approximation.Modulus`.
- State the headlines on those carriers.
- Keep only the roadmap's own definitions: `REPredIn`, `ComputablePredIn`, `SigmaIn`/`PiIn`/`DeltaIn`, the histories and labelled events of 6.1–6.3, and the Layer 8 stage machine, defined over `evalStage` with `setAnswers`.
- Delete the prototypes and the 64 restatements, which Scope and ownership already cites.
- Rewrite Convention 16 and the module docstring to match.

The proved Layer 6 examples can stay, restated on `TauCeti.Priority.injurySet`.

## C01 — The overview and the description say the roadmap follows Soare's book, but its layers do not

The first sentence of the summary (README line 4) reads "following Soare's *Recursively Enumerable Sets and Degrees*", and the description opens with the same phrase. The layers are the roadmap's own:

- Layer 3 merges III.2 with IV;
- Layer 4 takes III.3 after IV;
- Layer 6 corresponds to no chapter;
- VII.1 is left to Tau Ceti.

The phrase invites a reader to take the book's order as the specification. "with Soare's *Recursively Enumerable Sets and Degrees* as its main reference" would be accurate in both places.

## C02 — Six declarations of `Suggested.lean` hold by unfolding the definitions, so as targets they ask an implementer for nothing

With one tactic each:

- `injurySet_congr` closes by `simp only [injurySet, injuriesAt, fresh, hA, hr]`;
- `injuriesThrough_mono` closes by `Finset.biUnion_subset_biUnion_of_subset_left` with `Finset.range_subset_range`;
- `column_infinite` closes by `Set.infinite_of_injective_forall_mem` with `Nat.pair_eq_pair`.

The file already proves `monitoredInjuryEvents_mem` by `simp`, and `stageUse_le_agreementRestraint` and `first_disagreement_use_le` by `Finset.le_sup`.

If they are meant as sanity checks of the definitions, say so in their docstrings, or move them to the README as Checks. The Tau Ceti restatements that also close in one tactic (`injuriesAt_none`, `boundary_mem_injuriesAt`, `succ_mem_injuryStages`, `zero_not_mem_injuryStages`, `all_attention_finite_of_local`) go with R01.

## C03 — The provenance table assigns to the layers integration work that the README itself says Tau Ceti has already done

The CiL row (line 1436) says its use principle "can serve Layer 0", its jump results Layer 3, and its simple set Layer 5. The Freer row asks to "construct the actual relative jump and staged representation". The row for the Mathlib proposal asks to "add the stage, use and finite-injury interfaces". Yet the openings of Layers 0, 3, 5 and 6 say that all of these are in Tau Ceti at the pin. Each row would be accurate if it named only what remains:

- the Kleene–Post proof for 5.1 (CiL);
- the Friedberg–Muchnik construction and the low-halves splitting for Layers 7 and 8 (Aslyan).

Alternatively, the table could say that its rows record what Tau Ceti's modules were compared with.

## C04 — `Finset.equivBitIndices` is listed among the material "Already in Tau Ceti", but it is Mathlib's

The bullet at README lines 1132–1134 credits Tau Ceti with "the canonical binary coding of finite sets of naturals, `Finset.equivBitIndices`". That bijection is in Mathlib (`Mathlib/Combinatorics/Colex.lean:535`), as the Mathlib supplier contract correctly says. Tau Ceti supplies the primitive recursive lemmas about it (`Primrec.mem_equivBitIndices` and its companions). Would read: "Mathlib's coding `Finset.equivBitIndices`, with Tau Ceti's primitive recursive membership, union, …".

## N01 — The names in 8.1 coincide with Tau Ceti's raw-run declarations, which have a different meaning

`agreementLength` and `agreementRestraint` (8.1; Suggested lines 1098–1103) have the same names as `TauCeti.Oracle.Single.Code.agreementLength` and `agreementRestraint`, which the opening of Layer 8 says are a different object. Distinct names (for instance `stageAgreementLength`) would keep the two apart once the stage version sits beside Tau Ceti's.

## N02 — Two *Needs:* lines omit inputs that their routes use

- The many-one completeness of `TOT`, `FIN` and `INF` in 3.4 uses s-m-n (`Nat.Partrec.Code.curry` or `smn`).
- The converse direction of the Limit Lemma in 4.3 approximates `Z′` by its stages, using `TauCeti.Oracle.Single.Code.evalStage` and `primrec_evalStage`.

Both inputs are in the supplier contracts but not in those *Needs:* lines.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| 1.2 range presentations | ∅; `{0}`; constant `0` | ∅ = W of nowhere-halting program, every total range ∋ f(0); `{0}` = range of const 0, injective total range infinite | hypotheses nonempty/infinite needed; holds |
| 1.1 Checks | K, Kᶜ, ∅ | ∅ c.e. in every Z, not a total range; K c.e., Kᶜ ≤T ∅′, not c.e. | true |
| 2.1 padding | naive pad(c,n+1)=comp(pad(c,n), pair(left,right)) | pad(comp(c,I),0)=pad(c,1): collision; comp(left,pair(c,k_n)) injective, same function, same use | injectivity is a real constraint; satisfiable |
| 3.1 jump completeness | Z=∅ | every c.e. set ≤m K; Kᶜ (co-c.e.) computable in ∅′ | true |
| 3.2 pointclasses | n=0; FIN; wrong ∃-over-Σₙ variant | SigmaIn 1 = ∃y over Z-computable q = c.e. in Z; FIN = ∃n∀s; variant gives Σ′ₙ₊₁ = Σ₁, FIN ∉ Σ′₂ | Check true and separating |
| 3.3 Post (post_sigma, post_delta) | n=0; strictness | Σ⁰₁(Z)=c.e. in Z⁽⁰⁾=Z; Δ⁰₁(Z)=computable in Z; Z′ ∈ Σ₁(Z), ∉ Π₁(Z) else Z′ ≤T Z | true |
| 4.1 relativized moduli | Z=∅ | f(x)=a(x,m(x)) computable in Z; Z=∅ is Tau Ceti's computable_iff_exists_isModulus | true |
| 4.2 Modulus Lemma Check | Z=K, f=χ_K | m(x)=entry stage or 0, ≤T K; computable m would decide K | true |
| 4.3 limitLemma | Z=∅, f=χ_K | entry indicator converges, computable; χ_K ≤T ∅′, not computable | true; Tau Ceti has only → (Approximation/Limit.lean:86) |
| 4.4 c.e. degree | f=χ_K; converse via A={⟨x,s⟩: ∃t>s, a(x,t)≠a(x,s)} | A c.e.; A ≤T f needs m ≤T f; f ≤T A by least s ∉ A | true as stated |
| 5.1 Kleene–Post | Φ_e diverging everywhere; output 0 | no extension, R₂ₑ by divergence, both strings extended; output 0 → α(x)=1 | true |
| 6.1 counts | A: ∅,{0},∅,{0},…; zeroThenPair | I={0}, S={1,3} (|S|>|I|); I={0,1}, S={1} | Checks true; congr/mono one-tactic (C02) |
| 6.2 labelled events | 5 enters A only | (A,(s,5)) present, (B,(s,5)) absent | true |
| 6.3 initialization | resetOnce; e=1 | initializationStages = ⋃_{i<e} attention = {1}; no injury | true; not one-tactic |
| 7.2 bound 2ᵉ−1 | R₁,R₀,R₁ | 3 actions above R₂; 2ᵉ−1 = 0,1,3 for e=0,1,2 | true |
| 7.3 friedberg_muchnik | c.e. incomparable A,B | both noncomputable; ∅′ ≤T A gives B ≤T A, so A <T ∅′ | true; prototype `oracle` = Set.oracle |
| 8.1 Check / Lemma 1 / stabilization | Φ_e(0)=0, Φ_e(1)=A(1); A=C=∅ then 0∈C | ℓ=2, uses 0,2,0, r=2; then ℓ=0, r=0, 1 enters uninjured | true; routes checked |
| 8.2 exists_simple_avoiding | P_i once; x>2i | |I_e| ≤ e (only P_i, i<e injure); |A∩[0,2n]| ≤ n | true |
| 8.3 sacks_splitting / routing | x=0; x>0; e≥s; B=∅ | 0 ≤ r always so (0,0) wins, side 1; e≥s gives r=0; ∅ splits into ∅,∅ | true; Check true |
| 8.3 probe, C_e example | Φ^A_e(e)↓/↑; e∈K | ℓ(g(b,e)) → 1 / 0; non-waiting probe ℓ ≥ 1 always; 0∈C_e ⇔ e∈K | true |
| 8.4 low_incomparable_split, low_halves_of_K | C=B; B=K | A₀ ≤T A₁ ⇒ B ≡ A₀⊕A₁ ≤T A₁ contradiction; join ≡ K, K′=∅″ ≢ ∅′ | true |
| R01 prototypes vs Tau Ceti | encode; evalStage | pair 4P+5, comp 4P+6, prec 4P+7, rfind′ 4E+8 on both sides; evalStage = evaln + index/output bounds vs run (unfuelled prec) + 4 bounds | numbering equal, stage machine different |
| 0.3 race Check | D₁ at 1, D₀ at 2 | left preference 1 then 0; race keeps (1,·) | true |

- Source locators checked against the text: 0 of 31. All are to [S], Soare 1987, which is paywalled; the sources service returned "uncertified".
- Library declarations: about 300 backticked Mathlib and Tau Ceti names `#check`ed at the pin, and all resolve (the only miss is `ComputablePredIn`, the roadmap's own). Files opened: `SingleOracle/Code.lean:100–126`, `SingleOracle/Stage.lean:41`, `Jump/Basic.lean:62`, `Jump/Low.lean:44`, `TuringDegree.lean:83`, `Priority/Injury/Basic.lean:85–98`, `Priority/Injury/Causes.lean:45`, `Simple/Low.lean:570`, `Simple/Lowness.lean:117–126`, `Approximation/Modulus.lean:78,120`, `Approximation/Limit.lean:86–130`, `Enumeration/Code.lean:160`, Mathlib `Combinatorics/Colex.lean:535`.
- Cross-roadmap citations: the README makes none. Three open roadmaps name ComputabilityTheory only as outside their scope.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The worker's automatic checks all passed, and there are no changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 103 warnings, all `declaration uses 'sorry'`. The file has no `variable` or `include` blocks, every declaration carries its own binders, and none of the 188 elaborated signatures lost one.
- One-tactic probe: 13 attempts, 9 closed (three roadmap-owned targets, plus Tau Ceti restatements).
- Statability: the six headlines elaborate on Tau Ceti carriers in a separate test file.

Overlap check: read SatisfiabilityComplexity, PropositionalSatisfiability, ComparisonSortingAndSelection and LogicAndDefinabilityInNumberTheory; nothing shared. The first three name this roadmap only as out of scope; LogicAndDefinabilityInNumberTheory owns MRDP over Mathlib's `REPred`, which this roadmap does not treat.

Source independence: 0 passages compared with the cited source, whose text cannot be read legally. 3 Lean passages (`friedberg_muchnik`, `sacks_splitting` and the evaluator `run`) were compared with one public formalisation (aaslyan/friedberg-muchnik-lean): nothing is shared beyond the forced statement of `friedberg_muchnik`. Largest share: [S], 31 of 31 locators. Contents were compared with [S] through the README's own chapter locators, since the table of contents was not opened: independent (Layer 3 merges III.2 with IV, Layer 4 takes III.3 after IV, Layer 6 corresponds to no chapter, VII.1 is left to Tau Ceti). The order 8.1 → 8.2, 8.3 → 8.4 is forced by the *Needs:* lines.

Research link: Layers 7 and 8 are the finite-injury theorems of Friedberg (1957) and Muchnik (1956) and Sacks's splitting and cone-avoidance theorems, on which the theory of c.e. degrees in Soare (1987, Ch. VII on) builds. No Tau Ceti roadmap consumes them. This rests on the README's summary and scope, with the years from the aaslyan docstring.

## Not verifiable

- All 31 [S] locators, including the 15 sampled targets (1.2, 2.1, 3.1, 3.2, 3.3, 4.1, 4.2, 4.4, 5.1, 6.1, 6.2, 6.3, 8.2, 8.3, 8.4): Soare 1987 (Springer) is paywalled. The sources service found only a paywalled DOI, and I found no open copy.
- The table of contents of [S]: the publisher's page and its front matter redirect to a login, and a library catalogue record returned 403.

## Source issues

- none

## For the human reviewers

- Not tested: [S] (Soare 1987) holds all 31 source locators, and neither its text nor its table of contents could be read legally. The wording and arrangement checks therefore did not compare against it.
- Licence: hyeoniuwu/CiL at `3f44ae2` carries no licence on GitHub. The README's provenance table (line 1436) proposes adapting its use principle, jump results, simple set and Kleene–Post proofs.
- Licence: `friedberg_muchnik` (`Suggested.lean` line 1084) has the same name, binder names and statement shape as `friedberg_muchnik` in aaslyan/friedberg-muchnik-lean at `d5b3463`, `FriedbergMuchnik/Main.lean` line 30 (which has `CE` where this file has `REPred`). That repository is Apache-2.0.
